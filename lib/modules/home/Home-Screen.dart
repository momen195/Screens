import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'First App',
        ),
        actions: [
          IconButton(
              onPressed: (){print('Search');} ,
              icon: Icon(Icons.search)
          ),
          IconButton(
              onPressed: (){print('Notification');},
              icon: Icon(Icons.notification_important))
        ],
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 50.0,
      ),
      body: SingleChildScrollView(
        // scrollDirection: Axis.vertical  ,

        child:
        Container(

          color: Colors.brown,
          width: double.infinity,
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image(
                        image: NetworkImage('https://momayz.net/wp-content/uploads/2019/05/12828-1.jpg'),
                        height: 350.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        color: Colors.black45.withOpacity(0.6),
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 10.0,),
                        child: Text(
                          'Girle',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 50.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.blue,
                child: Text(
                  'momen',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                color: Colors.amber,
                child: Text(
                  'jou',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: Text(
                  'mohsen',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                color: Colors.pink,
                child: Text(
                  'adnan',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                color: Colors.blue,
                child: Text(
                  'momen',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                color: Colors.amber,
                child: Text(
                  'jou',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: Text(
                  'mohsen',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                color: Colors.pink,
                child: Text(
                  'adnan',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                color: Colors.blue,
                child: Text(
                  'momen',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                color: Colors.amber,
                child: Text(
                  'jou',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: Text(
                  'mohsen',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                color: Colors.pink,
                child: Text(
                  'adnan',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                color: Colors.blue,
                child: Text(
                  'momen',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                color: Colors.amber,
                child: Text(
                  'jou',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: Text(
                  'mohsen',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                color: Colors.pink,
                child: Text(
                  'adnan',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );

  }
}