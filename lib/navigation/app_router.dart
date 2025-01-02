import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/otp_screen.dart';
import '../screens/phone_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/create_team_screen.dart';
import '../screens/squad_screen.dart';
import '../screens/pitch_report_screen.dart';
import '../screens/bowling_statistics_screen.dart';
import '../screens/batting_statistics_screen.dart';
import '../screens/team_head_to_head_screen.dart';
import '../screens/player_overview_screen.dart';
import '../screens/cheat_sheet_screen.dart';
import '../screens/expert_corner_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/welcome':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/phone':
        return MaterialPageRoute(builder: (_) => const PhoneScreen());
      case '/otp':
        final phoneNumber = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => OtpScreen(phoneNumber: phoneNumber),
        );
      case '/create-team':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => CreateTeamScreen(matchDetails: args),
        );
      case '/squad':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => SquadScreen(matchDetails: args),
        );
      case '/pitch-report':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => PitchReportScreen(matchDetails: args),
        );
      case '/bowling-statistics':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BowlingStatisticsScreen(matchDetails: args),
        );
      case '/batting-statistics':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BattingStatisticsScreen(matchDetails: args),
        );
      case '/team-head-to-head':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => TeamHeadToHeadScreen(matchDetails: args),
        );
      case '/player-overview':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => PlayerOverviewScreen(matchDetails: args),
        );
      case '/cheat-sheet':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => CheatSheetScreen(matchDetails: args),
        );
      case '/expert-corner':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ExpertCornerScreen(matchDetails: args),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
