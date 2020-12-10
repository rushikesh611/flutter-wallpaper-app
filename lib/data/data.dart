import 'package:wallpaperapp/model/categories_model.dart';

String apiKey="YOUR API KEY";

List<CategoriesModel> getCategories(){
  List<CategoriesModel> categories = new List();
  CategoriesModel categoryModel= new CategoriesModel();

  //Texture
  categoryModel.imgUrl="https://images.pexels.com/photos/1460890/pexels-photo-1460890.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoryModel.categoryName="Texture";
  categories.add(categoryModel);
  categoryModel= new CategoriesModel();

  //Absract
  categoryModel.imgUrl="https://images.pexels.com/photos/2130475/pexels-photo-2130475.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoryModel.categoryName="Abstract";
  categories.add(categoryModel);
  categoryModel= new CategoriesModel();

  //Nature
  categoryModel.imgUrl="https://images.pexels.com/photos/5409751/pexels-photo-5409751.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoryModel.categoryName="Nature";
  categories.add(categoryModel);
  categoryModel= new CategoriesModel();

  //Art
  categoryModel.imgUrl="https://images.pexels.com/photos/2346120/pexels-photo-2346120.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoryModel.categoryName="Art";
  categories.add(categoryModel);
  categoryModel= new CategoriesModel();

  //City
  categoryModel.imgUrl="https://images.pexels.com/photos/936722/pexels-photo-936722.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoryModel.categoryName="City";
  categories.add(categoryModel);
  categoryModel= new CategoriesModel();

   //Cars
  categoryModel.imgUrl="https://images.pexels.com/photos/2710043/pexels-photo-2710043.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoryModel.categoryName="Car";
  categories.add(categoryModel);
  categoryModel= new CategoriesModel();

  return categories;
}