import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ChangeNotifierPage<T extends ChangeNotifier>
    extends StatelessWidget {
  final Widget? child;
  final bool lazy;
  final Key? changeNotifierKey;

  const ChangeNotifierPage({
    this.child,
    this.lazy = true,
    this.changeNotifierKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    return ChangeNotifierProvider<T>(
      key: changeNotifierKey,
      lazy: lazy,
      create: (context) => create(context, arguments),
      builder: (context, child) {
        return buildWidget(context, child, arguments);
      },
      child: child,
    );
  }

  Widget buildWidget(
    BuildContext context,
    Widget? child,
    Object? arguments,
  );

  T provider(
    BuildContext context,
    bool listen,
  ) {
    return Provider.of<T>(
      context,
      listen: listen,
    );
  }

  T create(BuildContext context, Object? arguments);
}
