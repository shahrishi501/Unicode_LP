import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/nearby_places_models.dart';

class NearbyPlaces extends StatelessWidget {
  const NearbyPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        
        nearbyPlaces.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              height: 135,
              width: double.maxFinite,
              child: Card(
                elevation: 0.4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            nearbyPlaces[index].image,
                            height: double.maxFinite,
                            width: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                nearbyPlaces[index].name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                               Text(nearbyPlaces[index].company),
                              const SizedBox(height: 10),
                              
                              const Spacer(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow.shade700,
                                    size: 14,
                                  ),
                                  const Text(
                                    "4.5",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  const Spacer(),
                                  RichText(
                                    text: const TextSpan(
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.teal,
                                        ),
                                        text: "\$22",
                                        children: [
                                          TextSpan(
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black54,
                                              ),
                                              text: "/ Person")
                                        ]),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
