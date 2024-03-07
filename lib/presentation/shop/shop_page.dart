import '../presentation.dart';

class ShopPage extends StatefulWidget {
  final Result shopUID;
  const ShopPage({super.key, required this.shopUID});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.shopUID.storeName.split("STMANGO")[0].trimLeft(),
                style: Theme.of(context).textTheme.titleMedium),
            Text(
              '${widget.shopUID.streetName}, ${widget.shopUID.postalCode} ${widget.shopUID.cityName}'
                  .trimLeft(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: const BeaconsWidget(),
    );
  }
}
