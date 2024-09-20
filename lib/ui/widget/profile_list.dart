import 'package:api_call/data/model/userprofile_model.dart';
import 'package:api_call/ui/widget/profile_details.dart';
import 'package:flutter/material.dart';

class ProfileList extends StatefulWidget {
  final List<UserProfileModel> userProfileData;
  const ProfileList({super.key, required this.userProfileData});

  @override
  State<ProfileList> createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 1),
          child: GridView.builder(
              itemCount: widget.userProfileData.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                final data = widget.userProfileData[index];
                return Card(
                    color: Colors.blueGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(data.imageUrlThumbnail),
                            ),
                          ],
                        ),
                        Text(
                          '${data.name.first}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProfileDetails(profileData: data)));
                            },
                            child: Text(
                              'See Details',
                              style: TextStyle(color: Colors.blue),
                            ))
                      ],
                    ));
              })),
    );
  }
}
