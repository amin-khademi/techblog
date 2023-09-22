import 'dart:async';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:techblog/component/decorations.dart';
import 'package:techblog/component/dimens.dart';
import 'package:techblog/controller/podcast/single_poscast_controller.dart';
import 'package:techblog/models/podcast_model.dart';
import '../../component/my_componnent.dart';
import '../../constant/my_colros.dart';
import '../../gen/assets.gen.dart';

class SinglePodcast extends StatelessWidget {
  late SinglePodcastController controller;
  late PodcastModel podcastModel;

  SinglePodcast({super.key}) {
    podcastModel = Get.arguments;
    controller = Get.put(SinglePodcastController(id: podcastModel.id));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: Get.height / 2.2,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: podcastModel.poster!,
                        imageBuilder: (context, imageProvider) => Image(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                        placeholder: (context, url) => const Loading(),
                        errorWidget: (context, url, error) =>
                            Image.asset(Assets.img.singlePlaceHolder.path),
                      ),
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
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 32, 0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      podcastModel.title!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.img.profileImg.path,
                        width: 50,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(podcastModel.author!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.podcastFileList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            await controller.player
                                .seek(Duration.zero, index: index);
                            controller.currentFileIndex.value =
                                controller.player.currentIndex!;
                            controller.timerCheck();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ImageIcon(
                                      Image.asset(Assets.icon.micro.path).image,
                                      color: SolidColor.seeMore,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SizedBox(
                                      width: Get.width / 1.5,
                                      child: Obx(
                                        () => Text(
                                          controller
                                              .podcastFileList[index].title!,
                                          style:
                                              controller.currentFileIndex
                                                          .value ==
                                                      index
                                                  ? Theme.of(context)
                                                      .textTheme
                                                      .headline3
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                    "${controller.podcastFileList[index].length!}:00")
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          right: Dimens.marginBody,
          left: Dimens.marginBody,
          child: Container(
            height: Get.height / 6,
            decoration: MyDecoration.maingradient,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => ProgressBar(
                      baseBarColor: Colors.white,
                      thumbColor: Colors.redAccent,
                      progressBarColor: Colors.redAccent,
                      progress: controller.progressValue.value,
                      buffered: controller.bufferValue.value,
                      total: controller.player.duration ?? Duration(seconds: 0),
                      onSeek: (duration) async {
                        controller.player.seek(duration);
                        if(controller.player.playing){
                            controller.startProgress();
                        }else if(duration <=Duration(seconds: 0)){
                          await controller.player.seekToNext();
                          controller.currentFileIndex.value =
                              controller.player.currentIndex!;
                              controller.timerCheck();
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await controller.player.seekToNext();
                          controller.currentFileIndex.value =
                              controller.player.currentIndex!;
                          controller.timerCheck();
                        },
                        child: const Icon(
                          Icons.skip_next,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          controller.player.playing
                              ? controller.player.pause()
                              : controller.player.play();

                          controller.player.playing
                              ? controller.timer!.cancel()
                              : controller.startProgress();

                          controller.playState.value =
                              !controller.playState.value;

                          controller.currentFileIndex.value =
                              controller.player.currentIndex!;
                        },
                        child: Obx(
                          () => Icon(
                            controller.playState.value
                                ? Icons.pause_circle_filled
                                : Icons.play_circle,
                            color: Colors.white,
                            size: 48,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await controller.player.seekToPrevious();
                          controller.currentFileIndex.value =
                              controller.player.currentIndex!;
                          controller.timerCheck();
                        },
                        child: const Icon(
                          Icons.skip_previous,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(),
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.setLoopmode();
                          },
                          child: Icon(
                            Icons.repeat_outlined,
                            color: controller.isLoopAll.value
                                ? Colors.blue
                                : Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    )));
  }
}
