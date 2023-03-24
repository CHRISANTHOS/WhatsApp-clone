import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:whatsapp_clone/view_model/calls/calls_listvm.dart';
import 'package:provider/provider.dart';

class CallPage extends StatefulWidget {
  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CallsListViewModel>(context, listen: false).getCalls();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CallsListViewModel>(context);

    Widget recentCalls() {
      return ListView.builder(
        shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: vm.calls.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(
                radius: 22,
                backgroundColor: Colors.black38,
                child: Icon(Icons.person),
              ),
              title: Text(vm.calls[index].caller),
              subtitle: vm.calls[index].received
                  ? Transform.rotate(
                      angle: 135 * math.pi / 180,
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.green,
                      ),
                    )
                  : Transform.rotate(
                      angle: 135 * math.pi / 180,
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.red,
                      ),
                    ),
              trailing: vm.calls[index].audio ? const Icon(Icons.call) : const Icon(Icons.video_call),
            );
          });
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 22,
                backgroundColor: const Color(0xff25D366),
                child: Transform.rotate(
                  angle: 90 * math.pi / 135,
                  child: const Icon(Icons.link_outlined, color: Colors.white,),
                ),
              ),
              title: const Text('Create call link', style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: const Text('Share a link for your WhatsApp call', style: TextStyle(fontSize: 13),),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Recent',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            recentCalls()
          ],
        ),
      ),
    );
  }
}
