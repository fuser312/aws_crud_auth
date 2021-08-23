/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the ItemInfo type in your schema. */
@immutable
class ItemInfo extends Model {
  static const classType = const _ItemInfoModelType();
  final String id;
  final String? _Name;
  final double? _Price;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get Name {
    return _Name;
  }
  
  double? get Price {
    return _Price;
  }
  
  const ItemInfo._internal({required this.id, Name, Price}): _Name = Name, _Price = Price;
  
  factory ItemInfo({String? id, String? Name, double? Price}) {
    return ItemInfo._internal(
      id: id == null ? UUID.getUUID() : id,
      Name: Name,
      Price: Price);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemInfo &&
      id == other.id &&
      _Name == other._Name &&
      _Price == other._Price;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ItemInfo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("Name=" + "$_Name" + ", ");
    buffer.write("Price=" + (_Price != null ? _Price!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ItemInfo copyWith({String? id, String? Name, double? Price}) {
    return ItemInfo(
      id: id ?? this.id,
      Name: Name ?? this.Name,
      Price: Price ?? this.Price);
  }
  
  ItemInfo.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _Name = json['Name'],
      _Price = json['Price'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'Name': _Name, 'Price': _Price
  };

  static final QueryField ID = QueryField(fieldName: "itemInfo.id");
  static final QueryField NAME = QueryField(fieldName: "Name");
  static final QueryField PRICE = QueryField(fieldName: "Price");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ItemInfo";
    modelSchemaDefinition.pluralName = "ItemInfos";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ItemInfo.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ItemInfo.PRICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
  });
}

class _ItemInfoModelType extends ModelType<ItemInfo> {
  const _ItemInfoModelType();
  
  @override
  ItemInfo fromJson(Map<String, dynamic> jsonData) {
    return ItemInfo.fromJson(jsonData);
  }
}