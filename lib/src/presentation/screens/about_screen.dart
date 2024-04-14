import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Forzar 4G"),
      ),
      body: Column(
        children: [
          InfoWidget(
            title: "Pedro José Dominguez Bonilla",
            subtitle: "Developer",
            icon: Icons.developer_mode_rounded,
            ontap: () async {
              await launchUrl(Uri.parse("https://t.me/Wachu985"));
            },
          ),
          InfoWidget(
            title: "Simple Force 4G",
            subtitle: "Github Repository",
            icon: Icons.code_rounded,
            ontap: () async {
              await launchUrl(
                Uri.parse("https://github.com/Wachu985/simple_force_4g_app"),
              );
            },
          ),
          InfoWidget(
            title: "Acerca de",
            subtitle: "Informacion",
            icon: Icons.question_mark_sharp,
            ontap: () {
              showAboutDialog(
                  context: context,
                  applicationIcon: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/play_store_512.png",
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  applicationName: "Forzar 4G",
                  applicationVersion: "1.0",
                  children: [
                    Text(
                      "Aplicacion desarrollada por:",
                      style: textTheme.bodyLarge,
                    ),
                    Text(
                      "Pedro Dominguez Bonilla",
                      style: textTheme.bodyLarge,
                    ),
                    Text(
                      "@Todos los derechos reservados",
                      style: textTheme.bodyLarge,
                    ),
                  ]);
            },
          ),
        ],
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function()? ontap;
  const InfoWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Icon(icon),
          onTap: ontap,
        ),
      ),
    );
  }
}
