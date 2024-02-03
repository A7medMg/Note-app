import 'package:untitled7/constans/masseg.dart';

validInput(String val,int min, int max){
  if(val.length>max){
    return "$massegeinpumax $max";
  }
  if(val.isEmpty){
    return "$massegeinputempty ";
  }
  if(val.length<min){
    return "$massegeinpumin $min";
  }

}