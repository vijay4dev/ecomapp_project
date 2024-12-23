import 'package:flutter/material.dart';

class ShoeFilter extends StatefulWidget {
  final List <String>  filteritem;
  final FocusNode focusNode;
    final ValueChanged<String> onFilterSelected;
  const ShoeFilter({
    super.key,
    required this.filteritem,
    required this.focusNode,
    required this.onFilterSelected,
  });
  @override
  State<ShoeFilter> createState() => _ShoeFilterState();
}
class _ShoeFilterState extends State<ShoeFilter> {
  String? selected;
  @override
  void initState() {
    super.initState();
    // Initialize 'selected' with the first item in the list
    if (widget.filteritem.isNotEmpty) {
      selected = widget.filteritem[0];
    }
  }
  @override
  Widget build(BuildContext context) {
    return   ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.filteritem.length,
                itemBuilder: (context, index) {
                  final filter = widget.filteritem[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: (){        
                        setState(() {                          
                            selected = filter;
                        });
                        widget.focusNode.unfocus();
                        widget.onFilterSelected(filter); // Notify parent widge
                      },
                      child: Chip(
                        backgroundColor:selected == filter? Colors.amber[300]:const Color.fromARGB(162, 227, 242, 253),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(30)),
                        label: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.filteritem[index],
                            style: const TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
      );
  }
}