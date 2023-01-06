import 'package:ecom/service/article_service.dart';
import 'package:flutter/material.dart';

class listarticlesbycat extends StatefulWidget {
  listarticlesbycat(this.id,this.name);

  final String?  id;
  final String?  name;
  @override
  _listarticlesbycatState createState() => _listarticlesbycatState();
}

class _listarticlesbycatState extends State<listarticlesbycat> {
  _listarticlesbycatState();
 List<dynamic> _items = [];
  bool _isLoading = true;
  
  final articleservice _apiService = articleservice();
  @override
  void initState() {
    super.initState();
    _fetchItems();
  }
void _fetchItems() async {
    final items = await _apiService.getArtbyCat(widget.id.toString());
    setState(() {
      _items = items;
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
          title: Text(widget.name.toString()),
          centerTitle: true,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        drawer: Drawer(),
        body:_isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          String description = _items[index]['LibArt'];
          String displayDescription;
          if (description.length > 17) {
             displayDescription = description.substring(0, 17)+"...";
          } else {
             displayDescription = description;
          }
          
              return Card(

                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.network('https://assets.simpleviewinc.com/simpleview/image/upload/c_limit,h_1200,q_75,w_1200/v1/clients/frisco-redesign/Main_Nav_Cuisine_Types_a445ed69-f8df-4525-a0a3-817a20541590.jpg', width: 100),
                  Padding(
                    
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                        Text(displayDescription, style: Theme.of(context).textTheme.bodyMedium),
                        Text(_items[index]['prix1'].toString()+" DT", style: Theme.of(context).textTheme.headline6),
                    
                        Text('', style: Theme.of(context).textTheme.bodyLarge),
                         ],
                    ),
                  ),
                  const Spacer(),
                  const Spacer(),
                  const Spacer(), 
                  Padding(
                    
                    padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                    child:  FloatingActionButton(
                              heroTag: "btn2",
                              onPressed: () {
                                
                              },
                              child: const Icon(Icons.info),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.purple,
                            ),
                  ),
                  
              
            
               
                ],
              ),
            ),
                
          );
        },
      ),
        );
  }
}