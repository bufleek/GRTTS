import 'package:flutter/material.dart';
import 'package:grtts/data/providers/main_provider.dart';
import 'package:grtts/ui/layouts/main_layout.dart';
import 'package:grtts/ui/theme/colors.dart';
import 'package:grtts/ui/theme/typography.dart';
import 'package:grtts/ui/widgets/time_reports/time_summary_item.dart';
import 'package:grtts/utils/strings.dart';
import 'package:provider/provider.dart';

class TimeReportsScreen extends StatelessWidget {
  const TimeReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      showTopView: false,
      appBar: AppBar(
        title: Text("time_reports".get()),
        elevation: 0,
      ),
      child: Consumer<MainProvider>(builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: GridView.builder(
                itemCount: provider.timeReportSummaries.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemBuilder: (context, index) {
                  return TimeSummaryItem(
                    timeSummary: provider.timeReportSummaries[index],
                  );
                },
              ),
            ),
            Card(
              elevation: 0,
              color: AppColors.white.withAlpha(50),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        ...["Date", "Time In", "Time Out", "Hours In"].map(
                          (title) => TableCell(
                            child: Text(
                              title,
                              style: AppTypography.body(),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
