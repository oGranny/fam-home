import 'package:fam_home/entities/base_card.dart';
import 'package:fam_home/entities/card_group.dart';
import 'package:fam_home/services/data_service.dart';
import 'package:fam_home/utils/constants.dart';
import 'package:fam_home/widgets/cards/big_display_card.dart';
import 'package:fam_home/widgets/cards/dynamic_width_scrollable_card.dart';
import 'package:fam_home/widgets/cards/small_display_card.dart';
import 'package:fam_home/widgets/fam_app_bar.dart';
import 'package:fam_home/widgets/cards/image_card.dart';
import 'package:fam_home/widgets/cards/small_card_with_arrow.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final List<Widget> _cards = [];
  bool _isLoading = true;
  bool _errWhileLoading = false;
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final data = await DataService.fetchData(apiUrl);
      final newWidgets = <Widget>[];
      for (var item in data) {
        final cardGroup = CardEntity.fromJson(item);
        newWidgets.add(_stringToWidget(cardGroup.designType!, cardGroup));
      }

      final startIndex = _cards.length;
      _cards.addAll(newWidgets);

      if (_listKey.currentState != null) {
        for (var i = startIndex; i < _cards.length; i++) {
          _listKey.currentState!.insertItem(
            i,
            duration: const Duration(milliseconds: 250),
          );
        }
      }
    } catch (e) {
      debugPrint('Fetch error: $e');
      _errWhileLoading = true;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _stringToWidget(String text, CardEntity cardGroup) {
    return {
          'HC3': HC3Container(
            cardGroup: cardGroup,
            onDismiss: () => _removeHC3Section(cardGroup.id),
          ),
          "HC6": HC6Container(cardGroup: cardGroup),
          "HC5": HC5Container(cardGroup: cardGroup),
          "HC9": HC9Container(cardGroup: cardGroup),
          "HC1": HC1Container(cardGroup: cardGroup),
        }[text] ??
        Container();
  }

  void _removeHC3Section(int id) {
    final index = _cards.indexWhere((w) => w is HC3Container && w.id == id);
    if (index != -1) {
      final removedItem = _cards.removeAt(index);
      _listKey.currentState?.removeItem(
        index,
        (context, animation) =>
            SizeTransition(sizeFactor: animation, child: removedItem),
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FamAppBar(),
      backgroundColor: const Color(0xFFF7F6F3),
      body: RefreshIndicator(
        onRefresh: () async {
          _cards.clear();
          setState(() {
            _isLoading = true;
            _errWhileLoading = false;
          });
          await _fetchData();
        },
        child:
            _errWhileLoading
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, size: 70, color: Colors.red),
                      SizedBox(height: 20),
                      Text(
                        'Error loading data, please refresh',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                )
                : !_isLoading
                ? AnimatedList(
                  key: _listKey,
                  initialItemCount: _cards.length,
                  itemBuilder: (context, index, animation) {
                    return SizeTransition(
                      sizeFactor: animation,
                      child: _cards[index],
                    );
                  },
                )
                : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
