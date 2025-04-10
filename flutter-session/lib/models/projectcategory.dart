enum ProjectCategory {
  ai(
      title: "Artificial Intelligence",
      description: "Cutting edge reseacrh on AI and ML",
      image: "ai_thumbnail.jpg"),
  cybersecurity(
      title: "Cyber Security",
      description: "Research on recent trends in Cyber Security",
      image: "cyber_security.jpg"),
  wn(
      title: "Wireless Networks",
      description: "Research based on wireless networks and communication",
      image: "wireless_networks.png"),
  robotics(
      title: "Robotics",
      description: "Research based on AI and Robotics",
      image: "robotics.jpg");

  const ProjectCategory(
      {required this.title, required this.description, required this.image});
  final String title;
  final String description;
  final String image;
}
