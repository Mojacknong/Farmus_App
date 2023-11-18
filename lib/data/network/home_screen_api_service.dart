import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

class HomeScreenApiService {
  Future<List<String>> getDataFromApi() async {
    try {
      // Example data
      List<String> missions = [
        '상훈이',
        '2',
        '상추가 너무너무',
      ];

      return missions;
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data from API');
    }
  }
}
