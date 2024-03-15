import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedOpacity(
                opacity: _animation.value,
                duration: Duration(milliseconds: 500),
                child: Container(
                  child: Image.asset(
                    "assets/splash_image.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: _animation.value,
                    child: Text(
                      "Autify",
                      style: GoogleFonts.lexend(
                          textStyle: TextStyle(fontSize: 84)),
                    ),
                  ),
                  Opacity(
                    opacity: _animation.value,
                    child: Text(
                      "The Product Auction Platform",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 18)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
//
// // void main() {
// //   runApp(MyApp());
// // }
//
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Contacts App',
// //       home: HomePage(),
// //     );
// //   }
// // }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   // Initialize SQLite database
//   Database? _database;
//
//   @override
//   void initState() {
//     super.initState();
//     initDatabase();
//   }
//
//   void initDatabase() async {
//     _database = await openDatabase('contacts.db', version: 1,
//         onCreate: (Database db, int version) {
//       db.execute(
//           'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, phone TEXT)');
//     });
//   }
//
//   @override
//   List contacts = [];
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Contacts'),
//       ),
//       body: ListView.builder(
//         itemCount: contacts.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(contacts[index]['name']),
//             subtitle: Text(contacts[index]['phone']),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.call),
//                   onPressed: () {
//                     // Implement call functionality
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.message),
//                   onPressed: () {
//                     // Implement SMS functionality
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//               title: Text('Add Contact'),
//               content: Column(
//                 children: [
//                   TextField(decoration: InputDecoration(labelText: 'Name')),
//                   TextField(decoration: InputDecoration(labelText: 'Phone')),
//                 ],
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     // Add contact to SQLite database
//                   },
//                   child: Text('Save'),
//                 ),
//               ],
//             ),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class BackedUpContactsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Backed Up Contacts'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('backed_up_contacts')
//             .snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) return CircularProgressIndicator();
//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               var contact = snapshot.data!.docs[index];
//               return ListTile(
//                 title: Text(contact['name']),
//                 subtitle: Text(contact['phone']),
//                 trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () {
//                       // Remove contact from Firestore database
//                     }),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
