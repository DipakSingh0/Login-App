import 'dart:ui';

class DashboardCategoriesModel {

  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;


  DashboardCategoriesModel(
      this.title,
    this.heading,
     this.subHeading, 
     this.onPress, 
      ); 

     static List<DashboardCategoriesModel> list = [
      DashboardCategoriesModel("BBT", "Buggati",   "3 models" , null),
      DashboardCategoriesModel("Supra", "Toyota",   "1 models" , null),
      DashboardCategoriesModel("L", "Lamborghini",  "3  models" , null),
      DashboardCategoriesModel("F", "Ferrari",  "2 models" , null),
      // DashboardCategories(heading, subHeading, onPress, title: title)
     
     ];
}