/// API模块
///
/// 连接服务端

/// API Service
class ApiService with DataSchemaApiMixin {

}


/// 数据模型API
mixin DataSchemaApiMixin {
  listDataSchemas() {}

  retrieveDataSchema(String id) {}

  destroyDataSchema(String id) {}

  saveDataSchema(Map<String, dynamic> jsonData) {}
}
