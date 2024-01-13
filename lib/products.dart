import 'package:flutter/material.dart';
import 'package:project/pages/product_detail.dart';

class product extends StatefulWidget {
  static const String id='product';
  const product({super.key});
  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  var product_list=[
    {
      "name":"game 1",
      "picture":"images/fortnite-3.jpeg",
      "price":"900"
    },
    {
      "name":"game 2",
      "picture":"images/slider-1.webp",
      "price":"1000"
    },
    {
      "name":"game 2",
      "picture":"images/slider-2.webp",
      "price":"1000"
    },
    {
      "name":"game 2",
      "picture":"images/slider-3.webp",
      "price":"1000"
    },
    {
      "name":"game 2",
      "picture":"images/slider-4.jpeg",
      "price":"1000"
    },
    {
      "name":"game 2",
      "picture":"images/fortnite-3.jpeg",
      "price":"1000"
    },
    {
      "name":"game 2",
      "picture":"images/fortnite-3.jpeg",
      "price":"1000"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index){
          return single_product(
            product_name: product_list[index]['name'],
            product_image: product_list[index]['picture'],
            product_price: product_list[index]['price'],
          );
        }
    );
  }
}


class single_product extends StatelessWidget {
  const single_product({super.key, this.product_name, this.product_image, this.product_price});
  final product_name;
  final product_image;
  final product_price;


  @override
  Widget build(BuildContext context) {
    return Card(
      child:Hero(
        tag:product_name,
        child: Material(
          child: InkWell(onTap: ()=>Navigator.of(context).push(
              new MaterialPageRoute(builder: (context)=> new product_detail(
                product_detail_name: product_name,
                product_detail_image: product_image,
                product_detail_price: product_price,
              ))),
            child:GridTile(
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  leading:Text(product_name,style: TextStyle(fontWeight: FontWeight.bold),),
                  title: Text('\pkr$product_price'),
                )
              ),
               child: Image.asset(product_image, fit: BoxFit.cover,)),

            )
          )
        )
      );
  }
}
