import '../presentation.dart';

class ShopSearchPage extends StatefulWidget {
  const ShopSearchPage({super.key});

  @override
  State<ShopSearchPage> createState() => _ShopSearchPageState();
}

class _ShopSearchPageState extends State<ShopSearchPage> {
  final TextEditingController searchController = TextEditingController();

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
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShopPage(
                              shopUID: 'Shop $index',
                            ),
                          ),
                        );
                      },
                      title: Text("Shop $index"),
                      subtitle: const Text('address'),
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
