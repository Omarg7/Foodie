import 'package:cooking_recipes/core/utils/app_font_weights.dart';
import 'package:cooking_recipes/core/widgets/custom_app_bar.dart';
import 'package:cooking_recipes/features/meals/presentation/widgets/instructions_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/utils/utils.dart';

class RecipeVideoScreen extends StatefulWidget {
  const RecipeVideoScreen(
      {Key? key, required this.videoUrl, required this.instructions})
      : super(key: key);
  final String videoUrl;
  final List<String> instructions;
  @override
  State<RecipeVideoScreen> createState() => _RecipeVideoScreenState();
}

class _RecipeVideoScreenState extends State<RecipeVideoScreen> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;
  late String videoId;
  @override
  void initState() {
    videoId = YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '';
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: false,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
    super.initState();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        customTitle: 'Recipe Video',
        context: context,
        customElevation: AppSizes.size0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YoutubePlayerBuilder(
                onExitFullScreen: () {
                  // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
                  SystemChrome.setPreferredOrientations(
                      DeviceOrientation.values);
                },
                player: YoutubePlayer(
                  topActions: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.settings))
                  ],
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                  onReady: () {
                    _isPlayerReady = true;
                    _controller.addListener(listener);
                  },
                ),
                builder: (context, player) {
                  return player;
                }),
            
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    _controller.metadata.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.deepOrange.shade700),
                  ),
                  const SizedBox(
                    height: AppSizes.size10,
                  ),
                  // Container(
                  //     decoration: BoxDecoration(
                  //       color: const Color(0xFFfff8f0),
                  //       borderRadius: BorderRadius.circular(AppSizes.radius15),
                  //     ),
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: AppSizes.size20, vertical: AppSizes.size30),
                  //     margin: const EdgeInsets.symmetric(
                  //         horizontal: AppSizes.size5, vertical: AppSizes.size5),
                  //     child: Text(
                  //       'Discover the art of culinary perfection! Watch the recipe video tutorial for a step-by-step guide to master this recipe and unlock culinary secrets.',
                  //       style: Theme.of(context).textTheme.bodyLarge,
                  //     )),
                  // const SizedBox(
                  //   height: AppSizes.size10,
                  // ),

                  const SizedBox(
                    height: AppSizes.size10,
                  ),

                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: ListTile(
                          leading: const Icon(Icons.assignment_ind_outlined),
                          title: Text(
                            _controller.metadata.author,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        )),
                        const VerticalDivider(),
                        Expanded(
                            child: ListTile(
                          leading: const Icon(Icons.timer_sharp),
                          title: Text(
                            DateFormat('HH:mm:ss').format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    _controller.metadata.duration.inMilliseconds)),
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.size20,
                  ),
                  InstructionsCard(instructions: widget.instructions),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
