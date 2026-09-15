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

