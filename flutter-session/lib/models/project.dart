import 'package:session13/models/stats.dart';
import 'package:session13/models/projectcategory.dart';
import 'package:session13/models/skill.dart';


class Project with Stats {
  // Constructor
  Project(
      {required this.title,
      required this.description,
      required this.category,
      required this.id});
  // fields
  final Set<Skill> skills = {};
  final ProjectCategory category;
  final String title;
  final String description;
  final String id;
  bool _isFeatured = false;

  //getters
  bool get isFeatured => _isFeatured;

  //methods
  void toggleisFeatured() {
    _isFeatured = !_isFeatured;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }
}

// Adding dummy data
List<Project> projects = [
  Project(
      id: '1',
      title: 'Image Recognition',
      description: 'Recognise number plates',
      category: ProjectCategory.ai),
  Project(
      id: '2',
      title: 'Server security',
      description: 'Securing servers',
      category: ProjectCategory.cybersecurity),
  Project(
      id: '3',
      title: 'Adhoc Networks',
      description: 'Vehicular Adhoc Networks',
      category: ProjectCategory.wn),
  Project(
      id: '4',
      title: 'UAV',
      description: 'Autonomous UAV',
      category: ProjectCategory.robotics)
];
