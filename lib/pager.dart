library pager;

import 'package:flutter/material.dart';

class Pager extends StatefulWidget {
  Pager(
      {Key? key,
      this.pagesView = 3,
      this.currentPage = 0,
      required this.totalPages,
      required this.onPageChanged})
      : super(key: key);

  /// How many page numbers to show
  final int pagesView;

  /// Total pages.
  final int totalPages;

  /// The callback that is called when the page is changed.
  final Function(int) onPageChanged;

  /// Current page. Default is 0.
  int currentPage;

  @override
  State<Pager> createState() => _PagerState();
}

class _PagerState extends State<Pager> {
  @override
  Widget build(BuildContext context) {
    int pageEnd = widget.currentPage + widget.pagesView > widget.totalPages
        ? widget.totalPages
        : widget.currentPage + widget.pagesView;
    int pageStart = pageEnd == widget.totalPages
        ? pageEnd - widget.pagesView
        : widget.currentPage;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          tooltip: "First Page",
          onPressed: () {
            setState(() {
              widget.currentPage = 0;
              widget.onPageChanged(widget.currentPage);
            });
          },
          icon: const Icon(
            Icons.first_page,
            color: Colors.grey,
          ),
        ),
        IconButton(
          tooltip: "Previous",
          onPressed: () {
            setState(() {
              widget.currentPage =
                  widget.currentPage > 0 ? widget.currentPage - 1 : 0;
              widget.onPageChanged(widget.currentPage);
            });
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.grey,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = pageStart; i < pageEnd; i++)
              TextButton(
                onPressed: () {
                  setState(() {
                    widget.currentPage = i;
                    widget.onPageChanged(widget.currentPage);
                  });
                },
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    primary: widget.currentPage == i ? Colors.blue : null),
                child: Text(
                  "${i + 1}",
                  style: TextStyle(
                    color: widget.currentPage == i ? Colors.white : null,
                  ),
                ),
              ),
          ],
        ),
        IconButton(
          tooltip: "Next Page",
          onPressed: () {
            setState(() {
              widget.currentPage = widget.currentPage < widget.totalPages - 1
                  ? widget.currentPage + 1
                  : widget.totalPages - 1;
              widget.onPageChanged(widget.currentPage);
            });
          },
          icon: const Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
        ),
        IconButton(
          tooltip: "Last Page",
          onPressed: () {
            setState(() {
              widget.currentPage = widget.totalPages - 1;
              widget.onPageChanged(widget.currentPage);
            });
          },
          icon: const Icon(
            Icons.last_page,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
