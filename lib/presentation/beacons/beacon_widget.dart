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
          print(state.toString());

          final List<String> artList = [
            "https://st.mngbcn.com/rcs/pics/static/T4/fotos/SZ/47025923_99_B4.jpg?imwidth=320",
            "https://st.mngbcn.com/rcs/pics/static/T3/fotos/SZ/37019111_99_B4.jpg?imwidth=320",
            "https://st.mngbcn.com/rcs/pics/static/T3/fotos/SZ/37009112_99_B4.jpg?imwidth=320",
            "https://st.mngbcn.com/rcs/pics/static/T4/fotos/SZ/47026315_99_B4.jpg?imwidth=320",
            "https://st.mngbcn.com/rcs/pics/static/T5/fotos/SZ/53097666_99_B4.jpg?imwidth=320",
            "https://st.mngbcn.com/rcs/pics/static/T5/fotos/SZ/57033256_TM_B4.jpg?imwidth=320",
            "https://st.mngbcn.com/rcs/pics/static/T6/fotos/SZ/67850051_TM_B4.jpg?imwidth=320",
            "https://st.mngbcn.com/rcs/pics/static/T5/fotos/SZ/57054046_54_B4.jpg?imwidth=320",
            "https://st.mngbcn.com/rcs/pics/static/T3/fotos/SZ/33050554_BL_B4.jpg?imwidth=320",
            "",
          ];

          if (state is BeaconsError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is BeaconsActive) {
            return ListView.builder(
              itemCount: artList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Image.network(
                      artList[index],
                      height: 120.0,
                    )
                  ],
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
