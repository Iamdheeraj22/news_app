import 'package:news_app/models/CategoryModel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = <CategoryModel>[];
  CategoryModel categoryModel = new CategoryModel();

  //1st
  categoryModel.categoryName = "Buisness";
  categoryModel.imageUrl =
      "https://cdn.pixabay.com/photo/2020/06/01/22/23/eye-5248678__340.jpg";
  categories.add(categoryModel);

  //1st
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl =
      "https://cdn.pixabay.com/photo/2020/06/01/22/23/eye-5248678__340.jpg";
  categories.add(categoryModel);

  //1st
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageUrl =
      "https://cdn.pixabay.com/photo/2020/06/01/22/23/eye-5248678__340.jpg";
  categories.add(categoryModel);

  //1st
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageUrl =
      "https://cdn.pixabay.com/photo/2020/06/01/22/23/eye-5248678__340.jpg";
  categories.add(categoryModel);

  //1st
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageUrl =
      "https://cdn.pixabay.com/photo/2020/06/01/22/23/eye-5248678__340.jpg";
  categories.add(categoryModel);

  //1st
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageUrl =
      "https://cdn.pixabay.com/photo/2020/06/01/22/23/eye-5248678__340.jpg";
  categories.add(categoryModel);

  return categories;
}
