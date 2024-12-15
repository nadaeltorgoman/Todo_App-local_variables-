import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/Data/Data_sources/local_variables_database.dart';
import 'package:todo_app/Data/model/task_model.dart';
import 'package:todo_app/Resources/color_pallete.dart';
import 'package:todo_app/Resources/icons.dart';
import 'package:todo_app/Resources/text_style.dart';
import 'package:collection/collection.dart';
import 'add_task_screen.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<Map<String, String>> generateCurrentWeekDates() {
    // Find the most recent Sunday from today
    DateTime today = DateTime.now();
    DateTime currentWeekSunday = today.subtract(Duration(days: today.weekday % 7));

    List<Map<String, String>> weekDates = [];
    DateTime currentDate = currentWeekSunday;

    // Loop for 7 days starting from the most recent Sunday
    for (int i = 0; i < 7; i++) {
      weekDates.add({
        "day": DateFormat('EEE').format(currentDate), // Abbreviated day name (e.g., Sun, Mon)
        "date": DateFormat('d').format(currentDate), // Day number only (e.g., 4, 5, etc.)
      });
      currentDate = currentDate.add(const Duration(days: 1)); // Increment by one day
    }

    return weekDates;
  }

  late List<Map<String, String>> weekDates;

  int _selectedDayIndex = 0;
  int _selectedCategoryIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Get the next Sunday

    // Generate the week starting from that Sunday
    weekDates = generateCurrentWeekDates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // date filter
          Container(
            decoration: BoxDecoration(
              color: ColorsPalette.secondaryColor.withOpacity(0.3),
            ),
            height: 180,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    Text('Today', style: AppTextStyles.bodyMedium.copyWith(fontSize: 32)),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: weekDates.mapIndexed((index, val) {
                          return _dateCard(dateObject: val, index: index);
                        }).toList()),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 16,
          ),

          // category filter
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: LocalVariablesDatabase().categoriesList.mapIndexed(
              (index, element) {
                return categoryCard(index: index, category: element);
              },
            ).toList(),
          ),

          // place holder

          Expanded(
              child: ListView.builder(
                  itemCount: LocalVariablesDatabase().categoriesList[_selectedCategoryIndex].data.isEmpty ? 1 : LocalVariablesDatabase().categoriesList[_selectedCategoryIndex].data.length,
                  itemBuilder: (context, index) {
                    List<TaskModel> myDate = LocalVariablesDatabase().categoriesList[_selectedCategoryIndex].data;

                    return myDate.isEmpty
                        ? Center(
                            child: SvgPicture.asset(emptyIcon),
                          )
                        : _taskCard(taskModel: myDate[index], context: context, currentTaskIndex: index);
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: ColorsPalette.whiteColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => AddTaskScreen(),
            ),
          );
        },
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }

  Widget _taskCard({required TaskModel taskModel, required context, required int currentTaskIndex}) {
    return Slidable(
      key: const ValueKey(0),
      closeOnScroll: true,
      startActionPane: _selectedCategoryIndex != 0
          ? null
          : ActionPane(motion: const ScrollMotion(), children: [
              SlidableAction(
                onPressed: (context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => AddTaskScreen(editedTask: taskModel),
                    ),
                  );
                },
                backgroundColor: const Color(0xFF0392CF),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
            ]),
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        if (_selectedCategoryIndex == 0) ...[
          SlidableAction(
            // An action can be bigger than the others.
            onPressed: (context) {
              LocalVariablesDatabase().categoriesList[1].data.add(taskModel);
              LocalVariablesDatabase().categoriesList[0].data.remove(taskModel);
              setState(() {});
            },
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.done,
            label: 'Done',
          ),
          SlidableAction(
            onPressed: (context) {
              LocalVariablesDatabase().categoriesList[2].data.add(taskModel);
              LocalVariablesDatabase().categoriesList[0].data.remove(taskModel);
              setState(() {});
            },
            backgroundColor: const Color.fromARGB(255, 207, 3, 3),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
        if (_selectedCategoryIndex == 1)
          SlidableAction(
            onPressed: (context) {
              LocalVariablesDatabase().categoriesList[0].data.add(taskModel);
              LocalVariablesDatabase().categoriesList[1].data.remove(taskModel);
              setState(() {});
            },
            backgroundColor: const Color.fromARGB(255, 181, 6, 220),
            foregroundColor: Colors.white,
            icon: Icons.undo,
            label: 'Undo',
          ),
        if (_selectedCategoryIndex == 2)
          SlidableAction(
            onPressed: (context) {
              LocalVariablesDatabase().categoriesList[0].data.add(taskModel);
              LocalVariablesDatabase().categoriesList[2].data.remove(taskModel);
              setState(() {});
            },
            backgroundColor: const Color.fromARGB(255, 6, 174, 220),
            foregroundColor: Colors.white,
            icon: Icons.undo,
            label: 'restore',
          )
      ]),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: taskModel.color.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    taskModel.title,
                    style: AppTextStyles.titleLarge.copyWith(fontSize: 28),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      taskModel.date,
                      style: AppTextStyles.bodySmall.copyWith(color: ColorsPalette.blackColor.withOpacity(0.6)),
                    ),
                    Text(
                      taskModel.time,
                      style: AppTextStyles.bodySmall.copyWith(color: ColorsPalette.blackColor.withOpacity(0.6)),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              taskModel.body,
              style: AppTextStyles.bodyMedium,
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  Widget categoryCard({required int index, required TaskCategoryModel category}) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedCategoryIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: _selectedCategoryIndex == index ? ColorsPalette.primaryColor : null, borderRadius: BorderRadius.circular(12), border: Border.all(width: 1, color: ColorsPalette.unselectedColor)),
        child: Text(
          category.category,
          style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600, color: _selectedCategoryIndex == index ? ColorsPalette.blackColor : ColorsPalette.unselectedColor),
        ),
      ),
    );
  }

  Widget _dateCard({required Map dateObject, required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedDayIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(color: _selectedDayIndex == index ? ColorsPalette.primaryColor : ColorsPalette.primaryColor.withOpacity(0.4), borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(dateObject['day']),
            const SizedBox(
              height: 6,
            ),
            Container(height: 32, width: 32, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)), child: Center(child: Text(dateObject['date']))),
          ],
        ),
      ),
    );
  }
}
