import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();

  final List<GlobalKey> _sectionKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  final List<Project> _projects = [
    Project(
      title: 'Vedio Conference',
      description:
          'Built a cross-platform conference call app using Flutter, ZEGOCLOUD SDK, and REST APIs with real-time video/audio, chat, and secure room management.',
      imageUrl: 'asset/conference.jpg',
      technologies: ['Flutter', 'ZegoCloud', 'GetX', 'REST API'],
      githubLink: 'https://github.com/shisath/winngoo',
      liveLink: '',
    ),
    Project(
      title: 'Beema Insurance',
      description:
          "A digital insurance management system that provides Home, Car, Bike, Individual, and Marine insurance services.",
      imageUrl: 'asset/beema.jpg',
      technologies: [
        'Flutter',
        'Firebase',
        'GetX',
        'Firestore Database',
        'GraphQl',
        'Razor Pay',
        'Firebase Authentication',
      ],
      githubLink: '',
      liveLink: 'https://www.beema-online.com/b2c/landing',
    ),

    Project(
      title: 'Chat Application',
      description:
          "Developed a real-time chat application using Flutter, Firebase, and REST APIs with features like one-to-one & group messaging, media sharing, and push notifications. Strengthened skills in Flutter, backend integration, and scalable chat system design.",
      imageUrl: 'asset/chat App.jpg',
      technologies: ['Flutter', 'Zegocloud', 'Provider', 'RestApi'],
      githubLink: 'https://github.com/shisath/hello_winngoo',
      liveLink: '',
    ),

    Project(
      title: 'Sports Academy website',
      description:
          "Developed a responsive Taekwondo Academy website with sections for About Us, Training Sessions, Contact, and Online Registration.",
      imageUrl: 'asset/academy.jpg',
      technologies: [
        'Flutter',
        'Firebase',
        'GetX',
        'Firestore Database',
        'Firebase Authentication',
      ],
      githubLink: '',
      liveLink: 'spartantkd.web.app',
    ),
    Project(
      title: 'Thermal printer Solution',
      description:
          'Developed a Flutter-based POS application with thermal printer integration, using Provider for state management. The system enables businesses to generate and print receipts seamlessly, with real-time data storage and management powered by Firebase.',
      imageUrl: 'asset/thermalPrinter.jpg',
      technologies: [
        'Flutter',
        'Firebase',
        'Provider',
        'Firestore Database',
        'Firebase Authentication',
      ],
      githubLink: '',
      liveLink: '',
    ),
    Project(
      title: 'Next Project !',
      description:
          '🚧 Work in progress... Exciting features are on the way. Stay tuned!',
      imageUrl: 'asset/construction.jpeg',
      technologies: ['Comming Soon...'],
      githubLink: '',
      liveLink: '',
    ),
  ];

  final List<Skill> _skills = [
    Skill(name: 'Flutter', proficiency: 0.95, color: Colors.blue),
    Skill(name: 'Dart', proficiency: 0.90, color: Colors.blueAccent),
    Skill(name: 'Firebase', proficiency: 0.85, color: Colors.amber),
    Skill(name: 'JavaScript', proficiency: 0.85, color: Colors.amber),
    Skill(name: 'REST API', proficiency: 0.80, color: Colors.green),
    Skill(name: 'ZegoCloud', proficiency: 0.85, color: Colors.purple),
    Skill(name: 'VBA Script', proficiency: 0.85, color: Colors.purple),
    Skill(name: 'GetX', proficiency: 0.85, color: Colors.purple),
    Skill(name: 'Provider', proficiency: 0.90, color: Colors.redAccent),
    Skill(name: 'UI/UX', proficiency: 0.80, color: Colors.teal),
    Skill(name: 'Riverpod', proficiency: 0.75, color: Colors.indigoAccent),
    Skill(name: 'MySql', proficiency: 0.75, color: Colors.indigoAccent),
  ];

  void _scrollToSection(int index) {
    if (!mounted) return;
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    // 🔹 Remove lifecycle observer

    // 🔹 Always dispose controllers
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!mounted) return Container(); //
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                _buildHeroSection(),
                _buildAboutSection(),
                _buildProjectsSection(),
                _buildSkillsSection(),
                _buildContactSection(),
                _buildFooter(),
              ],
            ),
          ),
          _buildNavigation(),
        ],
      ),
    );
  }

  Widget _buildNavigation() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.isMobile(context) ? 16 : 48,
            vertical: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sathish Kumar",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              if (!Responsive.isMobile(context))
                Row(
                  children: [
                    _navItem("Home", () => _scrollToSection(0)),
                    _navItem("About", () => _scrollToSection(1)),
                    _navItem("Projects", () => _scrollToSection(2)),
                    _navItem("Skills", () => _scrollToSection(3)),
                    _navItem("Contact", () => _scrollToSection(4)),
                  ],
                )
              else
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => Dialog(
                            child: Container(
                              width: 200,
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _mobileNavItem("Home", () {
                                    Navigator.pop(context);
                                    _scrollToSection(0);
                                  }),
                                  _mobileNavItem("About", () {
                                    Navigator.pop(context);
                                    _scrollToSection(1);
                                  }),
                                  _mobileNavItem("Projects", () {
                                    Navigator.pop(context);
                                    _scrollToSection(2);
                                  }),
                                  _mobileNavItem("Skills", () {
                                    Navigator.pop(context);
                                    _scrollToSection(3);
                                  }),
                                  _mobileNavItem("Contact", () {
                                    Navigator.pop(context);
                                    _scrollToSection(4);
                                  }),
                                ],
                              ),
                            ),
                          ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          title,
          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _mobileNavItem(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      key: _sectionKeys[0],
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 24 : 80,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, I'm",
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Sathish Kumar",
                  style: TextStyle(
                    fontSize: Responsive.isMobile(context) ? 40 : 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 50,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flutter Developer',
                        textStyle: TextStyle(
                          fontSize: 24,
                          color: Colors.white70,
                        ),
                        speed: Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'VBA Developer (Excel)',
                        textStyle: TextStyle(
                          fontSize: 24,
                          color: Colors.white70,
                        ),
                        speed: Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Backend Developer',
                        textStyle: TextStyle(
                          fontSize: 24,
                          color: Colors.white70,
                        ),
                        speed: Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Problem Solver',
                        textStyle: TextStyle(
                          fontSize: 24,
                          color: Colors.white70,
                        ),
                        speed: Duration(milliseconds: 100),
                      ),
                    ],
                    repeatForever: true,
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => _scrollToSection(2),
                      child: Text("View My Work"),
                    ),
                    SizedBox(width: 16),
                    OutlinedButton(
                      onPressed: () => _scrollToSection(4),
                      child: Text("Contact Me"),
                    ),
                  ],
                ),
                SizedBox(height: 48),
                Row(
                  children: [
                    _socialIcon(
                      FontAwesomeIcons.github,
                      'https://github.com/dashboard',
                    ),
                    _socialIcon(
                      FontAwesomeIcons.linkedin,
                      'https://www.linkedin.com/feed/',
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (!Responsive.isMobile(context))
            Expanded(
              flex: 2,
              child: Center(
                child: SizedBox(
                  width: 400,
                  height: 400,
                  child: Lottie.network(
                    'https://assets3.lottiefiles.com/packages/lf20_w51pcehl.json',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: Colors.grey[800],
                        child: Center(
                          child: Icon(
                            Icons.error_outline,
                            color: Colors.white60,
                          ),
                        ),
                      );
                    },
                    frameBuilder: (context, child, composition) {
                      if (composition == null) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return child;
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _socialIcon(IconData icon, String url) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: IconButton(
        icon: FaIcon(icon),
        color: Colors.white70,
        onPressed: () => launchUrl(Uri.parse(url)),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      key: _sectionKeys[1],
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: Responsive.isMobile(context) ? 24 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle("About Me"),
          SizedBox(height: 48),
          Responsive.isMobile(context)
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildProfileImage(),
                  SizedBox(height: 32),
                  _buildAboutText(),
                ],
              )
              : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: _buildAboutText()),
                  SizedBox(width: 48),
                  Expanded(flex: 1, child: _buildProfileImage()),
                ],
              ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: Responsive.isMobile(context) ? 200 : 100,
      height: Responsive.isMobile(context) ? 200 : 290,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 15,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset("asset/sathish.jpeg", fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildAboutText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I'm a passionate Flutter developer with 2+ years of experience crafting beautiful, high-performance cross-platform applications.",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
        SizedBox(height: 24),
        Text(
          "My journey in development began in 2023, and I've since worked with startups and established companies to build apps that millions of users love. I specialize in creating seamless user experiences with clean, maintainable code.",
          style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.8),
        ),
        SizedBox(height: 16),
        Text(
          "When I'm not coding, you can find me exploring new technologies, contributing to open-source projects, or sharing my knowledge through technical articles and mentoring.",
          style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.8),
        ),
        SizedBox(height: 32),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _aboutChip("Flutter Expert"),
            _aboutChip("Clean Architecture"),
            _aboutChip("Performance Optimization"),
            _aboutChip("Mentoring"),
          ],
        ),
      ],
    );
  }

  Widget _aboutChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Theme.of(context).cardColor,
      labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
    );
  }

  Widget _buildProjectsSection() {
    return Container(
      key: _sectionKeys[2],
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: Responsive.isMobile(context) ? 20 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle("Featured Projects"),
          SizedBox(height: 48),

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  Responsive.isMobile(context)
                      ? 1
                      : Responsive.isTablet(context)
                      ? 2
                      : 3,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: Responsive.isMobile(context) ? 0.60 : 0.85,
              // 👈 allows natural height
            ),
            itemCount: _projects.length,
            itemBuilder: (context, index) {
              return _buildProjectCard(_projects[index]);
            },
          ),
          // SizedBox(height: 48),
          // Center(
          //   child: OutlinedButton.icon(
          //     icon: FaIcon(FontAwesomeIcons.github),
          //     label: Text("See More on GitHub"),
          //     onPressed:
          //         () => launchUrl(Uri.parse("https://github.com/alexmorgan")),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(Project project) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            Expanded(
              flex: 3,
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(project.imageUrl, fit: BoxFit.cover),
              ),
            ),

            // if (Responsive.isMobile(context)) ...[
            // Project Info
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      project.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: Text(
                        project.description,
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                        softWrap: true,
                        // maxLines: 10,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 7,
                      runSpacing: 7,
                      children:
                          project.technologies
                              .map(
                                (tech) => Chip(
                                  label: Text(
                                    tech,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.surface,
                                  labelStyle: TextStyle(color: Colors.white70),
                                  padding: EdgeInsets.zero,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                              )
                              .toList(),
                    ),
                    SizedBox(height: 16),

                    Row(
                      children: [
                        if (project.githubLink.toString() != '')
                          Expanded(
                            child: OutlinedButton.icon(
                              icon: FaIcon(FontAwesomeIcons.github, size: 16),
                              label: Text("Code"),
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 12,
                                ),
                              ),
                              onPressed:
                                  () =>
                                      launchUrl(Uri.parse(project.githubLink)),
                            ),
                          ),
                        SizedBox(width: 8),
                        if (project.liveLink.toString() != '')
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: Icon(Icons.launch, size: 16),
                              label: Text("Live"),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 12,
                                ),
                              ),
                              onPressed:
                                  () => launchUrl(Uri.parse(project.liveLink)),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Container(
      key: _sectionKeys[3],
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: Responsive.isMobile(context) ? 24 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle("Skills & Expertise"),
          SizedBox(height: 48),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // if (!Responsive.isMobile(context))
              //   Expanded(
              //     flex: 2,
              //     child: Container(
              //       height: 400,
              //       child: Lottie.network(
              //         'https://assets2.lottiefiles.com/packages/lf20_bdlceeqv.json',
              //         fit: BoxFit.contain,
              //       ),
              //     ),
              //   ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // if (Responsive.isMobile(context))
                    //   Container(
                    //     height: 200,
                    //     width: double.infinity,
                    //     child: Lottie.network(
                    //       'https://assets2.lottiefiles.com/packages/lf20_bdlceeqv.json',
                    //       fit: BoxFit.contain,
                    //     ),
                    //   ),
                    Text(
                      "My technical expertise includes:",
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                    SizedBox(height: 32),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children:
                          _skills
                              .map<Widget>((skill) => _buildSkillBubble(skill))
                              .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 48),
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Professional Achievements",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 24),
                Responsive.isMobile(context)
                    ? Column(
                      children: [
                        _buildAchievementItem(
                          '5+',
                          'Developed and launched ',
                          'Academy and Insurance management websites with responsive design and user-friendly features',
                        ),
                        SizedBox(height: 24),
                        _buildAchievementItem(
                          '3+',
                          'Built real-time communication apps (conference call & chat)',
                          'ZEGOCLOUD SDK, enabling seamless collaboration across platforms.',
                        ),
                        SizedBox(height: 24),
                        _buildAchievementItem(
                          '4+',
                          'Integrated advanced utilities',
                          'Image-to-Text (OCR), Excel report generation, and POS thermal printer solutions, improving efficiency for end users.',
                        ),
                      ],
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildAchievementItem(
                          '5+',
                          'Developed and launched',
                          'Academy and Insurance management websites with responsive design and user-friendly features',
                        ),
                        _buildAchievementItem(
                          '3+',
                          'Built real-time communication apps',
                          'ZEGOCLOUD SDK, enabling seamless collaboration across platforms.',
                        ),
                        _buildAchievementItem(
                          '4+',
                          'Integrated advanced utilities',
                          'Image-to-Text (OCR), Excel report generation, and POS thermal printer solutions, improving efficiency for end users.',
                        ),
                      ],
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementItem(String number, String title, String subtitle) {
    return SizedBox(
      width: Responsive.isMobile(context) ? double.infinity : 200,
      child: Column(
        children: [
          Text(
            number,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,

            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            subtitle,

            style: TextStyle(fontSize: 14, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSkillBubble(Skill skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: skill.color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: skill.color, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            skill.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 12),
          Container(
            width: 50,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(3),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: skill.proficiency,
              child: Container(
                decoration: BoxDecoration(
                  color: skill.color,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Container(
      key: _sectionKeys[4],
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: Responsive.isMobile(context) ? 24 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle("Get In Touch"),
          SizedBox(height: 48),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: Responsive.isMobile(context) ? 1 : 3,
                child: _buildContactForm(),
              ),
              if (!Responsive.isMobile(context)) SizedBox(width: 48),
              if (!Responsive.isMobile(context))
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's build something amazing together",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Whether you have a project in mind or just want to chat about Flutter development, I'm always open to new opportunities and collaborations.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                          height: 1.8,
                        ),
                      ),
                      SizedBox(height: 32),
                      _contactItem(
                        Icons.email,
                        "sathishkumarpersonal07@gmail.com",
                        "mailto:sathishkumarpersonal07@gmail.com?subject=Support&body=Hi",
                      ),
                      _contactItem(
                        Icons.phone,
                        "+91 7010996304",
                        "tel:+917010996304",
                      ),
                      _contactItem(Icons.location_on, "Chennai", ''),
                      SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: Lottie.network(
                          'https://assets5.lottiefiles.com/packages/lf20_u8o7BL.json',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contactItem(IconData icon, String text, url) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary, size: 24),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 16, color: Colors.white70),
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),

        onTap:
            () =>
                url.toString() != ''
                    ? launchUrl(
                      Uri.parse(url),
                      mode: LaunchMode.externalApplication,
                    )
                    : "",
      ),
    );
  }

  Widget _buildContactForm() {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController message = TextEditingController();

    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Send a Message",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          TextFormField(
            controller: name,
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: email,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: message,
            decoration: InputDecoration(
              labelText: "Message",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.message),
              alignLabelWithHint: true,
            ),
            maxLines: 5,
          ),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: Icon(Icons.send),
              label: Text("Send Message"),
              onPressed: () {
                // Handle form submission
                if (name.text.isNotEmpty &
                    email.text.isNotEmpty &
                    message.text.isNotEmpty) {
                  name.clear();
                  email.clear();
                  message.clear();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Message sent successfully!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'All fields are required. Please fill out the form.',
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          if (Responsive.isMobile(context)) ...[
            SizedBox(height: 32),
            Divider(),
            SizedBox(height: 24),

            _contactItem(
              Icons.email,
              "sathishkumarpersonal07@gmail.com",
              "mailto:sathishkumarpersonal07@gmail.com?subject=Support&body=Hi",
            ),
            _contactItem(Icons.phone, "+91 7010996304", "tel:+917010996304"),
            _contactItem(Icons.location_on, "Chennai", ''),
          ],
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 40),
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialIcon(
                FontAwesomeIcons.github,
                'https://github.com/dashboard',
              ),
              _socialIcon(
                FontAwesomeIcons.linkedin,
                'https://www.linkedin.com/feed/',
              ),
            ],
          ),
          SizedBox(height: 24),
          Text(
            "© ${DateTime.now().year} Sathish Kumar. All rights reserved.",
            style: TextStyle(color: Colors.white54),
          ),
          SizedBox(height: 8),
          Text(
            "Built with Flutter with ❤️",
            style: TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

class Project {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String githubLink;
  final String liveLink;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    required this.githubLink,
    required this.liveLink,
  });
}

class Skill {
  final String name;
  final double proficiency;
  final Color color;

  Skill({required this.name, required this.proficiency, required this.color});
}

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 800;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
}
