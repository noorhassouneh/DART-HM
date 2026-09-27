import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
              backgroundImage: NetworkImage('https://tse4.mm.bing.net/th/id/OIP.q0IqGHJcAzBcQ-ygf_d5YAHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'),
              
              ),
              Text("Welcome Back!", style: TextStyle(fontSize: 30,fontWeight: .bold)),
              Text('Sign in to continue', style: TextStyle(fontSize: 12)),
              SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                     // shape: Border.all(color: Colors.grey),
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(7),side : BorderSide(color: Colors.grey)),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        children: [
                          CircleAvatar(
                radius: 8,
              backgroundImage: NetworkImage('https://tse3.mm.bing.net/th/id/OIP._vDkQZ1ILEE_SavSNvb6NQHaHk?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'),
              
              ),
                          //Icon(Icons.mail),
                          SizedBox(width: 4),
                          Text("Continue with Google"),
                        ],
                      ),
                      ),
                      ),
                    
                    SizedBox(width: 25),

                  Expanded(
                    child: MaterialButton(
                      
                      onPressed: () {},
                      //shape: Border.all(color: Colors.grey),
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(7),side : BorderSide(color: Colors.grey)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.apple),
                          SizedBox(width: 4),
                          Text("Continue with Apple",style: TextStyle()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Row(
                children: [
                  Expanded(child: Divider()),
                  Text(" or ", style : TextStyle(color: Colors.grey)),
                  Expanded(child: Divider()),
                ],
              ),

              SizedBox(height: 15),

              TextField(
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  //border: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail, color: Colors.grey),
                ),
              ),
              SizedBox(height:20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(fontSize:15),
                  prefixIcon: Icon(Icons.lock, color: Colors.grey, size: 22),
                  suffix: Icon(Icons.visibility, color:Colors.grey)
                  
                ),
              ),
              SizedBox(height:20),
              MaterialButton(
                minWidth: 400,
                
                 color:Colors.blue,
                 onPressed: () {},
                 child:Text('Login',style: TextStyle(color: Colors.white,fontWeight:.bold))
                 
                 ) ,
                 SizedBox(height: 20),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,

                  children:[
                Text(" Don't have an account?   ", style : TextStyle (fontSize:15 )),
                SizedBox(height:50),
                Text(' Sign up ', style: TextStyle(fontSize:10,color:Colors.blue)),
                  ]
                ),
                Row(  
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(' Forfet Password? ', style: TextStyle(color:Colors.blue,fontSize:10)),
            ])
                


              
            ],
          ),
        ),
      ),
    );
  }
}
