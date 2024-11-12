
import 'package:fastfoodapp/presentation/widgets/settingcom_notifition.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/presentation/widgets/settings_component.dart';

class Settingscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Setting_Screen();
}

class Setting_Screen extends State<Settingscreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 32, top: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, left: 16),
                child: Text(
                  "Setting",
                  style: TextStyle(
                    fontSize: SizeOfWidget.sizeOfLargeHeader,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 10),
                child: Text(
                  "Update your settings like notifications, "
                      "\npayments, profile edit etc.",
                  style: TextStyle(
                    fontSize: SizeOfWidget.sizeOfH3,
                    color: Colors.grey
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: SettingsComponent(
                    SIcon: 0,
                    STitle: "Profile Setting",
                    SContent: "Change your account information"
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: SettingsComponent(
                    SIcon: 1,
                    STitle: "Change Password",
                    SContent: "Change your password"
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: SettingsComponent(
                    SIcon: 2,
                    STitle: "Payment Methods",
                    SContent: "Add your credit & debit cards"
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: SettingsComponent(
                    SIcon: 3,
                    STitle: "Locations",
                    SContent: "Add or remove your delivery locations"
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "NOTIFICATIONS",
                  style: TextStyle(
                    fontSize: SizeOfWidget.sizeOfH1,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: SettingcomNotifition(
                    SIcon: 4,
                    STitle: "Push Not",
                    SContent: "Add or remove your delivery locations"
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: SettingcomNotifition(
                    SIcon: 4,
                    STitle: "Push Not",
                    SContent: "Add or remove your delivery locations"
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: SettingcomNotifition(
                    SIcon: 4,
                    STitle: "Push Not",
                    SContent: "Add or remove your delivery locations"
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "MORE",
                  style: TextStyle(
                    fontSize: SizeOfWidget.sizeOfH1,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: SettingsComponent(
                    SIcon: 5,
                    STitle: "Rate",
                    SContent: "Rate us playstore, appstor"
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: SettingsComponent(
                    SIcon: 6,
                    STitle: "FAQ",
                    SContent: "Frequently asked questions"
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: SettingsComponent(
                    SIcon: 7,
                    STitle: "Logout",
                    SContent: "Log out of your account"
                ),
              ),
            ],
          )
        )
      ),
    );
  }
}