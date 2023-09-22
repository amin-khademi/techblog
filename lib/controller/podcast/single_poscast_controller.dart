import 'dart:async';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:techblog/constant/api_constant.dart';
import 'package:techblog/models/podcasts_file_model.dart';
import 'package:techblog/services/dio_service.dart';

class SinglePodcastController extends GetxController {
  var id;

  SinglePodcastController({this.id});
  RxBool loading = false.obs;
  RxList<PodcastFileModel> podcastFileList = RxList();
  final player = AudioPlayer();
  late var playList;
  RxBool playState = false.obs;
  RxInt currentFileIndex = 0.obs;
  Timer? timer;
  RxBool isLoopAll = false.obs;
  @override
  onInit() async {
    super.onInit();
    playList = ConcatenatingAudioSource(
      useLazyPreparation: true,
      children: [],
    );
    await getPodcastFile();
    await player.setAudioSource(playList,
        initialIndex: 0, initialPosition: Duration.zero);
  }

  getPodcastFile() async {
    loading.value = true;
    var response =
        await DioService().getMethod(ApiUrlconstant.podcastFile + id);
    if (response.statusCode == 200) {
      for (var element in response.data["files"]) {
        podcastFileList.add(PodcastFileModel.fromJson(element));
        playList.add(AudioSource.uri(
            Uri.parse(PodcastFileModel.fromJson(element).file!)));
      }
      loading.value = false;
    }
  }

  Rx<Duration> progressValue = Duration(seconds: 0).obs;
  Rx<Duration> bufferValue = Duration(seconds: 0).obs;

  startProgress() {
    const tick = Duration(seconds: 1);
    int duration = player.duration!.inSeconds - player.position.inSeconds;
    if (timer != null && timer!.isActive) {
      timer!.cancel();
      timer = null;
    }
    Timer.periodic(tick, (timer) {
      duration--;
      progressValue.value = player.position;
      bufferValue.value = player.bufferedPosition;
      if (duration <= 1) {
        timer.cancel();
        progressValue.value = const Duration(seconds: 0);
        bufferValue.value = const Duration(seconds: 0);
      }
    });
  }

  setLoopmode() {
    if (isLoopAll.value) {
      isLoopAll.value = false;
      player.setLoopMode(LoopMode.off);
    } else {
      isLoopAll.value = true;
      player.setLoopMode(LoopMode.all);
    }
  }
}
