import 'package:flutter/material.dart';
import 'package:session13/models/project.dart';
import 'package:session13/models/skill.dart';
import 'package:session13/shared/styled_text.dart';
import 'package:session13/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.project, {super.key});
  final Project project;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> availableSkills;
  late Skill selectedSkill;

  @override
  void initState() {
    availableSkills = allSkills.where((skill) {
      return skill.projectCategory == widget.project.category;
    }).toList();
    super.initState();
    if (widget.project.skills.isEmpty) {
      selectedSkill = availableSkills[0];
    }
    if (widget.project.skills.isNotEmpty) {
      selectedSkill = widget.project.skills.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        color: AppColors.secondaryColor.withValues(alpha: 0.5),
        child: Column(
          children: [
            StyledHeading('Choose a skill for your project'),
            StyledText('Skills are unique to your project category'),
            SizedBox(
              height: 20,
            ),
            Row(
              children: availableSkills.map((skill) {
                return Container(
                  margin: EdgeInsets.all(6),
                  padding: EdgeInsets.all(2),
                  color: skill == selectedSkill
                      ? const Color.fromARGB(255, 255, 0, 0)
                      : Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.project.updateSkill(skill);
                        selectedSkill = skill;
                      });
                    },
                    child: Image.asset(
                      'assets/img/skills/${skill.image}',
                      width: 70,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 10,
            ),
            StyledText(selectedSkill.name),
          ],
        ),
      ),
    );
  }
}
