import 'package:flutter/material.dart';
import 'package:ssi_wallet/components/colors.dart';
import 'package:ssi_wallet/utils/config.dart';

class CredentialComponent extends StatelessWidget {
  CredentialComponent(
      {Key? key,
      required this.credentialName,
      required this.issuer,
      required this.credentialType,
      required this.issueDate,
      required this.index})
      : super(key: key);

  final String credentialName;
  final String issuer;
  final String credentialType;
  final String issueDate;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: getHeight(200),
        color: AppColors.card,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(credentialName),
            Text(issuer),
            Text(credentialType),
            Text(issueDate),
          ],
        ),
      ),
    );
  }
}
