

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/prompt/bloc/prompt_bloc.dart';

class createPromptScreen extends StatefulWidget {
  const createPromptScreen({super.key});

  @override
  State<createPromptScreen> createState() => _createPromptScreenState();
}

class _createPromptScreenState extends State<createPromptScreen> {

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
   context.read<PromptBloc>().add(PromptInitialEvent());
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Generate Images🚀"),),
      ),
      body: BlocConsumer<PromptBloc, PromptState>(
        listener: (context, state) {},
        builder: (context, state) {

          switch(state.runtimeType){
            case PromptGeneratingImageSuccessState:
              final successState = state as PromptGeneratingImageSuccessState;
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                       decoration: BoxDecoration(
                           color: Colors.deepPurple,
                         image: DecorationImage(
                           fit: BoxFit.fill,
                             image: MemoryImage(successState.file) ,
                          ),
                         )
                       ),
                      ),
                    Container(
                      height: 240,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Enter Your Text", style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: _controller,
                            cursorColor: Colors.deepPurple,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurple,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            height: 48,
                            width: double.maxFinite,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                    Colors.deepPurple),
                              ),
                              onPressed: () {},
                              icon: Icon(Icons.generating_tokens),
                              label: Text("Generate"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            case PromptGeneratingImageLoadingState:
              return Center(child: CircularProgressIndicator(),);
            case PromptGeneratingImageErrorState:
              return Center(child: Text("404 Error."),);
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
