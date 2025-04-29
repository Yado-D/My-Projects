import "package:e_commerse_app/features/home/Bloc/home_bloc.dart";
import "package:e_commerse_app/features/home/Models/home_model_data.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class ProductTileWidget extends StatelessWidget {
  final AnimalsDataModel animalModel;
  const ProductTileWidget({
    super.key,
    required this.animalModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color:Colors.black)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Container(
             height: 200,
             width: double.maxFinite,
            decoration: BoxDecoration(
               image: DecorationImage(image:
               NetworkImage(animalModel.image),),
            ),
           ),
          Text(animalModel.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text("${animalModel.Price}"),
             Row(
               children: [
                 IconButton(onPressed: (){
                   context.read<HomeBloc>().add(HomeWishlistButtonClikedEvent(
                      animalModel: animalModel,
                   ));
                 }, icon: Icon(Icons.favorite,color: Colors.red,),),
                 IconButton(onPressed: (){
                   context.read<HomeBloc>().add(HomeCartButtonClikedEvent(
                     animalModel: animalModel,
                   ));
                 }, icon: Icon(Icons.shopping_bag,),),
               ],
             )
           ],
         )
        ],
      ),
    );
  }
}
