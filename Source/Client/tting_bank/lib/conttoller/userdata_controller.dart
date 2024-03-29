import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> saveUser(String? email, String? name) async {
  final url = "##############/:users/login";
  final data = {'email': email, 'name': name};
  final body = jsonEncode(data);

  final res = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: body,
  );

  if (res.statusCode == 200) {
    print('전송 완료');
  } else if (res.statusCode == 400) {
    print('찾을 수 없음');
    throw Exception('찾을 수 없음');
  } else {
    print('에러 발생');
    throw Exception('에러 발생');
  }
}

Future<void> withdrawUser(String? email) async {
  final url = "##############/:users/withdrawal";
  final data = {'email': email};
  final body = jsonEncode(data);
  print(email);
  final res = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: body,
  );

  if (res.statusCode == 200) {
    print('전송 완료');
  } else if (res.statusCode == 400) {
    print('찾을 수 없음');
    throw Exception('찾을 수 없음');
  } else {
    print('에러 발생');
    throw Exception('에러 발생');
  }
}

Future<void> save(String? kakaoemai, String? kakaoname) async {
  String? name = kakaoname;
  String? email = kakaoemai;
  print('save');
  print(email);
  print(name);

  await saveUser(email, name);
}
