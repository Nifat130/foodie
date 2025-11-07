

class AppUrls{
  AppUrls._();

  static const String baseUrl = "https://stackfood-admin.6amtech.com/api/v1";

  static const String configuration = "$baseUrl/config";
  static const String banners = "$baseUrl/banners";
  static const String categories = "$baseUrl/categories";
  static const String popularFoods = "$baseUrl/products/popular?offset=1&limit=2";
  static const String campaign = "$baseUrl/campaigns/item";
  static const String restaurants = "$baseUrl/restaurants/get-restaurants/all?offset=1&limit=10";
}