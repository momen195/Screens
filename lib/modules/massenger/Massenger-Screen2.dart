import 'package:flutter/material.dart';

class MassengerScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 15.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage('https://www.sqorebda3.com/vb/attachments/36076/'),
            ),
            SizedBox(
              width: 9.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
              ),),
          ],
        ),
        actions: [
          IconButton(onPressed: (){},
              icon: CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.camera_alt,
                  size: 22.0,
                  color: Colors.white,
                  //color: Colors.white,
                ),
              )
          ),
          IconButton(onPressed: (){},
              icon: CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.edit,
                  size: 22.0,
                  color: Colors.white,
                  //color: Colors.white,
                ),
              )
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:EdgeInsets.all(2.0,) ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search,),
                    SizedBox(width: 9.0,),
                    Text('Search'),
                  ],
                ),
              ),
              SizedBox(
                height: 6.0,),
              Container(

                height: 85,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index) => BuildStoryItem(),
                  separatorBuilder: (context,index) => SizedBox(width: 8.0,),
                  itemCount: 10,
                ),
              ),
              SizedBox(
                height: 6.0,),
              ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index) => BuildChatItem(),
                    separatorBuilder: (context,index)=> SizedBox(height: 8.0,),
                    itemCount: 30,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget BuildChatItem() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://www.sqorebda3.com/vb/attachments/36070/'),
            radius: 25.0,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 8.0,
          ),
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 7.0,
          ),
        ],
      ),
      SizedBox(
        width: 7.0,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'mena Ali MOhamed',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 7.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Hello my name is Mena ALi Mohamed',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  child: CircleAvatar(
                    radius: 4.0,
                    backgroundColor: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: 3.0,
                ),
                Text(
                  '02:45 PM',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
  Widget BuildStoryItem() => Container(
    width: 50.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://www.sqorebda3.com/vb/attachments/36069/'),
              radius: 25.0,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 8.0,
            ),
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 7.0,
            ),
          ],
        ),
        Text(
          'salma mansor mohamed',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );


}
