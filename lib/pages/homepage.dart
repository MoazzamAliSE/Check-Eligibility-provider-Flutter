import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial1/provider/homePageProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ChangeNotifierProvider<HomePageProvider>(
            create: (context) =>
                HomePageProvider(), //instance of HomePageProvider
            child: Consumer<HomePageProvider>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      provider.eligibilityMessage.toString(),
                      style: TextStyle(
                          color: (provider.isEligible == true)
                              ? Colors.green
                              : Colors.red),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(hintText: 'Enter Your age'),
                      onChanged: (value) {
                        provider.chechEligibility(int.parse(value));
                      },
                    )
                  ],
                );
              },
            )),
      ),
    );
  }
}
