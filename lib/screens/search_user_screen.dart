import 'package:chat_ui/components/components.dart';
import 'package:chat_ui/constants.dart';
import 'package:chat_ui/services/services.dart';
import 'package:flutter/material.dart';

class SearchUserScreen extends StatefulWidget {
  static const routeName = '/search-user';

  @override
  _SearchUserScreenState createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  FocusNode _searchFocusNode = new FocusNode();

  TextEditingController _searchTextEditingController =
      new TextEditingController();

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kThemeColor,
      ),
      body: Container(
        color: kBackgroundColor,
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding,
        ),
        height: size.height,
        child: Column(
          children: [
            SearchField(
              focusNode: _searchFocusNode,
              textController: _searchTextEditingController,
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 70,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          ProfileAvatar(
                            assetImage: AvatarService.getRandomAvatarUrl(),
                            radius: 30,
                          ),
                          Expanded(
                            child: Text('Random Name $index', style: Theme.of(context).textTheme.headline6.copu),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ),
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: ListView.builder(
            //       itemBuilder: (BuildContext context, int index) {
            //         return Container(
            //           color: Colors.cyanAccent,
            //           child: Text('New Widget'),
            //         );
            //       },
            //       itemCount: 10,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
    @required FocusNode focusNode,
    @required TextEditingController textController,
  })  : _searchFocusNode = focusNode,
        _searchTextEditingController = textController,
        super(key: key);

  final FocusNode _searchFocusNode;
  final TextEditingController _searchTextEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search Your Friends..',
        hintStyle: TextStyle(
          color: kThemeColor.withOpacity(0.7),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: kThemeColor,
            style: BorderStyle.solid,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: kThemeColor,
            style: BorderStyle.solid,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: kThemeColor,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.all(kDefaultPadding),
        suffixIcon: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2,
              horizontal: kDefaultPadding,
            ),
            child: Icon(
              Icons.search,
              color: kThemeColor,
            ),
          ),
          onTap: () {
            _searchFocusNode.unfocus();

            _searchFocusNode.canRequestFocus = false;

            // intiateSearch();

            Future.delayed(Duration(milliseconds: 100), () {
              _searchFocusNode.canRequestFocus = true;
            });
          },
        ),
      ),
      controller: _searchTextEditingController,
      focusNode: _searchFocusNode,
      textInputAction: TextInputAction.search,
      style: TextStyle(color: kThemeColor.withOpacity(0.7), fontSize: 18),
    );
  }
}
