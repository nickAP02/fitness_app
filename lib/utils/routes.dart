import 'package:fitness_app/components/auth/login_page.dart';
import 'package:fitness_app/components/home/profile.dart';
import 'package:fitness_app/components/home/search_page.dart';
import 'package:fitness_app/components/plans/plan_list.dart';
import 'package:fitness_app/components/settings.dart';
import 'package:flutter/material.dart';

import '../components/auth/signup_page.dart';
import '../components/diets/diet_list.dart';
import '../components/exercises/exercice_list.dart';
import '../components/home/home.dart';
import '../components/home/notification.dart';
// import '../components/onboarding/splash.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      // PageEntity(
      //   route: AppRoutes.INITIAL,
      //   page: const Splash(),
      // ),
      // PageEntity(
      //   route: AppRoutes.LANG,
      //   page: const LangPreference(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => WelcomeBloc(),
      //   // ),
      // ),
      // PageEntity(
      //   route: AppRoutes.PLAN_PREF,
      //   page: const PlanPreferences(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => WelcomeBloc(),
      //   // ),
      // ),
      // PageEntity(
      //   route: AppRoutes.USER_PREF,
      //   page: const UserPreference(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => WelcomeBloc(),
      //   // ),
      // ),
      PageEntity(
        route: AppRoutes.SIGN_UP,
        page: const SignUp(),
        // bloc: BlocProvider(
        //   create: (_) => SignInBloc(),
        // ),
      ),
      PageEntity(
        route: AppRoutes.LOGIN,
        page: const Login(),
        // bloc: BlocProvider(
        //   create: (_) => RegisterBlocs(),
        // ),
      ),
      PageEntity(
        route: AppRoutes.HOME,
        page: const Home(),
        // bloc: BlocProvider(
        //   create: (_) => AppBlocs(),
        // ),
      ),
      PageEntity(
        route: AppRoutes.NOTIFICATION,
        page: const NotificationPage(),
        // bloc: BlocProvider(
        //   create: (_) => AppBlocs(),
        // ),
      ),
      // PageEntity(
      //   route: AppRoutes.CHANGE_PASSWORD,
      //   page: const ChangePassword(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => AppBlocs(),
      //   // ),
      // ),
      PageEntity(
        route: AppRoutes.PLANS,
        page: const Plans(),
        // bloc: BlocProvider(
        //   create: (_) => AppBlocs(),
        // ),
      ),
      // PageEntity(
      //   route: AppRoutes.PARTNERS,
      //   page: const Partners(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => AppBlocs(),
      //   // ),
      // ),
      PageEntity(
        route: AppRoutes.NUTRITION,
        page: const Diets(),
        // bloc: BlocProvider(
        //   create: (_) => AppBlocs(),
        // ),
      ),
      // PageEntity(
      //   route: AppRoutes.APROPOS,
      //   page: const About(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => AppBlocs(),
      //   // ),
      // ),
      PageEntity(
        route: AppRoutes.EXERCICES,
        page: const Exercices(),
        // bloc: BlocProvider(
        //   create: (_) => AppBlocs(),
        // ),
      ),
      PageEntity(
        route: AppRoutes.PARAMS,
        page: const Settings(),
        // bloc: BlocProvider(
        //   create: (_) => AppBlocs(),
        // ),
      ),
      PageEntity(
        route: AppRoutes.SEARCH,
        page: const Search(),
        // bloc: BlocProvider(
        //   create: (_) => AppBlocs(),
        // ),
      ),
      PageEntity(
        route: AppRoutes.PROFILE,
        page: const Profile(),
        // bloc: BlocProvider(
        //   create: (_) => AppBlocs(),
        // ),
      )
    ];
  }

// //return all bloc providers
//   static List<dynamic> allBlocProviders(BuildContext context) {
//     List<dynamic> blocProviders = <dynamic>[];

//     for (var bloc in routes()) {
//       if (bloc.bloc != null) {
//         blocProviders.add(bloc.bloc);
//       }
//     }
//     return blocProviders;
//   }

  //a model that covers entire screen as we click on Navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name matching when Navigator get triggered
      var result = routes().where((element) => element.route == settings.name);

      if (result.isNotEmpty) {
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }
    print('invalid route name: ${settings.name}');

    return MaterialPageRoute(
      builder: (_) => const SignUp(),
      settings: settings,
    );
  }
}

//unify blocProvider and routes and pages
class PageEntity {
  PageEntity({
    required this.route,
    required this.page,
    // this.bloc,
  });

  String route;
  Widget page;
  // dynamic bloc;
}

class AppRoutes {
  //splash page or on boarding
  // ignore: constant_identifier_names
  // static const INITIAL = '/';
  // //welcome page
  // // ignore: constant_identifier_names
  // static const WELCOME = '/welcome';
  //lang preferences page
  // ignore: constant_identifier_names
  // static const LANG = '/lang';
  //user preferences page
  // ignore: constant_identifier_names
  // static const PLAN_PREF = '/plan_pref';
  //user preferences page
  // ignore: constant_identifier_names
  // static const USER_PREF = '/user_pref';
  //sign in page
  // ignore: constant_identifier_names
  static const SIGN_UP = '/sign_in';
  //login page
  // ignore: constant_identifier_names
  static const LOGIN = '/login';
  //home page
  // ignore: constant_identifier_names
  static const HOME = '/home';
  //notification page
  // ignore: constant_identifier_names
  static const NOTIFICATION = '/notification';
  //change password page
  // ignore: constant_identifier_names
  static const CHANGE_PASSWORD = '/change_password';
  //plans
  // ignore: constant_identifier_names
  static const PLANS = '/plans';
  //exercices
  // ignore: constant_identifier_names
  static const EXERCICES = '/exercices';
  //partners page
  // ignore: constant_identifier_names
  static const PARTNERS = '/partners';
  //nutrition
  // ignore: constant_identifier_names
  static const NUTRITION = '/nutrition';
  //à propos
  // ignore: constant_identifier_names
  static const APROPOS = '/about';
  //recherche
  static const SEARCH = '/search';
  // //params
  static const PARAMS = '/params';
  //user profile
  static const PROFILE = '/profile';
  // //agenda
  // static const AGENDA = '/agenda';
  // //annonces concours
  // static const ANNONCES = '/annonces';
}
