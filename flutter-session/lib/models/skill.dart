import 'package:session13/models/projectcategory.dart';
class Skill {
  final String id;
  final String name;
  final String image;
  final ProjectCategory projectCategory;

  Skill(
      {required this.id,
      required this.name,
      required this.image,
      required this.projectCategory});
}

final List<Skill> allSkills = [
  // AI Category skills
  Skill(
      id: '1',
      name: 'Machine Learning Algorithms',
      image: 'skill-ai-mla.png',
      projectCategory: ProjectCategory.ai),
  Skill(
      id: '2',
      name: 'Data Processing',
      image: 'skill-ai-dataproc.png',
      projectCategory: ProjectCategory.ai),
  Skill(
      id: '3',
      name: 'Neural Network',
      image: 'skill-ai-neuralnet.png',
      projectCategory: ProjectCategory.ai),
  Skill(
      id: '4',
      name: 'NLP',
      image: 'skill-ai-nlp.png',
      projectCategory: ProjectCategory.ai),

  // Cyber Security skills
  Skill(
      id: '5',
      name: 'Penetration Testing',
      image: 'skill-cs-penetration.png',
      projectCategory: ProjectCategory.cybersecurity),
  Skill(
      id: '6',
      name: 'Cryptography',
      image: 'skill-cs-crypto.png',
      projectCategory: ProjectCategory.cybersecurity),
  Skill(
      id: '7',
      name: 'Incident Response',
      image: 'skill-cs-incresp.png',
      projectCategory: ProjectCategory.cybersecurity),
  Skill(
      id: '8',
      name: 'Network Security',
      image: 'skill-cs-netsec.webp',
      projectCategory: ProjectCategory.cybersecurity),

  // Wireless Networks skills
  Skill(
      id: '9',
      name: 'Network Protocols',
      image: 'skill-wn-protocols.png',
      projectCategory: ProjectCategory.wn),
  Skill(
      id: '10',
      name: 'Routing & Switching',
      image: 'skill-wn-routing.webp',
      projectCategory: ProjectCategory.wn),
  Skill(
      id: '11',
      name: 'Signal Processing',
      image: 'skill-wn-signalproc.png',
      projectCategory: ProjectCategory.wn),
  Skill(
      id: '12',
      name: 'Network Simulation',
      image: 'skill-wn-nstools.png',
      projectCategory: ProjectCategory.wn),

  //Robotics skills
  Skill(
      id: '13',
      name: 'Robotic Motion Planning',
      image: 'skill-robotics-auto.png',
      projectCategory: ProjectCategory.robotics),
  Skill(
      id: '14',
      name: 'Computer Vision',
      image: 'skill-robotics-humaninter.png',
      projectCategory: ProjectCategory.robotics),
  Skill(
      id: '15',
      name: 'Embedded Systems',
      image: 'skill-robotics-embedded.png',
      projectCategory: ProjectCategory.robotics),
  Skill(
      id: '16',
      name: 'Control Systems',
      image: 'skill-robotics-manip.png',
      projectCategory: ProjectCategory.robotics)
];
