import 'package:fam_home/entities/card_cta.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final CardCta cta;
  final VoidCallback? onPressed;

  const ActionButton({super.key, required this.cta, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: (cta.color!.withAlpha(100)),
        backgroundColor: cta.color ?? Theme.of(context).primaryColor,
        shape:
            cta.isCircular
                ? const CircleBorder()
                : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      ),
      child: Text(
        cta.text,
        style: TextStyle(
          color:
              (cta.color ?? Theme.of(context).primaryColor).computeLuminance() >
                      0.5
                  ? Colors.black
                  : Colors.white,
        ),
      ),
    );
  }
}
