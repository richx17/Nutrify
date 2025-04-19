// import 'package:flutter/material.dart';
// import 'package:read_the_label/data/dv_values.dart';
// import 'package:read_the_label/widgets/nutrient_card.dart';
//
// Widget DetailedNutrientsCard(
//     BuildContext context, Map<String, double> dailyIntake) {
//   return Container(
//     margin: const EdgeInsets.all(20),
//     decoration: BoxDecoration(
//       // gradient: LinearGradient(
//       //   colors: [
//       //     Theme.of(context).colorScheme.tertiary.withOpacity(0.03),
//       //     Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
//       //   ],
//       //   begin: Alignment.topLeft,
//       //   end: Alignment.bottomRight,
//       // ),
//       color: Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
//       borderRadius: BorderRadius.circular(24),
//       boxShadow: [
//         BoxShadow(
//           color: Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
//           blurRadius: 0,
//           offset: const Offset(5, 5),
//         ),
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Header Section
//         // Padding(
//         //   padding: const EdgeInsets.all(20),
//         //   child: Row(
//         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //     children: [
//         //       Text(
//         //         'Detailed Nutrients',
//         //         style: TextStyle(
//         //           fontSize: 24,
//         //           fontWeight: FontWeight.w500,
//         //           color: Theme.of(context).colorScheme.onPrimary,
//         //           fontFamily: 'Poppins',
//         //         ),
//         //       ),
//         //       IconButton(
//         //         icon: Icon(
//         //           Icons.info_outline,
//         //           color: Theme.of(context).colorScheme.onPrimary,
//         //         ),
//         //onPressed: () {
//     // Header Section
//         Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.primary,
//                 borderRadius: const BorderRadius.vertical(
//                   top: Radius.circular(24),
//                 ),
//               ),
//   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//   child: Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//   Text(
//   'Detailed Nutrients',
//   style: const TextStyle(
//   fontSize: 24,
//   fontWeight: FontWeight.w500,
//   color: Colors.white,
//   fontFamily: 'Poppins',
//   ),
//   ),
//   IconButton(
//   icon: const Icon(
//   Icons.info_outline,
//   color: Colors.white,
//   ),
//   onPressed: () {
//
//
//
//                   // Show info dialog about nutrients
//                   showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       backgroundColor: Theme.of(context).colorScheme.primary,
//                       title: const Text('About Nutrients'),
//                       content: const Text(
//                         'This section shows detailed breakdown of your nutrient intake. Values are shown as percentage of daily recommended intake.',
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
//         ),
//         if (dailyIntake.isEmpty)
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.restaurant_menu,
//                   color: Theme.of(context).colorScheme.onPrimary,
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     'Log your meals to see detailed nutrient breakdown.',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Theme.of(context).colorScheme.onPrimary,
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//         // Nutrients Grid
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: GridView.count(
//             padding: const EdgeInsets.all(8),
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             crossAxisCount: 2,
//             childAspectRatio: 1.5,
//             mainAxisSpacing: 16,
//             crossAxisSpacing: 16,
//             children: nutrientData
//                 .where((nutrient) {
//                   final name = nutrient['Nutrient'];
//                   final current = dailyIntake[name] ?? 0.0;
//                   return current > 0.0 &&
//                       !['Added Sugars', 'Saturated Fat'].contains(name);
//                 })
//                 .map((nutrient) => NutrientCard(context, nutrient, dailyIntake))
//                 .toList(),
//           ),
//         ),
//         const SizedBox(height: 20),
//       ],
//     ),
//   );

// }
import 'package:flutter/material.dart';
import 'package:read_the_label/data/dv_values.dart';
import 'package:read_the_label/widgets/nutrient_card.dart';

Widget DetailedNutrientsCard(BuildContext context, Map<String, double> dailyIntake) {
  return Padding(
    padding: const EdgeInsets.all(20), // Use Padding instead of margin on Container
    child: ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withOpacity(0.1),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
              blurRadius: 0,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            // Container(
            //   width: double.infinity,
            //   color: Theme.of(context).colorScheme.primary,
            //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const Text(
            //         'Detailed Nutrients',
            //         style: TextStyle(
            //           fontSize: 24,
            //           fontWeight: FontWeight.w500,
            //           color: Colors.white,
            //           fontFamily: 'Poppins',
            //         ),
            //       ),
            //       IconButton(
            //         icon: const Icon(Icons.info_outline, color: Colors.white),
            //         padding: EdgeInsets.zero,
            //         constraints: const BoxConstraints(),
            //         onPressed: () {
            //           showDialog(
            //             context: context,
            //             builder: (context) => AlertDialog(
            //               backgroundColor: Theme.of(context).colorScheme.primary,
            //               title: const Text('About Nutrients'),
            //               content: const Text(
            //                 'This section shows detailed breakdown of your nutrient intake. Values are shown as percentage of daily recommended intake.',
            //               ),
            //               actions: [
            //                 TextButton(
            //                   onPressed: () => Navigator.pop(context),
            //                   child: const Text('Got it'),
            //                 ),
            //               ],
            //             ),
            //           );
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Detailed Nutrients',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${dailyIntake.length} nutrients tracked',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.info_outline, color: Colors.white),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
                      splashRadius: 20,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            title: const Text('About Nutrients'),
                            content: const Text(
                              'This section shows a detailed breakdown of your nutrient intake. '
                                  'Values are shown as a percentage of the daily recommended intake.',
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
                  ),
                ],
              ),
            ),


            if (dailyIntake.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.restaurant_menu,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Log your meals to see detailed nutrient breakdown.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // Nutrients Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: GridView.count(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: nutrientData
                    .where((nutrient) {
                  final name = nutrient['Nutrient'];
                  final current = dailyIntake[name] ?? 0.0;
                  return current > 0.0 &&
                      !['Added Sugars', 'Saturated Fat'].contains(name);
                })
                    .map((nutrient) => Opacity(
                  opacity: 0.85,
                  child: NutrientCard(context, nutrient, dailyIntake),
                ))
                    .toList(),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    ),
  );
}
