import 'package:flutter/material.dart';
import 'package:mvvmprojects/providers/EmployeeProvider.dart';
import 'package:provider/provider.dart';

class AddEmployee extends StatefulWidget {

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {

  EmployeeProvider provider;

  TextEditingController _name = TextEditingController();
  TextEditingController _salary = TextEditingController();

  var grpvalue = "M";
  var select = "e1";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<EmployeeProvider>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD EMPLOYEE"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 20.0),
              child: Text("Name"),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: _name,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1,color: Colors.yellow),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 20.0),
              child: Text("Salary"),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: _salary,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1,color: Colors.yellow),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text("Gender"),
            ),
            Row(
              children: [

                Container(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text("Male"),
                ),
                Radio(
                  value: "M",
                  groupValue: grpvalue,
                  onChanged: (val)
                  {
                    setState(() {
                      grpvalue=val;
                    });
                  },
                ),
                Text("Female"),
                Radio(
                  value: "F",
                  groupValue: grpvalue,
                  onChanged: (val)
                  {
                    setState(() {
                      grpvalue=val;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: DropdownButton(
                  value: select,
                  onChanged: (val)
                  {
                    setState(() {
                      select = val;
                    });
                  },
                  items:[
                    DropdownMenuItem(
                      child: Text("1"),
                      value: "e1",
                    ),
                    DropdownMenuItem(
                      child: Text("2"),
                      value: "e2",
                    ),
                    DropdownMenuItem(
                      child: Text("3"),
                      value: "e3",
                    ),
                    DropdownMenuItem(
                      child: Text("4"),
                      value: "e4",
                    ),
                    DropdownMenuItem(
                      child: Text("5"),
                      value: "e5",
                    ),
                  ]
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () async {

                  var txtname = _name.text.toString();
                  var txtsalary = _salary.text.toString();
                  var txtdepartment = select.toString();
                  var txtgender = grpvalue.toString();


                  Map<String,String> params ={
                    "ename":txtname,
                    "salary":txtsalary,
                    "department":txtdepartment,
                    "gender":txtgender,
                  };

                 await provider.addemployee(context,params);

                  if(provider.isinserted)
                  {
                    print(provider.message);
                    _name.text="";
                    _salary.text="";
                    select="";
                    grpvalue="";
                  }
                  else
                  {
                    print(provider.message);
                  }
                },
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
