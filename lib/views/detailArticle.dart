import 'package:ecom/models/article.dart';
import 'package:ecom/service/article_service.dart';
import 'package:ecom/views/editarticle.dart';
import 'package:flutter/material.dart';



class DetailArticle extends StatefulWidget {
  DetailArticle(this.art);

  final article art;

  @override
  _DetailArticletState createState() => _DetailArticletState();
}

class _DetailArticletState extends State<DetailArticle> {
  _DetailArticletState();

  final articleservice api = articleservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar:  AppBar(
        title: Text("Detail Article"),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: (){
            Navigator.of(context).pop();
          },
          
        ),
           actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.delete_outline_rounded,
        color: Colors.white,
      ),
      onPressed: () {
        _showConfirmationDialog();

      },
    )
  ],

      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
                    Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color: Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://cdn.pixabay.com/photo/2018/02/26/21/44/hamburger-3184108__340.png",
                                ))),
                      ),
                 
              Container(
                padding: EdgeInsets.all(20.0),
                child: Card(
                    child: Container(
                        padding: EdgeInsets.all(10.0),
                        width: 440,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Column(
                                children: <Widget>[
                                  Text("Nom d'article :",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8))),
                                  Text(
                                    widget.art.libArt.toString(),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Column(
                                children: <Widget>[
                                  Text('Prix :',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8))),
                                  Text(
                                    widget.art.prix1.toString()+" DT",
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Column(
                                children: <Widget>[
                                  Text('CODE ARTICLE :',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8))),
                                  Text(
                                    widget.art.codeArt.toString(),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Column(
                                children: <Widget>[
                                  Text('Code categories :',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8))),
                                  Text(
                                    widget.art.codeCat.toString(),
                                  )
                                ],
                              ),
                            ),
     Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: RaisedButton(child: Text("MODIFIER"),onPressed: () => {

                                 Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditArticle(widget.art)))
                              },)
                            ),


                          ],
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _showConfirmationDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirmation'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Êtes-vous sûr de supprimer cet article?'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop();
              // delete the item here
            },
          ),
        ],
      );
    },
  );
}

}