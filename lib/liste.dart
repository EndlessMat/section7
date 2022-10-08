// ignore: file_names
import 'package:flutter/material.dart';

class Liste extends StatelessWidget {
  int nb_choses_a_faire;

  Liste(this.nb_choses_a_faire);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: nb_choses_a_faire,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => Container(
          child: Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text(
                'Todo n°${index + 1}',
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
              subtitle: Text('Description ${index + 1}'),
              //trailing: const Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),
        ),
      ),
    );
  }
}
