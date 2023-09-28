import 'package:world_commerce/Services/get_list.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetBrandsRepository {
  GetLists getLists = GetLists();
  Future<List<dynamic>> getBrands() async {
    final response =
        await getLists.getLists(dotenv.env['BRANDS_URL'].toString());
    return response;
  }
}
