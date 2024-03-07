import '../presentation.dart';

class ShopSearchPage extends StatefulWidget {
  const ShopSearchPage({super.key});

  @override
  State<ShopSearchPage> createState() => _ShopSearchPageState();
}

class _ShopSearchPageState extends State<ShopSearchPage> {
  final TextEditingController searchController = TextEditingController();
  List<Result> shopList = [];

  @override
  void initState() {
    shopList = Shop.fromJson(shops_json).results;
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("search-shops"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  hintStyle: const TextStyle(color: Colors.black45),
                  hintText: "search-shop",
                  fillColor: Colors.black12,
                  suffixIcon: IconButton(
                    onPressed: () => searchController.clear(),
                    icon: const Icon(
                      Icons.close,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: shopList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShopPage(
                              shopUID: shopList[index],
                            ),
                          ),
                        );
                      },
                      title: Text(shopList[index]
                          .storeName
                          .split("STMANGO")[0]
                          .trimLeft()),
                      subtitle: Text(
                          '${shopList[index].streetName}, ${shopList[index].postalCode} ${shopList[index].cityName}'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
