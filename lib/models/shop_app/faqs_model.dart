class FAQ {
  late bool status;
  late Data data;

  FAQ.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    //(json['data'] != null ? UserData.fromJson(json['data']) : null)!;
    data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
  }
}

class Data {
  late List<FaqData> data;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(FaqData.fromJson(v));
      });
    }
  }
}

class FaqData {
  late int id;
  late String question;
  late String answer;

  FaqData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }
}