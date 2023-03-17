import 'package:cached_network_image/cached_network_image.dart';
import 'package:coreapp1/models/space.dart';
import 'package:coreapp1/utils/constants/string_constants.dart';
import 'package:coreapp1/utils/style/style_constants/color_constants.dart';
import 'package:flutter/material.dart';

class FacilityCard extends StatelessWidget {
  final Space space;
  const FacilityCard({
    super.key,
    required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: space.photos.first,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              space.name,
              style: const TextStyle(
                  color: ColorConstants.kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _getFormattedFacilityType(space.spacetype),
                  style: const TextStyle(
                    color: ColorConstants.kPrimaryColor,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: ShapeDecoration(
                    color: space.isAvailable
                        ? ColorConstants.kSuccessBackgroundColor
                        : ColorConstants.kErrorBackgroundColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                  child: space.isAvailable
                      ? const Text(StringConstants.availableLabel)
                      : const Text(StringConstants.occupiedLabel),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  String _getFormattedFacilityType(SpaceType spaceType) {
    String spacTypeFormatted = spaceType.name.replaceAll('_', ' ');
    return "${spacTypeFormatted[0].toUpperCase()}${spacTypeFormatted.substring(1).toLowerCase()}";
  }
}
