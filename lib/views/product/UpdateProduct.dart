import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/ProductProvider.dart';
import 'ViewProduct.dart';

class UpdateProduct extends StatefulWidget {

  var updateid="";
  UpdateProduct({this.updateid});
  
  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {

  TextEditingController _name = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();
  ProductProvider provider;
  getsingledata() async
  {
    Map<String,String> params = {
      "pid":widget.updateid
    };
    await provider.getsinglerecord(context, params);
    setState(() {
      _name.text = provider.singleobj.pname.toString();
      _qty.text = provider.singleobj.qty.toString();
      _price.text = provider.singleobj.price.toString();
    });
  }

  // getsingledata() async
  // {
  //   Uri url = Uri.parse(UrlResources.GET_SINGLE_PRODUCT);
  //   Map<String,String> params = {
  //     "pid":widget.updateid
  //   };
  //   var response = await http.post(url,body: params);
  //   if(response.statusCode==200)
  //     {
  //       var json = jsonDecode(response.body);
  //       Product obj = Product.fromJson(json["data"]);
  //       setState((){
  //         _name.text = obj.pname.toString();
  //         _qty.text = obj.qty.toString();
  //         _price.text = obj.price.toString();
  //       });
  //     }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
    getsingledata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Product"),
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

                    Map<String,String> params = {
                      "pname":name,
                      "qty":qty,
                      "price":price,
                      "pid":widget.updateid,
                    };

                    await provider.saveproduct(context, params);
                    if(provider.issave)
                      {
                        Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=>ViewProduct())
                                );
                      }
                    else
                      {
                        print("error");
                      }
                    
                    // await ApiHandler.post(UrlResources.UPDATE_PRODUCT,body: params)
                    //     .then((json){
                    //   if(json["status"]=="true")
                    //       {
                    //         Navigator.of(context).pop();
                    //         Navigator.of(context).pop();
                    //         Navigator.of(context).push(
                    //           MaterialPageRoute(builder: (context)=>ViewProduct())
                    //         );
                    //       }
                    // });

                    // Uri url = Uri.parse(UrlResources.UPDATE_PRODUCT);
                    // Map<String,String> params = {
                    //   "pname":name,
                    //   "qty":qty,
                    //   "price":price,
                    //   "pid":widget.updateid,
                    // };
                    // var response = await http.post(url,body: params);
                    // if(response.statusCode==200) {
                    //   var json = jsonDecode(response.body);
                    //   if(json["status"]=="true")
                    //     {
                    //       Navigator.of(context).pop();
                    //       Navigator.of(context).pop();
                    //       Navigator.of(context).push(
                    //         MaterialPageRoute(builder: (context)=>ViewProduct())
                    //       );
                    //     }
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
