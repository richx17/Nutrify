// import 'package:flutter/material.dart';
//
// Widget MacronutrientSummaryCard(
//     BuildContext context, Map<String, double> dailyIntake) {
//   final calories = dailyIntake['Energy'] ?? 0.0;
//   const calorieGoal = 2000.0;
//   final caloriePercent = (calories / calorieGoal);
//   return Container(
//     margin: const EdgeInsets.symmetric(horizontal: 20),
//     padding: const EdgeInsets.all(20),
//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//         colors: [
//           Theme.of(context).colorScheme.primary,
//           Theme.of(context).colorScheme.primary.withOpacity(0.3),
//         ],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ),
//       borderRadius: BorderRadius.circular(24),
//       boxShadow: [
//         BoxShadow(
//           color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
//           blurRadius: 20,
//           offset: const Offset(5, 5),
//         ),
//       ],
//     ),
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Calories',
//                   style: TextStyle(
//                     color: Theme.of(context).colorScheme.onPrimary,
//                     fontSize: 20,
//                     fontFamily: 'Poppins',
//                   ),
//                 ),
//                 Text(
//                   '${calories.toStringAsFixed(0)} / ${calorieGoal.toStringAsFixed(0)} kcal',
//                   style: TextStyle(
//                     color: Theme.of(context).colorScheme.onPrimary,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'Poppins',
//                   ),
//                 ),
//               ],
//             ),
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                 SizedBox(
//                   width: 75,
//                   height: 75,
//                   child: CircularProgressIndicator(
//                     value: caloriePercent,
//                     backgroundColor: Colors.white24,
//                     valueColor: AlwaysStoppedAnimation<Color>(
//                       Theme.of(context).colorScheme.onPrimary,
//                     ),
//                     strokeWidth: 10,
//                     strokeCap: StrokeCap.round,
//                   ),
//                 ),
//                 Center(
//                   child: Text(
//                     '${(caloriePercent * 100).toStringAsFixed(0)}%',
//                     style: TextStyle(
//                       color: Theme.of(context).colorScheme.onPrimary,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _buildMacronutrientIndicator(
//               'Protein',
//               dailyIntake['Protein'] ?? 0.0,
//               50.0,
//               Icons.fitness_center,
//             ),
//             _buildMacronutrientIndicator(
//               'Carbs',
//               dailyIntake['Carbohydrate'] ?? 0.0,
//               275.0,
//               Icons.grain,
//             ),
//             _buildMacronutrientIndicator(
//               'Fat',
//               dailyIntake['Fat'] ?? 0.0,
//               78.0,
//               Icons.opacity,
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _buildMacronutrientIndicator(
//   String label,
//   double value,
//   double goal,
//   IconData icon,
// ) {
//   final percent = (value / goal).clamp(0.0, 1.0);
//   return Column(
//     spacing: 4,
//     children: [
//       Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.white24,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Icon(
//           icon,
//           color: Colors.white,
//           size: 32,
//         ),
//       ),
//       Text(
//         label,
//         style: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontFamily: 'Poppins',
//             fontWeight: FontWeight.w500),
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             '${value.toStringAsFixed(1)}g',
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 12,
//               fontWeight: FontWeight.w600,
//               fontFamily: 'Poppins',
//             ),
//           ),
//           Text(
//             ' / ${goal.toStringAsFixed(1)}g',
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 10,
//               fontWeight: FontWeight.w400,
//               fontFamily: 'Poppins',
//             ),
//           ),
//         ],
//       ),
//       SizedBox(
//         height: 6,
//         width: 80,
//         child: LinearProgressIndicator(
//           value: percent,
//           backgroundColor: Colors.white24,
//           valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
//           minHeight: 5,
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     ],
//   );
// }
import 'package:flutter/material.dart';

Widget MacronutrientSummaryCard(
    BuildContext context, Map<String, double> dailyIntake) {
  final calories = dailyIntake['Energy'] ?? 0.0;
  const calorieGoal = 2000.0;
  final caloriePercent = (calories / calorieGoal).clamp(0.0, 1.0);

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
          blurRadius: 12,
          offset: const Offset(4, 6),
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ✅ Calorie Section - Original Font Preserved
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Calories',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,

                    fontSize: 26,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  '${calories.toStringAsFixed(0)} / ${calorieGoal.toStringAsFixed(0)} kcal',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 75,
                  height: 75,
                  child: CircularProgressIndicator(
                    value: caloriePercent,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.onPrimary,
                    ),
                    strokeWidth: 10,
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Center(
                  child: Text(
                    '${(caloriePercent * 100).toStringAsFixed(0)}%',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildMacronutrientIndicator(
              context,
              'Protein',
              dailyIntake['Protein'] ?? 0.0,
              50.0,
              Icons.fitness_center,
              Colors.teal.shade400,
            ),
            _buildMacronutrientIndicator(
              context,
              'Carbs',
              dailyIntake['Carbohydrate'] ?? 0.0,
              275.0,
              Icons.grain,
              Colors.orange.shade300,
            ),
            _buildMacronutrientIndicator(
              context,
              'Fat',
              dailyIntake['Fat'] ?? 0.0,
              78.0,
              Icons.opacity,
              Colors.pink.shade300,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildMacronutrientIndicator(
    BuildContext context,
    String label,
    double value,
    double goal,
    IconData icon,
    Color iconColor,
    ) {
  final percent = (value / goal).clamp(0.0, 1.0);
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 32,
        ),
      ),
      const SizedBox(height: 6),
      Text(
        label,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${value.toStringAsFixed(1)}g',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            ' / ${goal.toStringAsFixed(1)}g',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 10,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
      const SizedBox(height: 4),
      SizedBox(
        height: 6,
        width: 80,
        child: LinearProgressIndicator(
          value: percent,
          backgroundColor: Colors.black12,
          valueColor: AlwaysStoppedAnimation<Color>(iconColor),
          minHeight: 5,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ],
  );
}
