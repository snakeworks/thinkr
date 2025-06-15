import requests
import json
from datetime import datetime, timezone
import time
import uuid

API_URL = "https://en.wikipedia.org/w/api.php"
SCIENCE_KEYWORDS = [
    "science", "scientist", "physics", "chemistry", "biology", "mathematics",
    "astronomy", "geology", "medicine", "engineering", "computer science",
    "technology", "ecology", "genetics", "neuroscience", "psychology"
]

def get_random_pages(limit=50):
    params = {
        "action": "query",
        "format": "json",
        "list": "random",
        "rnnamespace": 0,
        "rnlimit": limit
    }
    response = requests.get(API_URL, params=params)
    return response.json()["query"]["random"]

def get_page_content_and_categories(pageid):
    params = {
        "action": "query",
        "format": "json",
        "prop": "extracts|pageimages|categories",
        "explaintext": True,
        "exlimit": 1,
        "exintro": False,
        "pageids": pageid,
        "piprop": "original",
        "cllimit": 50
    }
    response = requests.get(API_URL, params=params)
    page = response.json()["query"]["pages"][str(pageid)]
    
    content = page.get("extract", "").strip()
    if len(content.split()) < 100:
        return None  # Skip if not enough content

    image_url = page.get("original", {}).get("source", "")
    categories = [cat["title"].lower() for cat in page.get("categories", [])]

    return {
        "title": page.get("title", "Untitled"),
        "bannerUrl": image_url,
        "content": content,
        "categories": categories
    }

def is_science_related(categories):
    for cat in categories:
        if any(keyword in cat for keyword in SCIENCE_KEYWORDS):
            return True
    return False

def main():
    entries = []
    attempts = 0
    while len(entries) < 50 and attempts < 500:
        pages = get_random_pages(10)
        for page in pages:
            time.sleep(0.5)  # Avoid hammering the API
            data = get_page_content_and_categories(page["id"])
            if data and is_science_related(data["categories"]):
                # Try to get the article's last edited timestamp from the API response
                revision_params = {
                    "action": "query",
                    "format": "json",
                    "prop": "revisions",
                    "rvprop": "timestamp",
                    "pageids": page["id"]
                }
                rev_response = requests.get(API_URL, params=revision_params)
                rev_page = rev_response.json()["query"]["pages"][str(page["id"])]
                created_at = ""
                if "revisions" in rev_page and rev_page["revisions"]:
                    created_at = rev_page["revisions"][0]["timestamp"]
                entries.append({
                    "id": str(uuid.uuid4()),
                    "title": data["title"],
                    "bannerUrl": data["bannerUrl"] or "",
                    "createdAt": created_at,
                    "content": data["content"]
                })
            if len(entries) >= 50:
                break
        attempts += 1

    with open("wikipedia_entries.json", "w", encoding="utf-8") as f:
        json.dump(entries, f, ensure_ascii=False, indent=2)

    print(f"Saved {len(entries)} science-related Wikipedia entries to 'wikipedia_entries.json'.")

if __name__ == "__main__":
    main()
