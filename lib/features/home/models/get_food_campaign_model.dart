// To parse this JSON data, do
//
//     final getFoodCampaignModel = getFoodCampaignModelFromJson(jsonString);

import 'dart:convert';

List<GetFoodCampaignModel> getFoodCampaignModelFromJson(String str) => List<GetFoodCampaignModel>.from(json.decode(str).map((x) => GetFoodCampaignModel.fromJson(x)));

String getFoodCampaignModelToJson(List<GetFoodCampaignModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetFoodCampaignModel {
  int? id;
  String? image;
  String? description;
  int? status;
  int? adminId;
  dynamic categoryId;
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
  int? restaurantId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? veg;
  dynamic slug;
  int? maximumCartQuantity;
  int? tempAvailable;
  int? open;
  String? name;
  String? availableTimeStarts;
  String? availableTimeEnds;
  DateTime? availableDateStarts;
  DateTime? availableDateEnds;
  int? recommended;
  dynamic tags;
  String? restaurantName;
  int? restaurantStatus;
  int? restaurantDiscount;
  String? restaurantOpeningTime;
  String? restaurantClosingTime;
  bool? scheduleOrder;
  int? ratingCount;
  int? avgRating;
  int? minDeliveryTime;
  int? maxDeliveryTime;
  int? freeDelivery;
  int? halalTagStatus;
  dynamic nutritionsName;
  dynamic allergiesName;
  List<Cuisine>? cuisines;
  List<dynamic>? taxData;
  String? imageFullUrl;
  List<Translation>? translations;
  List<Storage>? storage;

  GetFoodCampaignModel({
    this.id,
    this.image,
    this.description,
    this.status,
    this.adminId,
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
    this.restaurantId,
    this.createdAt,
    this.updatedAt,
    this.veg,
    this.slug,
    this.maximumCartQuantity,
    this.tempAvailable,
    this.open,
    this.name,
    this.availableTimeStarts,
    this.availableTimeEnds,
    this.availableDateStarts,
    this.availableDateEnds,
    this.recommended,
    this.tags,
    this.restaurantName,
    this.restaurantStatus,
    this.restaurantDiscount,
    this.restaurantOpeningTime,
    this.restaurantClosingTime,
    this.scheduleOrder,
    this.ratingCount,
    this.avgRating,
    this.minDeliveryTime,
    this.maxDeliveryTime,
    this.freeDelivery,
    this.halalTagStatus,
    this.nutritionsName,
    this.allergiesName,
    this.cuisines,
    this.taxData,
    this.imageFullUrl,
    this.translations,
    this.storage,
  });

  factory GetFoodCampaignModel.fromJson(Map<String, dynamic> json) => GetFoodCampaignModel(
    id: json["id"],
    image: json["image"],
    description: json["description"],
    status: json["status"],
    adminId: json["admin_id"],
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
    restaurantId: json["restaurant_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    veg: json["veg"],
    slug: json["slug"],
    maximumCartQuantity: json["maximum_cart_quantity"],
    tempAvailable: json["temp_available"],
    open: json["open"],
    name: json["name"],
    availableTimeStarts: json["available_time_starts"],
    availableTimeEnds: json["available_time_ends"],
    availableDateStarts: json["available_date_starts"] == null ? null : DateTime.parse(json["available_date_starts"]),
    availableDateEnds: json["available_date_ends"] == null ? null : DateTime.parse(json["available_date_ends"]),
    recommended: json["recommended"],
    tags: json["tags"],
    restaurantName: json["restaurant_name"],
    restaurantStatus: json["restaurant_status"],
    restaurantDiscount: json["restaurant_discount"],
    restaurantOpeningTime: json["restaurant_opening_time"],
    restaurantClosingTime: json["restaurant_closing_time"],
    scheduleOrder: json["schedule_order"],
    ratingCount: json["rating_count"],
    avgRating: json["avg_rating"],
    minDeliveryTime: json["min_delivery_time"],
    maxDeliveryTime: json["max_delivery_time"],
    freeDelivery: json["free_delivery"],
    halalTagStatus: json["halal_tag_status"],
    nutritionsName: json["nutritions_name"],
    allergiesName: json["allergies_name"],
    cuisines: json["cuisines"] == null ? [] : List<Cuisine>.from(json["cuisines"]!.map((x) => Cuisine.fromJson(x))),
    taxData: json["tax_data"] == null ? [] : List<dynamic>.from(json["tax_data"]!.map((x) => x)),
    imageFullUrl: json["image_full_url"],
    translations: json["translations"] == null ? [] : List<Translation>.from(json["translations"]!.map((x) => Translation.fromJson(x))),
    storage: json["storage"] == null ? [] : List<Storage>.from(json["storage"]!.map((x) => Storage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "description": description,
    "status": status,
    "admin_id": adminId,
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
    "restaurant_id": restaurantId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "veg": veg,
    "slug": slug,
    "maximum_cart_quantity": maximumCartQuantity,
    "temp_available": tempAvailable,
    "open": open,
    "name": name,
    "available_time_starts": availableTimeStarts,
    "available_time_ends": availableTimeEnds,
    "available_date_starts": "${availableDateStarts!.year.toString().padLeft(4, '0')}-${availableDateStarts!.month.toString().padLeft(2, '0')}-${availableDateStarts!.day.toString().padLeft(2, '0')}",
    "available_date_ends": "${availableDateEnds!.year.toString().padLeft(4, '0')}-${availableDateEnds!.month.toString().padLeft(2, '0')}-${availableDateEnds!.day.toString().padLeft(2, '0')}",
    "recommended": recommended,
    "tags": tags,
    "restaurant_name": restaurantName,
    "restaurant_status": restaurantStatus,
    "restaurant_discount": restaurantDiscount,
    "restaurant_opening_time": restaurantOpeningTime,
    "restaurant_closing_time": restaurantClosingTime,
    "schedule_order": scheduleOrder,
    "rating_count": ratingCount,
    "avg_rating": avgRating,
    "min_delivery_time": minDeliveryTime,
    "max_delivery_time": maxDeliveryTime,
    "free_delivery": freeDelivery,
    "halal_tag_status": halalTagStatus,
    "nutritions_name": nutritionsName,
    "allergies_name": allergiesName,
    "cuisines": cuisines == null ? [] : List<dynamic>.from(cuisines!.map((x) => x.toJson())),
    "tax_data": taxData == null ? [] : List<dynamic>.from(taxData!.map((x) => x)),
    "image_full_url": imageFullUrl,
    "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toJson())),
    "storage": storage == null ? [] : List<dynamic>.from(storage!.map((x) => x.toJson())),
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
  String? name;
  String? type;
  dynamic min;
  dynamic max;
  String? required;
  List<Value>? values;

  Variation({
    this.name,
    this.type,
    this.min,
    this.max,
    this.required,
    this.values,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    name: json["name"],
    type: json["type"],
    min: json["min"],
    max: json["max"],
    required: json["required"],
    values: json["values"] == null ? [] : List<Value>.from(json["values"]!.map((x) => Value.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
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
  String? optionPrice;

  Value({
    this.label,
    this.optionPrice,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    label: json["label"],
    optionPrice: json["optionPrice"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "optionPrice": optionPrice,
  };
}
