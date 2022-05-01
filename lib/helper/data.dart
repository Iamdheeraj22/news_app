import 'package:news_app/models/CategoryModel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = <CategoryModel>[];
  CategoryModel categoryModel = new CategoryModel();

  //1st
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl =
      "https://cdn.pixabay.com/photo/2020/06/01/22/23/eye-5248678__340.jpg";
  categories.add(categoryModel);

  //2nd
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl =
      "https://cdn.pixabay.com/photo/2020/06/01/22/23/eye-5248678__340.jpg";
  categories.add(categoryModel);

  //3rd
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageUrl =
      "https://cdn.pixabay.com/photo/2020/06/01/22/23/eye-5248678__340.jpg";
  categories.add(categoryModel);

  //4th
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl =
      "https://cdn.pixabay.com/photo/2020/06/01/22/23/eye-5248678__340.jpg";
  categories.add(categoryModel);

  //5th
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageUrl =
      "https://cdn.pixabay.com/photo/2020/06/01/22/23/eye-5248678__340.jpg";
  categories.add(categoryModel);

  //6th
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl =
      "https://cdn.pixabay.com/photo/2020/06/01/22/23/eye-5248678__340.jpg";
  categories.add(categoryModel);

  //7th
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl =
      "https://cdn.pixabay.com/photo/2020/06/01/22/23/eye-5248678__340.jpg";
  categories.add(categoryModel);

  return categories;
}
