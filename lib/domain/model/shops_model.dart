// To parse this JSON data, do
//
//     final shop = shopFromJson(jsonString);

import 'dart:convert';

Shop shopFromJson(String str) => Shop.fromJson(json.decode(str));

String shopToJson(Shop data) => json.encode(data.toJson());

class Shop {
    List<Result> results;

    Shop({
        required this.results,
    });

    factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    String store;
    String plantCustomer;
    String storeName;
    String country;
    String countryName;
    String transportZone;
    String transportZoneDescription;
    String physicalLocation;
    String physicalLocationName;
    bool storeSap;
    String siteBlockingReason;
    String siteBlockingReasonName;
    String openingDate;
    dynamic closingDate;
    String cityName;
    String postalCode;
    String streetName;
    String distributionChannel;
    String distributionChannelName;
    String salesOrganization;
    String salesOrganizationName;
    String addressIdbp;
    String additionalCustomerGroup1;
    String additionalCustomerGroup1Name;
    String additionalCustomerGroup2;
    String additionalCustomerGroup2Name;
    String latitude;
    String longitude;
    String department;
    String salesArea;

    Result({
        required this.store,
        required this.plantCustomer,
        required this.storeName,
        required this.country,
        required this.countryName,
        required this.transportZone,
        required this.transportZoneDescription,
        required this.physicalLocation,
        required this.physicalLocationName,
        required this.storeSap,
        required this.siteBlockingReason,
        required this.siteBlockingReasonName,
        required this.openingDate,
        required this.closingDate,
        required this.cityName,
        required this.postalCode,
        required this.streetName,
        required this.distributionChannel,
        required this.distributionChannelName,
        required this.salesOrganization,
        required this.salesOrganizationName,
        required this.addressIdbp,
        required this.additionalCustomerGroup1,
        required this.additionalCustomerGroup1Name,
        required this.additionalCustomerGroup2,
        required this.additionalCustomerGroup2Name,
        required this.latitude,
        required this.longitude,
        required this.department,
        required this.salesArea,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        store: json["Store"],
        plantCustomer: json["PlantCustomer"],
        storeName: json["StoreName"],
        country: json["Country"],
        countryName: json["CountryName"],
        transportZone: json["TransportZone"],
        transportZoneDescription: json["TransportZoneDescription"],
        physicalLocation: json["PhysicalLocation"],
        physicalLocationName: json["PhysicalLocationName"],
        storeSap: json["StoreSAP"],
        siteBlockingReason: json["SiteBlockingReason"],
        siteBlockingReasonName: json["SiteBlockingReasonName"],
        openingDate: json["OpeningDate"],
        closingDate: json["ClosingDate"],
        cityName: json["CityName"],
        postalCode: json["PostalCode"],
        streetName: json["StreetName"],
        distributionChannel: json["DistributionChannel"],
        distributionChannelName: json["DistributionChannelName"],
        salesOrganization: json["SalesOrganization"],
        salesOrganizationName: json["SalesOrganizationName"],
        addressIdbp: json["AddressIDBP"],
        additionalCustomerGroup1: json["AdditionalCustomerGroup1"],
        additionalCustomerGroup1Name: json["AdditionalCustomerGroup1Name"],
        additionalCustomerGroup2: json["AdditionalCustomerGroup2"],
        additionalCustomerGroup2Name: json["AdditionalCustomerGroup2Name"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        department: json["Department"],
        salesArea: json["SalesArea"],
    );

    Map<String, dynamic> toJson() => {
        "Store": store,
        "PlantCustomer": plantCustomer,
        "StoreName": storeName,
        "Country": country,
        "CountryName": countryName,
        "TransportZone": transportZone,
        "TransportZoneDescription": transportZoneDescription,
        "PhysicalLocation": physicalLocation,
        "PhysicalLocationName": physicalLocationName,
        "StoreSAP": storeSap,
        "SiteBlockingReason": siteBlockingReason,
        "SiteBlockingReasonName": siteBlockingReasonName,
        "OpeningDate": openingDate,
        "ClosingDate": closingDate,
        "CityName": cityName,
        "PostalCode": postalCode,
        "StreetName": streetName,
        "DistributionChannel": distributionChannel,
        "DistributionChannelName": distributionChannelName,
        "SalesOrganization": salesOrganization,
        "SalesOrganizationName": salesOrganizationName,
        "AddressIDBP": addressIdbp,
        "AdditionalCustomerGroup1": additionalCustomerGroup1,
        "AdditionalCustomerGroup1Name": additionalCustomerGroup1Name,
        "AdditionalCustomerGroup2": additionalCustomerGroup2,
        "AdditionalCustomerGroup2Name": additionalCustomerGroup2Name,
        "Latitude": latitude,
        "Longitude": longitude,
        "Department": department,
        "SalesArea": salesArea,
    };
}
