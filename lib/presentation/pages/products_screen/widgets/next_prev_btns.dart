import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Services/get_products.dart';
import '../../../../bloc/bloc/number_of_pages_bloc.dart';
import '../../../../bloc/change_page/increase_page_bloc.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/disabled_btn.dart';

Widget nextAndPrevBtn() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      BlocProvider(
        create: (context) => NumberOfPagesBloc(
          getProducts: GetProducts(),
        )..add(
            TotalPagesEvent(),
          ),
        child: BlocBuilder<NumberOfPagesBloc, NumberOfPagesState>(
          builder: (context, state) {
            if (state.loadingStatus == LoadingStatus.loading) {
              // return customButton('Prev', false);
              return Text('Loading');
            } else if (state.loadingStatus == LoadingStatus.loaded) {
              return context.read<IncreasePageBloc>().state.pageNumber < 1
                  ? disabledBtn('Prev', false)
                  : InkWell(
                      onTap: () {
                        // context.read<IncreasePageBloc>().add(DecrementEvent());
                      },
                      child: customButton('Prev', false),
                    );
            } else {
              return Container();
            }
          },
        ),
      ),
      BlocProvider(
        create: (context) => NumberOfPagesBloc(
          getProducts: GetProducts(),
        )..add(
            TotalPagesEvent(),
          ),
        child: BlocBuilder<NumberOfPagesBloc, NumberOfPagesState>(
          builder: (context, state) {
            if (state.loadingStatus == LoadingStatus.loading) {
              // return customButton('Next', true);
              return Text('Loading');
            } else if (state.loadingStatus == LoadingStatus.loaded) {
              return context.read<IncreasePageBloc>().state.pageNumber >=
                      context.read<NumberOfPagesBloc>().state.pages
                  ? disabledBtn('Next', true)
                  : InkWell(
                      onTap: () {
                        context.read<IncreasePageBloc>().add(IncrementEvent());
                      },
                      child: customButton('Next', true),
                    );
            } else {
              return Container();
            }
          },
        ),
      ),
    ],
  );
}
