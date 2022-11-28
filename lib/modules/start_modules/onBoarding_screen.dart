import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';
import 'package:teledoctor/shared/constants/constants.dart';
import '../../models/onBoarding_model.dart';




class OnBoardingScreen extends StatelessWidget {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        title: 'Welcome To Teledoctor',
        body: 'Facilitates Follow-up patients and discuss issues with the nurse',
        image: 'images/onBoarding1.png'),
    BoardingModel(
        title: 'We are making virtual healthcare more accessible . ',
        body: 'Together,let\’s innovate for impact',
        image: 'images/onBoarding2.png'),
    BoardingModel(
        title: 'Smart patient care system',
        body: 'Smart application to make doctor always aware of the patient\'s condition',
        image: 'images/onBoarding3.png')
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        listener:(context,state){} ,
        builder:(context,state)
        {
          var cubit=AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('TeleDoctor',style: TextStyle(fontSize: 27),),
              backgroundColor: primaryColor,
              actions: [
                TextButton(
                    onPressed: (){
                      cubit.submit(context);
                    },
                    child: Row(
                      children: [
                        Text('SKIP',
                          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                          ,),
                        SizedBox(width: 5,),
                        Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,)
                      ],
                    ))


              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller:  boardController,
                      onPageChanged: (int index){
                        cubit.changeOnBoarding(index,boarding.length);
                      },
                      physics:  BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                      itemCount: boarding.length,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SmoothPageIndicator(
                        controller: boardController,
                        effect: ExpandingDotsEffect(
                          activeDotColor:primaryColor,
                          dotColor: Colors.grey,
                          dotHeight: 10,
                          expansionFactor: 3,
                          dotWidth: 10,
                          spacing: 5,
                        ),
                        count: boarding.length,
                      ),
                      Spacer(),
                      FloatingActionButton(
                        backgroundColor:primaryColor,
                        onPressed: ()
                        {
                          if(cubit.isLast)
                          {
                            cubit.submit(context);
                          }else
                          {
                            boardController.nextPage(
                              duration: Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.fastLinearToSlowEaseIn,
                            );
                          }
                        },
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } ,

    );
  }

  Widget buildBoardingItem(BoardingModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage('${model.image}',),

          ),
        ),
        Text(
          '${model.title}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          '${model.body}',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
