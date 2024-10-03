import 'package:e_commerse_app/features/cart/ui/cart.dart';
import 'package:e_commerse_app/features/home/Bloc/home_bloc.dart';
import 'package:e_commerse_app/features/home/ui/product_tile_widget.dart';
import 'package:e_commerse_app/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  void initState() {
     context.read<HomeBloc>().add(HomeInitialEvent());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous,current) => current is HomeActionState,
      buildWhen: (previous,current) => current is !HomeActionState,
      listener: (context, state) {
         if(state is HomeNavigateToWishlistPageActionState){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> cartPage()));
         }
         if(state is HomeNavigateToCartPageActionState){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> wishlistPage()));
         }
         if(state is HomeProductItemWishlistedActionState){
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" Item wishlisted!")));
         }
         if(state is HomeProductItemCartedActionState){
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" Item Carted!")));
         }
      },
      builder: (context, state) {
        print(state);
          switch(state.runtimeType){
            case HomeLoadingState:
              return Center(
                child: CircularProgressIndicator(),
              );

            case HomeLoadingSuccessState:
              final successState = state as HomeLoadingSuccessState;
              return Scaffold(
                    appBar: AppBar(
                    backgroundColor: Colors.green,
                    title: Center(
                    child: Text(
                    "Animals Lover", style: TextStyle(color: Colors.white),),
                    ),
                    actions: [
                    IconButton(onPressed: (){
                    context.read<HomeBloc>().add(HomeWishlistButtonNavigateClikedEvent());
                    }, icon: Icon(Icons.favorite,color: Colors.red,),),
                    IconButton(onPressed: (){
                    context.read<HomeBloc>().add(HomeCartButtonNavigateClikedEvent());
                    }, icon: Icon(Icons.shopping_bag,color: Colors.white,),),
                    ],
                    ),
                    body: ListView.builder(
                      itemCount: successState.AnimalModel.length,
                        itemBuilder: (context,index){
                            return ProductTileWidget(animalModel: successState.AnimalModel[index],);
                        })
              );
            case HomeErrorState:
               return Scaffold(
                 body: Center(child: Text("404 Error"),),
               );
            default:
              return Scaffold(
                body: Center(child: Text("data"),),
              );
          }
      },
    );
  }
}
