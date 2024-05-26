import 'package:expence_tracker/Constant/array.dart';
import 'package:expence_tracker/Screens/add_new_expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedCategory;
  String selectedDate = '';

  final dateFormatter = DateFormat('dd-MM-yyyy');

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = dateFormatter.format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expence Tracker'),
        // centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/img.jpeg'),
                  radius: 35,
                ),
                const SizedBox(width: 30),
                Text(
                  'Total \nExpenditure',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  '₹ 13,555.80',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 15)
              ],
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  8,
                  (index) => Column(
                    children: [
                      Container(
                        height: 75,
                        width: 80,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple,
                        ),
                        child: Icon(
                          category_icon[index],
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(category_name[index])
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane:
                        ActionPane(motion: ScrollMotion(), children: [
                      SlidableAction(
                        onPressed: (context) {},
                        icon: Icons.delete,
                        backgroundColor: Colors.red,
                        label: 'Delete',
                        borderRadius: BorderRadius.circular(10),
                        autoClose: true,
                      ),
                    ]),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100],
                        border: Border.all(
                          color: const Color.fromRGBO(238, 238, 238, 1),
                        ),
                      ),
                      child: const ListTile(
                        leading: Icon(Icons.shopping_cart,
                            size: 35, color: Colors.red),
                        title: Text('Title', style: TextStyle(fontSize: 18)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Category', style: TextStyle(fontSize: 17)),
                            Text(
                              '24-May-2024',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        trailing: Text(
                          '₹ 0.0',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Add Transaction',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField(
                        value: _selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                        items: List.generate(
                          category_name.length,
                          (index) => DropdownMenuItem(
                            value: category_name[index],
                            child: Text(category_name[index]),
                          ),
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Select Category',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: _presentDatePicker,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              Text(
                                selectedDate.isEmpty
                                    ? 'Select a Date'
                                    : selectedDate,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey[800],
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.calendar_today),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Add Transaction'),
                      )
                    ],
                  ),
                );
                ;
              });
        },
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}

String formatDateTime(DateTime dateTime) {
  final DateFormat dateFormatter = DateFormat('dd-MM-yyyy');
  print(dateFormatter.format(dateTime));
  return dateFormatter.format(dateTime);
}
