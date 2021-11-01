import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tackon/bloc/question/question_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuestionBloc>(context).add(const QuestionFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tackon'),
      ),
      body: BlocBuilder<QuestionBloc, QuestionState>(
        builder: (BuildContext context, QuestionState state) {
          if (state is QuestionFetch) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: state.questions?.length ?? 0,
                itemBuilder: (_, int index) => Text(
                  state.questions?[index].text ?? 'Question Text',
                ),
              );
            }
          }
          return const Text('Something Not Good');
        },
      ),
    );
  }
}
