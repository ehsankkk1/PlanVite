
import 'package:get/get.dart';
import 'package:plane_vite/config/user_information.dart';
import 'package:plane_vite/screens/agenda/agenda_service.dart';
import '../../models/agenda_model.dart';



class AgendaController extends GetxController{

  List<Agenda> agendaList=[];

  // ProductsService _service=ProductsService();
  AgendaService _service= AgendaService();


  var isLoading=true.obs;
  var like=false;
  var currentId=0;
  @override
  void onInit() {

    super.onInit();
  }
  @override
  void onReady()async {

    agendaList=await _service.getAgenda();
    isLoading(false);
    super.onReady();

  }
  void unPin(id)async{
    isLoading(true);
    await _service.unPinTask(UserInformation.User_Token,id);
    agendaList=await _service.getAgenda();
    isLoading(false);

  }
  void load()async{

    isLoading(true);
    agendaList=await _service.getAgenda();
    isLoading(false);

  }


}