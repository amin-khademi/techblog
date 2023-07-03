import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/component/my_colros.dart';
import 'package:techblog/component/my_componnent.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';

class Single extends StatelessWidget {
  const Single({super.key});

  @override
  Widget build(BuildContext context) {
    var id=Get.arguments[0];
    var themeData = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              // CachedNetworkImage(
              //   imageUrl:
              //       "https://techblog.sasansafari.com/Techblog/assets/upload/images/article/20220904181457.jpg",
              //   imageBuilder: (context, imageProvider) => Container(
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(16),
              //         image: DecorationImage(
              //             image: imageProvider, fit: BoxFit.cover)),
              //   ),
              //   placeholder: (context, url) => const Loading(),
              //   errorWidget: (context, url, error) =>
              //       Image.asset(Assets.img.singlePlaceHolder.path),
              // ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                color: Colors.red,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 60,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                          colors: GradientColors.singleAppBarGradient)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.bookmark_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "راز های اساسینز کرید والهالا: از هری پاتر و ارباب حلقه ها تا دارک سولز",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.black, fontSize: 16),
            ),
          ),
          Row(
            children: [
              Image.asset(
                Assets.img.profileImg.path,
                width: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Text("فاطمه امیری",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
              SizedBox(
                width: 20,
              ),
              Text("تاریخ")
            ],
          ),
          SizedBox(height: 20,),
          Text(
              "datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata"),
              tags()
        ],
      ),
    ));
  }

  Widget tags(){
    return SizedBox(
      height: 45,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: taghList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? 15 : 15, 0),
            child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        gradient: const LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: GradientColors.tags),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          children: [
            Assets.icon.hash.image(height: 14),
            const SizedBox(
              width: 8,
            ),
            Text(
              taghList[index].titile,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
    )
          );
        },
      ),
    );
  }

  
}
