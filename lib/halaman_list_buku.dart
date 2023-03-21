import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data_buku.dart';
import 'halaman_detail_buku.dart';

class HalamanList extends StatelessWidget {
  const HalamanList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Buku"),centerTitle: true,),
      body: ListView.builder(
        itemCount: listBuku.length,
          itemBuilder: (context, index) {
            final DataBuku buku = listBuku[index];

            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    HalamanDetail(buku: buku,),));
              },
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        height: MediaQuery.of(context).size.height/3,
                        child: Image.network(buku.imageLink),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          height: MediaQuery.of(context).size.height/3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(buku.title,style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0),),
                              SizedBox(
                                height: 10,
                              ),
                              Text(buku.author)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}
