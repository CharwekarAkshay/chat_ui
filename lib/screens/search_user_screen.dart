import 'package:chat_ui/constants.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kThemeColor,
      ),
      body: Container(
        color: kBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding,
          ),
          child: Column(
            children: [
              Expanded(
                child: TextField(
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
                  // onFieldSubmitted: onFieldSubmitted,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  // obscureText: obscureText,
                  // validator: validator,
                  style: TextStyle(
                      color: kThemeColor.withOpacity(0.7), fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleBackNavigation extends StatelessWidget {
  const SimpleBackNavigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 30,
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}

/*
   TextField(
                      style: TextStyle(
                        color: kThemeColor,
                        fontSize: 18,
                      ),
                      textInputAction: TextInputAction.search,
                      focusNode: _searchFocusNode,
                      controller: _searchTextEditingController,
                      decoration: InputDecoration(
                        hintText: 'Search Username',
                        hintStyle: TextStyle(color: Colors.white54),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        suffixIcon: GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
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
                      onSubmitted: (_) {
                        // intiateSearch();
                      },
                    ),
 */
