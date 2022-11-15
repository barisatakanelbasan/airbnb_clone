import 'package:airbnb_clone/core/extensions/context_extension.dart';
import 'package:airbnb_clone/product/constants/product_constants.dart';
import 'package:airbnb_clone/view/home/explore/view_model/explore_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../generation/colors.gen.dart';

class FilterBarWidget extends StatefulWidget {
  const FilterBarWidget({super.key});

  @override
  State<FilterBarWidget> createState() => _FilterBarWidgetState();
}

class _FilterBarWidgetState extends State<FilterBarWidget> {
  final _viewModel = ExploreViewModel();
  //
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      builder: (context, child) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ProductConstants.instance.filterNames.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _onFilterTap(_viewModel, index),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: context.normalValue),
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(top: context.lowValue),
                      child: Image.asset(
                        ProductConstants.instance.filterIcons[index],
                        height: 20,
                        width: 20,
                      ),
                    ),
                    Text(ProductConstants.instance.filterNames[index].tr()),
                    const Spacer(),
                    Container(
                      margin: EdgeInsets.only(bottom: context.lowValue / 2),
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        color: context.watch<ExploreViewModel>().selectedFilterIndex == index ? ColorName.black : Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _onFilterTap(viewModel, index) async {
    // TODO: Implement filter logic
    viewModel.setSelectedFilterIndex = index;
    debugPrint('test $index');
  }
}
