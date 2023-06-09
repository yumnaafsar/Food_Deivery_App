import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});


  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {

  PageController pageController=PageController(viewportFraction: 0.85);

  var _currPageValue=0.0;

  double _scaleFactor=0.8;
  double _height=220;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue=pageController.page!;
        
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position){
        return _buildPageItem(position);
      }),
    );
  }

  Widget _buildPageItem(int index){

    Matrix4 matrix= new Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale= 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }
    else if(index ==_currPageValue.floor()+1){
      var currScale=_scaleFactor+(_currPageValue-index+1)-(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [Container(
          height: 220,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven?Color(0xFF69c5df): Color(0xFF9294cc),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/food1.jpg')
            )
          ),
        ),
    
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            
            child: Container(
              padding: EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
    
                  BigText(text: 'Fast Food Side'),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor, size: 15,),
                      )
                  ),
    
                  SizedBox(width: 10,),
    
                  SmallText(text: '4.5'),
    
                  SizedBox(width: 10,),
    
                  SmallText(text: '1287'),
    
                  SizedBox(width: 10,),
    
                  SmallText(text: "comments")
                      
                  ],
                  ),
    
                  SizedBox(height: 20,),
    
                  Row(
                    children: [
                      IconAndTextWidget(Icons.circle_sharp,
                       "Normal",
                        AppColors.iconColor1),
    
                         IconAndTextWidget(Icons.location_on,
                       "1.7km",
                        AppColors.mainColor),
    
                         IconAndTextWidget(Icons.access_time_rounded,
                       "32min",
                        AppColors.iconColor2)
                    ],
                  )
    
                ],
              ),
            ),
          ),
        ),
    
        ]
      ),
    );
  }
}