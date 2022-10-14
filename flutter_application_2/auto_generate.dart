// https://book.flutterchina.club/chapter11/json_model.html#_11-7-2-%E4%B8%80%E5%8F%A5%E5%91%BD%E4%BB%A4%E5%AE%9E%E7%8E%B0json%E8%BD%ACdart%E7%B1%BB

import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

const TAG = "\$";
const SRC = "./json"; //JSON 目录
const DIST = "lib/model/"; //输出model目录

void walk() {
  //遍历JSON目录生成模板
  var src = Directory(SRC);
  var list = src.listSync();
  var template = File("./template").readAsStringSync();
  File file;

  for (var f in list) {
    if (FileSystemEntity.isFileSync(f.path)) {
      file = File(f.path);
      var paths = path.basename(f.path).split(".");
      String name = paths.first;
      // 如果JSON文件名以下划线“_”开始，则忽略此JSON文件。
      if (paths.last.toLowerCase() != "json" || name.startsWith("_")) return;
      //下面生成模板
      var map = json.decode(file.readAsStringSync());
      //为了避免重复导入相同的包，我们用Set来保存生成的import语句。
      var set = <String>{};
      StringBuffer attrs = StringBuffer();
      (map as Map<String, dynamic>).forEach((key, v) {
        if (key.startsWith("_")) return;
        //所有字段都定义为可空
        attrs.write("${getType(v, set, name)}?");
        attrs.write(" ");
        attrs.write(key);
        attrs.writeln(";");
        attrs.write("    ");
      });
      String className = name[0].toUpperCase() + name.substring(1);
      var dist = format(template, [
        name,
        className,
        className,
        attrs.toString(),
        className,
        className,
        className
      ]);
      var importFile = set.join(";\r\n");
      importFile += importFile.isEmpty ? "" : ";";
      dist = dist.replaceFirst("%t", importFile);
      //将生成的模板输出
      File("$DIST$name.dart").writeAsStringSync(dist);
    }
  }
}

String changeFirstChar(String str, [bool upper = true]) {
  return (upper ? str[0].toUpperCase() : str[0].toLowerCase()) +
      str.substring(1);
}

//将JSON类型转为对应的dart类型
String getType(v, Set<String> set, String current) {
  current = current.toLowerCase();
  if (v is bool) {
    return "bool";
  } else if (v is num) {
    return "num";
  } else if (v is Map) {
    return "Map<String,dynamic>";
  } else if (v is List) {
    return "List";
  } else if (v is String) {
    //处理特殊标志
    if (v.startsWith("$TAG[]")) {
      var className = changeFirstChar(v.substring(3), false);
      if (className.toLowerCase() != current) {
        set.add('import "$className.dart"');
      }
      return "List<${changeFirstChar(className)}>";
    } else if (v.startsWith(TAG)) {
      var fileName = changeFirstChar(v.substring(1), false);
      if (fileName.toLowerCase() != current) {
        set.add('import "$fileName.dart"');
      }
      return changeFirstChar(fileName);
    }
    return "String";
  } else {
    return "String";
  }
}

//替换模板占位符
String format(String fmt, List<Object> params) {
  int matchIndex = 0;
  String replace(Match m) {
    if (matchIndex < params.length) {
      switch (m[0]) {
        case "%s":
          return params[matchIndex++].toString();
      }
    } else {
      throw Exception("Missing parameter for string format");
    }
    throw Exception("Invalid format string: ${m[0]}");
  }

  return fmt.replaceAllMapped("%s", replace);
}

void main() {
  walk();
}
