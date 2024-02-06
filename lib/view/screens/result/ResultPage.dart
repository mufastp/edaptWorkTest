import 'package:quiz_app/controller/provideroperation.dart';
import 'package:quiz_app/view/screens/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../components/apptext.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderOperations>(context,listen: false).getresult();
   final service =  Provider.of<ProviderOperations>(context,listen: true);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
         
          title:  AppText(
           text: 'Result',
            weight: FontWeight.w500,
            size: 16,
          ),
        ),
        body: Stack(
          children: [
            service.correctAns>6
                ? LottieBuilder.network(
                    'https://assets7.lottiefiles.com/packages/lf20_ahrbr631.json')
                : Align(
                    alignment: Alignment.center,
                    child: LottieBuilder.network(
                        'https://assets8.lottiefiles.com/private_files/lf30_uDAsLk.json'),
                  ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 400),
                    child: CircularPercentIndicator(
                      animation: true,
                      // animationDuration: 1000,
                      radius: 85,
                      lineWidth: 20,
                      percent: service.correctAns / 10,
                      center: Text(
                        "${service.correctAns}/10",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      progressColor: service.correctAns>6 ? Colors.green : Colors.red,
                      backgroundColor: Colors.white,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: FloatingActionButton.extended(
                        backgroundColor: service.correctAns>6 ? Colors.lightGreen : Colors.red,
                        onPressed: () {
                         
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => MyHomePage()));
                        },
                        label: service.correctAns>6
                            ? const Text(
                                "Awesome",
                                style: TextStyle(fontSize: 20),
                              )
                            : const Text(
                                'Oooops.....!',
                                style: TextStyle(fontSize: 20),
                              )),
                  ),
                  service.correctAns>6
                      ? const Text(
                          '\t\t\t\t\t\t\tCongratulations\nYou Passed The exam ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      : TextButton(
                          onPressed: () {
                            // context.read<QustionsProvider>().mark = 0;
                           
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => MyHomePage()));
                          },
                          child: const Text(
                            'try again',
                            style: TextStyle(fontSize: 15),
                          ),
                        )
                ],
              ),
            )
          ],
        ));
  }
}
