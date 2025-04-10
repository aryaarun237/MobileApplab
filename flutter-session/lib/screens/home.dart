import 'package:flutter/material.dart';
import 'package:session13/screens/project_card.dart';
import 'package:session13/shared/styled_text.dart';
import 'package:session13/shared/styled_button.dart';
import 'package:session13/models/project.dart';
import 'package:session13/screens/create/create.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle('Your Projects'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: projects.length,
                itemBuilder: (_, index) {
                  return ProjectCard(projects[index]);
                },
              ),
            ),
            StyledButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => Create()));
                },
                child: StyledHeading('Create New'))
          ],
        ),
      ),
    );
  }
}
