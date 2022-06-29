import 'package:flutter/material.dart';
import 'package:intll/l10n/l10n.dart';
import 'package:intll/provider/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_locatizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, provider, snapshot) {
        var lang = provider.locale ?? Localizations.localeOf(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.language),
            actions: [
              DropdownButton(
                icon: const Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                value: lang,
                onChanged: (Locale? val) {
                  provider.set(val!);
                },
                items: L10n.all
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: provider.title(e.languageCode),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.helloWorld,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 85.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
