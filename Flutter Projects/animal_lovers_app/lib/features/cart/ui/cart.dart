import "package:e_commerse_app/features/cart/Bloc/cart_bloc.dart";
import "package:e_commerse_app/features/home/Bloc/home_bloc.dart";
import "package:e_commerse_app/features/home/ui/product_tile_widget.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class cartPage extends StatefulWidget {
  const cartPage({super.key});

  @override
  State<cartPage> createState() => _cartPageState();
}


class _cartPageState extends State<cartPage> {

  @override
  void initState() {
    context.read<CartBloc>().add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text("Cart"),
        ),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {},
        listenWhen: (previous,current) => current is CartActionState,
        buildWhen: (previous,current) => current is !CartActionState,
        builder: (context, state) {
          switch(state.runtimeType){
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context,index){
                    return ProductTileWidget(animalModel: successState.cartItems[index],);
                  });
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
