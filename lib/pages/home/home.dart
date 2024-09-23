import 'package:assesment/controllers/datacontroller.dart';
import 'package:assesment/pages/utils/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var datacontroller = Get.put(Datacontroller());
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wallet Balance : 0 rs',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
        ),
      ),
      body: _buildUi(),
    );
  }

  Widget _buildUi() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Column(
        children: [
          Expanded(
            child: Obx(
              () => GridView.builder(
                itemCount: datacontroller.finaldata.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 0.7),
                itemBuilder: (context, index) {
                  bool isSelected = index == selectedindex;
                  return CustomContainer(
                    subtextcolor:
                        isSelected == true ? Colors.white : Colors.black54,
                    textcolor: isSelected == true ? Colors.white : Colors.black,
                    color: isSelected == true
                        ? Colors.deepPurple
                        : Colors.grey.shade200,
                    ontap: () {
                      setState(() {
                        selectedindex = index;
                      });
                      print(selectedindex);
                    },
                    gift: datacontroller.finaldata[index].gift ?? 0,
                    rs: datacontroller.finaldata[index].rs ?? 0,
                  );
                },
              ),
            ),
          ),
          Spacer(),
          _bottombutton()
        ],
      ),
    );
  }

  Widget _bottombutton() {
    return Column(
      children: [
        Row(
          children: [Expanded(child: Divider())],
        ),
        SizedBox(
          height: 10.h,
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              shape: BeveledRectangleBorder(),
              context: context,
              builder: (context) {
                return Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width.w,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(),
                            Text(
                              'Payment Details',
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(Icons.cancel))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            Text(
                                "₹ ${datacontroller.finaldata[selectedindex].rs.toString()}",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('This recharge is GST FREE',
                                style: TextStyle(
                                    color: Colors.deepPurple.shade300,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600)),
                            Text('₹0',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600)),
                            Text(
                                '₹ ${datacontroller.finaldata[selectedindex].rs.toString()}',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.deepPurple.shade100,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Gift ₹ ${datacontroller.finaldata[selectedindex].gift.toString()}',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.deepPurple.shade400)),
                                Text(
                                    'Extra ₹ ${datacontroller.finaldata[selectedindex].gift.toString()} cashback in wallet after recharge ',
                                    style: TextStyle(
                                        color: Colors.deepPurple.shade400,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [Expanded(child: Divider())],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.deepPurple),
                          height: 50.h,
                          width: MediaQuery.of(context).size.width.w / 1.8,
                          child: Center(
                              child: Text(
                            'Proceed to pay',
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.deepPurple),
            height: 50.h,
            width: MediaQuery.of(context).size.width.w / 1.8,
            child: Center(
                child: Text(
              'Proceed to pay',
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            )),
          ),
        ),
        SizedBox(
          height: 10.h,
        )
      ],
    );
  }

  // Widget _gstcontainer() {
  //   return Container(
  //       padding: EdgeInsets.symmetric(horizontal: 10),
  //       height: 70.h,
  //       width: MediaQuery.of(context).size.width.w,
  //       decoration: BoxDecoration(color: Colors.deepPurple),
  //       child: Column(
  //         children: [
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                   'Gift ${datacontroller.finaldata?[selectedindex].gift.toString() ?? ''}'),
  //               Text(
  //                   'Extra Rs.${datacontroller.finaldata?[selectedindex].gift.toString() ?? ''} cashback in wallet after recharge ')
  //             ],
  //           ),
  //           SizedBox(
  //             height: 10,
  //           ),
  //           Row(
  //             children: [Expanded(child: Divider())],
  //           ),
  //           Container(
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(12),
  //                 color: Colors.deepPurple),
  //             height: 50,
  //             width: MediaQuery.of(context).size.width.w / 1.8,
  //             child: Center(
  //                 child: Text(
  //               'Proceed to pay',
  //               style: TextStyle(
  //                   fontSize: 20,
  //                   color: Colors.white,
  //                   fontWeight: FontWeight.w600),
  //             )),
  //           ),
  //         ],
  //       ));
  // }
}
