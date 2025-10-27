import 'dart:convert';
import 'package:http/http.dart' as http;

class ArchDailyService {
  static const String _baseUrl =
      'https://www.archdaily.com/search/projects?display=json&q=';

  Future<List<Map<String, dynamic>>> searchProjects(String keyword) async {
    final url = Uri.parse('$_baseUrl$keyword');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // ArchDaily JSON มีหลายรูปแบบ (ขึ้นกับ query)
      if (data is List) {
        return data.map<Map<String, dynamic>>((e) {
          return {
            'title': e['title'] ?? 'Untitled',
            'image': e['image'] ?? '',
            'link': e['url'] ?? '',
            'description': e['snippet'] ?? '',
          };
        }).toList();
      }
    }
    return [];
  }
}
