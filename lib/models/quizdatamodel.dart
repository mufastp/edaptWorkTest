// To parse this JSON data, do
//
//     final questionList = questionListFromJson(jsonString);

import 'dart:convert';

QuestionList questionListFromJson(String str) => QuestionList.fromJson(json.decode(str));

String questionListToJson(QuestionList data) => json.encode(data.toJson());

class QuestionList {
    int? responseCode;
    List<Result>? results;

    QuestionList({
        this.responseCode,
        this.results,
    });

    factory QuestionList.fromJson(Map<String, dynamic> json) => QuestionList(
        responseCode: json["response_code"],
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Result {
    Type? type;
    Difficulty? difficulty;
    String? category;
    String? question;
    String? correctAnswer;
    String? selctedAnswer;
    List<String>? incorrectAnswers;

    Result({
        this.type,
        this.difficulty,
        this.category,
        this.question,
        this.correctAnswer,
        this.selctedAnswer,
        this.incorrectAnswers,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        type: typeValues.map[json["type"]]!,
        difficulty: difficultyValues.map[json["difficulty"]],
        category: json["category"],
        question: json["question"],
        correctAnswer: json["correct_answer"],
        selctedAnswer: json["selctedAnswer"],
        incorrectAnswers: json["incorrect_answers"] == null ? [] : List<String>.from(json["incorrect_answers"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "difficulty": difficultyValues.reverse[difficulty],
        "category": category,
        "question": question,
        "correct_answer": correctAnswer,
        "selctedAnswer": selctedAnswer,
        "incorrect_answers": incorrectAnswers == null ? [] : List<dynamic>.from(incorrectAnswers!.map((x) => x)),
    };
}

enum Difficulty {
    HARD
}

final difficultyValues = EnumValues({
    "hard": Difficulty.HARD
});

enum Type {
    BOOLEAN,
    MULTIPLE
}

final typeValues = EnumValues({
    "boolean": Type.BOOLEAN,
    "multiple": Type.MULTIPLE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
