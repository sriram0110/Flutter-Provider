
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'model/data_model.dart';

Future<DataModel?> getSinglePostData() async 
{
  DataModel? result;
  try{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),);
    if(response.statusCode == 200)
    {
      final item = jsonDecode(response.body);
      result = DataModel.fromJson(item);
    }
    else
    {
      print('error');
    }
  }
  catch(e)
  {
    print(e);
  }
  return result;
}