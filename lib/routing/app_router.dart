import 'package:go_router/go_router.dart';

import '../features/home/home_screen.dart';
import '../features/services/services_screen.dart';
import '../features/services/service_detail_screen.dart';
import '../features/projects/projects_screen.dart';
import '../features/projects/project_detail_screen.dart';
import '../features/about/about_screen.dart';
import '../features/legal/privacy_screen.dart';
import '../utils/site_content.dart';
import '../widgets/adapt_scaf.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AdaptiveScaffold(
          title: 'Taylor Consulting',
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/services',
              builder: (context, state) => const ServicesScreen(),
              routes: [
                for (final item in serviceItems)
                  GoRoute(
                    path: item.slug,
                    builder: (context, state) => ServiceDetailScreen(slug: item.slug),
                  ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/projects',
              builder: (context, state) => const ProjectsScreen(),
              routes: [
                for (final item in projectItems)
                  GoRoute(
                    path: item.slug,
                    builder: (context, state) => ProjectDetailScreen(slug: item.slug),
                  ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/about', builder: (context, state) => const AboutScreen()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/privacy', builder: (context, state) => const PrivacyScreen()),
          ],
        ),
      ],
    ),
  ],
);