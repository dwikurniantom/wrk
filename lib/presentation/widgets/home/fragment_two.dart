import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wrk/presentation/providers/home_provider.dart';

import '../composable/horizontal_wrapper.dart';

class FragmentTwo extends StatelessWidget {
  final Size screenSize;

  const FragmentTwo({
    required this.screenSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => MouseRegion(
        onEnter: (event) {
          debugPrint('enter');
        },
        onHover: (event) {
          provider.changeFrameworkPanning(
            Offset(
              event.delta.dx / 10,
              event.delta.dy / 10,
            ),
          );
        },
        child: Container(
          height: screenSize.height,
          width: double.infinity,
          color: Colors.yellow,
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 24,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/photos/potrait-1.png',
                                ),
                                alignment: Alignment.topCenter,
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: screenSize.height * 0.6,
                            width: 450,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 48,
                              bottom: 48,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48),
                              border: Border.all(
                                color: Colors.amber,
                                width: 10,
                              ),
                            ),
                            height: screenSize.height * 0.6,
                            width: 450,
                          ),
                        ],
                      ),
                    ),
                    experiencesSection(context),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        nameSection(context, provider),
                        const SizedBox(
                          height: 48,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            languagesSection(context, provider),
                            const SizedBox(height: 32),
                            frameworksSection(context, provider),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget nameSection(
    BuildContext context,
    HomeProvider provider,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.black,
              ),
        ),
        Text(
          "I'm Dwi Kurnianto",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.black,
              ),
        ),
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              'Senior Mobile Apps Engineer',
              textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
              speed: const Duration(
                milliseconds: 100,
              ),
            ),
            TyperAnimatedText(
              'Open source contributor',
              textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
              speed: const Duration(
                milliseconds: 100,
              ),
            ),
          ],
          displayFullTextOnTap: true,
          repeatForever: true,
          stopPauseOnTap: true,
        ),
      ],
    );
  }

  Widget languagesSection(
    BuildContext context,
    HomeProvider provider,
  ) {
    return ValueListenableBuilder<Offset>(
      valueListenable: provider.frameworkPan,
      builder: (context, offset, child) {
        return Transform.translate(
          offset: offset,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Languages : ',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 12,
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: provider.languages.length,
                  itemBuilder: (context, index) => Chip(
                    label: Text(
                      provider.languages[index],
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget frameworksSection(
    BuildContext context,
    HomeProvider provider,
  ) {
    return ValueListenableBuilder<Offset>(
      valueListenable: provider.frameworkPan,
      builder: (context, offset, child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(offset.dx / 50)
            ..rotateY(offset.dy / 50),
          alignment: FractionalOffset.center,
          child: Container(
            margin: const EdgeInsets.only(
              left: 24,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Frameworks : ',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 12,
                ),
                Consumer<HomeProvider>(
                  builder: (context, provider, child) {
                    return HorizontalWrapper(
                      itemCount: provider.frameworks.length,
                      itemBuilder: (context, index) => Chip(
                        label: Text(
                          provider.frameworks[index],
                        ),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 16,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget experiencesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '#6 Years+',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
        Text(
          'With 6 years plus working experience on various '
          'industries.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
