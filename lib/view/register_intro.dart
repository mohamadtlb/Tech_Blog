import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/my_strings.dart';
import 'package:tec/view/my_cats.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //pic
            SvgPicture.asset(
              Assets.images.techBotSvg.path,
              height: 100,
            ),
            //text
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyStrings.welcome, style: textTheme.headline4)),
            ),
            //bottom Lets go
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: SizedBox(
                height: 45,
                width: 140,
                child: ElevatedButton(
                  onPressed: () => {_showBottomSheet(context, size, textTheme)},
                  child: const Text("بزن بریم"),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future<dynamic> _showBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2.6,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Email
                  Text(
                    MyStrings.insertYourEmail,
                    style: textTheme.headline4,
                  ),
                  //textField
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                        onChanged: (value) {
                          if (isEmail(value) == true) {
                            print("$value is Email =${isEmail(value)}");
                          } else {
                            print("Please Insert Your Emaie Correctly...");
                          }
                        },
                        style: textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "techBlog@gmail.com",
                          hintStyle: textTheme.headline6,
                        )),
                  ),
                  //bottom Continue
                  SizedBox(
                    height: 45,
                    width: 140,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _activateCodeBottomSheet(context, size, textTheme);
                        },
                        child: const Text("ادامه")),
                  )
                ],
              )),
            ),
          );
        }));
  }

  Future<dynamic> _activateCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2.6,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Code
                  Text(
                    MyStrings.insertCode,
                    style: textTheme.headline4,
                  ),
                  //textField
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                        onChanged: (value) {
                          if (isEmail(value) == true) {
                            print("$value is Email =${isEmail(value)}");
                          } else {
                            print("Please Insert Your Emaie Correctly...");
                          }
                        },
                        style: textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "******",
                          hintStyle: textTheme.headline6,
                        )),
                  ),
                  //bottom Continue
                  SizedBox(
                    height: 45,
                    width: 140,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => MyCats()));
                        },
                        child: const Text("ادامه")),
                  )
                ],
              )),
            ),
          );
        }));
  }
}
