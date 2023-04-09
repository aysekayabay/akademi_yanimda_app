import 'package:akademi_yanimda/pages/auth_screen.dart';
import 'package:akademi_yanimda/pages/onboard/onboard_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({Key? key}) : super(key: key);
  @override
  State<OnboardView> createState() => _OnboardViewViewState();
}

class _OnboardViewViewState extends State<OnboardView> {
  final PageController _pageController = PageController();

  List<OnboardModel> onboard = [
    OnboardModel(title: "Soru Sor", description: "Platformda kendini geliştirmek için soru sor bilmediğin konularda destek al", imagePath: "o1"),
    OnboardModel(title: "Aktif Ol", description: "Bilmediğinde soru sor bildiklerinde cevapla sürekli ekosisteme katkıda bulun", imagePath: "o2"),
    OnboardModel(title: "Koleksiyon Biriktir", description: "O kadar soru soruyorsun... cevap veriyorsun... bir ödülü hakettin. Koleksiyon biriktir insan kazan", imagePath: "o3"),
  ];
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _storeWelcomeInfo() async {
      int isViewed = 1;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('welcome', isViewed);
    }

    return Scaffold(
        body: PageView.builder(
            controller: _pageController,
            itemCount: onboard.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Image.asset('assets/images/${onboard[index].imagePath}.png'),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                      child: Text(
                        onboard[index].title,
                        style: GoogleFonts.openSans(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      onboard[index].description,
                      style: GoogleFonts.openSans(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    index == onboard.length - 1
                        ? MainButton(
                            isFilled: true,
                            title: 'Başla',
                            onTap: () async {
                              await _storeWelcomeInfo();
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) {
                                  return AuthScreen();
                                },
                              ));
                            },
                          )
                        : MainButton(
                            isFilled: false,
                            title: 'Devam Et',
                            onTap: () {
                              _pageController.nextPage(duration: Duration(milliseconds: 700), curve: Curves.easeIn);
                            },
                          )
                  ],
                ),
              );
            }));
  }
}
