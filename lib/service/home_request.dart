import 'package:flutter_project_230531/model/home_model.dart';
import 'package:flutter_project_230531/service/config.dart';
import 'http_request.dart';

class QYHomeRequest {
  static Future<List<HomeListItem>> getList(int page) async {
    final url =
        'home/article?page=$page&limit=${RequestConfig.COUNT}&type=1&day=7&category=%E7%B2%BE%E9%80%89';

    // 发送请求得到数据
    final res = await QYHttpRequest.request(url);
    final list = res['data']['list'];

    // 将 Map 转为 Model
    List<HomeListItem> homeList = [];
    for (var item in list) {
      homeList.add(HomeListItem.fromJson(item));
    }

    return homeList;
  }
}
