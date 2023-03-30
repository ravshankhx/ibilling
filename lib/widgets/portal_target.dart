

import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';


class WPortalTarget extends StatefulWidget {
  final List<String> list;

  const WPortalTarget({Key? key, required this.list}) : super(key: key);

  @override
  State<WPortalTarget> createState() => _WPortalTargetState();
}

class _WPortalTargetState extends State<WPortalTarget> {
  bool _isOpen = true;
  String _value = '';

  List<MyRadioListTile<String>> listOfMyRadioListTile() {
    List<MyRadioListTile<String>> myRadioListTile = [];
    for (int i = 0; i < widget.list.length; i++) {
      myRadioListTile.add(MyRadioListTile<String>(
        value: widget.list[i],
        groupValue: _value,
        title: Text(
          widget.list[i],
          style: const TextStyle(color: Color(0xffE7E7E7)),
        ),
        onChanged: (value) => setState(() {

          _value = value!;
          _isOpen=!_isOpen;
        }),
      ));
    }
    return myRadioListTile;
  }

  @override
  Widget build(BuildContext context) {
    return PortalTarget(
      visible: true,
      anchor: const Aligned(
          follower: Alignment.topCenter, target: Alignment.bottomCenter),
      portalFollower: AnimatedCrossFade(
        firstChild: const SizedBox(),
        secondChild: IntrinsicHeight(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: listOfMyRadioListTile(),
            ),
          ),
        ),
        crossFadeState:
            _isOpen ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 200),
        reverseDuration: const Duration(milliseconds: 200),
      ),
      child: InkWell(

        onTap: () {
          setState(() {
            _isOpen = !_isOpen;
          });
        },
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              border: const Border(
                top: BorderSide(
                  width: 1.2,
                  style: BorderStyle.solid,
                  color: Color(0xff1F1F1F),
                ),
                bottom: BorderSide(
                  width: 1.2,
                  style: BorderStyle.solid,
                  color: Color(0xff1F1F1F),
                ),
                right: BorderSide(
                  width: 1.2,
                  style: BorderStyle.solid,
                  color: Color(0xff1F1F1F),
                ),
                left: BorderSide(
                  width: 1.2,
                  style: BorderStyle.solid,
                  color: Color(0xff1F1F1F),
                ),
              ),
              color: Colors.black,
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // TextFormField(),

                Text(
                  _value,
                  style: const TextStyle(color: Color(0xffF1F1F1), fontSize: 14),
                ),
                const Spacer(),

                const Icon(
                  IconlyBold.arrow_down_circle,
                  color: Color(0xff200E32),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Widget? title;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        color: const Color(0xff2A2A2D),
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            if (title != null) title,
            const Spacer(),
            _customRadioButton,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return isSelected
        ? SvgPicture.asset("assets/icons/button_checked.svg")
        : SvgPicture.asset("assets/icons/button_unchecked.svg");
  }
}
