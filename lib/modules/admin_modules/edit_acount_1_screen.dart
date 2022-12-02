import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teledoctor/models/user_model.dart';
import 'package:teledoctor/modules/admin_modules/edit_account_screen.dart';
import 'package:teledoctor/shared/component/components.dart';
import '../../shared/constants/constants.dart';




class EditScreen1 extends StatefulWidget {
  const EditScreen1({Key? key}) : super(key: key);

  @override
  State<EditScreen1> createState() => _EditScreen1State();
}

class _EditScreen1State extends State<EditScreen1> {
  String name = "";

  /*List<Map<String, dynamic>> data = [
    {
      'name': 'John',
      'image':
      'https://i.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
      'email': 'john@gmail.com'
    },
    {
      'name': 'Eric',
      'image':
      'https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
      'email': 'eric@gmail.com'
    },
    {
      'name': 'Mark',
      'image':
      'https://i.picsum.photos/id/449/200/300.jpg?grayscale&hmac=GcAk7XLOGeBrqzrEpBjAzBcZFJ9bvyMwvL1QENQ23Zc',
      'email': 'mark@gmail.com'
    },
    {
      'name': 'Ela',
      'image':
      'https://i.picsum.photos/id/3/200/300.jpg?blur=2&hmac=CgtEzNwC4BLEa1z5r0oGOsZPj5wJlqjU615MLuFillY',
      'email': 'ela@gmail.com'
    },
    {
      'name': 'Sue',
      'image':
      'https://i.picsum.photos/id/497/200/300.jpg?hmac=IqTAOsl408FW-5QME1woScOoZJvq246UqZGGR9UkkkY',
      'email': 'sue@gmail.com'
    },
    {
      'name': 'Lothe',
      'image':
      'https://i.picsum.photos/id/450/200/300.jpg?hmac=EAnz3Z3i5qXfaz54l0aegp_-5oN4HTwiZG828ZGD7GM',
      'email': 'lothe@gmail.com'
    },
    {
      'name': 'Alyssa',
      'image':
      'https://i.picsum.photos/id/169/200/200.jpg?hmac=MquoCIcsCP_IxfteFmd8LfVF7NCoRre282nO9gVD0Yc',
      'email': 'Alyssa@gmail.com'
    },
    {
      'name': 'Nichols',
      'image':
      'https://i.picsum.photos/id/921/200/200.jpg?hmac=6pwJUhec4NqIAFxrha-8WXGa8yI1pJXKEYCWMSHroSU',
      'email': 'Nichols@gmail.com'
    },
    {
      'name': 'Welch',
      'image':
      'https://i.picsum.photos/id/845/200/200.jpg?hmac=KMGSD70gM0xozvpzPM3kHIwwA2TRlVQ6d2dLW_b1vDQ',
      'email': 'Welch@gmail.com'
    },
    {
      'name': 'Delacruz',
      'image':
      'https://i.picsum.photos/id/250/200/200.jpg?hmac=23TaEG1txY5qYZ70amm2sUf0GYKo4v7yIbN9ooyqWzs',
      'email': 'Delacruz@gmail.com'
    },
    {
      'name': 'Tania',
      'image':
      'https://i.picsum.photos/id/237/200/200.jpg?hmac=zHUGikXUDyLCCmvyww1izLK3R3k8oRYBRiTizZEdyfI',
      'email': 'Tania@gmail.com'
    },
    {
      'name': 'Jeanie',
      'image':
      'https://i.picsum.photos/id/769/200/200.jpg?hmac=M55kAfuYOrcJ8a49hBRDhWtVLbJo88Y76kUz323SqLU',
      'email': 'Jeanie@gmail.com'
    }
  ];
  addData() async {
    for (var element in data) {
      FirebaseFirestore.instance.collection('users').add(element);
    }
    print('all data added');
  }*/
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //addData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body:
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: blue5,
                        borderRadius: BorderRadius.circular(25)),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        )),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 7.0, left: size.width * .1),
                    child: Text(
                      'Search ',
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: '    Search... ',
                  suffixIcon: Icon(
                    Icons.search,
                  ),
                  suffixStyle: TextStyle(
                      color: primaryColor
                  ),
                  suffixIconColor:primaryColor ,

                  labelStyle: GoogleFonts.laila(
                    fontSize: 22,
                    color:primaryColor,
                    fontStyle: FontStyle.italic,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color:primaryColor,
                      width:2,
                    ),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color:primaryColor,
                      width:3,
                    ),
                  ),
                ),

                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('admins').snapshots(),
                builder: (context, snapshots) {
                  return (snapshots.connectionState == ConnectionState.waiting)
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : ListView.builder(
                      itemCount: snapshots.data!.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshots.data!.docs[index].data()
                        as Map<String, dynamic>;
                        UserModel model=UserModel.fromJson(data);

                        if (name.isEmpty) {
                          return Container();
                          /*InkWell(
                          onTap: (){
                            navigateTo(context, EditAccountScreen());
                          },
                          child: Card(
                            color: Colors.grey[100],

                            elevation: 5,

                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15))),

                            //  color: Colors.blue,

                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 12,
                                left: 12,
                              ),
                              child: Container(
                                child: Row(
                                  children: [
                                    //image
                                    Container(
                                      width: 80,
                                      height: 85,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(
                                            width: 6,
                                            color: Colors.white,
                                          )),
                                      child: Center(
                                        child: Image(
                                          image: AssetImage('images/profile.png'
                                          ),
                                          fit: BoxFit.fill,
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      width: 10.0,
                                    ),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            data['name'],
                                            style: TextStyle(
                                                fontSize: 16.0, fontWeight: FontWeight.bold),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            data['email'],
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w200,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          );*/

                        }
                        if (data['name']
                            .toString()
                            .toLowerCase()
                            .startsWith(name.toLowerCase())&&(data['type']=='DOCTOR'||data['type']=='NURSE')) {
                          return InkWell(
                            onTap: (){
                              navigateTo(context, EditAccountScreen(model:model,));
                            },
                            child: ListTile(
                              title: Text(
                                data['name'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                data['email'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              leading: CircleAvatar(
                                backgroundImage: AssetImage('images/profile.png'
                                ),
                              ),
                            ),
                          );
                        }
                        return Container();
                      });
                },
              ),
            ),
          ],
        ));
  }
}