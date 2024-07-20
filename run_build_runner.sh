(
cd data || exit 1
fvm flutter pub get
fvm flutter packages pub run build_runner build --delete-conflicting-outputs
)
fvm flutter pub get
fvm flutter packages pub run build_runner build --delete-conflicting-outputs
fvm flutter --no-color pub global run intl_utils:generate
