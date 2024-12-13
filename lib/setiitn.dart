import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cài đặt'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.lock_reset),
                title: Text('Đặt lại mật khẩu'),
                onTap: () {
                  // Gọi hàm đặt lại mật khẩu

                },
              ),
              ListTile(
                leading: Icon(Icons.language),
                title: Text('Đổi ngôn ngữ'),
                onTap: () {
                  // Gọi hàm đổi ngôn ngữ

                },
              ),
              ListTile(
                leading: Icon(Icons.brightness_6),
                title: Text('Đổi giao diện sáng/tối'),
                trailing:  Switch(
                  value: true,
                  onChanged: (value) {
                   // settingsController.toggleTheme();
                  },
                )
              ),
              ListTile(
                leading: Icon(Icons.account_balance),
                title: Text('Thiết lập số dư ban đầu'),
                onTap: () {
                  // Gọi hàm thiết lập số dư ban đầu
                  _showInitialBalanceDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showInitialBalanceDialog(BuildContext context) {
    TextEditingController balanceController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thiết lập số dư ban đầu'),
          content: TextField(
            controller: balanceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Nhập số dư ban đầu"),
          ),
          actions: [
            TextButton(
              child: Text("Hủy"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Lưu"),
              onPressed: () {
                // Lưu số dư ban đầu
                //settingsController.setInitialBalance(double.parse(balanceController.text));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
