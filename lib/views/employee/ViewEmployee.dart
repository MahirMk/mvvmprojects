import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:http/http.dart' as http;
import 'package:mvvmprojects/providers/EmployeeProvider.dart';
import 'package:provider/provider.dart';

import '../../resources/UrlResources.dart';


class ViewEmployee extends StatefulWidget {

  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}

class _ViewEmployeeState extends State<ViewEmployee> {

  EmployeeProvider provider;

  getdata() async
  {
    await provider.viewemployee(context);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<EmployeeProvider>(context,listen: false);
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<EmployeeProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("VIEW EMPLOYEE"),
      ),
      body: (provider.alldata!=null)?ListView.builder(
        itemCount: provider.alldata.length,
        itemBuilder: (context,index)
        {
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Card(
                        color: Colors.blue.shade100,
                        child: Column(
                          children: [
                            SizedBox(height: 10.0,),
                            Row(
                              children: [
                                Text("Eid : ",style: TextStyle(color: Colors.black,fontSize: 25),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 28.0),
                                  child: Text(provider.alldata[index].eid,style: TextStyle(color: Colors.black,fontSize: 25),),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Row(
                              children: [
                                Text("Name : ",style: TextStyle(color: Colors.black,fontSize: 25),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 28.0),
                                  child: Text(provider.alldata[index].ename,style: TextStyle(color: Colors.black,fontSize: 25),),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Row(
                              children: [
                                Text("Salary : ",style: TextStyle(color: Colors.black,fontSize: 25),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 28.0),
                                  child: Text(provider.alldata[index].salary,style: TextStyle(color: Colors.black,fontSize: 25),),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Row(
                              children: [
                                Text("Department : ",style: TextStyle(color: Colors.black,fontSize: 25),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 28.0),
                                  child: Text(provider.alldata[index].department,style: TextStyle(color: Colors.black,fontSize: 25),),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Row(
                              children: [
                                Text("Gender : ",style: TextStyle(color: Colors.black,fontSize: 25),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 28.0),
                                  child: Text(provider.alldata[index].gender,style: TextStyle(color: Colors.black,fontSize: 25),),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Row(
                              children: [
                                Text("Date : ",style: TextStyle(color: Colors.black,fontSize: 25),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 28.0),
                                  child: Text(provider.alldata[index].addedDatetime,style: TextStyle(color: Colors.black,fontSize: 25),),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Container(
                              width: 350,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red.shade900,
                                ),
                                onPressed: (){
                                  AlertDialog alert = new AlertDialog(
                                    title: Text("Warning!",style: TextStyle(color: Colors.white),),
                                    backgroundColor: Colors.black,
                                    content: Text("Are you sure you want to delete record?",style: TextStyle(color: Colors.white),),
                                    actions: [
                                      TextButton(onPressed: (){
                                        Navigator.of(context).pop();
                                      }, child: Text("Cancel",style: TextStyle(color: Colors.white),)
                                      ),
                                      TextButton(onPressed: () async{

                                        var id = provider.alldata[index].eid.toString();


                                        Map<String,String> params = {
                                          "eid":id
                                        };

                                        await provider.deleteemployee(context, params);
                                        if(provider.isdeleted)
                                        {
                                          Navigator.of(context).pop();
                                          await provider.viewemployee(context);
                                        }
                                        else
                                        {
                                          print(provider.message);
                                        }
                                      }, child: Text("Delete",style: TextStyle(color: Colors.white),)
                                      ),
                                    ],
                                  );
                                  showDialog(context: context, builder: (BuildContext context){
                                    return alert;
                                  });
                                },
                                child: Text("REMOVE",style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ):Center(
        child: LoadingAnimationWidget.threeArchedCircle(
          color: Colors.purple,
          size: 80,
        ),
      ),
    );
  }
}
