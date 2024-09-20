import 'package:api_call/state/app_state.dart';
import 'package:api_call/state/notifier/app_state_notifier.dart';
import 'package:api_call/ui/widget/failed_widget.dart';
import 'package:api_call/ui/widget/profile_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      ref.read(appStateProvider.notifier).getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(appStateProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: Text(
          'API Call(Riverpod)',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: state is AppStateLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : state is AppStateSuccess
              ? ProfileList(userProfileData: state.profiledata)
              : state is AppStateFailed
                  ? FailedWidget(
                      errorMessage: state.errorMessage,
                    )
                  : Center(
                      child: Text('Unknown State'),
                    ),
    );
  }
}
