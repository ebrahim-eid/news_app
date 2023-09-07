import 'package:dio/dio.dart';

import '../components/constants.dart';
import '../models/class_model.dart';
import '../network/error_model.dart';
import '../network/exception.dart';

class DioData{
  Future <List<ArticlesModel>> getBusiness()async{
    final response = await Dio().get(AppConstants.url('business'));
    if (response.statusCode ==200){
      return List<ArticlesModel>.from((response.data['articles'] as List)
          .map((e) => ArticlesModel.fromJson(e)));
    }
    else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
  Future <List<ArticlesModel>> getSports()async{
    final response = await Dio().get(AppConstants.url('sports'));
    if (response.statusCode ==200){
      return List<ArticlesModel>.from((response.data['articles'] as List)
          .map((e) => ArticlesModel.fromJson(e)));
    }
    else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
  Future <List<ArticlesModel>> getScience()async{
    final response = await Dio().get(AppConstants.url('science'));
    if (response.statusCode ==200){
      return List<ArticlesModel>.from((response.data['articles'] as List)
          .map((e) => ArticlesModel.fromJson(e)));
    }
    else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
  Future <List<ArticlesModel>> getSearch(String value)async{
    final response = await Dio().get(AppConstants.searchUrl(value));
    if (response.statusCode ==200){
      return List<ArticlesModel>.from((response.data['articles'] as List)
          .map((e) => ArticlesModel.fromJson(e)));
    }
    else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }


}