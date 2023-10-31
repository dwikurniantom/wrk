import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../providers/home_provider.dart';

class FragmentOne extends StatelessWidget {
  final Size screenSize;
  final ScrollController scrollController;

  const FragmentOne({
    required this.screenSize,
    required this.scrollController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Container(
        height: screenSize.height,
        width: double.infinity,
        color: Colors.red,
        alignment: Alignment.center,
        child: Animate(
          target: 1,
          adapter: ScrollAdapter(
            scrollController,
            end: 1,
            begin: screenSize.height,
          ),
          effects: const [
            FadeEffect(end: 1, begin: 0),
            ScaleEffect(),
          ],
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Hello World',
                textStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Colors.white,
                    ),
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'By Dwi Kurnianto',
                textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                    ),
                speed: const Duration(
                  milliseconds: 100,
                ),
              ),
            ],
            displayFullTextOnTap: true,
            repeatForever: false,
            isRepeatingAnimation: false,
            stopPauseOnTap: true,
          ),
        ),
      ),
    );
  }
}
