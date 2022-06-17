// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:ajyal/models/post_model.dart';
// import 'package:ajyal/service/updatapost_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// part 'updatapost_event.dart';
// part 'updatapost_state.dart';

// class UpdatapostBloc extends Bloc<UpdatapostEvent, UpdatapostState> {
//   UpdatapostBloc() : super(UpdatapostInitial()) {
//     on<UpdataEvent>((event, emit) async {
//       emit(Loadingupdata());
//       try {
//         PostModel? posts = await updata.updatacomment(
//             event.updatapost,
//             (await SharedPreferences.getInstance())
//                     .getString('backend_token') ??
//                 'EMPTY_TOKEN',
//             (await SharedPreferences.getInstance()).getInt('id_post') ?? 0);
//         emit(UpDataState(post2: posts));
//         emit(UpdatapostInitial());
//       } catch (e) {
//         emit(Error2State());
//       }
//     });
//   }
//   UpDataPost updata = UpDataPost();
// }
