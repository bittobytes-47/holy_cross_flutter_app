import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:holy_cross/screen/radio_screeen.dart';
import 'package:holy_cross/utils/app_assets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'media_player_screen.dart';
import 'new_audio_player.dart';

class HolyCrossScreen extends StatefulWidget {
  const HolyCrossScreen({super.key});

  @override
  State<HolyCrossScreen> createState() => _HolyCrossScreenState();
}

class _HolyCrossScreenState extends State<HolyCrossScreen> {
  final Uri holyCrossWebsite = Uri.parse("http://www.holycrosstv.com");
  final Uri holyCrossRadio = Uri.parse("https://holycrossradio.com/");
  final Uri youtubeURL = Uri.parse("https://youtube.com/@holycrosstv");
  final Uri facebookURL =Uri.parse("https://www.facebook.com/share/1ZSe2YJwtN/?mibextid=wwXIfr");

  final Uri shortsURL =Uri.parse("https://www.youtube.com/@holycrosstv/shorts");
  final Uri instaURL =Uri.parse("https://www.instagram.com/holycrosstv/?igsh=emhhZ2QyOGk5cXVn#");

  Future<void> _launchURL(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // ---------------- APP BAR ----------------
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(100),
      //   child:
      // ),

      // ---------------- BODY ----------------
      body: Container(
        height: MediaQuery.of(context).size.height/1,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF031D42), // Dark Blue
                Color(0xFF04528C), // Blue
              ],
            ),

            // image:DecorationImage(image: AssetImage("assets/bg.jpg"),fit: BoxFit.cover)
        ),
        width: MediaQuery.of(context).size.width/1,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(0),
          child: Column(

            children: [
              Container(
                width: MediaQuery.of(context).size.width/1,
                height: 160,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF031D42), // Dark Blue
                      Color(0xFF04528C), // Blue
                    ],
                  ),
                    // image:DecorationImage(image: AssetImage("assets/bg.jpg"),fit: BoxFit.cover),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.18),
                      blurRadius: 18,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Title

                    SizedBox(height: 30,),
                    Container(
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage("assets/NetUseLogo.png"))
                      ),),
                    Text("HOLY CROSS MEDIA NETWORK", style:  TextStyle(color: Colors.white),)
                    // RichText(
                    //   textAlign: TextAlign.center,
                    //   text: const TextSpan(
                    //     children: [
                    //       TextSpan(
                    //         text: "HolyCross\n",
                    //         style: TextStyle(
                    //           fontSize: 30,
                    //           color: Colors.red,
                    //           fontWeight: FontWeight.w800,
                    //           letterSpacing: 1,
                    //         ),
                    //       ),
                    //       TextSpan(
                    //         text: "Media Network",
                    //         style: TextStyle(
                    //           fontSize: 18,
                    //           color: Colors.amber,
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    //   const SizedBox(height: 10),

                    // Icon Circle
                    // Container(
                    //   padding: const EdgeInsets.all(10),
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     gradient: const LinearGradient(
                    //       colors: [Colors.red, Color(0xFFFFEB3B)],
                    //       begin: Alignment.topLeft,
                    //       end: Alignment.bottomRight,
                    //     ),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.red.withOpacity(0.3),
                    //         blurRadius: 10,
                    //         offset: const Offset(0, 4),
                    //       ),
                    //     ],
                    //   ),
                    //   child: const Icon(
                    //     Icons.church,
                    //     color: Colors.white,
                    //     size: 36,
                    //   ),
                    // ),
                    //
                  ],
                ),
              ),
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: SizedBox(
               child: Column(
                 children: [
                   SizedBox(height: 20,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       FadeInUp(
                         child: _buildCard(
                           title: "YouTube",
                           image: AppAssets.youtube,
                           icon: Icons.play_circle,
                           onTap: () => _launchURL(youtubeURL),
                         ),
                       ),
                       FadeInUp(
                         child: _buildCard(
                           title: "YT Shorts",
                           image: AppAssets.shorts,
                           icon: Icons.radio,
                           onTap: () => _launchURL(shortsURL),
                         ),
                       ),

                     ],
                   ),
                   SizedBox(height: 20,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       FadeInUp(
                         child: _buildCard(
                           title: "Facebook",
                           image: AppAssets.facebook,
                           icon: Icons.radio,
                           onTap: () => _launchURL(facebookURL),
                         ),
                       ),
                       FadeInUp(
                         child: _buildCard(
                           title: "Insta Reels",
                           image: AppAssets.instaReel,
                           icon: Icons.play_circle,
                           onTap: () => _launchURL(instaURL),
                         ),
                       )
                     ],
                   ),
                   SizedBox(height: 30,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       FadeInUp(
                         child: _buildCard(
                             title: "Live Radio",
                             image: AppAssets.radio,
                             icon: Icons.radio,
                             onTap: () {
                               Navigator.push(context, MaterialPageRoute(builder: (_)=>AudioPlayerUI()));
                            //   Navigator.push(context,MaterialPageRoute(builder: (_)=>RadioWebView()));
                             }
                           //_launchURL(holyCrossRadio),
                         ),
                       ),
                       FadeInUp(
                         child: _buildCard(
                           title: "Website",
                           image: AppAssets.website,
                           icon: Icons.language,
                           onTap: () => _launchURL(holyCrossWebsite),
                         ),
                       ),

                     ],
                   ),

                   // FadeInUp(
                   //   child: _buildCard(
                   //     title: "HolyCross Website / ஹொலி க்ராஸ் வலைத்தளம்",
                   //     image: AppAssets.website,
                   //     icon: Icons.language,
                   //     onTap: () => _launchURL(holyCrossWebsite),
                   //   ),
                   // ),
                   // // FadeInUp(
                   // //   child: _buildCard(
                   // //     title: "HolyCross Radio / ஹொலி க்ராஸ் ரேடியோ",
                   // //     image: AppAssets.radio,
                   // //     icon: Icons.radio,
                   // //     onTap: () => _launchURL(holyCrossRadio),
                   // //   ),
                   // // ),
                   // FadeInUp(
                   //   child: _buildCard(
                   //     title: "HolyCross YouTube / ஹொலி க்ராஸ் யூடியூப்",
                   //     image: AppAssets.youtube,
                   //     icon: Icons.play_circle,
                   //     onTap: () => _launchURL(youtubeURL),
                   //   ),
                   //  ),
                 ],
               ),
             ),
           )
            ],
          ),
        ),
      ),
    );
  }

  // --------------- REUSABLE CARD ----------------
  Widget _buildCard({
    required String title,
    required String image,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 150,
        width: 150,
        // margin: const EdgeInsets.only(bottom: 20),
      // padding: const EdgeInsets.all(18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Colors.white,Color(0xFFCBE4F6),],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
          border: Border.all(
            color: Colors.red.withOpacity(0.4),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        image,
                        height: 90,
                        width: 90,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width/3,
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ),

                  ],
                ),

         //   const SizedBox(width: 18),

            // // Title Text
            // Expanded(
            //   child: Text(
            //     title,
            //     style: const TextStyle(
            //       fontSize: 17,
            //       fontWeight: FontWeight.w600,
            //       color: Colors.black87,
            //       height: 1.3,
            //     ),
            //   ),
            // ),
            //
            // // Icon
            // Container(
            //   padding: const EdgeInsets.all(8),
            //   decoration: BoxDecoration(
            //     color: Colors.red,
            //     shape: BoxShape.circle,
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.red.withOpacity(0.3),
            //         blurRadius: 8,
            //         offset: const Offset(0, 4),
            //       )
            //     ],
            //   ),
            //   child: Icon(
            //     icon,
            //     color: Colors.white,
            //     size: 26,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
