import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example2/provider/slider_provider.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({Key? key}) : super(key: key);

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SliderProvider>(context,listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Slider With Provider'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);

                });
          }),
          Consumer<SliderProvider>(builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(color: Colors.teal.withOpacity(value.value)),
                      child: Center(
                        child: Text('Container1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(color: Colors.pink.withOpacity(value.value)),
                      child: Center(
                        child: Text('Container2'),
                      ),
                    ),
                  )
                ],
              );
          })

        ],
      ),
    );
  }
}
