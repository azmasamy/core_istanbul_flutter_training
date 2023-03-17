import 'package:cached_network_image/cached_network_image.dart';
import 'package:coreapp1/providers/facilities/facilities_bloc.dart';
import 'package:coreapp1/providers/login/login_bloc.dart';
import 'package:coreapp1/ui/facilities/widgets/facility_card.dart';
import 'package:coreapp1/utils/constants/string_constants.dart';
import 'package:coreapp1/utils/style/style_constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FacilitiesScreen extends StatelessWidget {
  FacilitiesScreen({super.key});
  late FacilitesBloc facilitiesBloc;
  late LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(children: [
        buildUserInfo(context),
        buildScreenBody(context),
      ]),
    ));
  }

  buildUserInfo(BuildContext context) {
    loginBloc = Provider.of<LoginBloc>(context);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: ColorConstants.kSecondaryColor,
            child: CircleAvatar(
              radius: 30,
              backgroundImage:
                  CachedNetworkImageProvider(loginBloc.loggedInUser!.photo),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                StringConstants.welcomTitle,
                style: TextStyle(
                    color: ColorConstants.kPrimaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                loginBloc.loggedInUser!.name,
                style: const TextStyle(
                    color: ColorConstants.kPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }

  buildScreenBody(BuildContext context) {
    facilitiesBloc = Provider.of<FacilitesBloc>(context);

    if (facilitiesBloc.state == FacilitiesState.loading) {
      facilitiesBloc.fetchFacilities();
      return buildLoadingScreen();
    } else {
      return Column(
        children: [
          buildPageTitle(context),
          buildFacilitiesList(context),
        ],
      );
    }
  }

  buildLoadingScreen() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  buildPageTitle(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            StringConstants.ourOfficesTitle,
            style: TextStyle(
                color: ColorConstants.kPrimaryColor,
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "${facilitiesBloc.facilities.length} ${StringConstants.officesLabel}",
            style: const TextStyle(
              color: ColorConstants.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  buildFacilitiesList(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            shrinkWrap: true,
            itemCount: facilitiesBloc.facilities.length,
            itemBuilder: (context, index) =>
                FacilityCard(space: facilitiesBloc.facilities[index])),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
