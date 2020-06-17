# covid19counter

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Screenshots

<img src="https://raw.githubusercontent.com/siddiquisahil02/COVID-Tracker-Worldwide-using-Flutter/master/src/mian_screen.png"  height = "400" ><img src="https://raw.githubusercontent.com/siddiquisahil02/COVID-Tracker-Worldwide-using-Flutter/master/src/navigation_drawer.png"  height = "400" ><img src="https://raw.githubusercontent.com/siddiquisahil02/COVID-Tracker-Worldwide-using-Flutter/master/src/World.png"  height = "400" >
<img src="https://raw.githubusercontent.com/siddiquisahil02/COVID-Tracker-Worldwide-using-Flutter/master/src/All_Countries.png"  height = "400" ><img src="https://raw.githubusercontent.com/siddiquisahil02/COVID-Tracker-Worldwide-using-Flutter/master/src/Canada.png"  height = "400" ><img src="https://raw.githubusercontent.com/siddiquisahil02/COVID-Tracker-Worldwide-using-Flutter/master/src/India.png"  height = "400" >
<img src="https://raw.githubusercontent.com/siddiquisahil02/COVID-Tracker-Worldwide-using-Flutter/master/src/Districts.png"  height = "400" ><img src="https://raw.githubusercontent.com/siddiquisahil02/COVID-Tracker-Worldwide-using-Flutter/master/src/District_wise.png"  height = "400" ><img src="https://raw.githubusercontent.com/siddiquisahil02/COVID-Tracker-Worldwide-using-Flutter/master/src/FAQs.png"  height = "400" >

# APIs Used

In this application, data parsing is done from these APIs.

- [For Whole World](https://disease.sh/v2/all)
- [For Different Countries](https://corona.lmao.ninja/v2/countries?yesterday&sort)
- [For India](https://api.covid19india.org/v2/state_district_wise.json)

# Packages Used

These are the packages that are added to this flutter project from [pub.dev](https://pub.dev/)

- [http 0.12.1](https://pub.dev/packages/http) for parsing the data from the APIs
- [intl 0.16.1](https://pub.dev/packages/intl) for beautifying the integer data to show with commas 
- [url_launcher 5.4.10](https://pub.dev/packages/url_launcher) for launching the W.H.O wesite for **Myth Busters** and **Travel Precautions**
- [material_design_icons_flutter 4.0.5345](https://pub.dev/packages/material_design_icons_flutter) for adding material icons that flutter doesn't provide with there default *Icons* pack
- [flutter_linkify 3.1.3](https://pub.dev/packages/flutter_linkify) for showing clickable website links in the application