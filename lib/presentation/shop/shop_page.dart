import '../presentation.dart';

class ShopPage extends StatefulWidget {
  final String shopUID;
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
            Text(widget.shopUID, style: Theme.of(context).textTheme.titleLarge),
            Text(
              widget.shopUID,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: Column(
        children: [Image.asset("assets/images/map.png")],
      ),
    );
  }
}
