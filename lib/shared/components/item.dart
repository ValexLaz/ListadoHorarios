import 'package:flutter/material.dart';

class ItemOfList extends StatelessWidget {
  final dynamic data;
  final String title;

  const ItemOfList({Key? key, required this.data, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                margin: EdgeInsets.only(bottom: 12,right: 12),
                color: const Color.fromARGB(255, 33, 47, 243),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      color: Color.fromARGB(255, 11, 24, 168),
                      child: Center(
                        child: Text(
                          getNameAbrev(),
                          style: TextStyle(
                            color: Colors
                                .white, // Cambia el color del texto según desees
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      child: Text(
                        title,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: _buildDynamicFields(),
              )
            ],
          ),
        ),
      
    );
  }

  List<Widget> _buildDynamicFields() {
    List<Widget> fields = [];
    final Map<String, dynamic>? dataMap = _getDataMap();
    if (dataMap != null) {
      dataMap.forEach((key, value) {
        fields.add(_buildFieldWidget(key, value));
      });
    }
    return fields;
  }

  Map<String, dynamic>? _getDataMap() {
    if (data is Map<String, dynamic>) {
      return data as Map<String, dynamic>;
    } else if (data.toJson is Function) {
      return data.toJson() as Map<String, dynamic>;
    }
    return null;
  }

  Widget _buildFieldWidget(String key, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '$key:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey, // Color personalizado
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value.toString(),
              style: TextStyle(
                color: Colors.black87, // Color personalizado
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getNameAbrev(){
    dynamic titulo =  title.split(" ");
    return " ${titulo[0][0]} ${titulo[1][0]}";
  }
}
