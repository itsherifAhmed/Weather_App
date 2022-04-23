import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/controller/HomeController.dart';

import '../constants/images.dart';
import '../model/current_weather_data.dart';


class MyList extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>
            VerticalDivider(
              color: Colors.transparent,
              width: 5,
            ),
        itemCount: controller.dataList.length,
        itemBuilder: (context, index) {
          CurrentWeatherData? data;
          (controller.dataList.length > 0)
              ? data = controller.dataList[index]
              : data = null;
          return Container(
            width: 140,
            height: 150,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      (data != null)
                          ? '${data.name}'
                          : '',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                        fontFamily: 'flutterfonts',
                      ),
                    ),
                    Text(
                      (data != null)
                          ? '${(data.main!.temp !- 273.15).round().toString()}\u2103'
                          : '',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                        fontFamily: 'flutterfonts',
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: LottieBuilder.asset(
                          Images.cloudyAnim),
                    ),
                    Text(
                      (data != null)
                          ? '${data.weather![0].description}'
                          : '',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(
                        color: Colors.black45,
                        fontFamily: 'flutterfonts',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
