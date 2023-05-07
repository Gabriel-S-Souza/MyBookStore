import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../nav_bar_notifier/botton_nav_bar_notifier.dart';

class BottomNavBarWidget extends StatefulWidget {
  final List<IconData>? icons;
  final List<String>? names;
  final void Function(int index)? onTap;
  final Future<bool> Function(int index)? authorizeTap;

  const BottomNavBarWidget({
    Key? key,
    this.onTap,
    this.icons,
    this.names,
    this.authorizeTap,
  }) : super(key: key);

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  late Size size;
  late final List<IconData> _icons;
  late final List<String> _names;
  late final int itemCount;

  @override
  void initState() {
    super.initState();
    _icons = widget.icons ??
        [
          Icons.home_outlined,
          Icons.search_rounded,
          Icons.add_box_outlined,
          Icons.person_2_outlined,
        ];

    _names = widget.names ??
        [
          'Home',
          'Funcionários',
          'Livros',
          'Meu Perfil',
        ];

    itemCount = _icons.length;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: NavBarNotifier.I,
        builder: (context, _) => SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              itemCount,
              (index) => Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final bool authorized = await widget.authorizeTap?.call(index) ?? true;
                    if (authorized) {
                      NavBarNotifier.I.changeIndex(index);
                      widget.onTap?.call(index);
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _icons[index],
                        size: 30,
                        color: NavBarNotifier.I.navBarCurrentIndex == index
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.primary.withOpacity(0.5),
                      ),
                      const SizedBox(height: 4),
                      AutoSizeText(
                        _names[index],
                        style: TextStyle(
                          fontSize: 12,
                          color: NavBarNotifier.I.navBarCurrentIndex == index
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.primary.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
