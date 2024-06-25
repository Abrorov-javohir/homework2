import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class PlaneAnimation1 extends StatefulWidget {
  const PlaneAnimation1({super.key});

  @override
  State<PlaneAnimation1> createState() => _PlaneAnimation1State();
}

class _PlaneAnimation1State extends State<PlaneAnimation1> {
  Alignment _alignment = Alignment.centerLeft;
  bool isChanged = false;

  double _cloud1Left = -50;
  double _cloud4Left = -40;

  double _cloud2Left = 350;
  double _cloud3Left = 200;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (!mounted) {
        timer.cancel();
      } else {
        setState(() {
          _cloud1Left += 2;
          _cloud2Left -= 2;
          _cloud3Left -= 2;
          _cloud4Left += 2;

          if (_cloud1Left > 350) {
            _cloud1Left = -50;
          }
          if (_cloud4Left > 350) {
            _cloud4Left = -30;
          }
          if (_cloud2Left < -50) {
            _cloud2Left = 350;
          }
          if (_cloud3Left < -50) {
            _cloud3Left = 200;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plane page'),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 500,
          color: isChanged ? Colors.grey : Colors.red,
          child: Container(
            width: 350,
            height: 100,
            decoration: BoxDecoration(
              color: isChanged ? Colors.blue : Colors.black,
              borderRadius: BorderRadius.circular(60),
            ),
            child: AnimatedAlign(
              alignment: _alignment,
              duration: const Duration(seconds: 1),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_alignment == Alignment.centerLeft) {
                      _alignment = Alignment.centerRight;
                    } else {
                      _alignment = Alignment.centerLeft;
                    }
                    isChanged = !isChanged;
                  });
                },
                child: SizedBox(
                  width: 350,
                  child: Stack(
                    children: [
                      if (isChanged)
                        Positioned(
                          right: 0,
                          top: 0,
                          left: 0,
                          bottom: 0,
                          child: Container(
                            width: 140,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://scenerytr.com/wp-content/uploads/2016/03/LTCG_Prepar3D-2016-03-29-00-32-11-74.jpg',
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 40,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    "https://media.istockphoto.com/id/1328689113/photo/summer-blue-sky-and-white-cloud-white-background-beautiful-clear-cloudy-in-sunlight-calm.jpg?s=612x612&w=0&k=20&c=37qEuwdxyQSx9kuS-_Gz0WiKFX6jMXZN9aRY47mN2vI=",
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      AnimatedPositioned(
                        duration: const Duration(seconds: 1),
                        right: isChanged ? 0 : 250,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                          ),
                          width: 100,
                          height: 100,
                          child: ClipOval(
                            child: Image.network(
                              "https://png.pngtree.com/png-clipart/20220119/ourmid/pngtree-black-cartoon-aircraft-logo-element-png-image_4244385.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      if (!isChanged) ...[
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 50),
                          left: _cloud1Left,
                          top: 20,
                          child: Image.network(
                            "https://www.creativefabrica.com/wp-content/uploads/2018/11/Cloud-Logo-by-Friendesign-Acongraphic-20.jpg",
                            width: 30,
                            height: 30,
                            fit: BoxFit.contain,
                          ),
                        ),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 50),
                          left: _cloud2Left,
                          top: 50,
                          child: Image.network(
                            "https://www.creativefabrica.com/wp-content/uploads/2018/11/Cloud-Logo-by-Friendesign-Acongraphic-20.jpg",
                            width: 40,
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                        ),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 50),
                          left: _cloud3Left,
                          top: 30,
                          child: Image.network(
                            "https://www.creativefabrica.com/wp-content/uploads/2018/11/Cloud-Logo-by-Friendesign-Acongraphic-20.jpg",
                            width: 40,
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                        ),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 50),
                          left: _cloud4Left,
                          child: Image.network(
                            "https://www.creativefabrica.com/wp-content/uploads/2018/11/Cloud-Logo-by-Friendesign-Acongraphic-20.jpg",
                            width: 40,
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
