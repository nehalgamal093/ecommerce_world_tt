import 'package:world_commerce/Services/get_list.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetCategoriesRepository {
  GetLists getLists = GetLists();
  Future<List<dynamic>> getCategories() async {
    final response =
        await getLists.getLists(dotenv.env['CATEGORIES_URL'].toString());
    return response;
  }
}
