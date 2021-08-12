// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class URLS {
//   static const String BASE_URL = 'https://bhomiasoft.com/bakery_api/api/Api';
// }

// class ApiService {
//   static Future<List<dynamic>> getCategory_list() async {
//     // RESPONSE JSON :
//     // [{
//     //   "id": "1",
//     //   "employee_name": "",
//     //   "employee_salary": "0",
//     //   "employee_age": "0",
//     //   "profile_image": ""
//     // }]
//     final response =
//         await http.get('https://bhomiasoft.com/bakery_api/api/Api/getCategory');
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       return null;
//     }
//   }

//   static Future<bool> addCustomer(body) async {
//     // BODY
//     // {
//     //   "name": "test",
//     //   "age": "23"
//     // }
//     final response = await http.post('${URLS.BASE_URL}/register', body: body);
//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   static Future<List<dynamic>> get_banner() async {
//     // RESPONSE JSON :
//     // [{
//     //   "id": "1",
//     //   "employee_name": "",
//     //   "employee_salary": "0",
//     //   "employee_age": "0",
//     //   "profile_image": ""
//     // }]
//     final response =
//         await http.get('https://bhomiasoft.com/bakery_api/api/Api/getbanner');
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       return null;
//     }
//   }

//   // static Future<bool> loginCustomer(body) async {
//   //   // BODY
//   //   // {
//   //   //   "name": "test",
//   //   //   "age": "23"
//   //   // }
//   //   final response = await http.get('${URLS.BASE_URL}/login', headers: body);
//   //   if (response.statusCode == 200) {
//   //     return true;
//   //   } else {
//   //     return false;
//   //   }
//   // }

//   static Future<bool> loginCustomer(body) async {
//     // BODY
//     // {
//     //   "name": "test",
//     //   "age": "23"
//     // }
//     final response = await http.post('${URLS.BASE_URL}/login', body: body);
//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
