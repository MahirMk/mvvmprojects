import 'package:flutter/material.dart';

import 'package:mvvmprojects/views/product/UpdateProduct.dart';
import 'package:provider/provider.dart';

import '../../providers/ProductProvider.dart';

class ViewProduct extends StatefulWidget {

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {

  ProductProvider provider;

  getdata() async
  {

   await provider.viewproduct(context);

    // Uri url = Uri.parse(UrlResources.VIEW_PRODUCT);
    // var response = await http.get(url);
    // //200 ok 400 api problem 500 server error
    // if(response.statusCode==200)
    // {
    //   var body = response.body.toString();
    //   var json = jsonDecode(body);
    //   setState((){
    //     alldata = json["data"].map<Product>((obj)=> Product.fromJson(obj)).toList();
    //   });
    // }
    // else
    // {
    //   print("API Error");
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("VIEW PRODUCT"),
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
                      onTap: (){},
                      child: Card(
                        child: Column(
                          children: [
                            SizedBox(height: 10.0,),
                            Row(
                              children: [
                                Container(
                                    child: Text("PID : ",style: TextStyle(color: Colors.blue,fontSize: 20,),)),
                                Padding(
                                  padding: const EdgeInsets.only(right: 28.0),
                                  child: Text(provider.alldata[index].pid.toString(),
                                    style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.w700,fontSize: 20,
                                      decoration: TextDecoration.underline,
                                      decorationStyle: TextDecorationStyle.wavy,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Row(
                              children: [
                                Text("Name :- ",style: TextStyle(color: Colors.blue,fontSize: 30),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 28.0),
                                  child: Text(provider.alldata[index].pname,style: TextStyle(color: Colors.blue.shade900,fontSize: 30),),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Row(
                              children: [
                                Text("Quantity : ",style: TextStyle(color: Colors.blue,fontSize: 27),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 25.0),
                                  child: Text(provider.alldata[index].qty,style: TextStyle(color: Colors.blue.shade900,fontSize: 25),),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Row(
                              children: [
                                Text("Price : ",style: TextStyle(color: Colors.blue,fontSize: 25),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 28.0),
                                  child: Container(
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Text(provider.alldata[index].price.toString(),style: TextStyle(fontSize: 25,color: Colors.blue.shade900),),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Row(
                              children: [
                                Text("Added Date : ",style: TextStyle(color: Colors.blue,fontSize: 20),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 28.0),
                                  child: Text(provider.alldata[index].addedDatetime.toString(),style: TextStyle(fontSize: 20,color: Colors.blue.shade900),),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Container(
                              width: 350,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                                onPressed: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>UpdateProduct(updateid: provider.alldata[index].pid.toString(),))
                                  );
                                },
                                child: Text("UPDATE",style: TextStyle(color: Colors.white)),
                              ),
                            ),
                            Container(
                              width: 350,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red, // Background color
                                ),
                                onPressed: (){
                                  AlertDialog alert = new AlertDialog(
                                    title: Text("Warning!",style: TextStyle(color: Colors.white),),
                                    backgroundColor: Colors.orange,
                                    content: Text("Are you sure you want to delete record?",style: TextStyle(color: Colors.white),),
                                    actions: [
                                      TextButton(onPressed: (){
                                        Navigator.of(context).pop();
                                      }, child: Text("Cancel",style: TextStyle(color: Colors.white),)
                                      ),
                                      TextButton(onPressed: () async{

                                        var id = provider.alldata[index].pid.toString();

                                        Map<String,String> params = {
                                          "pid":id
                                        };

                                        await provider.deleteproduct(context, params);
                                        if(provider.isdeleted)
                                          {
                                            Navigator.of(context).pop();
                                            await provider.viewproduct(context);
                                          }
                                        else
                                          {
                                            print(provider.message);
                                          }

                                        // await ApiHandler.post("http://picsyapps.com/studentapi/deleteProductNormal.php",body: params)
                                        //     .then((json){
                                        //     if(json["status"]=="true")
                                        //     {
                                        //       Navigator.of(context).pop();
                                        //       setState((){
                                        //         provider.alldata = getdata();
                                        //       });
                                        //       print("Record Deleted");
                                        //     }
                                        //     else
                                        //     {
                                        //       var msg=json["message"];
                                        //       print(msg);
                                        //     }
                                        // });

                                        // Uri url = Uri.parse("http://picsyapps.com/studentapi/deleteProductNormal.php");
                                        // var response = await http.post(url,body: params);
                                        // if(response.statusCode==200)
                                        // {
                                        //   var json = jsonDecode(response.body);
                                        //   if(json["status"]=="true")
                                        //   {
                                        //     Navigator.of(context).pop();
                                        //     setState((){
                                        //       alldata = getdata();
                                        //     });
                                        //     print("Record Deleted");
                                        //   }
                                        //   else
                                        //   {
                                        //     var msg=json["message"];
                                        //     print(msg);
                                        //   }
                                        // }
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
      ):Center(child: CircularProgressIndicator()),
    );
  }
}
