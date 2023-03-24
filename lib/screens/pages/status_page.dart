import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/view_model/status/status_listvm.dart';

class StatusPage extends StatefulWidget {

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<StatusListViewModel>(context, listen: false).getStatusUpload();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<StatusListViewModel>(context);

    Widget recentUpdates(){
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
          itemCount: vm.unViewedStatuses.length,
          itemBuilder: (context, index){
            return ListTile(
              onTap: (){
                vm.justViewed(index);
              },
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.blueAccent, width: 2)
                ),
                child: const Icon(Icons.person),
              ),
              title: Text(vm.unViewedStatuses[index].user),
            );
          });
    }

    Widget viewedUpdates(){
      return ListView.builder(
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
          itemCount: vm.viewedStatuses.length,
          itemBuilder: (context, index){
            return ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.grey, width: 2)
                ),
                child: const Icon(Icons.person),
              ),
              title: Text(vm.viewedStatuses[index].user),
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
              leading: Stack(
                children: const [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.black38,
                    child: Icon(Icons.person, color: Colors.white,),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 9,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add, size: 15,),
                    ),
                  ),
                ],
              ),
              title: const Text('Your status update', style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: const Text('Tap to add status update'),
            ),
            const SizedBox(height: 10,),
            vm.unViewedStatuses.isNotEmpty ? const Text('Recent updates', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),) : Container(),
            const SizedBox(height: 9,),
            vm.unViewedStatuses.isNotEmpty ? recentUpdates() : Container(),
            const SizedBox(height: 10,),
            vm.viewedStatuses.isNotEmpty ? const Text('Viewed updates', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),) : Container(),
            const SizedBox(height: 9,),
            vm.viewedStatuses.isNotEmpty ? viewedUpdates() : Container()
          ],
        ),
      ),
    );
  }
}
