import 'package:world_commerce/Services/get_list.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetSubCategoriesRepository {
  GetLists getLists = GetLists();
  Future<List<dynamic>> getSubCategories() async {
    final response =
        await getLists.getLists(dotenv.env['SUB_CATEGORIES_URL'].toString());
    return response;
  }
}
