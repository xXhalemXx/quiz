class Questions {
  int id;
  String title;
  String topic;
  List<Question> questions;
  Questions({
    required this.id,
    required this.title,
    required this.topic,
    required this.questions,
  });

  static Questions fromJson(Map<String, dynamic> map) {
    List<dynamic> questionsJason = map['questions'];
    List<Question> questionsList =
        questionsJason.map((e) => Question.fromJson(e)).toList();
    return Questions(
      id: map['id'],
      title: map['title'],
      topic: map['topic'],
      questions: questionsList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'topic': topic,
      'questions': questions,
    };
  }
}

class Question {
  int id;
  String description;
  String topic;
  String detailedSolution;
  List<Option> options;
  //ReadingMaterial readingMaterial;

  Question({
    required this.id,
    required this.description,
    required this.topic,
    required this.detailedSolution,
    required this.options,
  });

  static Question fromJson(Map<String, dynamic> map) {
    List<dynamic> optionsJason = map['options'];
    List<Option> optionsList =
        optionsJason.map((e) => Option.fromJson(e)).toList();
    return Question(
      id: map['id'],
      description: map['description'],
      topic: map['topic'],
      detailedSolution: map['detailed_solution'],
      options: optionsList,
    );
  }
}

class Option {
  String description;
  bool isCorrect;
  Option({
    required this.description,
    required this.isCorrect,
  });

  static Option fromJson(Map<String, dynamic> map) {
    return Option(
      description: map['description'],
      isCorrect: map['is_correct'],
    );
  }
}

class ReadingMaterial {
  int id;
  String keywords;
  dynamic content;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> contentSections;
  PracticeMaterial practiceMaterial;

  ReadingMaterial({
    required this.id,
    required this.keywords,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.contentSections,
    required this.practiceMaterial,
  });
}

class PracticeMaterial {
  List<String> content;
  List<String> keywords;

  PracticeMaterial({
    required this.content,
    required this.keywords,
  });
}
