import 'package:json_annotation/json_annotation.dart';
part 'question_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class QuestionModel {
  final List<QuestionData>? questions;
  final String? status;
  final String? message;

  QuestionModel({
    this.status,
    this.questions,
    this.message,
  });

  factory QuestionModel.withError(String message) {
    return QuestionModel(
      message: message,
    );
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class QuestionData {
  final String? id;
  final String? userId;
  final String? author;
  final String? title;
  final String? text;
  final int? upvote;
  final String? solvingCommentId;
  final String? createdAt;
  final String? message;

  QuestionData({
    this.id,
    this.userId,
    this.author,
    this.title,
    this.text,
    this.upvote,
    this.solvingCommentId,
    this.createdAt,
    this.message,
  });

  factory QuestionData.withError(String message) {
    return QuestionData(
      message: message,
    );
  }

  factory QuestionData.fromJson(Map<String, dynamic> json) =>
      _$QuestionDataFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionDataToJson(this);
}
