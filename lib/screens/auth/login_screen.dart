import 'package:flutter/material.dart';
import 'package:news_api/auth_api/model-auth.dart';
import 'package:news_api/auth_api/repository_auth.dart';
import 'package:news_api/screens/home_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  RepositoryAuth repositoryAuth= RepositoryAuth();
  late ModelAuth modelAuth;
  var formKey = GlobalKey<FormState>();
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  Future<void> login()async {
    await repositoryAuth.login(
        email: emailTextController.text,
        password: passwordTextController.text
    ).then((value) {
      modelAuth=value;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailTextController=TextEditingController();
    passwordTextController=TextEditingController();
    //login();
  }
  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Login',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key:formKey ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                    'Welcome Back...',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Login to start using app',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    color: Colors.black38,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailTextController,
                validator: (email)
                {
                  if(email!.isEmpty)
                  {
                    return 'This Field is required';
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: passwordTextController,
                validator: (password)
                {
                  if(password!.isEmpty)
                  {
                    return 'This Field is required';
                  }
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: ()async{
                    if(formKey.currentState!.validate()){
                      await login().then((value) {
                        if(modelAuth.status == true){
                          print(modelAuth.message);
                          Navigator.pushNamed(context, '/home_screen');
                        }else{
                          print('not validate');
                        }
                      });
                    }
                  },
                  child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                )
              ),
              // OutlinedButton(
              //   style: OutlinedButton.styleFrom(
              //       backgroundColor: Colors.blue,
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadiusDirectional.circular(15)
              //       )
              //   ),
              //   onPressed: ()async
              //   {
              //     if(formKey.currentState!.validate())
              //     {
              //       await login().then((value)
              //       {
              //         if(modelAuth.status == true)
              //         {
              //           print(modelAuth.message);
              //
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => const HomeScreen(),
              //               )
              //           );
              //         }
              //       },
              //       );
              //     }
              //     else
              //     {
              //       print('not validate');
              //     }
              //   },
              //   child: const Text(
              //     'LOGIN',
              //     style: TextStyle(
              //         color: Colors.white
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
