import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandayatest/core_module/bloc/search_bloc/search_bloc.dart';
import 'package:mandayatest/core_module/widgets/search_widget/experience_sheet.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class WhenToMin extends StatefulWidget {
  const WhenToMin({
    super.key,
    this.title,
    this.subTitle,
    this.index,
    required this.valueNotif,
  });

  final String? title;
  final String? subTitle;
  final int? index;
  final ValueNotifier<int?> valueNotif;

  @override
  State<WhenToMin> createState() => _WhenToMinState();
}

class _WhenToMinState extends State<WhenToMin> {
  ValueNotifier<DateTime?> vnDate = ValueNotifier(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<SearchBloc>(context),
      child: Builder(builder: (context) {
        SearchBloc bloc = BlocProvider.of<SearchBloc>(context);
        return BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return ButtonExperience(
              valueNotif: widget.valueNotif,
              title: widget.title,
              index: widget.index,
              subTitle: widget.subTitle,
              onTap: () async {
                widget.valueNotif.value = widget.index;
                await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BlocProvider.value(
                        value: bloc,
                        child: Builder(builder: (context) {
                          return Dialog.fullscreen(
                            backgroundColor: Colors.transparent,
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.2,
                                  right: 24,
                                  left: 24,
                                  bottom: 24),
                              decoration: BoxDecoration(
                                  color: const Color(0xffefefef),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 24,
                                      left: 24,
                                      right: 24,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "When's Your Trip?",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        BlocBuilder<SearchBloc, SearchState>(
                                          builder: (context, stateSearch) {
                                            return SfDateRangePicker(
                                              minDate: DateTime.now(),
                                              initialSelectedDate:
                                                  DateTime.tryParse(
                                                stateSearch
                                                        .searchFormModel
                                                        ?.searchForm
                                                        ?.dateTrip
                                                        ?.date ??
                                                    DateTime.now().toString(),
                                              ),
                                              onSelectionChanged:
                                                  (DateRangePickerSelectionChangedArgs
                                                      value) {
                                                vnDate.value = value.value;
                                              },
                                              selectionMode:
                                                  DateRangePickerSelectionMode
                                                      .single,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 24),
                                    child: SizedBox(
                                      height: 50,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 50,
                                                child: Center(
                                                    child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    'Skip',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ))),
                                            ValueListenableBuilder(
                                                valueListenable: vnDate,
                                                builder: (context, valueNtfr,
                                                    child) {
                                                  return Expanded(
                                                      flex: 50,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          BlocProvider.of<
                                                                      SearchBloc>(
                                                                  context)
                                                              .add(ChangeDateSearch(
                                                                  data: valueNtfr
                                                                      .toString()));

                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .redAccent,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: const Center(
                                                              child: Text(
                                                                  'Next',
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white,
                                                                  ))),
                                                        ),
                                                      ));
                                                })
                                          ]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      );
                    });
              },
            );
          },
        );
      }),
    );
  }
}
