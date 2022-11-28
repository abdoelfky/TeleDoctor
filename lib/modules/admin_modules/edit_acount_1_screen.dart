import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teledoctor/modules/admin_modules/edit_account_screen.dart';
import 'package:teledoctor/shared/component/components.dart';

class EditScreen1 extends StatefulWidget {
  const EditScreen1({Key? key}) : super(key: key);

  @override
  State<EditScreen1> createState() => _EditScreen1State();
}

class _EditScreen1State extends State<EditScreen1> {
  String email = "";

  List<Map<String, dynamic>> data = [
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
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState(); //addData();
  }

  @override
  Widget build(BuildContext context) {
    String name = "";

    List<Map<String, dynamic>> data = [
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white.withOpacity(.9),
          title: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Enter User Name'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
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

                  if (name.isEmpty) {
                    return InkWell(
                      onTap: (){
                        navigateTo(context, EditAccountScreen());
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
                          backgroundImage: NetworkImage(data['image']),
                        ),
                      ),
                    );
                  }
                  if (data['name']
                      .toString()
                      .toLowerCase()
                      .startsWith(name.toLowerCase())) {
                    return ListTile(
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
                        backgroundImage: NetworkImage(data['image']),
                      ),
                    );
                  }
                  return Container();
                });
          },
        ));
  }
}

Widget defaultButton3({
  double width = double.infinity,
  double height = 50.0,
  Color? color,
  required String string,
  required Function function,
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.red)),
      child: Center(
        child: MaterialButton(
            child: Text(string.toUpperCase(),
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.red)),
            onPressed: function()),
      ),
    );

/*Column(
          children: [
            SizedBox(
              width: 100,
            ),
            Card(
              elevation: 15,
              child: Container(
                height: size.height*.2,
                width: size.width*.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red)
                ),
                child: Center(
                  child: MaterialButton(
                      child: Text('Search',
                          style: TextStyle(fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.red)),
                      onPressed: (){

                      }),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('users').snapshots(),
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

                            if (email.isEmpty) {
                              return InkWell(
                                onTap: () {
                                  navigateTo(context, HomeScreen());
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Card(
                                    elevation: 40,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    //  color: Colors.blue,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, left: 10, bottom: 12),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional
                                                  .bottomEnd,
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: Colors.grey,
                                                  radius: 36,
                                                  backgroundImage: NetworkImage(
                                                      data['image']),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          data['name'],
                                                          style: TextStyle(
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          'Enter Data : 25,Nov 2022',
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 13.0,
                                                            fontWeight:
                                                                FontWeight.w200,
                                                          ),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Room No: 3',
                                                      ),
                                                      Spacer(),
                                                      TextButton(
                                                        child:
                                                            Text('Check Out'),
                                                        onPressed: () {
                                                          navigateTo(context,
                                                              AddAdminScreen());
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                            if (data['email']
                                .toString()
                                .toLowerCase()
                                .startsWith(email.toLowerCase())) {
                              return ListTile(
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
                                  backgroundImage: NetworkImage(data['image']),
                                ),
                              );
                            }
                            return Container();
                          });
                },
              ),
            ),
          ],
        )*/