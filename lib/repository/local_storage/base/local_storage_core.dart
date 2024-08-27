import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalStorageCore {
  // Constructor mặc định không có tham số cho lớp LocalStorageCore.
  LocalStorageCore();

  // Phương thức đọc dữ liệu từ bộ nhớ cục bộ với một khóa cụ thể.
  Future<dynamic> read(String key) async {
    final prefs = await SharedPreferences
        .getInstance(); // Lấy instance của SharedPreferences.
    var data = prefs.getString(
        key); // Lấy dữ liệu dưới dạng chuỗi từ bộ nhớ với khóa cung cấp.
    return json.decode(
        data.toString()); // Giải mã chuỗi JSON thành đối tượng và trả về.
  }

  // Phương thức lưu dữ liệu vào bộ nhớ cục bộ với một khóa cụ thể.
  save(String key, value) async {
    final prefs = await SharedPreferences
        .getInstance(); // Lấy instance của SharedPreferences.
    prefs.setString(
        key,
        json.encode(
            value)); // Mã hóa đối tượng thành chuỗi JSON và lưu vào bộ nhớ.
  }

  // Phương thức xóa một dữ liệu khỏi bộ nhớ cục bộ dựa trên khóa cung cấp.
  remove(String key) async {
    final prefs = await SharedPreferences
        .getInstance(); // Lấy instance của SharedPreferences.
    prefs.remove(key); // Xóa dữ liệu tương ứng với khóa khỏi bộ nhớ cục bộ.
  }

  // Phương thức xóa toàn bộ dữ liệu trong bộ nhớ cục bộ.
  Future<bool> clear() async {
    final prefs = await SharedPreferences
        .getInstance(); // Lấy instance của SharedPreferences.
    return await prefs
        .clear(); // Xóa toàn bộ dữ liệu và trả về kết quả (thành công hoặc thất bại).
  }

  // Phương thức kiểm tra xem một khóa cụ thể có tồn tại trong bộ nhớ cục bộ hay không.
  Future<bool> exist(String key) async {
    final prefs = await SharedPreferences
        .getInstance(); // Lấy instance của SharedPreferences.
    bool exist = prefs.containsKey(key); // Kiểm tra xem khóa có tồn tại không.
    return exist; // Trả về true nếu khóa tồn tại, ngược lại là false.
  }
}
