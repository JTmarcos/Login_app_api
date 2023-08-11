import 'package:flutter/material.dart';
import 'package:login_screen/models/post_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    PostModel args = ModalRoute.of(context)!.settings.arguments as PostModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              args.title,
              style: const TextStyle(
                  fontSize: 28,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              args.body,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20,),
            Text("Noticia ${args.id.toString()}\nAutor: ${args.userId}", style: const TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
