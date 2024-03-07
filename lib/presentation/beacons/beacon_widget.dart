import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation.dart';

class BeaconsWidget extends StatefulWidget {
  const BeaconsWidget({super.key});

  @override
  State<BeaconsWidget> createState() => _BeaconsWidgetState();
}

class _BeaconsWidgetState extends State<BeaconsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: BlocBuilder<BeaconsCubit, BeaconsState>(
        builder: (context, state) {
          if (state is BeaconsError) {
            return Center(
              child: Text(state.message),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
