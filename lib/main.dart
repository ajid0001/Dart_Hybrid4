import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() async {
  await fetchUserData();
}

Future<void> fetchUserData() async {
  var url = Uri.parse('https://random-data-api.com/api/v2/users?size=10');

  try {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var users = convert.jsonDecode(response.body) as List<dynamic>;

      for (var user in users) {
        final uid = user['uid'];
        final firstName = user['first_name'];
        final lastName = user['last_name'];

        print('$uid: $firstName $lastName');
      }
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (err) {
    print('An error has occurred: $err');
  }
}
