import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/ProductProvider.dart';
class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  TextEditingController _name = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();
  ProductProvider provider;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("ADD PRODUCT")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 120,),
            Text("Name",style: TextStyle(fontSize: 30,)),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration:  BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue,width: 3.0),
                  boxShadow: [
                    BoxShadow(color: Colors.yellow.shade200, blurRadius: 5.0, spreadRadius: 0.4)
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: TextField(
                  controller: _name,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(fillColor: Colors. white, filled: true,border: InputBorder.none,),
                  style: TextStyle(color: Colors. black,fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.name,
                ),
              ),
            ),
            Text("Quantity",style: TextStyle(fontSize: 30)),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration:  BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue,width: 3.0),
                  boxShadow: [
                    BoxShadow(color: Colors.yellow.shade200, blurRadius: 5.0, spreadRadius: 0.4)
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: TextField(
                  controller: _qty,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(fillColor: Colors. white, filled: true,border: InputBorder.none,),
                  style: TextStyle(color: Colors. black,fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.name,
                ),
              ),
            ),
            Text("Price",style: TextStyle(fontSize: 30)),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration:  BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue,width: 3.0),
                  boxShadow: [
                    BoxShadow(color: Colors.yellow.shade200, blurRadius: 5.0, spreadRadius: 0.4)
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: TextField(
                  controller: _price,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(fillColor: Colors. white, filled: true,border: InputBorder.none,),
                  style: TextStyle(color: Colors. black,fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.name,
                ),
              ),
            ),
            SizedBox(height: 60,),
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 3.0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Center(child:
              GestureDetector(
                  onTap: () async{
                    var name = _name.text.toString();
                    var qty = _qty.text.toString();
                    var price = _price.text.toString();

                    Map<String,String> params ={
                      "pname":name,
                      "qty":qty,
                      "price":price
                    };

                    await provider.addproduct(context,params);

                    if(provider.isinserted)
                      {
                        print(provider.message);
                        _name.text="";
                        _qty.text="";
                        _price.text="";
                      }
                    else
                      {
                        print(provider.message);
                      }

                    // await ApiHandler.post(UrlResources.ADD_PRODUCT,body: params).then((json){
                    //     if(json["status"]=="true")
                    //     {
                    //       var msg = json["message"];
                    //       print(msg);
                    //     }
                    //     else
                    //     {
                    //       var msg = json["message"];
                    //       print(msg);
                    //     }
                    //     _name.text="";
                    //     _qty.text="";
                    //     _price.text="";
                    // });

                    // Uri url = Uri.parse(UrlResources.ADD_PRODUCT);
                    // var response = await http.post(url,body: params);
                    // if(response.statusCode==200)
                    // {
                    //   var json = jsonDecode(response.body);
                    //   if(json["status"]=="true")
                    //   {
                    //     var msg = json["message"];
                    //     print(msg);
                    //   }
                    //   else
                    //   {
                    //     var msg = json["message"];
                    //     print(msg);
                    //   }
                    //   _name.text="";
                    //   _qty.text="";
                    //   _price.text="";
                    // }
                  },
                  child: Text("Submit",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold))
              ),
              ),
            ),
            SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }
}
