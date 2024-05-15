import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson_36/pages/last_page.dart';

class MyTitleField extends StatefulWidget {
  final IconData icon;
  final String hindText;
  const MyTitleField({
    super.key,
    required this.icon,
    required this.hindText,
  });

  @override
  State<MyTitleField> createState() => _MyTitleFieldState();
}

class _MyTitleFieldState extends State<MyTitleField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        prefixIcon: Icon(
          widget.icon,
          color: Colors.grey,
        ),
        hintText: widget.hindText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

class MyPasswordField extends StatefulWidget {
  bool checkEye;
  Function() onPressed;
  MyPasswordField({
    super.key,
    required this.checkEye,
    required this.onPressed,
  });

  @override
  State<MyPasswordField> createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  @override
  Widget build(BuildContext context) {
    print(widget.checkEye);
    return TextField(
      obscureText: widget.checkEye ? false : true,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        prefixIcon: const Icon(
          Icons.key_outlined,
          color: Colors.grey,
        ),
        suffixIcon: IconButton(
          onPressed: widget.onPressed,
          icon: Icon(
            widget.checkEye ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
            color: Colors.grey,
          ),
        ),
        hintText: "***********",
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String title;
  Function() onPressed;
  MyButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff4155FA),
            Color.fromARGB(255, 87, 95, 171),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 71, 83, 149).withOpacity(0.6),
            offset: const Offset(3.0, 4.0),
            blurRadius: 12.0,
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            letterSpacing: 2,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class MyLogoButton extends StatelessWidget {
  final String imgUrl;
  final String title;
  const MyLogoButton({
    super.key,
    required this.imgUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        // width: screenW * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                imgUrl,
                width: 25,
              ),
              const Gap(10.0),
              Text(
                title,
                style: const TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyDialog {
  static void showAccountActivatedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 80,
                  color: Color(0xff4155FA),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Your account has been activated",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Create your account to schedule your tasks.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            MyButton(
              title: "Ok",
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LastPage()));
              },
            ),
          ],
        );
      },
    );
  }
}
