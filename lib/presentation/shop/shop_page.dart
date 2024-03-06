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
        title: Text(widget.shopUID),
      ),
    );
  }
}
