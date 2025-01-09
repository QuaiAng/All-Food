import 'package:fastfoodapp/presentation/states/resultsearchviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Resultsearchscreen extends StatelessWidget {
  const Resultsearchscreen({super.key});

  // Đây là giao diện tạm thời để test
  @override
  Widget build(BuildContext context) {
    final resultSearchViewModel = Provider.of<Resultsearchviewmodel>(context);
    final args = ModalRoute.of(context)?.settings.arguments
        as String; // Nhận tham số truyền quá

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: resultSearchViewModel.SearchProductByName(args),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Text(
                          "Product name : ${snapshot.data![index].productName}");
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
