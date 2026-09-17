# Claude has memory problems: in a project things get lost between chats in the Pro lic version
This document is to keep a running tab of the LLM chats.

## Setting up alltechllc Flutter Project chat:
Here's a full copy-paste summary of everything covered in this session:
________________________________________
Project: allytechllc.com — Flutter PWA on Firebase Hosting/Firestore
Goal: Replace the current (not live) allytechllc.com GoDaddy domain with a Flutter PWA hosted on Firebase. Phase 1 = simple landing page showcasing commercial/client project work to attract freelance clients. No Firestore-backed features are required yet, though Firestore was set up alongside Hosting per original request.
Environment
•	Windows 11 laptop, VS Code, PowerShell
•	Flutter SDK: upgraded during this session from 3.35.4 → 3.47.4 (stable channel), installed at C:\flutter
•	Node.js installed (was missing) so npm/firebase-tools could be installed
•	Firebase CLI (firebase-tools) and FlutterFire CLI (flutterfire_cli) both installed via npm/dart pub global
•	Had to add C:\Users\Bobby Taylor\AppData\Local\Pub\Cache\bin to Windows PATH for flutterfire command to work
Project location
•	Originally created in OneDrive\Documents\allytechllc — caused persistent file-lock errors during builds, so the project was moved to C:\Developer\allytechllc (not OneDrive-synced). Open this folder in VS Code going forward.
•	GitHub repo exists at https://github.com/AllyTechEngineering/allytechllc — intended as version control, but not yet confirmed connected (git init/remote/push to that repo hasn't been verified as done in this session — check/do that next if not already).
Firebase setup — done
•	Firebase project created in the console (web app registered; App ID seen: 1:853531739924:web:fcf6cc9198ebaf44026401)
•	Firestore database created (Native mode, started in Production/locked-down rules mode — no custom security rules written yet)
•	flutterfire configure run successfully → generated lib/firebase_options.dart (web platform registered)
•	Packages added via flutter pub add firebase_core cloud_firestore
•	lib/main.dart updated: main() made async, calls WidgetsFlutterBinding.ensureInitialized() then await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform) before runApp()
•	Confirmed working: flutter build web succeeds, and serving that build locally (npx serve build\web) loads correctly in Chrome with no console errors — Firebase initialization is confirmed working end-to-end.
Known unresolved bug — workaround in place
•	flutter run in debug mode (both -d chrome and -d web-server) fails every time with: Flutter failed to delete a directory at "build\flutter_assets"...
•	Confirmed machine-wide (happens on a brand-new test Flutter project too, not just this one) and specific to debug/hot-reload mode only — release mode and plain flutter build web are unaffected.
•	Ruled out: OneDrive sync, stale processes, machine restart, Windows Defender folder exclusions (added for project folder, C:\flutter, and Pub Cache), Flutter SDK being outdated (upgraded, bug persists).
•	Suspected but unconfirmed: possibly a corporate-managed security agent beyond Windows Defender (not yet investigated — user paused this thread here).
•	Current workflow instead of hot reload: run flutter build web then npx serve build\web, open the printed localhost URL manually in Chrome. VS Code's Run/Debug panel has 3 configs (debug/profile/release) — use release mode config (or the terminal commands) and avoid the debug mode config for now.
Not yet done
•	Confirm/set up git connection between C:\Developer\allytechllc and github.com/AllyTechEngineering/allytechllc
•	Add a Firestore read/write test in the app to verify the database connection end-to-end (was about to do this when the session paused)
•	Write actual Firestore security rules (still default production/locked-down)
•	Design/build actual landing page content (portfolio/projects showcase, contact info) — still on default Flutter counter-app boilerplate
•	firebase init hosting + firebase deploy to Firebase Hosting
•	Connect custom domain allytechllc.com (registered on GoDaddy) to Firebase Hosting via GoDaddy DNS records — user has used GoDaddy DNS before but wanted a refresher

## Firebase Hosting Setup Chat

AllyTech LLC Website — Firebase/Firestore Setup Status
Project: allytechllc.com — Flutter PWA on Firebase Hosting/Firestore
Goal: Replace the GoDaddy-parked allytechllc.com domain with a Flutter PWA landing site showcasing commercial project work, to attract freelance clients/job opportunities.
Environment
•	Windows 11, VS Code, PowerShell
•	Flutter SDK 3.47.4 (stable channel), installed at C:\flutter
•	Node.js, npm, Firebase CLI (firebase-tools), and FlutterFire CLI (flutterfire_cli) all installed
•	Project location: C:\Developer\allytechllc (moved off OneDrive to avoid file-lock build errors)
Version control
•	Git confirmed connected: C:\Developer\allytechllc remote points to AllyTechEngineering/allytechllc on GitHub
Firebase project setup
•	Firebase project created: allytechllc-website
•	Web app registered (App ID: 1:853531739924:web:fcf6cc9198ebaf44026401)
•	flutterfire configure run successfully → generated lib/firebase_options.dart
•	Packages added: firebase_core, cloud_firestore
•	lib/main.dart updated: main() is async, calls WidgetsFlutterBinding.ensureInitialized() then await Firebase.initializeApp(...) before runApp()
Firestore
•	Database created (Native mode, started in production/locked-down rules)
•	Temporary open rule added for testing: allow read, write: if true scoped to the test collection only (everything else stays locked down)
•	Write/read round-trip test built into the app (button that writes a doc to test collection, then reads it back and displays it)
•	Confirmed working end-to-end — both on localhost and on the live deployed site
•	Still to do: write real, permanent security rules once actual data needs are known (currently still wide open for the test collection — should be locked down or removed before this goes fully public-facing with real content)
Known unresolved bug (workaround in place)
•	flutter run in debug mode (both -d chrome and -d web-server) fails every time on this machine with a Windows file-lock error deleting build\flutter_assets
•	Confirmed machine-wide (reproduces on a brand-new test project too), survives AV exclusions, SDK upgrade, and a reboot — root cause not identified, possibly a corporate-managed security agent
•	Standing workflow instead of hot reload: flutter build web then npx serve build\web, open the printed localhost URL manually. Avoid VS Code's "debug mode" launch config; use "release mode" or the terminal commands.
Hosting — deployed and live
•	firebase init hosting completed: public directory build/web, configured as single-page app (rewrites to /index.html), no GitHub auto-deploy set up (manual deploys for now)
•	firebase deploy --only hosting completed successfully
•	Live at: https://allytechllc-website.web.app
Custom domain — in progress
•	Custom domain allytechllc.com added in Firebase Console (Hosting → Custom domains)
•	Important: this domain has active Microsoft 365 email service — MX record to outlook.com, autodiscover/lyncdiscover CNAMEs, SPF TXT record, and a NETORGFT... verification TXT record. None of these were touched.
•	GoDaddy DNS changes made: 
o	Edited existing A record at @ from "Parked" to 199.36.158.100 (Firebase Hosting IP)
o	Added new TXT record at @: hosting-site=allytechllc-website
•	Existing CNAME record for www → allytechllc.com was already in place (should make www.allytechllc.com resolve correctly once the root domain is live)
•	Status: waiting on DNS propagation and Firebase's automatic SSL certificate issuance (checked via Firebase Console → Hosting → custom domain entry)
Not yet done
•	Confirm DNS propagation + SSL cert issued for allytechllc.com (custom domain "Connected" status in Firebase Console)
•	Write real Firestore security rules (currently just the temporary open test rule)
•	Design and build actual landing page content — still running the Firestore Connectivity Test placeholder page, not real site content (portfolio/projects showcase, contact info, etc.)

## Designing the site UI

# AllyTech LLC — Flutter PWA Website: Session Summary

## Project Status
- **Stack:** Flutter PWA + Firebase Hosting + Firestore
- **Live site:** https://allytechllc-website.web.app
- **Custom domain:** allytechllc.com — connected and confirmed successful in Firebase Hosting
- **Repo:** github.com/AllyTechEngineering/allytechllc

## Packages Decided
- `provider` — state management (per arch.md)
- `go_router` — routing (URL-based, PWA-appropriate over plain Navigator or auto_route)
- `url_launcher` — outbound links/email (stable on v6.x, no pending breaking changes)
- `google_fonts` — already in use in `custom_app_theme.dart`
- Explicitly skipped: `cached_network_image` (local assets only for now)

## Utility Widgets Built
| File | Path | Purpose |
|---|---|---|
| `custom_app_bar.dart` | `lib/widgets/` | Shared AppBar, avoids per-screen duplication |
| `adaptive_navigation.dart` | `lib/widgets/` | Drawer (mobile) / NavigationRail (≥600px), driven by `MediaQuery` width per Material 3 guidance |
| `adaptive_scaffold.dart` | `lib/widgets/` | Composes CustomAppBar + AdaptiveNavigation + body into one reusable shell |
| `constants.dart` | `lib/utils/` | Cleaned up — removed leftover PWM/sensor/Consul-app constants; kept only `kAppTitle` and `kIconThemeIconSize` |

## Theme Fixes (to apply manually in `custom_app_theme.dart`)
1. **Add `navigationRailTheme`** — new block using existing 4-color palette (primary=selected, secondary=unselected, tertiary=indicator). Snippet provided.
2. **Delete dead `bottomNavigationBarTheme`** — commented-out block, no longer used since Drawer+Rail was chosen over BottomNavigationBar+Rail.
3. **Fix `primaryContainer`** — was hardcoded `Color(0xFFF4ECF8)` ("light pink"), off the documented sea palette. Changed to `appColorScheme.tertiary`.

## Reviewed Files (from lib/utils/)
- `custom_app_theme.dart` — solid, Material 3, no leftover-app contamination (aside from the two fixes above)
- `custom_decorations.dart` — clean, minor inconsistency in gradient `begin`/`end` flexibility, noted but not fixed
- `contants.dart` → renamed to `constants.dart`, cleaned as above

## Established Build Sequence (per your direction)
1. ~~Packages~~ ✅
2. ~~Utility widgets~~ ✅
3. **Generic screens** ← next (Services, Projects, About, Privacy — Home already exists)
4. Routing (wire `go_router` + `onDestinationSelected` callbacks)

## Environment Notes
- Debugging: `flutter run -d windows` works around the persistent Chrome/web-server debug-mode file-lock bug
- Build/deploy: `flutter build web` then `firebase deploy --only hosting`
- Firestore configured for both `web` and `windows` via `flutterfire configure`

## Outstanding / Unresolved
- **GitHub → Claude sync:** Not working in this chat across three different UI paths tried (Project-level "Add content from GitHub," chat-level "Add repository," Settings→Connectors). Direct file upload to chat is the only confirmed-reliable method for getting me current repo content.
- Theme fixes above are written out but not yet applied by you to the actual file.

ChatGPT Chat 1
## Windows Impeller Issue

Flutter Windows rendering currently encounters repeated EGL context-loss errors while resizing the application window with Impeller enabled:

```text
EGL Error: Context Lost (12302)
Could not make the context current to acquire the frame.