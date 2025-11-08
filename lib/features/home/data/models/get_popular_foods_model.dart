// To parse this JSON data, do
//
//     final getPopularFoodsModel = getPopularFoodsModelFromJson(jsonString);

import 'dart:convert';

GetPopularFoodsModel getPopularFoodsModelFromJson(String str) => GetPopularFoodsModel.fromJson(json.decode(str));

String getPopularFoodsModelToJson(GetPopularFoodsModel data) => json.encode(data.toJson());

class GetPopularFoodsModel {
  int? totalSize;
  String? limit;
  String? offset;
  List<Product>? products;

  GetPopularFoodsModel({
    this.totalSize,
    this.limit,
    this.offset,
    this.products,
  });

  factory GetPopularFoodsModel.fromJson(Map<String, dynamic> json) => GetPopularFoodsModel(
    totalSize: json["total_size"],
    limit: json["limit"],
    offset: json["offset"],
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_size": totalSize,
    "limit": limit,
    "offset": offset,
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class Product {
  int? id;
  String? name;
  String? description;
  String? image;
  int? categoryId;
  List<CategoryId>? categoryIds;
  List<Variation>? variations;
  List<AddOn>? addOns;
  String? attributes;
  String? choiceOptions;
  int? price;
  int? tax;
  String? taxType;
  int? discount;
  String? discountType;
  String? availableTimeStarts;
  String? availableTimeEnds;
  int? veg;
  int? status;
  int? restaurantId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? orderCount;
  double? avgRating;
  int? ratingCount;
  int? recommended;
  String? slug;
  dynamic maximumCartQuantity;
  int? isHalal;
  int? itemStock;
  int? sellCount;
  String? stockType;
  int? tempAvailable;
  int? open;
  int? reviewsCount;
  List<dynamic>? tags;
  String? restaurantName;
  int? restaurantStatus;
  int? restaurantDiscount;
  String? restaurantOpeningTime;
  String? restaurantClosingTime;
  bool? scheduleOrder;
  int? minDeliveryTime;
  int? maxDeliveryTime;
  int? freeDelivery;
  int? halalTagStatus;
  List<String>? nutritionsName;
  List<String>? allergiesName;
  List<Cuisine>? cuisines;
  List<dynamic>? taxData;
  String? imageFullUrl;
  List<Storage>? storage;
  List<Translation>? translations;
  List<Nutrition>? nutritions;
  List<Allergy>? allergies;
  List<dynamic>? newVariations;

  Product({
    this.id,
    this.name,
    this.description,
    this.image,
    this.categoryId,
    this.categoryIds,
    this.variations,
    this.addOns,
    this.attributes,
    this.choiceOptions,
    this.price,
    this.tax,
    this.taxType,
    this.discount,
    this.discountType,
    this.availableTimeStarts,
    this.availableTimeEnds,
    this.veg,
    this.status,
    this.restaurantId,
    this.createdAt,
    this.updatedAt,
    this.orderCount,
    this.avgRating,
    this.ratingCount,
    this.recommended,
    this.slug,
    this.maximumCartQuantity,
    this.isHalal,
    this.itemStock,
    this.sellCount,
    this.stockType,
    this.tempAvailable,
    this.open,
    this.reviewsCount,
    this.tags,
    this.restaurantName,
    this.restaurantStatus,
    this.restaurantDiscount,
    this.restaurantOpeningTime,
    this.restaurantClosingTime,
    this.scheduleOrder,
    this.minDeliveryTime,
    this.maxDeliveryTime,
    this.freeDelivery,
    this.halalTagStatus,
    this.nutritionsName,
    this.allergiesName,
    this.cuisines,
    this.taxData,
    this.imageFullUrl,
    this.storage,
    this.translations,
    this.nutritions,
    this.allergies,
    this.newVariations,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    categoryId: json["category_id"],
    categoryIds: json["category_ids"] == null ? [] : List<CategoryId>.from(json["category_ids"]!.map((x) => CategoryId.fromJson(x))),
    variations: json["variations"] == null ? [] : List<Variation>.from(json["variations"]!.map((x) => Variation.fromJson(x))),
    addOns: json["add_ons"] == null ? [] : List<AddOn>.from(json["add_ons"]!.map((x) => AddOn.fromJson(x))),
    attributes: json["attributes"],
    choiceOptions: json["choice_options"],
    price: json["price"],
    tax: json["tax"],
    taxType: json["tax_type"],
    discount: json["discount"],
    discountType: json["discount_type"],
    availableTimeStarts: json["available_time_starts"],
    availableTimeEnds: json["available_time_ends"],
    veg: json["veg"],
    status: json["status"],
    restaurantId: json["restaurant_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    orderCount: json["order_count"],
    avgRating: json["avg_rating"]?.toDouble(),
    ratingCount: json["rating_count"],
    recommended: json["recommended"],
    slug: json["slug"],
    maximumCartQuantity: json["maximum_cart_quantity"],
    isHalal: json["is_halal"],
    itemStock: json["item_stock"],
    sellCount: json["sell_count"],
    stockType: json["stock_type"],
    tempAvailable: json["temp_available"],
    open: json["open"],
    reviewsCount: json["reviews_count"],
    tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"]!.map((x) => x)),
    restaurantName: json["restaurant_name"],
    restaurantStatus: json["restaurant_status"],
    restaurantDiscount: json["restaurant_discount"],
    restaurantOpeningTime: json["restaurant_opening_time"],
    restaurantClosingTime: json["restaurant_closing_time"],
    scheduleOrder: json["schedule_order"],
    minDeliveryTime: json["min_delivery_time"],
    maxDeliveryTime: json["max_delivery_time"],
    freeDelivery: json["free_delivery"],
    halalTagStatus: json["halal_tag_status"],
    nutritionsName: json["nutritions_name"] == null ? [] : List<String>.from(json["nutritions_name"]!.map((x) => x)),
    allergiesName: json["allergies_name"] == null ? [] : List<String>.from(json["allergies_name"]!.map((x) => x)),
    cuisines: json["cuisines"] == null ? [] : List<Cuisine>.from(json["cuisines"]!.map((x) => Cuisine.fromJson(x))),
    taxData: json["tax_data"] == null ? [] : List<dynamic>.from(json["tax_data"]!.map((x) => x)),
    imageFullUrl: json["image_full_url"],
    storage: json["storage"] == null ? [] : List<Storage>.from(json["storage"]!.map((x) => Storage.fromJson(x))),
    translations: json["translations"] == null ? [] : List<Translation>.from(json["translations"]!.map((x) => Translation.fromJson(x))),
    nutritions: json["nutritions"] == null ? [] : List<Nutrition>.from(json["nutritions"]!.map((x) => Nutrition.fromJson(x))),
    allergies: json["allergies"] == null ? [] : List<Allergy>.from(json["allergies"]!.map((x) => Allergy.fromJson(x))),
    newVariations: json["new_variations"] == null ? [] : List<dynamic>.from(json["new_variations"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "category_id": categoryId,
    "category_ids": categoryIds == null ? [] : List<dynamic>.from(categoryIds!.map((x) => x.toJson())),
    "variations": variations == null ? [] : List<dynamic>.from(variations!.map((x) => x.toJson())),
    "add_ons": addOns == null ? [] : List<dynamic>.from(addOns!.map((x) => x.toJson())),
    "attributes": attributes,
    "choice_options": choiceOptions,
    "price": price,
    "tax": tax,
    "tax_type": taxType,
    "discount": discount,
    "discount_type": discountType,
    "available_time_starts": availableTimeStarts,
    "available_time_ends": availableTimeEnds,
    "veg": veg,
    "status": status,
    "restaurant_id": restaurantId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "order_count": orderCount,
    "avg_rating": avgRating,
    "rating_count": ratingCount,
    "recommended": recommended,
    "slug": slug,
    "maximum_cart_quantity": maximumCartQuantity,
    "is_halal": isHalal,
    "item_stock": itemStock,
    "sell_count": sellCount,
    "stock_type": stockType,
    "temp_available": tempAvailable,
    "open": open,
    "reviews_count": reviewsCount,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "restaurant_name": restaurantName,
    "restaurant_status": restaurantStatus,
    "restaurant_discount": restaurantDiscount,
    "restaurant_opening_time": restaurantOpeningTime,
    "restaurant_closing_time": restaurantClosingTime,
    "schedule_order": scheduleOrder,
    "min_delivery_time": minDeliveryTime,
    "max_delivery_time": maxDeliveryTime,
    "free_delivery": freeDelivery,
    "halal_tag_status": halalTagStatus,
    "nutritions_name": nutritionsName == null ? [] : List<dynamic>.from(nutritionsName!.map((x) => x)),
    "allergies_name": allergiesName == null ? [] : List<dynamic>.from(allergiesName!.map((x) => x)),
    "cuisines": cuisines == null ? [] : List<dynamic>.from(cuisines!.map((x) => x.toJson())),
    "tax_data": taxData == null ? [] : List<dynamic>.from(taxData!.map((x) => x)),
    "image_full_url": imageFullUrl,
    "storage": storage == null ? [] : List<dynamic>.from(storage!.map((x) => x.toJson())),
    "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toJson())),
    "nutritions": nutritions == null ? [] : List<dynamic>.from(nutritions!.map((x) => x.toJson())),
    "allergies": allergies == null ? [] : List<dynamic>.from(allergies!.map((x) => x.toJson())),
    "new_variations": newVariations == null ? [] : List<dynamic>.from(newVariations!.map((x) => x)),
  };
}

class AddOn {
  int? id;
  String? name;
  int? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? restaurantId;
  int? status;
  String? stockType;
  int? addonStock;
  int? sellCount;
  dynamic addonCategoryId;
  List<dynamic>? taxIds;
  List<dynamic>? translations;

  AddOn({
    this.id,
    this.name,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.restaurantId,
    this.status,
    this.stockType,
    this.addonStock,
    this.sellCount,
    this.addonCategoryId,
    this.taxIds,
    this.translations,
  });

  factory AddOn.fromJson(Map<String, dynamic> json) => AddOn(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    restaurantId: json["restaurant_id"],
    status: json["status"],
    stockType: json["stock_type"],
    addonStock: json["addon_stock"],
    sellCount: json["sell_count"],
    addonCategoryId: json["addon_category_id"],
    taxIds: json["tax_ids"] == null ? [] : List<dynamic>.from(json["tax_ids"]!.map((x) => x)),
    translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "restaurant_id": restaurantId,
    "status": status,
    "stock_type": stockType,
    "addon_stock": addonStock,
    "sell_count": sellCount,
    "addon_category_id": addonCategoryId,
    "tax_ids": taxIds == null ? [] : List<dynamic>.from(taxIds!.map((x) => x)),
    "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x)),
  };
}

class Allergy {
  int? id;
  String? allergy;
  DateTime? createdAt;
  DateTime? updatedAt;
  AllergyPivot? pivot;

  Allergy({
    this.id,
    this.allergy,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Allergy.fromJson(Map<String, dynamic> json) => Allergy(
    id: json["id"],
    allergy: json["allergy"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    pivot: json["pivot"] == null ? null : AllergyPivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "allergy": allergy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
  };
}

class AllergyPivot {
  int? foodId;
  int? allergyId;

  AllergyPivot({
    this.foodId,
    this.allergyId,
  });

  factory AllergyPivot.fromJson(Map<String, dynamic> json) => AllergyPivot(
    foodId: json["food_id"],
    allergyId: json["allergy_id"],
  );

  Map<String, dynamic> toJson() => {
    "food_id": foodId,
    "allergy_id": allergyId,
  };
}

class CategoryId {
  String? id;
  int? position;
  String? categoryName;

  CategoryId({
    this.id,
    this.position,
    this.categoryName,
  });

  factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
    id: json["id"],
    position: json["position"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "position": position,
    "category_name": categoryName,
  };
}

class Cuisine {
  int? id;
  String? name;
  String? image;

  Cuisine({
    this.id,
    this.name,
    this.image,
  });

  factory Cuisine.fromJson(Map<String, dynamic> json) => Cuisine(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}

class Nutrition {
  int? id;
  String? nutrition;
  DateTime? createdAt;
  DateTime? updatedAt;
  NutritionPivot? pivot;

  Nutrition({
    this.id,
    this.nutrition,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
    id: json["id"],
    nutrition: json["nutrition"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    pivot: json["pivot"] == null ? null : NutritionPivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nutrition": nutrition,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
  };
}

class NutritionPivot {
  int? foodId;
  int? nutritionId;

  NutritionPivot({
    this.foodId,
    this.nutritionId,
  });

  factory NutritionPivot.fromJson(Map<String, dynamic> json) => NutritionPivot(
    foodId: json["food_id"],
    nutritionId: json["nutrition_id"],
  );

  Map<String, dynamic> toJson() => {
    "food_id": foodId,
    "nutrition_id": nutritionId,
  };
}

class Storage {
  int? id;
  String? dataType;
  String? dataId;
  String? key;
  String? value;
  DateTime? createdAt;
  DateTime? updatedAt;

  Storage({
    this.id,
    this.dataType,
    this.dataId,
    this.key,
    this.value,
    this.createdAt,
    this.updatedAt,
  });

  factory Storage.fromJson(Map<String, dynamic> json) => Storage(
    id: json["id"],
    dataType: json["data_type"],
    dataId: json["data_id"],
    key: json["key"],
    value: json["value"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "data_type": dataType,
    "data_id": dataId,
    "key": key,
    "value": value,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Translation {
  int? id;
  String? translationableType;
  int? translationableId;
  String? locale;
  String? key;
  String? value;
  dynamic createdAt;
  dynamic updatedAt;

  Translation({
    this.id,
    this.translationableType,
    this.translationableId,
    this.locale,
    this.key,
    this.value,
    this.createdAt,
    this.updatedAt,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
    id: json["id"],
    translationableType: json["translationable_type"],
    translationableId: json["translationable_id"],
    locale: json["locale"],
    key: json["key"],
    value: json["value"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "translationable_type": translationableType,
    "translationable_id": translationableId,
    "locale": locale,
    "key": key,
    "value": value,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Variation {
  int? variationId;
  String? name;
  String? type;
  String? min;
  String? max;
  String? required;
  List<Value>? values;

  Variation({
    this.variationId,
    this.name,
    this.type,
    this.min,
    this.max,
    this.required,
    this.values,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    variationId: json["variation_id"],
    name: json["name"],
    type: json["type"],
    min: json["min"],
    max: json["max"],
    required: json["required"],
    values: json["values"] == null ? [] : List<Value>.from(json["values"]!.map((x) => Value.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "variation_id": variationId,
    "name": name,
    "type": type,
    "min": min,
    "max": max,
    "required": required,
    "values": values == null ? [] : List<dynamic>.from(values!.map((x) => x.toJson())),
  };
}

class Value {
  String? label;
  int? optionPrice;
  String? totalStock;
  String? stockType;
  String? sellCount;
  int? optionId;
  int? currentStock;

  Value({
    this.label,
    this.optionPrice,
    this.totalStock,
    this.stockType,
    this.sellCount,
    this.optionId,
    this.currentStock,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    label: json["label"],
    optionPrice: json["optionPrice"],
    totalStock: json["total_stock"],
    stockType: json["stock_type"],
    sellCount: json["sell_count"],
    optionId: json["option_id"],
    currentStock: json["current_stock"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "optionPrice": optionPrice,
    "total_stock": totalStock,
    "stock_type": stockType,
    "sell_count": sellCount,
    "option_id": optionId,
    "current_stock": currentStock,
  };
}
