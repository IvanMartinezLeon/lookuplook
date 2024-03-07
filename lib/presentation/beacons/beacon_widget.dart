import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation.dart';

class BeaconsWidget extends StatefulWidget {
  const BeaconsWidget({super.key});

  @override
  State<BeaconsWidget> createState() => _BeaconsWidgetState();
}

class _BeaconsWidgetState extends State<BeaconsWidget> {
  List<ProductElement> productsList = [];

  @override
  void initState() {
    productsList = Product.fromJson(product_json).products;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
              itemCount: productsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () => context
                      .read<BeaconsCubit>()
                      .beaconsRanging(productsList[index].uuid),
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
                      state.rangingList != null
                          ? Text(
                              'Distance ${state.rangingList!.accuracy} meters',
                              textAlign: TextAlign.start,
                            )
                          : const SizedBox(),
                    ],
                  ),
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
