
import 'package:flutter/material.dart';
import 'package:session13/models/project.dart';
import 'package:session13/shared/styled_text.dart';
import 'package:session13/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.project, {super.key});
  final Project project;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.secondaryColor.withValues(alpha: 0.5)),
        child: Column(
          children: [
            Column(
              children: widget.project.statsAsFormattedList.map((stat) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: StyledHeading(stat['title']!),
                    ),
                    SizedBox(
                      width: 100,
                      child: Center(child: StyledHeading(stat['value']!)),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.project.increaseStat(stat['title']!);
                        });
                      },
                      icon: Icon(
                        Icons.arrow_upward,
                        color: AppColors.textColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.project.decreaseStat(stat['title']!);
                        });
                      },
                      icon: Icon(
                        Icons.arrow_downward,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
