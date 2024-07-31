import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  late LinkedScrollControllerGroup _controllers;
  late ScrollController _scrollController1;
  late ScrollController _scrollController2;

  @override
  void initState() {
    _controllers = LinkedScrollControllerGroup();
    _scrollController1 = _controllers.addAndGet();
    _scrollController2 = _controllers.addAndGet();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController1.dispose();
    _scrollController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const int numRows = 20;
    const int numCols = 10;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollController1,
                child: Table(
                  border: TableBorder.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  defaultColumnWidth: const FixedColumnWidth(100.0),
                  children: [
                    TableRow(
                      children: List.generate(
                        numCols,
                        (colIndex) => TableCell(
                          child: Container(
                            color: Colors.grey[300],
                            height: 50,
                            child: Center(
                              child: Text(
                                'Head $colIndex',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ...List.generate(
                      numRows,
                      (rowIndex) => TableRow(
                        children: List.generate(
                          numCols,
                          (colIndex) {
                            final cellColor = (rowIndex % 2 == 0)
                                ? Colors.yellow[50]
                                : Colors.yellow[200];
                            return TableCell(
                              child: Container(
                                color: cellColor,
                                height: 70,
                                child: Center(
                                  child: Text(
                                    '${rowIndex * numCols + colIndex}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Table(
                border: TableBorder.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                defaultColumnWidth: const FixedColumnWidth(50.0),
                children: [
                  TableRow(
                    children: List.generate(
                      2,
                      (colIndex) => TableCell(
                        child: Container(
                          color: Colors.grey[300],
                          height: 50,
                          child: Center(
                            child: Text(
                              'Head $colIndex',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ...List.generate(
                    numRows,
                    (rowIndex) => TableRow(
                      children: List.generate(2, (colIndex) {
                        final cellColor = (rowIndex % 2 == 0)
                            ? Colors.grey[100]
                            : Colors.grey[200];
                        return TableCell(
                          child: Container(
                            color: cellColor,
                            height: 70,
                            child: const SizedBox(),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                scrollDirection: Axis.horizontal,
                controller: _scrollController2,
                child: Table(
                  border: TableBorder.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  defaultColumnWidth: const FixedColumnWidth(100.0),
                  children: [
                    TableRow(
                      children: List.generate(
                        numCols,
                        (colIndex) => TableCell(
                          child: Container(
                            color: Colors.grey[300],
                            height: 50,
                            child: Center(
                              child: Text(
                                'Head ${numCols - colIndex - 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ...List.generate(
                      numRows,
                      (rowIndex) => TableRow(
                        children: List.generate(
                          numCols,
                          (colIndex) {
                            final cellColor = (rowIndex % 2 == 0)
                                ? Colors.green[50]
                                : Colors.green[200];
                            return TableCell(
                              child: Container(
                                color: cellColor,
                                height: 70,
                                child: Center(
                                  child: Text(
                                    '${rowIndex * numCols + colIndex}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
