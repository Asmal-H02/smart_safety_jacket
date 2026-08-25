import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';


class CustomCard extends StatelessWidget {

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;


  const CustomCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
  });


  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        padding: padding ??
            const EdgeInsets.all(AppSpacing.lg),

        decoration: BoxDecoration(

          color: AppColors.card,

          borderRadius: BorderRadius.circular(
            AppSpacing.cardRadius,
          ),

          boxShadow: const [

            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 20,
              offset: Offset(0, 8),
            ),

          ],

        ),

        child: child,

      ),

    );

  }
}