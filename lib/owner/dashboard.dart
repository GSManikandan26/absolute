import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../about/cookie_policy.dart';
import '../about/privacy_policy.dart';
import '../about/terms_and_conditions.dart';
import '../home/homepage.dart';
import 'PropertyListingPage.dart';
import 'Service.dart';
import 'TicketDetailsPage.dart';
import 'kyc_verification.dart';
import 'owner_profile.dart';
import 'payment_notification.dart';
import 'tenant_list.dart';
import 'vacant_list.dart';
import 'package:fluttertoast/fluttertoast.dart';


class OwnerDashboard extends StatelessWidget {
  OwnerDashboard({super.key});

  final Map<String, IconData> menuIcons = {
    'Profile': Icons.account_circle,
    'adminServices': Icons.business,
    'Tenant List': Icons.people,
    'KYC': Icons.perm_identity,
    'Manage Payment': Icons.payment,
    'Vacant List': Icons.home,
    'Ticket list': Icons.receipt,
    'logout': Icons.exit_to_app,
  };

  void handleDrawerSelection(String value, BuildContext context) {
    switch (value) {
      case 'Tenant List':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const TenantListPage(),
          ),
        );
        break;
      case 'Manage Payment':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PaymentNotificationPage(),
          ),
        );
        break;
      case 'adminServices':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AdminServicesPage(),
          ),
        );
        break;
      case 'Owner Profile':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OwnerProfileScreen(),
          ),
        );
        break;
      case 'KYC':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const KYCVerificationPage(),
          ),
        );
        break;
      case 'Vacant List':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>  VacantListPage(),
          ),
        );
        break;
      case 'Ticket list':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const VendorTicketListPage(),
          ),
        );
        break;
      case 'logout':
        Navigator.pop(context); // Close the drawer if it's open
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
              (Route<dynamic> route) => false,
        );
        // Perform logout action
        break;
      default:
      // Handle other selections if needed
        break;
    }
  }

  void _openWhatsApp() async {
    const phoneNumber = '+1234567890'; // Replace with the desired WhatsApp phone number
    const whatsappUrl = 'https://wa.me/$phoneNumber';

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      _whatsapp();
    }
  }

  @override
  Widget build(BuildContext context) {
    Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: customColor,
                ),
                child: const Center(
                  child: Text(
                    'Welcome Owner ! ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(menuIcons['Profile']),
                title: const Text('Profile'),
                onTap: () {
                  handleDrawerSelection('Owner Profile', context);
                },
              ),
              ListTile(
                leading: Icon(menuIcons['Tenant List']),
                title: const Text('List of the Tenants'),
                onTap: () {
                  handleDrawerSelection('Tenant List', context);
                },
              ),
              ListTile(
                leading: Icon(menuIcons['KYC']),
                title: const Text('KYC Management'),
                onTap: () {
                  handleDrawerSelection('KYC', context);
                },
              ),
              ListTile(
                leading: Icon(menuIcons['Manage Payment']),
                title: const Text('Manage Payment'),
                onTap: () {
                  handleDrawerSelection('Manage Payment', context);
                },
              ),
              ListTile(
                leading: Icon(menuIcons['Vacant List']),
                title: const Text('Vacant List'),
                onTap: () {
                  handleDrawerSelection('Vacant List', context);
                },
              ),
              ListTile(
                leading: Icon(menuIcons['Ticket list']),
                title: const Text('Tenant Raised Tickets'),
                onTap: () {
                  handleDrawerSelection('Ticket list', context);
                },
              ),
              ListTile(
                leading: Icon(menuIcons['adminServices']),
                title: const Text('Services Provided by Admin'),
                onTap: () {
                  handleDrawerSelection('adminServices', context);
                },
              ),
              ListTile(
                leading: Icon(menuIcons['logout']),
                title: const Text('Logout'),
                onTap: () {
                  handleDrawerSelection('logout', context);
                },
              ),
              const SizedBox(height: 50.0),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Instagram Icon with URL
                        GestureDetector(
                          onTap: () {
                            launch('https://www.instagram.com/absolute_stay_coporate_livings/'); // Open Instagram URL
                          },
                          child: Icon(
                            FontAwesomeIcons.instagram,
                          ),
                        ),
                        // Facebook Icon with URL
                        GestureDetector(
                          onTap: () {
                            launch('https://www.facebook.com/absolutestaycorporate'); // Open Facebook URL
                          },
                          child: Icon(
                            FontAwesomeIcons.facebook,
                          ),
                        ),
                        // Twitter Icon with URL
                        GestureDetector(
                          onTap: () {
                            launch('https://twitter.com/AbsoluteStay'); // Open Twitter URL
                          },
                          child: Icon(
                            FontAwesomeIcons.twitter,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    ListTile(
                      title: const Text('Terms & Conditions'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TermsAndConditionsPage(),
                          ),
                        );
                      },
                    ),

                    ListTile(
                      title: const Text('Cookie Policy for App'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CookiePolicyPage(),
                          ),
                        );
                      },
                    ),

                    ListTile(
                      title: const Text('Privacy Policy'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 5.0,
                color: Colors.grey.shade200,
                margin: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Property Overview',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ListTile(
                        leading: Icon(Icons.home),
                        title: Text('Property Name: Your Property'),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text('Location: Your Location'),
                      ),
                      ListTile(
                        leading: Icon(Icons.attach_money),
                        title: Text('Total Earnings: \$10,000'),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5.0,
                color: Colors.grey.shade200,
                margin: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notifications',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ListTile(
                        leading: Icon(Icons.notifications),
                        title: Text('New Booking: John Doe booked your property.'),
                      ),
                      ListTile(
                        leading: Icon(Icons.notifications),
                        title: Text('Payment Received: \$500 received for booking.'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Elevated Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PropertyListingPage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return const Color.fromRGBO(33, 37, 41, 1.0);
                        }
                        return const Color.fromRGBO(33, 84, 115, 1.0);
                      },
                    ),
                  ),
                  child: const Text(
                    'List Your Property',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0, right: 20),
        child: FloatingActionButton(
          onPressed: _openWhatsApp,
          backgroundColor: customColor,
          child: const Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
        ),
      ),
    );
  }
  void _whatsapp() {
    Fluttertoast.showToast(
      msg: 'Unable to launch Whatsapp!',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM_RIGHT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      webShowClose: true,
      webBgColor: "linear-gradient(to right, #ffaa00, #ff7700)",
    );
  }
}

