## Sơ lược

B1: Chọn 1 cái API để fetch, trong bài này tôi chọn bừa 1 api liên quan tới thông tin user

B2: Tạo file userService.dart để cấu hình data trả về từ API, đồng thời tiện tay viết luôn một hàm để fetch data từ API

B3: Tạo một file .dart khác để làm trang chủ cho project (trang Homepage ấy), ở đây tôi tạo file tên là homePage.dart. Sau khi tạo xong file homePage.dart thì dùng sẵn file main.dart hiện có để import cái Homepage vào làm trang chủ cho project.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_fetch_api/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Đặt tiêu đề cho app
      title: "My Flutter App",
      // Đặt theme chính cho App, ở đây tôi dùng Blue cho đẹp
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Đặt trang chủ cho App
      home: Homepage(),
      // Ẩn cái banner debug daubuoi ở góc phải màn hình đi cho đẹp
      debugShowCheckedModeBanner: false,
    );
  }
}
```

B4: Hiển thị data fetch được ra vào trong homePage.dart thui, còn file detailsPage.dart tôi đang để cho vui. Hiển thị như nào thì tự đọc code trong file homePage.dart.
