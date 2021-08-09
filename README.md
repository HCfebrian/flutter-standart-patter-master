This project currently using Flutter Channel stable, 1.22.4

This is a basic example of standart pattern for Flutter

#how to build#

flutter build apk --debug --flavor develop -t lib/main_develop.dart //for develop

flutter build apk --debug --flavor staging -t lib/main_staging.dart //for staging

flutter build apk --release --flavor production -t lib/main_production.dart // for production