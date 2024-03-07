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

          if (state is BeaconsActive || state is BeaconsLoaded) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 1,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () => context
                      .read<BeaconsCubit>()
                      .beaconsRanging("2F234454-CF6D-4A0F-ADF2-F4911BA9FFA7"),
                  leading: Image.network(
                    "https://st.mngbcn.com/rcs/pics/static/T4/fotos/SZ/47025923_99_B4.jpg?imwidth=320",
                    height: 120.0,
                  ),
                  title: const Text('perndaaa 111'),
                  subtitle: state.rangingList.isNotEmpty
                      ? Text(
                          'Distance ${state.rangingList.first.accuracy} meters',
                          textAlign: TextAlign.start,
                        )
                      : const SizedBox(),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                );
              },
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
