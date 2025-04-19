import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:read_the_label/logic.dart';
import 'package:read_the_label/screens/foodAnalysisScreen.dart';
import 'package:read_the_label/widgets/food_input_form.dart';

class FoodHistoryCard extends StatefulWidget {
  final BuildContext context;
  final Logic logic;
  final DateTime selectedDate;
  int currentIndex;

  FoodHistoryCard({
    super.key,
    required this.context,
    required this.logic,
    required this.selectedDate,
    required this.currentIndex,
  });

  @override
  State<FoodHistoryCard> createState() => _FoodHistoryCardState();
}

// class _FoodHistoryCardState extends State<FoodHistoryCard> {
//   Widget build(context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
//             Theme.of(context).colorScheme.tertiary.withOpacity(0.05),
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(24),
//         boxShadow: [
//           BoxShadow(
//             color: Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
//             blurRadius: 20,
//             offset: const Offset(5, 5),
//           ),
//         ],
//       ),
//       margin: const EdgeInsets.all(20),
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Today\'s Intake',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w500,
//                   color: Theme.of(context).colorScheme.onPrimary,
//                   fontFamily: 'Poppins',
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(
//                   Icons.info_outline,
//                   color: Theme.of(context).colorScheme.onPrimary,
//                 ),
//                 onPressed: () {
//                   // Show info dialog about nutrients
//                   showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       backgroundColor: Theme.of(context).colorScheme.surface,
//                       title: const Text('Food Items History'),
//                       content: const Text(
//                         'This section shows all the food items you have consumed today, along with their caloric values and timestamps.',
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () => Navigator.pop(context),
//                           child: const Text('Got it'),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//           ListView.builder(
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: widget.logic.foodHistory.length,
//             itemBuilder: (context, index) {
//               final item = widget.logic.foodHistory[index];
//               // Only show items from selected date
//               if (isSameDay(item.dateTime, widget.selectedDate)) {
//                 return Container(
//                   margin: const EdgeInsets.only(bottom: 8),
//                   decoration: BoxDecoration(
//                     color: Colors.white24,
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(
//                       color: Theme.of(context)
//                           .colorScheme
//                           .outline
//                           .withOpacity(0.2),
//                     ),
//                   ),
//                   child: ListTile(
//                     contentPadding:
//                         const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                     title: Text(
//                       item.foodName,
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     subtitle: Text(
//                       DateFormat('h:mm a').format(item.dateTime),
//                       style: TextStyle(
//                         color: Theme.of(context)
//                             .colorScheme
//                             .onPrimary
//                             .withOpacity(0.6),
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                     trailing: Text(
//                       '${item.nutrients['Energy']?.toStringAsFixed(0) ?? 0} kcal',
//                       style: TextStyle(
//                         color: Theme.of(context).colorScheme.onPrimary,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                   ),
//                 );
//               }
//               return const SizedBox
//                   .shrink(); // Return empty widget for non-matching dates
//             },
//           ),
//           GestureDetector(
//             onTap: () {
//               showModalBottomSheet(
//                 context: context,
//                 isScrollControlled: true,
//                 backgroundColor: Theme.of(context).colorScheme.surface,
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                 ),
//                 builder: (context) => Padding(
//                   padding: EdgeInsets.only(
//                     bottom: MediaQuery.of(context).viewInsets.bottom,
//                   ),
//                   child: FoodInputForm(
//                     logic: widget.logic,
//                     onSubmit: () {
//                       Navigator.push(
//                         context,
//                         CupertinoPageRoute(
//                           builder: (context) => FoodAnalysisScreen(
//                             logic: widget.logic,
//                             updateIndex: (index) {
//                               setState(
//                                 () {
//                                   widget.currentIndex = index;
//                                 },
//                               );
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               );
//             },
//             child: Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color.fromARGB(255, 237, 202, 149),
//                     Color.fromARGB(255, 253, 142, 81),
//                     Color.fromARGB(255, 255, 0, 85),
//                     Color.fromARGB(255, 0, 21, 255),
//                   ],
//                   stops: [0.2, 0.4, 0.6, 1.0],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 children: [
//                   const Icon(
//                     Icons.add,
//                     color: Color.fromARGB(255, 0, 21, 255),
//                   ),
//                   Text(
//                     "Add Food Item",
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w500,
//                       foreground: Paint()
//                         ..shader = const LinearGradient(
//                           colors: <Color>[
//                             Color.fromARGB(255, 0, 21, 255),
//                             Color.fromARGB(255, 255, 0, 85),
//                             Color.fromARGB(255, 250, 220, 194),
//                           ],
//                           stops: [0.3, 0.5, 0.8], // Four stops for four colors
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                         ).createShader(
//                           const Rect.fromLTWH(0.0, 0.0, 250.0, 16.0),
//                         ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   bool isSameDay(DateTime date1, DateTime date2) {
//     return date1.year == date2.year &&
//         date1.month == date2.month &&
//         date1.day == date2.day;
//   }
// }
class _FoodHistoryCardState extends State<FoodHistoryCard> {
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // HEADER
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today\'s Intake',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Food items you consumed',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.info_outline, color: Colors.white),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: Theme.of(context).colorScheme.surface,
                          title: const Text('Food Items History'),
                          content: const Text(
                            'This section shows all the food items you have consumed today, along with their caloric values and timestamps.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Got it'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // BODY
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.logic.foodHistory.length,
                  itemBuilder: (context, index) {
                    final item = widget.logic.foodHistory[index];
                    if (isSameDay(item.dateTime, widget.selectedDate)) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                          ),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          title: Text(
                            item.foodName,
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            DateFormat('h:mm a').format(item.dateTime),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
                              fontFamily: 'Poppins',
                            ),
                          ),
                          trailing: Text(
                            '${item.nutrients['Energy']?.toStringAsFixed(0) ?? 0} kcal',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),

                const SizedBox(height: 20),

                // Add Food Item Button
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) => Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: FoodInputForm(
                          logic: widget.logic,
                          onSubmit: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => FoodAnalysisScreen(
                                  logic: widget.logic,
                                  updateIndex: (index) {
                                    setState(() {
                                      widget.currentIndex = index;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 237, 202, 149),
                          Color.fromARGB(255, 253, 142, 81),
                          Color.fromARGB(255, 255, 0, 85),
                          Color.fromARGB(255, 0, 21, 255),
                        ],
                        stops: [0.2, 0.4, 0.6, 1.0],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add,
                          color: Color.fromARGB(255, 0, 21, 255),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Add Food Item",
                          style: TextStyle(

                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,

                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: [
                                  Colors.white,
                                  Color.fromARGB(255, 220, 220, 220),
                                  Colors.white,
                                  // Color.fromARGB(255, 0, 21, 255),
                                  // Color.fromARGB(255, 255, 0, 85),
                                  // Color.fromARGB(255, 250, 220, 194),
                                ],
                                stops: [0.0, 0.5, 1.0],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ).createShader(
                                const Rect.fromLTWH(0.0, 0.0, 250.0, 16.0),
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
        ],
      ),
    );
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
