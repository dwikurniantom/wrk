import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wrk/presentation/providers/home_provider.dart';
import 'package:wrk/presentation/widgets/home/fragment_two.dart';

import '../../common/core/change_notifier_page.dart';
import '../widgets/home/fragment_one.dart';

class HomePage extends ChangeNotifierPage<HomeProvider> {
  static const routeName = '/';

  const HomePage({
    super.key,
  });

  @override
  Widget buildWidget(
    BuildContext context,
    Widget? child,
    Object? arguments,
  ) {
    return Scaffold(
      body: buildBody(
        context,
        screenSize: MediaQuery.of(context).size,
      ),
    );
  }

  @override
  create(BuildContext context, Object? arguments) {
    return HomeProvider(
      context: context,
    );
  }

  Widget buildBody(
    BuildContext context, {
    required Size screenSize,
  }) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return PageView(
          controller: provider.fragmentController,
          scrollDirection: Axis.vertical,
          pageSnapping: true,
          allowImplicitScrolling: true,
          children: [
            FragmentOne(
              screenSize: screenSize,
              scrollController: provider.fragmentController,
            ),
            FragmentTwo(
              screenSize: screenSize,
            ),
          ],
        );
      },
    );
  }
}
