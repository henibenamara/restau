import 'package:ecom/models/article.dart';
import 'package:ecom/service/article_service.dart';
import 'package:ecom/views/addimagearticle.dart';
import 'package:flutter/material.dart';




class addarticle extends StatefulWidget {
  

 


  @override
  _addarticlePageState createState() => _addarticlePageState();
}

class _addarticlePageState extends State<addarticle>  {

  bool showPassword = false;
  @override
  Widget build(BuildContext context)  {
    final codeArt = TextEditingController(text: "");
    final codeCat = TextEditingController(text: "");
    final libArt = TextEditingController(text: "");
    final prix1 = TextEditingController(text: "");
    return Scaffold(
      appBar: AppBar(
        title:Text("Ajouter article",) ,

        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {Navigator.of(context).pop();},
        ),

      ),
      body: Container(

        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [

              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
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
                                "https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child:InkWell (
                            onTap: (){
                             Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                     builder: (context) => uploadphotoArticle()));
                            },
                            child :Container(

                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: Theme
                                      .of(context)
                                      .scaffoldBackgroundColor,
                                ),
                                color: Colors.blue,
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ))),
                  ],
                ),
              ),


              SizedBox(
                height: 35,
              ),
              buildTextField("Code Article", "", codeArt),
              buildTextField("Code Categorie", "", codeCat),
              buildTextField("libelle", "", libArt),
              buildTextField("prix", "",prix1 ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {Navigator.of(context).pop();},
                    child: Text("Annuler",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                    //  String nom = nomC.text;
                     // String prenom = prenomC.text;
                     // String adresse = AdresseC.text;


                     // String numero = numC.text;

                      articleservice api = articleservice();
                   /*  api.updateClient(
                          widget.client.id,
                          nom,
                          prenom,
                          adresse,
                          numero);*/

                   /*   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardClient()));*/
                    },
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Ajouter",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, TextEditingController controlleur) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextFormField(
        controller: controlleur,

        decoration: InputDecoration(

            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,

            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}