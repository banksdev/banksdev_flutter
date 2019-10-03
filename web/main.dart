import 'package:flutter_for_web_ui/ui.dart' as ui;
import 'package:banksdev_flutter/main.dart' as app;

main() async {
  await ui.webOnlyInitializePlatform();
  app.main();
}
