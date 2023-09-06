import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<Response> registerUser() async {
    //IMPLEMENT USER REGISTRATION
    try {
      Response response = await _dio.post(
          'https://api.loginradius.com/identity/v2/auth/register',  //ENDPONT URL
          // data: userData, //REQUEST BODY
          queryParameters: {'apikey': 'YOUR_API_KEY'},  //QUERY PARAMETERS
          options: Options(headers: {'X-LoginRadius-Sott': 'YOUR_SOTT_KEY', //HEADERS
          }));
      //returns the successful json object
      return response.data;
    } on DioError catch (e) {
      //returns the error object if there is
      return e.response!.data;
    }
  }

  Future<Response> login(String email, String password) async {
    //IMPLEMENT USER LOGIN
    var uri = Uri.https('gaingerms.com', 'gainGermSit/login.php');
    try {
      Response response = await _dio.postUri(
        uri,
        data: {
          'email': email,
          'password': password,
          'currentTime': DateTime.now().millisecondsSinceEpoch.toString()
        },
        // queryParameters: {'apikey': 'YOUR_API_KEY'},
      );
      //returns the successful user data json object
      return response.data;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response!.data;
    }
  }

  Future<Response> getUserProfileData() async {
    //GET USER PROFILE DATA
    try {
      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/account',
        queryParameters: {'apikey': 'YOUR_API_KEY'},
        options: Options(
          // headers: {
          //   'Authorization': 'Bearer ${YOUR_ACCESS_TOKEN}',
          // },
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<Response> logout() async {
    //IMPLEMENT USER LOGOUT
    try {
      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/access_token/InValidate',
        // queryParameters: {'apikey': ApiSecret.apiKey},
        // options: Options(
        //   headers: {'Authorization': 'Bearer $accessToken'},
        // ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}