import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/providers/scan_provider.dart';
import 'package:provider/provider.dart';

class ScanListTiles extends StatelessWidget {
  final String tipo;
  const ScanListTiles(this.tipo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScanProvider>(context, listen: true);
    final scans = scanProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, int index) {
          return Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.redAccent,
            ),
            onDismissed: (_) {
              Provider.of<ScanProvider>(context, listen: false)
                  .deleteAllById(scans[index].id!);
            },
            child: ListTile(
              leading: Icon(
                tipo == 'geo' ? Icons.link_outlined : Icons.map_outlined,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(scans[index].value),
              subtitle: Text('ID: ${scans[index].id}'),
              trailing: Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () => print("ON TAP EVENT"),
            ),
          );
        });
  }
}
