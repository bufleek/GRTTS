import 'package:flutter/material.dart';
import 'package:grtts/data/models/time_summary.dart';
import 'package:grtts/ui/theme/colors.dart';
import 'package:grtts/ui/theme/typography.dart';

class TimeSummaryItem extends StatelessWidget {
  const TimeSummaryItem({
    super.key,
    required this.timeSummary,
  });
  final TimeSummary timeSummary;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            timeSummary.title,
            style: AppTypography.body(),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              color: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 2),
                child: Text(
                  "${timeSummary.hours.toStringAsFixed(4)} hrs",
                  textAlign: TextAlign.center,
                  style: AppTypography.bodyBold(color: AppColors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
