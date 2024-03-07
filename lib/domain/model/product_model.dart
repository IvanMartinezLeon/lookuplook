// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    List<ProductElement> products;

    Product({
        required this.products,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        products: List<ProductElement>.from(json["Products"].map((x) => ProductElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class ProductElement {
    String uuid;
    String product;
    String commercialReference;
    String material;
    String materialName;
    String color;
    String colorName;
    String cobolSizeGroup;
    String externalMaterialGroup;
    String baseReferenceForEComm;
    String baseColorForEComm;
    String mainReference;
    String baseReferenceRelabel;
    bool isRelabel;
    String season;
    String seasonYear;
    String countryOfOrigin;
    String businessPartner;
    String businessPartnerName;
    String requirementSegment;
    String styleCode;
    String baseStyle;
    String cobolStatus;
    String creationDate;
    String creationTime;
    String createdByUser;
    bool isMarkedForDeletion;
    dynamic cancelDate;
    String cancelTime;
    dynamic cancelTimestamp;
    dynamic reactivateDate;
    String reactivateTime;
    dynamic reactivateTimestamp;
    String productImageUrl;

    ProductElement({
        required this.uuid,
        required this.product,
        required this.commercialReference,
        required this.material,
        required this.materialName,
        required this.color,
        required this.colorName,
        required this.cobolSizeGroup,
        required this.externalMaterialGroup,
        required this.baseReferenceForEComm,
        required this.baseColorForEComm,
        required this.mainReference,
        required this.baseReferenceRelabel,
        required this.isRelabel,
        required this.season,
        required this.seasonYear,
        required this.countryOfOrigin,
        required this.businessPartner,
        required this.businessPartnerName,
        required this.requirementSegment,
        required this.styleCode,
        required this.baseStyle,
        required this.cobolStatus,
        required this.creationDate,
        required this.creationTime,
        required this.createdByUser,
        required this.isMarkedForDeletion,
        required this.cancelDate,
        required this.cancelTime,
        required this.cancelTimestamp,
        required this.reactivateDate,
        required this.reactivateTime,
        required this.reactivateTimestamp,
        required this.productImageUrl,
    });

    factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        uuid: json["Uuid"],
        product: json["Product"],
        commercialReference: json["CommercialReference"],
        material: json["Material"],
        materialName: json["MaterialName"],
        color: json["Color"],
        colorName: json["ColorName"],
        cobolSizeGroup: json["CobolSizeGroup"],
        externalMaterialGroup: json["ExternalMaterialGroup"],
        baseReferenceForEComm: json["BaseReferenceForEComm"],
        baseColorForEComm: json["BaseColorForEComm"],
        mainReference: json["MainReference"],
        baseReferenceRelabel: json["BaseReferenceRelabel"],
        isRelabel: json["IsRelabel"],
        season: json["Season"],
        seasonYear: json["SeasonYear"],
        countryOfOrigin: json["CountryOfOrigin"],
        businessPartner: json["BusinessPartner"],
        businessPartnerName: json["BusinessPartnerName"],
        requirementSegment: json["RequirementSegment"],
        styleCode: json["StyleCode"],
        baseStyle: json["BaseStyle"],
        cobolStatus: json["CobolStatus"],
        creationDate: json["CreationDate"],
        creationTime: json["CreationTime"],
        createdByUser: json["CreatedByUser"],
        isMarkedForDeletion: json["IsMarkedForDeletion"],
        cancelDate: json["CancelDate"],
        cancelTime: json["CancelTime"],
        cancelTimestamp: json["CancelTimestamp"],
        reactivateDate: json["ReactivateDate"],
        reactivateTime: json["ReactivateTime"],
        reactivateTimestamp: json["ReactivateTimestamp"],
        productImageUrl: json["ProductImageURL"],
    );

    Map<String, dynamic> toJson() => {
        "Uuid": uuid,
        "Product": product,
        "CommercialReference": commercialReference,
        "Material": material,
        "MaterialName": materialName,
        "Color": color,
        "ColorName": colorName,
        "CobolSizeGroup": cobolSizeGroup,
        "ExternalMaterialGroup": externalMaterialGroup,
        "BaseReferenceForEComm": baseReferenceForEComm,
        "BaseColorForEComm": baseColorForEComm,
        "MainReference": mainReference,
        "BaseReferenceRelabel": baseReferenceRelabel,
        "IsRelabel": isRelabel,
        "Season": season,
        "SeasonYear": seasonYear,
        "CountryOfOrigin": countryOfOrigin,
        "BusinessPartner": businessPartner,
        "BusinessPartnerName": businessPartnerName,
        "RequirementSegment": requirementSegment,
        "StyleCode": styleCode,
        "BaseStyle": baseStyle,
        "CobolStatus": cobolStatus,
        "CreationDate": creationDate,
        "CreationTime": creationTime,
        "CreatedByUser": createdByUser,
        "IsMarkedForDeletion": isMarkedForDeletion,
        "CancelDate": cancelDate,
        "CancelTime": cancelTime,
        "CancelTimestamp": cancelTimestamp,
        "ReactivateDate": reactivateDate,
        "ReactivateTime": reactivateTime,
        "ReactivateTimestamp": reactivateTimestamp,
        "ProductImageURL": productImageUrl,
    };
}
