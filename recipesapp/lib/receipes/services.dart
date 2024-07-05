import 'package:recipesapp/receipes/resepiesModel.dart';
import 'package:http/http.dart' as http;

recipesItems()async{
  Uri url=Uri.parse('https://dummyjson.com/recipes');
  var res=await http.get(url);

  try{
    if(res.statusCode==200){

     var data=recipiesModelFromJsonFromJson(res.body);

     return data.recipes;

    }else{
      print('Error Occured');
    }
  }catch(e){
    print(e.toString());
  }
}