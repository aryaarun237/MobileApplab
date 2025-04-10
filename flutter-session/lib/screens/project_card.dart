import 'package:flutter/material.dart';
import 'package:session13/shared/styled_text.dart';
import 'package:session13/theme.dart';
import 'package:session13/models/project.dart';
import 'package:session13/profile/profile.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard(this.project, {super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Image.asset(
              'assets/img/category/${project.category.image}',
              width: 80,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeading(project.title),
                StyledText(project.category.title)
              ],
            ),
            Expanded(child: SizedBox()),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => Profile(project: project),
                      ));
                },
                icon: Icon(
                  Icons.arrow_forward,
                  color: AppColors.textColor,
                ))
          ],
        ),
      ),
    );
  }
}
