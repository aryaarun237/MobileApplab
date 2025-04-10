import 'package:flutter/material.dart';
import 'package:session13/models/project.dart';
import 'package:session13/profile/skill_list.dart';
import 'package:session13/profile/stats_table.dart';
import 'package:session13/shared/styled_button.dart';
import 'package:session13/shared/styled_text.dart';
import 'package:session13/theme.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.project,
  });

  final Project project;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: StyledTitle(project.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                color: AppColors.secondaryColor.withValues(alpha: 0.3),
                child: Row(children: [
                  Image.asset(
                    'assets/img/category/${project.category.image}',
                    width: 140,
                    height: 140,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(project.category.title),
                        StyledText(project.category.description)
                      ],
                    ),
                  )
                ]),
              ),
              SizedBox(height: 20),
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [StatsTable(project), SkillList(project)],
                ),
              ),
              StyledButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: StyledHeading('Project Saved Successfully'),
                      showCloseIcon: true,
                      duration: Duration(seconds: 3),
                      backgroundColor: AppColors.secondaryColor,
                    ));
                  },
                  child: StyledHeading('Save Project')),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}



// ------------------------------------//
// citations || 10 || up || down // ---> row 1
// downloads || 10 || up || down // ---> row 2
// views || 10 || up || down // ---> row 3
// collaborations || 10 || up || down // ---> row 4
// ------------------------------------//