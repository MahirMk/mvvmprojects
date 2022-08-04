import 'package:flutter/material.dart';

import '../helpers/ApiHandler.dart';
import '../helpers/error_handler.dart';
import '../models/Employee.dart';
import '../resources/UrlResources.dart';
import '../views/employee/ErrorPageEmployee.dart';

class EmployeeProvider with ChangeNotifier
{
  List<Employee> alldata;
  viewemployee(context) async
  {
    try
    {
      await ApiHandler.get(UrlResources.VIEW_EMPLOYEE).then((json){
        alldata = json["data"].map<Employee>((obj)=> Employee.fromJson(obj)).toList();
        notifyListeners();
      });
    }
    on ErrorHandler catch(e)
    {
      if(e.message=="Internet Connection Failure")
      {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>ErrorPageEmployee())
        );
      }
    }
  }
  bool isinserted=false;
  var message="";
  addemployee(context,params) async
  {
    try
    {
      await ApiHandler.post(UrlResources.ADD_EMPLOYEE,body: params).then((json){
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
            MaterialPageRoute(builder: (context)=>ErrorPageEmployee())
        );
      }
    }
  }
  bool isdeleted=false;
  deleteemployee(context,params) async
  {
    try
    {
      await ApiHandler.post(UrlResources.DELETE_EMPLOYEE,body: params)
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
            MaterialPageRoute(builder: (context)=>ErrorPageEmployee())
        );
      }
    }
  }

  getsinglerecord() async
  {

  }

  saveproduct() async
  {

  }
}