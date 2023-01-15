import 'package:flutter/material.dart';
class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context,i){
return Container(
  width: double.infinity,
  child: Card(
    elevation: 7,
    child: Column(
      children: [
        Row(
          
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(''))
              ),
            ),
            SizedBox(width: 6,),
            Text('name:'),
             SizedBox(width: 3,),
              Text('nof'),
          ],
        ),
        Row(

          children: [
            SizedBox(width: 75,),
              Text('name:'),
             SizedBox(width: 3,),
              Text('nof'),
          ],
        ),
          Row(

          children: [
            SizedBox(width: 75,),
              Text('name:'),
             SizedBox(width: 3,),
              Text('nof'),
          ],
        ),
          Row(

          children: [
            SizedBox(width: 75,),
              Text('name:'),
             SizedBox(width: 3,),
              Text('nof'),
          ],
        ),
      ],
    ),
  ),
);
          }
          )
        )),
    );
  }
}