import 'package:flutter/material.dart';

import '../helpers/ApiHandler.dart';
import '../helpers/error_handler.dart';
import '../models/Product.dart';
import '../resources/UrlResources.dart';
import '../views/product/ErrorPageProduct.dart';
import '../views/product/ViewProduct.dart';

class ProductProvider with ChangeNotifier
{
  List<Product> alldata;
  viewproduct(context) async
  {
    try
    {
      await ApiHandler.get(UrlResources.VIEW_PRODUCT).then((json){
        alldata = json["data"].map<Product>((obj)=> Product.fromJson(obj)).toList();
        notifyListeners();
      });
    }
    on ErrorHandler catch(e)
    {
      if(e.message=="Internet Connection Failure")
      {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>ErrorPageProduct())
        );
      }
    }
  }

  bool isinserted=false;
  var message="";
  addproduct(context,params) async
  {
    try
    {
      await ApiHandler.post(UrlResources.ADD_PRODUCT,body: params).then((json){
        if(json["status"]=="true")
        {
          isinserted=true;
          message = json["message"];
        }
        else
        {
          isinserted=false;
          message = json["message"];
        }
      });
    }
    on ErrorHandler catch(e)
    {
      if(e.message=="Internet Connection Failure")
      {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>ErrorPageProduct())
        );
      }
    }
  }
  bool isdeleted=false;
  deleteproduct(context,params) async
  {
    try
    {
      await ApiHandler.post(UrlResources.DELETE_PRODUCT,body: params)
          .then((json){
        if(json["status"]=="true")
        {
         isdeleted=true;
         message=json["message"];
        }
        else
        {
          isdeleted=false;
          message=json["message"];
        }
      });
    }
    on ErrorHandler catch(e)
    {
      if(e.message=="Internet Connection Failure")
      {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>ErrorPageProduct())
        );
      }
    }
  }
  bool isupdated=false;
  Product singleobj;
  getsinglerecord(context,params) async
  {
    try
    {
      await ApiHandler.post(UrlResources.GET_SINGLE_PRODUCT,body: params)
          .then((json) {
        singleobj = Product.fromJson(json["data"]);
      });
    }
    on ErrorHandler catch(e)
    {
      if(e.message=="Internet Connection Failure")
      {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>ErrorPageProduct())
        );
      }
    }
  }


  bool issave=false;
  saveproduct(context,params) async
  {
    try
    {
      await ApiHandler.post(UrlResources.UPDATE_PRODUCT,body: params)
          .then((json) {
        if(json["status"]=="true")
              {
                issave=true;
              }
        else
          {
            issave=false;
          }
      });
    }
    on ErrorHandler catch(e)
    {
      if(e.message=="Internet Connection Failure")
      {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>ErrorPageProduct())
        );
      }
    }
  }
}