import 'dart:math';

class QuizQuestions {
  static final List<Question> _questions = [
    const Question(
      question: "What is the capital of France?",
      answers: ["Berlin", "Madrid", "Paris", "Rome"],
      answerIndex: 2,
    ),
    const Question(
      question: "Which planet is known as the Red Planet?",
      answers: ["Venus", "Mars", "Jupiter", "Saturn"],
      answerIndex: 1,
    ),
    const Question(
      question: "What is the largest ocean on Earth?",
      answers: [
        "Atlantic Ocean",
        "Pacific Ocean",
        "Indian Ocean",
        "Arctic Ocean",
      ],
      answerIndex: 1,
    ),
    const Question(
      question: "What is the square root of 81?",
      answers: ["7", "8", "9", "10"],
      answerIndex: 2,
    ),
    const Question(
      question: "Who invented the telephone?",
      answers: [
        "Alexander Graham Bell",
        "Thomas Edison",
        "Nikola Tesla",
        "Isaac Newton",
      ],
      answerIndex: 0,
    ),
    const Question(
      question: "Which country is known as the Land of the Rising Sun?",
      answers: ["China", "South Korea", "Japan", "Thailand"],
      answerIndex: 2,
    ),
    const Question(
      question: "What is the largest desert in the world?",
      answers: [
        "Sahara Desert",
        "Arabian Desert",
        "Gobi Desert",
        "Antarctic Desert",
      ],
      answerIndex: 3,
    ),
    const Question(
      question: "Which element has the chemical symbol 'O'?",
      answers: ["Oxygen", "Osmium", "Ozone", "Oganesson"],
      answerIndex: 0,
    ),
    const Question(
      question: "What is the largest country by land area?",
      answers: ["United States", "Canada", "Russia", "China"],
      answerIndex: 2,
    ),
    const Question(
      question: "In which year did World War II end?",
      answers: ["1939", "1941", "1945", "1950"],
      answerIndex: 2,
    ),
    const Question(
      question: "Who wrote 'Romeo and Juliet'?",
      answers: [
        "Charles Dickens",
        "William Shakespeare",
        "Jane Austen",
        "Mark Twain",
      ],
      answerIndex: 1,
    ),
    const Question(
      question: "What is the smallest prime number?",
      answers: ["0", "1", "2", "3"],
      answerIndex: 2,
    ),
    const Question(
      question: "How many continents are there?",
      answers: ["5", "6", "7", "8"],
      answerIndex: 2,
    ),
    const Question(
      question: "Which animal is known as the king of the jungle?",
      answers: ["Lion", "Elephant", "Tiger", "Bear"],
      answerIndex: 0,
    ),
    const Question(
      question: "What is the hardest natural substance on Earth?",
      answers: ["Gold", "Iron", "Diamond", "Platinum"],
      answerIndex: 2,
    ),
    const Question(
      question: "What is the speed of light?",
      answers: ["300,000 km/s", "150,000 km/s", "100,000 km/s", "500,000 km/s"],
      answerIndex: 0,
    ),
    const Question(
      question: "Who painted the Mona Lisa?",
      answers: [
        "Vincent van Gogh",
        "Leonardo da Vinci",
        "Pablo Picasso",
        "Claude Monet",
      ],
      answerIndex: 1,
    ),
    const Question(
      question: "Which ocean is on the east coast of the United States?",
      answers: [
        "Atlantic Ocean",
        "Pacific Ocean",
        "Indian Ocean",
        "Arctic Ocean",
      ],
      answerIndex: 0,
    ),
    const Question(
      question: "What is the chemical symbol for Gold?",
      answers: ["Au", "Ag", "Pb", "Fe"],
      answerIndex: 0,
    ),
    const Question(
      question: "What is the currency of Japan?",
      answers: ["Yuan", "Won", "Yen", "Ringgit"],
      answerIndex: 2,
    ),
    const Question(
      question: "Which is the longest river in the world?",
      answers: [
        "Amazon River",
        "Nile River",
        "Yangtze River",
        "Mississippi River",
      ],
      answerIndex: 1,
    ),
    const Question(
      question: "Which country has the most official languages?",
      answers: ["Switzerland", "South Africa", "Canada", "India"],
      answerIndex: 1,
    ),
    const Question(
      question: "What is the main ingredient in guacamole?",
      answers: ["Tomato", "Onion", "Avocado", "Cucumber"],
      answerIndex: 2,
    ),
    const Question(
      question: "What is the tallest mountain in the world?",
      answers: ["K2", "Mount Everest", "Kangchenjunga", "Makalu"],
      answerIndex: 1,
    ),
    const Question(
      question: "Who was the first man to walk on the moon?",
      answers: [
        "Buzz Aldrin",
        "Neil Armstrong",
        "Yuri Gagarin",
        "Michael Collins",
      ],
      answerIndex: 1,
    ),
    const Question(
      question: "In which country did the Olympic Games originate?",
      answers: ["France", "Italy", "Greece", "Germany"],
      answerIndex: 2,
    ),
    const Question(
      question: "What is the national flower of Japan?",
      answers: ["Cherry Blossom", "Rose", "Lotus", "Tulip"],
      answerIndex: 0,
    ),
    const Question(
      question: "Who discovered gravity?",
      answers: [
        "Isaac Newton",
        "Albert Einstein",
        "Galileo Galilei",
        "Nikola Tesla",
      ],
      answerIndex: 0,
    ),
    const Question(
      question: "Which is the smallest country in the world?",
      answers: ["Monaco", "Liechtenstein", "Vatican City", "San Marino"],
      answerIndex: 2,
    ),
    const Question(
      question: "What is the main ingredient in hummus?",
      answers: ["Chickpeas", "Lentils", "Beans", "Rice"],
      answerIndex: 0,
    ),
    const Question(
      question: "What is the tallest building in the world?",
      answers: [
        "Empire State Building",
        "Burj Khalifa",
        "Eiffel Tower",
        "Shanghai Tower",
      ],
      answerIndex: 1,
    ),
    const Question(
      question: "How many states are there in the United States?",
      answers: ["50", "48", "52", "49"],
      answerIndex: 0,
    ),
    const Question(
      question: "Which ocean is the smallest?",
      answers: [
        "Atlantic Ocean",
        "Indian Ocean",
        "Arctic Ocean",
        "Pacific Ocean",
      ],
      answerIndex: 2,
    ),
    const Question(
      question: "Who invented the light bulb?",
      answers: [
        "Nikola Tesla",
        "Thomas Edison",
        "Alexander Graham Bell",
        "James Watt",
      ],
      answerIndex: 1,
    ),
    const Question(
      question: "What is the most common gas in Earth's atmosphere?",
      answers: ["Oxygen", "Nitrogen", "Carbon Dioxide", "Argon"],
      answerIndex: 1,
    ),
    const Question(
      question: "What is the longest river in South America?",
      answers: [
        "Amazon River",
        "Paraná River",
        "Orinoco River",
        "Mississippi River",
      ],
      answerIndex: 0,
    ),
    const Question(
      question: "Which planet is closest to the Sun?",
      answers: ["Earth", "Venus", "Mercury", "Mars"],
      answerIndex: 2,
    ),
    const Question(
      question: "Which element has the atomic number 1?",
      answers: ["Oxygen", "Carbon", "Hydrogen", "Helium"],
      answerIndex: 2,
    ),
    const Question(
      question: "What is the capital of Canada?",
      answers: ["Toronto", "Ottawa", "Vancouver", "Montreal"],
      answerIndex: 1,
    ),
    const Question(
      question: "Which country is known for the Great Barrier Reef?",
      answers: ["Australia", "Brazil", "United States", "Mexico"],
      answerIndex: 0,
    ),
    const Question(
      question: "Which animal is the largest mammal on Earth?",
      answers: ["Elephant", "Blue Whale", "Giraffe", "Rhino"],
      answerIndex: 1,
    ),
    const Question(
      question: "What is the hardest natural material on Earth?",
      answers: ["Gold", "Diamond", "Iron", "Platinum"],
      answerIndex: 1,
    ),
    const Question(
      question: "What is the chemical formula for water?",
      answers: ["CO2", "H2O", "O2", "H2O2"],
      answerIndex: 1,
    ),
    const Question(
      question: "In what year did the Titanic sink?",
      answers: ["1912", "1905", "1920", "1915"],
      answerIndex: 0,
    ),
    const Question(
      question: "Who was the first president of the United States?",
      answers: [
        "Thomas Jefferson",
        "George Washington",
        "Abraham Lincoln",
        "John Adams",
      ],
      answerIndex: 1,
    ),
    const Question(
      question: "What is the largest planet in our solar system?",
      answers: ["Earth", "Jupiter", "Saturn", "Neptune"],
      answerIndex: 1,
    ),
    const Question(
      question: "Which country is the Eiffel Tower located in?",
      answers: ["Spain", "Italy", "France", "Germany"],
      answerIndex: 2,
    ),
    const Question(
      question: "What is the main ingredient in sushi?",
      answers: ["Chicken", "Fish", "Rice", "Noodles"],
      answerIndex: 2,
    ),
    const Question(
      question: "What is the longest-running TV show in history?",
      answers: ["Friends", "The Simpsons", "The Office", "Saturday Night Live"],
      answerIndex: 3,
    ),
    const Question(
      question: "Who developed the theory of relativity?",
      answers: [
        "Isaac Newton",
        "Albert Einstein",
        "Nikola Tesla",
        "Galileo Galilei",
      ],
      answerIndex: 1,
    ),
    const Question(
      question: "What does DNA stand for?",
      answers: [
        "Deoxyribonucleic Acid",
        "Deoxyribonitric Acid",
        "Deoxyribose Nitric Acid",
        "Deoxyribonuclear Acid",
      ],
      answerIndex: 0,
    ),
    const Question(
      question: "In which country would you find the ancient ruins of Petra?",
      answers: ["Egypt", "Jordan", "Syria", "Iraq"],
      answerIndex: 1,
    ),
    const Question(
      question: "What is the symbol for the chemical element Sodium?",
      answers: ["S", "Na", "So", "Sn"],
      answerIndex: 1,
    ),
    const Question(
      question: "Which country is home to the famous landmark Machu Picchu?",
      answers: ["Mexico", "Peru", "Argentina", "Chile"],
      answerIndex: 1,
    ),
    const Question(
      question: "Which ocean is the deepest?",
      answers: [
        "Atlantic Ocean",
        "Pacific Ocean",
        "Indian Ocean",
        "Arctic Ocean",
      ],
      answerIndex: 1,
    ),
    const Question(
      question: "What is the smallest planet in our solar system?",
      answers: ["Mars", "Mercury", "Venus", "Earth"],
      answerIndex: 1,
    ),
    const Question(
      question: "What is the longest mountain range in the world?",
      answers: ["Himalayas", "Andes", "Rocky Mountains", "Alps"],
      answerIndex: 1,
    ),
    const Question(
      question: "Which country is the Great Wall of China located in?",
      answers: ["China", "Japan", "South Korea", "Vietnam"],
      answerIndex: 0,
    ),
    const Question(
      question: "What is the only mammal capable of flight?",
      answers: ["Bat", "Squirrel", "Dolphin", "Penguin"],
      answerIndex: 0,
    ),
    const Question(
      question: "Which planet has the most moons?",
      answers: ["Earth", "Mars", "Jupiter", "Saturn"],
      answerIndex: 3,
    ),
    const Question(
      question: "Which animal can sleep for three years?",
      answers: ["Koala", "Snail", "Bat", "Hibernating Bear"],
      answerIndex: 1,
    ),
    const Question(
      question: "What is the official language of Brazil?",
      answers: ["Spanish", "Portuguese", "English", "French"],
      answerIndex: 1,
    ),
    const Question(
      question: "What type of animal is a Komodo Dragon?",
      answers: ["Lizard", "Snake", "Bird", "Mammal"],
      answerIndex: 0,
    ),
    const Question(
      question: "What element does 'O' represent on the periodic table?",
      answers: ["Oxygen", "Osmium", "Oganesson", "Ozone"],
      answerIndex: 0,
    ),
    const Question(
      question: "What is the tallest waterfall in the world?",
      answers: [
        "Niagara Falls",
        "Angel Falls",
        "Iguaçu Falls",
        "Victoria Falls",
      ],
      answerIndex: 1,
    ),
    const Question(
      question: "In which year did the United States declare its independence?",
      answers: ["1776", "1789", "1792", "1800"],
      answerIndex: 0,
    ),
    const Question(
      question: "What is the official language of Egypt?",
      answers: ["Arabic", "French", "English", "Hebrew"],
      answerIndex: 0,
    ),
    const Question(
      question: "Which vitamin is primarily obtained from sunlight?",
      answers: ["Vitamin C", "Vitamin D", "Vitamin A", "Vitamin B12"],
      answerIndex: 1,
    ),
    const Question(
      question: "Which country is the largest producer of coffee?",
      answers: ["Brazil", "Colombia", "Vietnam", "Ethiopia"],
      answerIndex: 0,
    ),
  ];

  static List<Question> getRandom(int count) {
    if (count >= _questions.length) {
      return _questions;
    }
    
    List<Question> generated = [];
    Random random = Random();

    while (count > 0) {
      Question randomQuestion = _questions[(random.nextDouble() * _questions.length).toInt()];
      while (generated.contains(randomQuestion)) {
        randomQuestion = _questions[(random.nextDouble() * _questions.length).toInt()];
      }
      generated.add(randomQuestion);
      count--;
    }

    return generated;
  }
}

class Question {
  const Question({
    required this.question,
    required this.answers,
    required this.answerIndex,
  });

  final String question;
  final List<String> answers;
  final int answerIndex;
}
