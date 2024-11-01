import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:telware_cross_platform/core/models/user_model.dart';
import 'package:telware_cross_platform/core/routes/routes.dart';
import 'package:telware_cross_platform/core/theme/dimensions.dart';
import 'package:telware_cross_platform/core/theme/palette.dart';
import 'package:telware_cross_platform/features/auth/view_model/auth_view_model.dart';
import 'package:telware_cross_platform/features/user/repository/user_local_repository.dart';
import 'package:telware_cross_platform/features/user/view/widget/profile_header_widget.dart';
import 'package:telware_cross_platform/features/user/view/widget/settings_option_widget.dart';
import 'package:telware_cross_platform/features/user/view/widget/settings_section.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  static const String route = '/settings';

  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreen();
}

class _SettingsScreen extends ConsumerState<SettingsScreen> {
  late UserModel _user;
  late List<Map<String, dynamic>> profileSections = [
    {},
    const {
      "title": "Settings",
      "options": [
        {
          "icon": Icons.chat_bubble_outline,
          "text": 'Chat Settings',
          "routes": 'locked'
        },
        {
          "key": "privacy-option",
          "icon": Icons.lock_outline_rounded,
          "text": 'Privacy and Security',
          "routes": '/privacy'
        },
        {
          "icon": Icons.notifications_none,
          "text": 'Notifications and Sounds',
          "routes": 'locked'
        },
        {
          "icon": Icons.pie_chart_outline,
          "text": 'Data and Storage',
          "routes": 'locked'
        },
        {
          "icon": Icons.battery_saver_outlined,
          "text": 'Power Saving',
          "routes": 'locked'
        },
        {
          "icon": Icons.folder_outlined,
          "text": 'Chat Folders',
          "routes": 'locked'
        },
        {"icon": Icons.devices, "text": 'Devices', "routes": '/devices'},
        {
          "icon": Icons.language_rounded,
          "text": 'Language',
          "trailing": 'English',
          "routes": 'locked'
        },
      ]
    },
    const {
      "options": [
        {
          "icon": Icons.star_border_purple500_rounded,
          "text": 'TelWare Premium',
          "routes": "locked",
        },
        {
          "icon": Icons.star_border_rounded,
          "text": 'My Stars',
          "routes": "locked"
        },
        {
          "icon": Icons.storefront,
          "text": 'TelWare Business',
          "routes": "locked"
        },
        {
          "icon": Icons.card_giftcard,
          "text": 'Send a Gift',
          "routes": "locked"
        },
      ]
    },
    const {
      "title": "Help",
      "options": [
        {"icon": Icons.chat, "text": 'Ask a Question', "routes": "locked"},
        {
          "icon": Icons.question_mark,
          "text": 'TelWare FAQ',
          "routes": "locked"
        },
        {
          "icon": Icons.verified_user_outlined,
          "text": 'Privacy Policy',
          "routes": "locked"
        },
      ],
      "trailing": "TalWare for Android v11.2.0 (5299) store bundled arm64-v8a"
    }
  ];

  void _initializeProfileSections() {
    profileSections[0] =
    {
      "title": "Account",
      "options": [
        {
          "key": "change-number-option",
          "text": _user.phone,
          "subtext": "Tap to change phone number",
          "routes": "/change-number"
        },
        {
          "text": (_user.phone != "" ? "@${_user.username}" : "None"),
          "subtext": "Username"
        },
        {
          "key": "bio-option",
          "text": _user.bio != "" ? _user.bio : "Bio",
          "subtext":
          _user.bio != "" ? "Bio" : "Add a few words about yourself",
          "routes": "/bio"
        }
      ]
    };
  }

  @override
  void initState() {
    super.initState();
    _user = ref.read(userLocalRepositoryProvider).getUser()!;
    _initializeProfileSections();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newUser = ref.read(userLocalRepositoryProvider).getUser();
    if (newUser != null && newUser != _user) {
      setState(() {
        _user = newUser;
        _initializeProfileSections(); // Re-initialize sections
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final updatedUser = ref.watch(userLocalRepositoryProvider).getUser();
    if (updatedUser != null && updatedUser != _user) {
      _user = updatedUser;
      _initializeProfileSections(); // Re-initialize sections
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 145.0,
            toolbarHeight: 80,
            floating: false,
            pinned: true,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.pop()),
            actions: [
              const Icon(Icons.search),
              const SizedBox(width: 16),
              IconButton(onPressed: () {
                ref.read(authViewModelProvider.notifier).logOut();
                context.go(Routes.logIn);
              }, icon: const Icon(Icons.more_vert)),
            ],
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                double factor = _calculateFactor(constraints);
                return FlexibleSpaceBar(
                  title: ProfileHeader(fullName: _user.screenName, factor: factor),
                  centerTitle: true,
                  background: Container(
                    alignment: Alignment.topLeft,
                    color: Palette.trinary,
                    padding: EdgeInsets.zero,
                  ),
                );
              },
            ),
          ),
          const SliverToBoxAdapter(
              child: Column(
            children: [
              SettingsSection(
                settingsOptions: [],
                actions: [
                  SettingsOptionWidget(
                    key: ValueKey("set-profile-photo-option"),
                    icon: Icons.camera_alt_outlined,
                    iconColor: Palette.primary,
                    text: "Set Profile Photo",
                    color: Palette.primary,
                    showDivider: false,
                  )
                ],
              ),
            ],
          )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final section = profileSections[index];
                final title = section["title"] ?? "";
                final options = section["options"];
                final trailing = section["trailing"] ?? "";
                return Column(
                  children: [
                    const SizedBox(height: Dimensions.sectionGaps),
                    SettingsSection(
                      title: title,
                      settingsOptions: options,
                      trailing: trailing,
                    ),
                  ],
                );
              },
              childCount: profileSections.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: Dimensions.sectionGaps),
          ),
        ],
      ),
    );
  }

  double _calculateFactor(BoxConstraints constraints) {
    double maxExtent = 130.0;
    double scrollOffset = constraints.maxHeight - kToolbarHeight;
    double factor =
        scrollOffset > 0 ? (maxExtent - scrollOffset) / maxExtent * 90.0 : 60.0;
    return factor.clamp(0, 90.0);
  }
}
