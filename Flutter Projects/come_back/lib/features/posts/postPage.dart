import "package:come_back/features/Bloc/post_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class post_page extends StatefulWidget {
  const post_page({super.key});
  @override
  State<post_page> createState() => _post_pageState();
}


class _post_pageState extends State<post_page> {

  // final PostBloc postBloc = PostBloc();

  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(InitialFechSuccessEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(
          child: Text("API Integration"),
         ),
          backgroundColor: Colors.green,
        ),
        body: BlocConsumer<PostBloc, PostState>(
          listenWhen: (previous,current) => current is PostActionState,
          buildWhen: (previous,current)=> current is !PostActionState,
          listener: (context, state) {
            if(state is AddingPostState){
               ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.postMessage)),
              );
            }
          },
          builder: (context, state) {
            switch(state.runtimeType){
              case LoadingState:
                 return Center(child: CircularProgressIndicator(),);
              case initailPostSuccessState:
                  final successState = state as initailPostSuccessState;
                  return Container(
                    margin: const EdgeInsets.all(10),
                    child: ListView.builder(
                        itemCount: successState.post.length,
                        itemBuilder:(context,index){
                         return Container(
                           color: Colors.grey.shade300,
                           padding: const EdgeInsets.all(10),
                           margin: const EdgeInsets.all(10),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(successState.post[index].title,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16),),
                                Container(
                                  margin: const EdgeInsets.all(10),
                                    child: Text(
                                      "${successState.post[index].body}",)
                                ),
                              ],
                            ),
                         );
                      }
                    ),
                  );
              case initailPostFailureState:
                    return Center(child: Text("404 failed fetching data."),);
              default:
                return Center(
                   child:Text("there is some error check your connection."),
                );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
            onPressed: (){
             context.read<PostBloc>().add(AddingPost());
            }
        ),
    );
  }
}
