import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:flutter/material.dart';

//EdgeInsets.only(left: 10) mar
// EdgeInsets.symmetric(vertical: 10),
//"Andy & Cindy's Diner"

class PlaceListCardView extends StatelessWidget with BaseView {
  final bool hasFreeDelivery;
  final PlaceListDetailEntity placeListDetailEntity;

  PlaceListCardView({
    super.key,
    required this.hasFreeDelivery,
    required this.placeListDetailEntity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => coordinator.showPlaceDetailPage(context: context, placeId: placeListDetailEntity.placeId),
      child: Card( // Usamos Card para una tarjeta semántica y con estilo.
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // LeftImageContentView tiene un ancho fijo
              LeftImageContentView(imageUrl: placeListDetailEntity.imgs.first),
              const SizedBox(width: 10), // Espacio entre la imagen y el texto
              // RightImageContentView se expande para llenar el espacio restante
              Expanded(
                child: RightImageContentView(
                  hasFreeDelivery: hasFreeDelivery,
                  placeListDetailEntity: placeListDetailEntity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LeftImageContentView extends StatelessWidget {
  final String imageUrl;

  const LeftImageContentView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image(
        width: 80,
        height: 80,
        fit: BoxFit.cover,
        image: NetworkImage(imageUrl),
      ),
    );
  }
}

class RightImageContentView extends StatelessWidget {
  final bool hasFreeDelivery;
  final PlaceListDetailEntity placeListDetailEntity;

  const RightImageContentView({
    super.key,
    required this.hasFreeDelivery,
    required this.placeListDetailEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Fila 1: Solo el nombre y la dirección
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerText(
              placeListDetailEntity.placeName,
              overflow: TextOverflow.ellipsis,
              Colors.black,
              17,
              FontWeight.bold,
            ),
            headerText(
              placeListDetailEntity.address,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              Colors.grey,
              13,
              FontWeight.w500,
            ),
          ],
        ),

        // Agregamos un pequeño espacio entre las dos secciones
        
        // Fila 2: Rating y el botón de Free Delivery
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 16),
            Text(
              " ${placeListDetailEntity.ratingAverage}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              "(${placeListDetailEntity.ratings} ratings)",
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
            
            // Usamos un Spacer para empujar el botón al final de la fila
            const Spacer(),
            if (hasFreeDelivery)
              createButton(
                width: 100,
                height: 20,
                margin: EdgeInsets.only(top: 0),
                func: () {},
                color: Colors.orange,
                fontSize: 8,
                labelButton: "Free Delivery",
              ),
          ],
        ),
      ],
    );
  }
}