import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:tting_bank/data/recommend_card.dart';

Future<List<Recommend_card>> sendData(String email, String company, String label) async {
  final url = "##############/search/recommend/";
  final data = {'email': email, 'company': company, 'label': label};
  final body = jsonEncode(data);

  final res = await http.post(
    Uri.parse(url),
    headers: {"accept": "application/json", "content-type": "application/json"},
    body: body,
  );

  if (res.statusCode == 200) {
    final result = jsonDecode(res.body);
    if (result != null) {
      print(List<Recommend_card>.from(
          result.map((item) => Recommend_card.fromJson(item))));
      return List<Recommend_card>.from(
          result.map((item) => Recommend_card.fromJson(item)));
    } else {
      throw Exception('Invalid data format');
    }
  } else if (res.statusCode == 404) {
    final result = jsonDecode(res.body);
    if (result == null) {
      print('404');
      return [];
    } else {
      return List<Recommend_card>.from(
          result.map((item) => Recommend_card.fromJson(item)));
    }
  } else {
    print(res.statusCode);
    throw Exception('에러 발생');
  }
}

Future<List<Recommend_card>> recommend(String email, String company, String label) async {
  try {
    List<Recommend_card> results = await sendData(email, company, label);
    return results;
  } catch (error) {
    print('catch error');
    return [];
  }
}
