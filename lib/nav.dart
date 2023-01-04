import 'package:examan/dose.dart';
import 'package:examan/phar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationTab extends StatelessWidget {
  const NavigationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.red,
          title: const Text("Evax",)
          ,centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.health_and_safety),
                text: "Mes doses",
              ),
              Tab(
                icon: Icon(Icons.local_pharmacy),
                text: "Pharmacies",
              ),
                 Tab(
                icon: Icon(Icons.qr_code),
                text: "Certificats",
              )

            ],
          ),
        ),
        drawer: Drawer(
          
          child: Column(
            children: [
              AppBar(
                  iconTheme: IconThemeData(color: Colors.white),
                  backgroundColor: Colors.red,
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.history),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Historique")
                  ],
                ),
                onTap: () {
                
                },
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.power_settings_new),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Se deconnecter")
                  ],
                ),
                onTap: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
  
   
   prefs.clear();
                 Navigator.pushReplacementNamed(context, "/");
                },
              )
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            Dose(), Pharmacie(),Pharmacie()
          ],
        ),
      ),
    );
  }
}
