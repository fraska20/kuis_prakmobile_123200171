import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data_buku.dart';

class HalamanDetail extends StatefulWidget {
  final DataBuku buku;

  const HalamanDetail({Key? key, required this.buku}) : super(key: key);

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.buku.title),
        actions: <Widget>[IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
        },
      )],),
      body: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            Container(
              width: MediaQuery.of(context).size.width/3,
              height: MediaQuery.of(context).size.height/3,
              child: Image.network(widget.buku.imageLink),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Judul                        : " + widget.buku.title,),
                  Text("Penulis                      : " + widget.buku.author),
                  Text("Bahasa                       : " + widget.buku.language),
                  Text("Negara                       : " + widget.buku.country),
                  Text("Jumlah Halaman               : " + widget.buku.pages.toString()),
                  Text("Tahun Terbit                 : " + widget.buku.year.toString()),
                  widget.buku.isAvailable ? Text("Status                       : Tersedia",
                    style: TextStyle(
                      color : Colors.lightGreenAccent,
                    ),
                  ) : Text("Status                       : Tidak Tersedia",
                    style: TextStyle(
                      color : Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: widget.buku.isAvailable ? () {
                  String text = "";
                  setState(() {
                    text = "Berhasil Meminjam Buku";
                    widget.buku.isAvailable = false;
                  });

                  SnackBar snackBar = SnackBar(content: Text(text),backgroundColor: Colors.green,);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } : null,
                child: Text("Pesan"),
              ),
            ),
          ]
      ),
    );
  }
}
