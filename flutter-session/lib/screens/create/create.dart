import 'package:flutter/material.dart';
import 'package:session13/shared/styled_text.dart';
import 'package:session13/shared/styled_button.dart';
import 'package:session13/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:session13/screens/create/category_card.dart';
import 'package:session13/models/project.dart';
import 'package:session13/models/projectcategory.dart';
import 'package:session13/screens/home.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // Adding category selection
  ProjectCategory selectedCategory = ProjectCategory.ai;

  void updateProjectCategory(ProjectCategory projectcategory) {
    setState(() {
      selectedCategory = projectcategory;
    });
  }

  void handleSubmit() {
    if (_titleController.text.trim().isEmpty) {
      // show error dialog box
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: StyledHeading('Missing Project Title'),
            content: StyledText('Please Enter a Project Title'),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: StyledHeading('Close'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
      return;
    }
    if (_descriptionController.text.trim().isEmpty) {
      // show error dialog box
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: StyledHeading('Missing Description'),
            content: StyledText('Please Enter Project Descriptoin'),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: StyledHeading('Close'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
      return;
    }
    projects.add(
      Project(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        category: selectedCategory,
        id: uuid.v4(),
      ),
    );

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledTitle('Project Creation'), centerTitle: true),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.computer_sharp,
                  color: AppColors.primaryColor,
                ),
              ),
              Center(child: StyledText('Project Title and Description')),
              SizedBox(height: 20),
              TextField(
                controller: _titleController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_2_rounded),
                  label: StyledText('Project Title'),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _descriptionController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('Project Description'),
                ),
              ),
              SizedBox(height: 30),
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              Center(child: StyledText('Choose Category')),
              SizedBox(height: 30),
              CategoryCard(
                selected: selectedCategory == ProjectCategory.ai,
                onTap: updateProjectCategory,
                projectcategory: ProjectCategory.ai,
              ),
              CategoryCard(
                selected: selectedCategory == ProjectCategory.cybersecurity,
                onTap: updateProjectCategory,
                projectcategory: ProjectCategory.cybersecurity,
              ),
              CategoryCard(
                selected: selectedCategory == ProjectCategory.wn,
                onTap: updateProjectCategory,
                projectcategory: ProjectCategory.wn,
              ),
              CategoryCard(
                selected: selectedCategory == ProjectCategory.robotics,
                onTap: updateProjectCategory,
                projectcategory: ProjectCategory.robotics,
              ),
              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                  child: StyledHeading('Create Project'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
