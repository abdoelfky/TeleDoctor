import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/models/patient_model.dart';
import 'package:teledoctor/modules/doctor_nurse_modules/patient_details_1_screen.dart';
import 'package:teledoctor/shared/component/components.dart';
import '../../models/user_model.dart';
import '../../shared/constants/constants.dart';
import '../../shared/local/shared_preference.dart';
import '../admin_modules/checkout_screen.dart';

class SearchForPatientScreen extends StatefulWidget {
  const SearchForPatientScreen({Key? key}) : super(key: key);

  @override
  State<SearchForPatientScreen> createState() => _SearchForPatientScreenState();
}

class _SearchForPatientScreenState extends State<SearchForPatientScreen> {
  String name = "";
  String uId = CacheHelper.getData(key: 'uId');


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 7.0, left: size.width * .08),
                    child: Text(
                      '  Search For Patients ',
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
                  suffixStyle: TextStyle(color: primaryColor),
                  suffixIconColor: primaryColor,
                  labelStyle: GoogleFonts.laila(
                    fontSize: 22,
                    color: primaryColor,
                    fontStyle: FontStyle.italic,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 3,
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
                stream:
                FirebaseFirestore.instance.collection('patients').snapshots(),
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
                        PatientModel model = PatientModel.fromJson(data);

                        if (name.isEmpty) {
                          return Container();
                        }
                        if (data['name']
                            .toString()
                            .toLowerCase()
                            .startsWith(name.toLowerCase())
                            &&( (data['selectedDoctorUID'] == uId)||
                                (data['selectedNurseUID'] == uId)))
                        {
                          return InkWell(
                              onTap: () {},
                              child: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 1,
                                itemBuilder: (context, index) =>
                                    buildItem(context, model, index),
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 8,
                                ),
                              ));
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

Widget buildItem(context, PatientModel patient, index) => InkWell(
  onTap: () {
    navigateTo(
        context,
        PatientDetailsScreen1(
          patientModel: patient,
        ));
  },
  child: Card(
    color: Colors.grey[100],

    elevation: 5,

    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))),

    //  color: Colors.blue,

    child: Padding(
      padding:
      const EdgeInsets.only(right: 12, left: 12, top: 12, bottom: 12),
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
                  image: AssetImage(
                    'images/profile.jpeg',
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
                    '${patient.name}',
                    style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Registered Date: ${DateFormat("yyyy-MM-dd").format(DateTime.parse(patient.registeredDate.toString()))}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w200,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        'Room No : ${patient.roomNo}',
                        style: TextStyle(color: primaryColor),
                      ),
                      Spacer(),
                      Text(
                        'Active',
                        style: TextStyle(color: Colors.red[800]),
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
);