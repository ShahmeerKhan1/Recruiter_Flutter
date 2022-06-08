import 'package:flutter/material.dart';
import 'package:recruiter_flutter/model/stats_model.dart';
import 'package:recruiter_flutter/util/colors.dart';

class PerformHistoryList extends StatefulWidget {
  final int index;
  final List<StatsModel> list;
  VoidCallback callback;

  PerformHistoryList(
      {required this.index, required this.list, required this.callback});

  @override
  _PerformHistoryListState createState() => _PerformHistoryListState();
}

class _PerformHistoryListState extends State<PerformHistoryList> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Container(
      height: _height * 0.1,
      width: _width,
      padding: EdgeInsets.only(left: 8, right: 8),
      margin: EdgeInsets.only(top: 16.0, bottom: 2.0),
      decoration: BoxDecoration(
        color: Color(0xFF111111),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Row(
        children: [
          widget.list[widget.index].image != null ? Container(
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Image.file(widget.list[widget.index].image!,
                width: 70, height: 70, fit: BoxFit.fill),
          ) :
          Image.asset('assets/perform.png'),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.list[widget.index].date,
                style: TextStyle(
                    color: Color(0xFFFFEE00), fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 2),
              Text(widget.list[widget.index].team,
                  style: TextStyle(color: Colors.white)),
              SizedBox(height: 2),
              Text(
                widget.list[widget.index].location,
                style: TextStyle(color: Color(0xFF686868)),
              )
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
                child: PopupMenuButton(
                    color: Colors.black,
                    offset: Offset(0, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(0.0),
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Text('delete',
                              style: TextStyle(color: Colors.red)),
                          height: 20,
                          onTap: () {
                            print('contTap');
                            setState(() {
                              widget.list.removeAt(widget.index);
                              widget.callback();
                            });
                          },
                        )
                      ];
                    }),
              ),
              Text(
                widget.list[widget.index].status,
                style: TextStyle(color: widget.list[widget.index].color),
              ),
              Text(
                widget.list[widget.index].ratio,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              Text(
                widget.list[widget.index].rating,
                style: TextStyle(color: Color(0xFF717781), fontSize: 12.0),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _dltWidget() {
    return Stack(
      children: [
        Container(
          height: 20,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: Color(0xFF474747)),
          ),
          child: InkWell(
              onTap: () {
                print('contTap');
                setState(() {
                  widget.list.removeAt(widget.index);
                  widget.callback();
                });
              },
              child: Text(
                'Delete',
                style: TextStyle(color: Color(0xFFF61F1F), fontSize: 14.0),
              )),
        ),
      ],
    );
  }
}
