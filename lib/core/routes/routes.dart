import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:telware_cross_platform/core/models/chat_model.dart';
import 'package:telware_cross_platform/core/models/message_model.dart';
import 'package:telware_cross_platform/core/models/user_model.dart';

import 'package:telware_cross_platform/core/view/screen/splash_screen.dart';
import 'package:telware_cross_platform/features/auth/view/screens/change_number_form_screen.dart';
import 'package:telware_cross_platform/features/auth/view/screens/log_in_screen.dart';
import 'package:telware_cross_platform/features/auth/view/screens/sign_up_screen.dart';
import 'package:telware_cross_platform/features/auth/view/screens/social_auth_loading_screen.dart';
import 'package:telware_cross_platform/features/auth/view/screens/verification_screen.dart';
import 'package:telware_cross_platform/features/auth/view_model/auth_view_model.dart';
import 'package:telware_cross_platform/features/chat/view/screens/call_screen.dart';
import 'package:telware_cross_platform/features/chat/view/screens/caption_screen.dart';
import 'package:telware_cross_platform/features/chat/view/screens/chat_info_screen.dart';
import 'package:telware_cross_platform/features/chat/view/screens/chat_screen.dart';
import 'package:telware_cross_platform/features/chat/view/screens/create_chat_screen.dart';
import 'package:telware_cross_platform/features/chat/view/screens/thread_screen.dart';
import 'package:telware_cross_platform/features/groups/view/screens/channel_setting_screen.dart';
import 'package:telware_cross_platform/features/groups/view/screens/members_screen.dart';
import 'package:telware_cross_platform/features/groups/view/screens/add_members_screen.dart';
import 'package:telware_cross_platform/features/groups/view/screens/create_group_screen.dart';
import 'package:telware_cross_platform/features/groups/view/screens/group_creation_details.dart';
import 'package:telware_cross_platform/features/groups/view/screens/select_channel_members.dart';
import 'package:telware_cross_platform/features/home/view/screens/home_screen.dart';
import 'package:telware_cross_platform/features/home/view/screens/inbox_screen.dart';
import 'package:telware_cross_platform/features/stories/view/screens/add_my_image_screen.dart';
import 'package:telware_cross_platform/features/stories/view/screens/show_taken_image_screen.dart';
import 'package:telware_cross_platform/features/stories/view/screens/story_screen.dart';
import 'package:telware_cross_platform/features/user/view/screens/block_user.dart';
import 'package:telware_cross_platform/features/user/view/screens/blocked_users.dart';
import 'package:telware_cross_platform/features/user/view/screens/change_email_screen.dart';
import 'package:telware_cross_platform/features/user/view/screens/change_number_screen.dart';
import 'package:telware_cross_platform/features/user/view/screens/change_username_screen.dart';
import 'package:telware_cross_platform/features/user/view/screens/data_and_storage_screen.dart';
import 'package:telware_cross_platform/features/user/view/screens/invites_permissions_screen.dart';
import 'package:telware_cross_platform/features/user/view/screens/last_seen_privacy_screen.dart';
import 'package:telware_cross_platform/features/user/view/screens/phone_privacy_screen.dart';
import 'package:telware_cross_platform/features/user/view/screens/privacy_and_security_screen.dart';
import 'package:telware_cross_platform/features/user/view/screens/profile_info_screen.dart';
import 'package:telware_cross_platform/features/user/view/screens/profile_photo_privacy_screen.dart';
import 'package:telware_cross_platform/features/user/view/screens/self_destruct_screen.dart';
import 'package:telware_cross_platform/features/user/view/screens/settings_screen.dart';
import 'package:telware_cross_platform/features/user/view/screens/user_profile_screen.dart';
import 'package:telware_cross_platform/features/user/view/screens/wifi_media_screen.dart';

import '../../features/chat/view/screens/pinned_messages_screen.dart';
import '../../features/groups/view/screens/create_channel_screen.dart';
import '../../features/groups/view/screens/edit_group.dart';
import '../../features/stories/view/screens/crop_image_screen.dart';
import '../../features/user/view/screens/devices_screen.dart';

class Routes {
  static const String home = HomeScreen.route;
  static const String splash = SplashScreen.route;
  static const String logIn = LogInScreen.route;
  static const String signUp = SignUpScreen.route;
  static const String verification = VerificationScreen.route;
  static const String socialAuthLoading = SocialAuthLoadingScreen.route;
  static const String inboxScreen = InboxScreen.route;
  static const String addMyStory = AddMyImageScreen.route;
  static const String createChannel = CreateChannelScreen.route;
  static const String showTakenStory = ShowTakenImageScreen.route;
  static const String storyScreen = StoryScreen.route;
  static const String devicesScreen = DevicesScreen.route;
  static const String settings = SettingsScreen.route;
  static const String changeNumber = ChangeNumberScreen.route;
  static const String changeNumberForm = ChangeNumberFormScreen.route;
  static const String changeUsername = ChangeUsernameScreen.route;
  static const String profileInfo = ProfileInfoScreen.route;
  static const String blockUser = BlockUserScreen.route;
  static const String blockedUser = BlockedUsersScreen.route;
  static const String userProfile = UserProfileScreen.route;
  static const String privacySettings = PrivacySettingsScreen.route;
  static const String phonePrivacySettings = PhonePrivacyScreen.route;
  static const String lastSeenPrivacySettings = LastSeenPrivacyScreen.route;
  static const String profilePhotoPrivacySettings =
      ProfilePhotoPrivacyScreen.route;
  static const String invitePermissionsSettings = InvitesPermissionScreen.route;
  static const String selfDestructTimer = SelfDestructScreen.route;
  static const String changeEmail = ChangeEmailScreen.route;
  static const String chatScreen = ChatScreen.route;
  static const String pinnedMessagesScreen = PinnedMessagesScreen.route;
  static const String cropImageScreen = CropImageScreen.route;
  static const String createChatScreen = CreateChatScreen.route;
  static const String chatInfoScreen = ChatInfoScreen.route;
  static const String createGroupScreen = CreateGroupScreen.route;
  static const String groupCreationDetails = GroupCreationDetails.route;
  static const String channelSettingsScreen = ChannelSettingScreen.route;
  static const String threadScreen = ThreadScreen.route;
  static const String selectChannelMembers = SelectChannelMembers.route;
  static const String callScreen = CallScreen.route;
  static const String editGroupScreen = EditGroup.route;
  static const String addMembersScreen = AddMembersScreen.route;
  static const String membersScreen = MembersScreen.route;
  static const String captionScreen = CaptionScreen.route;
  static const String dataAndStorageScreen = DataAndStorageScreen.route;
  static const String wifiMediaScreen = WifiMediaScreen.route;

  static GoRouter appRouter(WidgetRef ref) => GoRouter(
        initialLocation: Routes.splash,
        redirect: (context, state) {
          final isAuthorized =
              ref.read(authViewModelProvider.notifier).isAuthorized();
          // debugPrint('fullPath: ${state.fullPath}');
          if (!isAuthorized) {
            if ((state.fullPath?.startsWith(Routes.socialAuthLoading) ??
                false)) {
              return null;
            }
            if (state.fullPath != Routes.logIn &&
                state.fullPath != Routes.signUp &&
                state.fullPath != Routes.verification &&
                state.fullPath != Routes.splash) {
              return Routes.logIn;
            }
          }
          return null;
        },
        routes: [
          GoRoute(
            path: Routes.splash,
            builder: (context, state) => const SplashScreen(),
          ),
          GoRoute(
            path: Routes.logIn,
            builder: (context, state) => const LogInScreen(),
          ),
          GoRoute(
            path: Routes.signUp,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const SignUpScreen(),
              transitionsBuilder: _slideRightTransitionBuilder,
            ),
          ),
          GoRoute(
            path: Routes.verification,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: VerificationScreen(
                sendVerificationCode: (state.extra
                            as Map<String, dynamic>?)?['sendVerificationCode']
                        as bool? ??
                    false,
              ),
              transitionsBuilder: _slideRightTransitionBuilder,
            ),
          ),
          GoRoute(
            path: '${Routes.socialAuthLoading}/:secretSessionId',
            builder: (context, state) {
              final secretSessionId = state.pathParameters['secretSessionId']!;
              return SocialAuthLoadingScreen(secretSessionId: secretSessionId);
            },
          ),
          GoRoute(
            path: home,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const HomeScreen(),
              transitionsBuilder: _slideRightTransitionBuilder,
            ),
          ),
          GoRoute(
            path: Routes.inboxScreen,
            builder: (context, state) {
              final Function(ChatModel) onChatSelected =
                  state.extra as Function(ChatModel);
              return InboxScreen(onChatSelected: onChatSelected);
            },
          ),
          GoRoute(
            path: Routes.addMyStory,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const AddMyImageScreen(),
              transitionsBuilder: _slideRightTransitionBuilder,
            ),
          ),
          GoRoute(
            path: Routes.showTakenStory,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: ShowTakenImageScreen(image: state.extra as File),
              transitionsBuilder: _slideRightTransitionBuilder,
            ),
          ),
          GoRoute(
            path: Routes.storyScreen,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: StoryScreen(
                userId:
                    (state.extra as Map<String, dynamic>)['userId'] as String,
                showSeens:
                    (state.extra as Map<String, dynamic>)['showSeens'] as bool,
              ),
              transitionsBuilder: _slideRightTransitionBuilder,
            ),
          ),
          GoRoute(
            path: Routes.settings,
            builder: (context, state) => const SettingsScreen(),
          ),
          GoRoute(
            path: Routes.changeNumber,
            builder: (context, state) => const ChangeNumberScreen(),
          ),
          GoRoute(
            path: Routes.changeNumberForm,
            builder: (context, state) => const ChangeNumberFormScreen(),
          ),
          GoRoute(
            path: Routes.profileInfo,
            builder: (context, state) => const ProfileInfoScreen(),
          ),
          GoRoute(
            path: Routes.blockUser,
            builder: (context, state) => const BlockUserScreen(),
          ),
          GoRoute(
            path: Routes.blockedUser,
            builder: (context, state) => const BlockedUsersScreen(),
          ),
          GoRoute(
              path: Routes.userProfile,
              builder: (context, state) {
                final String? userId = state.extra as String?;
                return UserProfileScreen(userId: userId);
              }),
          GoRoute(
            path: Routes.privacySettings,
            builder: (context, state) => const PrivacySettingsScreen(),
          ),
          GoRoute(
            path: Routes.devicesScreen,
            builder: (context, state) => const DevicesScreen(),
          ),
          GoRoute(
            path: Routes.changeUsername,
            builder: (context, state) => const ChangeUsernameScreen(),
          ),
          GoRoute(
            path: Routes.phonePrivacySettings,
            builder: (context, state) => const PhonePrivacyScreen(),
          ),
          GoRoute(
            path: Routes.lastSeenPrivacySettings,
            builder: (context, state) => const LastSeenPrivacyScreen(),
          ),
          GoRoute(
            path: Routes.profilePhotoPrivacySettings,
            builder: (context, state) => const ProfilePhotoPrivacyScreen(),
          ),
          GoRoute(
            path: Routes.invitePermissionsSettings,
            builder: (context, state) => const InvitesPermissionScreen(),
          ),
          GoRoute(
            path: Routes.selfDestructTimer,
            builder: (context, state) => const SelfDestructScreen(),
          ),
          GoRoute(
            path: Routes.changeEmail,
            builder: (context, state) => const ChangeEmailScreen(),
          ),
          GoRoute(
              path: Routes.chatScreen,
              builder: (context, state) {
                print(state.extra.runtimeType);
                if (state.extra is List) {
                  final chat = (state.extra as List)[0] as ChatModel;
                  final forwardedMessages = (state.extra != null &&
                          (state.extra as List).length > 1 &&
                          (state.extra as List)[1] is List)
                      ? (state.extra as List)[1] as List<MessageModel>?
                      : null;
                  return ChatScreen(
                    chatModel: chat,
                    forwardedMessages: forwardedMessages,
                  );
                }
                final String chatId = state.extra as String;
                return ChatScreen(chatId: chatId);
              }),
          GoRoute(
              path: Routes.pinnedMessagesScreen,
              builder: (context, state) {
                if (state.extra is ChatModel) {
                  return PinnedMessagesScreen(
                      chatModel: state.extra as ChatModel);
                }
                final String chatId = state.extra as String;
                return PinnedMessagesScreen(chatId: chatId);
              }),
          GoRoute(
              path: Routes.cropImageScreen,
              builder: (context, state) {
                final String path = state.extra as String;
                return CropImageScreen(path: path);
              }),
          GoRoute(
            path: Routes.createChatScreen,
            builder: (context, state) {
              final forwardedMessages = state.extra as List<MessageModel>?;
              return CreateChatScreen(
                forwardedMessages: forwardedMessages,
              );
            },
          ),
          GoRoute(
            path: Routes.chatInfoScreen,
            builder: (context, state) {
              final ChatModel chatModel = state.extra as ChatModel;
              return ChatInfoScreen(chatModel: chatModel);
            },
          ),
          GoRoute(
            path: Routes.createGroupScreen,
            builder: (context, state) => const CreateGroupScreen(),
          ),
          GoRoute(
              path: Routes.groupCreationDetails,
              builder: (context, state) {
                final List<UserModel> members = state.extra as List<UserModel>;
                return GroupCreationDetails(members: members);
              }),
          GoRoute(
            path: Routes.callScreen,
            builder: (context, state) {
              final Map<String, dynamic>? extra =
                  state.extra as Map<String, dynamic>?;
              return CallScreen(
                  chatId: extra?['chatId'] as String?,
                  callee: extra?['user'] as UserModel?,
                  voiceCallId: extra?['voiceCallId'] as String?);
            },
          ),
          GoRoute(
            path: Routes.captionScreen,
            builder: (context, state) {
              final String filePath =
                  (state.extra as Map<String, dynamic>)['filePath'];
              final void Function(
                      {required String caption,
                      required String filePath}) sendCaptionMedia =
                  (state.extra as Map<String, dynamic>)['sendCaptionMedia'];
              return CaptionScreen(
                filePath: filePath,
                sendCaptionMedia: sendCaptionMedia,
              );
            },
          ),
          GoRoute(
            path: Routes.editGroupScreen,
            builder: (context, state) {
              final ChatModel chat = state.extra as ChatModel;
              return EditGroup(chatModel: chat);
            },
          ),
          GoRoute(
            path: Routes.addMembersScreen,
            builder: (context, state) {
              final String chat = state.extra as String;
              return AddMembersScreen(chatId: chat);
            },
          ),
          GoRoute(
            path: Routes.membersScreen,
            builder: (context, state) {
              final ChatModel chat = state.extra as ChatModel;
              return MembersScreen(
                chatModel: chat,
              );
            },
          ),
          GoRoute(
            path: Routes.createChannel,
            builder: (context, state) => CreateChannelScreen(),
          ),
          GoRoute(
            path: Routes.channelSettingsScreen,
            builder: (context, state) {
              final Map<String, dynamic> channelInfo =
                  state.extra as Map<String, dynamic>;
              return ChannelSettingScreen(
                channelName: channelInfo['channelName']!,
                channelDescription: channelInfo['channelDescription']!,
                channelImage: channelInfo['channelImage'],
              );
            },
          ),
          GoRoute(
            path: Routes.selectChannelMembers,
            builder: (context, state) {
              final Map<String, dynamic> channelInfo =
                  state.extra as Map<String, dynamic>;
              return SelectChannelMembers(
                channelName: channelInfo['name']!,
                privacy: channelInfo['privacy']!,
                channelDiscription: channelInfo['channelDiscription']!,
                // channelImage: null,
              );
            },
          ),
          GoRoute(
            path: Routes.threadScreen,
            builder: (context, state) {
              final Map<String, dynamic> thread =
                  state.extra as Map<String, dynamic>;
              return ThreadScreen(
                announcement: thread['announcement'],
                thread: thread['thread'],
                chatId: thread['chatId'],
                chatModel: thread['chatModel'],
              );
            },
          ),
          GoRoute(
            path: Routes.dataAndStorageScreen,
            builder: (context, state) => const DataAndStorageScreen(),
          ),
          GoRoute(
            path: Routes.wifiMediaScreen,
            builder: (context, state) => const WifiMediaScreen(),
          )
        ],
      );

  static Widget _slideRightTransitionBuilder(
      context, animation, secondaryAnimation, child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}
