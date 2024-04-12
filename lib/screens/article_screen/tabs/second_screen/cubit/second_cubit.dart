import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/data/service_locator.dart';
import 'package:flutter_application_1/models/rss_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'second_state.dart';

class SecondCubit extends Cubit<SecondState> {
  final urls = [
    "http://www.ynet.co.il/integration/StoryRss3.xml",
    "http://www.ynet.co.il/integration/StoryRss538.xml",
  ];
  List<RssData> fullList = [];
  SecondCubit()
      : super(const SecondState(
          isLoading: true,
          data: [],
        ));

  Future<void> getData() async {
    for (var element in urls) {
      dataRepository.getData(element).listen(
        (event) {
          final data = event.$1.isEmpty ? null : event.$1;

          if (data != null) {
            fullList.addAll(data);
            fullList = fullList.toSet().toList();
          }

          emit(state.copyWith(isLoading: event.$2, data: fullList));
        },
      );
    }
  }

  @override
  Future<void> close() {
    dataRepository.cancelFetch(urls);
    return super.close();
  }
}
