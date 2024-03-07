import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation.dart';

class BeaconsWidget extends StatefulWidget {
  const BeaconsWidget({super.key});

  @override
  State<BeaconsWidget> createState() => _BeaconsWidgetState();
}

class _BeaconsWidgetState extends State<BeaconsWidget> {
  List<ProductElement> productsList = [];
  List<bool> isActiveList = [];
  int indexActive = 0;
  bool isAtiveRadar = false;

  List<List<double>> coord = [
    [145.0, 73, 0],
    [250.0, 75, 0],
    [145.0, 100, 0],
    [145.0, 73, 0],
    [250.0, 75, 0],
    [250.0, 75, 0],
    [145.0, 73, 0],
  ];

  @override
  void initState() {
    productsList = Product.fromJson(productJSON).products;
    isActiveList = List.filled(productsList.length, false);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24.0),
        Stack(
          children: [
            Image.asset(
              "assets/maps_images/map.png",
              height: 395,
            ),
            isAtiveRadar
                ? Positioned(
                    bottom: coord[indexActive][0],
                    right: coord[indexActive][1],
                    child: Image.asset(
                      "assets/images/radar.gif",
                      height: 30,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        Expanded(
          child: Container(
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

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: productsList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {
                        isAtiveRadar = false;
                        if (index != indexActive) {
                          if (isActiveList[indexActive]) {
                            isActiveList[indexActive] = false;
                            // context.read<BeaconsCubit>().beaconsClose();
                          }
                        }
                        if (isActiveList[index]) {
                          isActiveList[index] = false;
                          // context.read<BeaconsCubit>().beaconsClose();
                        } else {
                          isAtiveRadar = true;
                          isActiveList[index] = true;
                          if (context.read<BeaconsCubit>().state
                              is BeaconsActive) {
                            context
                                .read<BeaconsCubit>()
                                .beaconsRanging(productsList[index].uuid);
                          }
                        }
                        indexActive = index;

                        setState(() {});
                      },
                      leading: Image.network(
                        productsList[index].productImageUrl,
                        height: 120.0,
                      ),
                      title: Text(productsList[index].materialName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productsList[index].businessPartnerName,
                            textAlign: TextAlign.start,
                          ),
                          state.rangingList != null && isActiveList[index]
                              ? Text(
                                  'Distancia ${state.rangingList!.accuracy} metros',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              : const SizedBox(),
                        ],
                      ),
                      trailing: isActiveList[index]
                          ? const Icon(Icons.close)
                          : const Icon(Icons.search),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
