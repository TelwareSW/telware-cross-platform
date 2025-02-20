import 'package:flutter/material.dart';
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';

class WidgetKeys {
  static const ValueKey<String> settingsOptionSuffix = ValueKey('-option');
  static const ValueKey<String> iconSuffix = ValueKey('-icon');
  static const ValueKey<String> settingsSectionSuffix = ValueKey('-section');
  static const ValueKey<String> titleSuffix = ValueKey('-title');
  static const ValueKey<String> trailingSuffix = ValueKey('-trailing');
  static const ValueKey<String> radioButtonSuffix = ValueKey('-radio-button');
  static const ValueKey<String> settingsRadioOptionSuffix =
      ValueKey('-radio-button-option');
  static const ValueKey<String> settingsToggleSwitchOptionSuffix =
      ValueKey('-switch-option');
  static const ValueKey<String> toggleSwitchButtonSuffix =
      ValueKey('-switch-button');
  static const ValueKey<String> userChatCopyableLink =
      ValueKey("user-chat-copyable-link");
  static const ValueKey<String> memberTilePrefix = ValueKey('member-tile-');

  WidgetKeys._();
}

//----- DONT USE THIS KEYS YOU CAN FIND THEM INSIDE THE SCREEN IT SELF ---------
class SignUpKeys {
  static final formKey = GlobalKey<FormState>(debugLabel: 'signup_form');
  static final emailKey =
      GlobalKey<FormFieldState>(debugLabel: 'signup_email_input');
  static final phoneKey =
      GlobalKey<FormFieldState>(debugLabel: 'signup_phone_input');
  static final passwordKey =
      GlobalKey<FormFieldState>(debugLabel: 'signup_password_input');
  static final confirmPasswordKey =
      GlobalKey<FormFieldState>(debugLabel: 'signup_confirm_password_input');
  static final alreadyHaveAccountKey =
      GlobalKey<State>(debugLabel: 'signup_already_have_account_button');
  static final signUpSubmitKey =
      GlobalKey<State>(debugLabel: 'signup_submit_button');
  static final onConfirmationKey =
      GlobalKey<State>(debugLabel: 'signup_on_confirmation_button');
  static final onCancellationKey =
      GlobalKey<State>(debugLabel: 'signup_on_cancellation_button');

  static final emailShakeKey =
      GlobalKey<ShakeWidgetState>(debugLabel: 'signup_email_shake');
  static final phoneShakeKey =
      GlobalKey<ShakeWidgetState>(debugLabel: 'signup_phone_shake');
  static final passwordShakeKey =
      GlobalKey<ShakeWidgetState>(debugLabel: 'signup_password_shake');
  static final confirmPasswordShakeKey =
      GlobalKey<ShakeWidgetState>(debugLabel: 'signup_confirm_password_shake');

  SignUpKeys._();
}

class ValidationKeys {
  static final verificationCodeKey =
      GlobalKey<State>(debugLabel: 'verificationCode_input');
  static final resendCodeKey =
      GlobalKey<State>(debugLabel: 'verification_resendCode_button');
  static final submitKey =
      GlobalKey<State>(debugLabel: 'verification_submit_button');
  static final shakeKey =
      GlobalKey<ShakeWidgetState>(debugLabel: 'verification_shake');

  ValidationKeys._();
}
//------------------------------------------------------------------------------

class ChangeEmailKeys {
  static final formKey = GlobalKey<FormState>(debugLabel: 'change_email_form');
  static final emailKey =
      GlobalKey<FormFieldState>(debugLabel: 'change_email_input');
  static final submitKey =
      GlobalKey<State>(debugLabel: 'change_email_submit_button');
  static final emailShakeKey =
      GlobalKey<ShakeWidgetState>(debugLabel: 'change_email_shake');

  ChangeEmailKeys._();
}

class ChatKeys {
  static const ValueKey<String> chatsListKey = ValueKey('chats-list');
  static String chatTilePrefixSubvalue =
      DateTime.now().millisecondsSinceEpoch.toString();

  static void resetChatTilePrefixSubvalue() =>
      chatTilePrefixSubvalue = DateTime.now().millisecondsSinceEpoch.toString();

  static const ValueKey<String> createChatButton =
      ValueKey('create-chat-button');
  static const ValueKey<String> chatSearchButton =
      ValueKey('chat-search-button');
  static const ValueKey<String> chatMuteButton = ValueKey('chat-mute-button');
  static const ValueKey<String> chatSearchInput = ValueKey('chat-search-input');
  static const ValueKey<String> chatSearchShowMode =
      ValueKey('chat-search-show-mode');
  static const ValueKey<String> chatSearchDatePicker =
      ValueKey('chat-search-date-picker');
  static const ValueKey<String> chatTilePrefix = ValueKey('chat-tile-');
  static const ValueKey<String> chatMessagePrefix = ValueKey('chat-message-');
  static const ValueKey<String> chatNamePostfix = ValueKey('-name');
  static const ValueKey<String> chatTileDisplayTextPostfix =
      ValueKey('-display-text');
  static const ValueKey<String> chatTileDisplayTimePostfix =
      ValueKey('-display-time');
  static const ValueKey<String> chatTileDisplayUnreadCountPostfix =
      ValueKey('-display-unread-count');
  static const ValueKey<String> chatTileMentionPostfix = ValueKey('-mention');
  static const ValueKey<String> chatTileMutePostfix = ValueKey('-mute');
  static const ValueKey<String> chatTileMessageStatusPostfix =
      ValueKey('-message');
  static const ValueKey<String> chatAvatarPostfix = ValueKey('-avatar');
  static const ValueKey<String> chatHeader = ValueKey('chat-header');

  ChatKeys._();
}

class MessageKeys {
  static const ValueKey<String> messagesContainer =
      ValueKey('messages-container');
  static const ValueKey<String> messageInput = ValueKey('message-input');
  static const ValueKey<String> messageSendButton =
      ValueKey('message-send-button');
  static const ValueKey<String> messageAttachmentButton =
      ValueKey('message-attachment-button');
  static const ValueKey<String> messageVoiceButton =
      ValueKey('message-voice-button');
  static const ValueKey<String> messagePrefix = ValueKey('message-');
  static const ValueKey<String> messageSenderPostfix = ValueKey('-sender');
  static const ValueKey<String> messageContentPostfix = ValueKey('-content');
  static const ValueKey<String> messageTimePostfix = ValueKey('-time');
  static const ValueKey<String> messageStatusPostfix = ValueKey('-status');
  static const ValueKey<String> messageReplyPostfix = ValueKey('-reply');
  static const ValueKey<String> messageForwardPostfix = ValueKey('-forward');
  static const ValueKey<String> messageCopyPostfix = ValueKey('-copy');
  static const ValueKey<String> messageDeletePostfix = ValueKey('-delete');

  MessageKeys._();
}

class CallKeys {
  static const ValueKey<String> acceptCallButton =
      ValueKey('accept-call-button');
  static const ValueKey<String> rejectCallButton =
      ValueKey('reject-call-button');
  static const ValueKey<String> endCallButton = ValueKey('end-call-button');
  static const ValueKey<String> toggleMuteButton =
      ValueKey('toggle-mute-button');
  static const ValueKey<String> toggleSpeakerButton =
      ValueKey('toggle-speaker-button');
  static const ValueKey<String> toggleVideoButton =
      ValueKey('toggle-video-button');
  static const ValueKey<String> minimizeCallButton =
      ValueKey('minimize-call-button');
  static const ValueKey<String> callOverlayBar = ValueKey('call-overlay-bar');
  static const ValueKey<String> callStatusText = ValueKey('call-status-text');
  static const ValueKey<String> startCallButton = ValueKey('start-call-button');
}

class Keys {
  // LogInScreen
  static final logInFormKey = GlobalKey<FormState>(debugLabel: 'login_form');
  static final logInEmailKey =
      GlobalKey<FormFieldState>(debugLabel: 'login_email_input');
  static final logInPasswordKey =
      GlobalKey<FormFieldState>(debugLabel: 'login_password_input');
  static final logInForgotPasswordKey =
      GlobalKey<State>(debugLabel: 'login_forgot_password_button');
  static final logInSignUpKey =
      GlobalKey<State>(debugLabel: 'login_signup_button');
  static final logInSubmitKey =
      GlobalKey<State>(debugLabel: 'login_submit_button');
  static final logInemailShakeKey =
      GlobalKey<ShakeWidgetState>(debugLabel: 'login_email_shake');
  static final logInpasswordShakeKey =
      GlobalKey<ShakeWidgetState>(debugLabel: 'login_password_shake');

  // ChangeNumberFormScreen
  static final changeNumberFormKey =
      GlobalKey<FormState>(debugLabel: 'change_number_form');
  static final changeNumberPhoneShakeKey =
      GlobalKey<ShakeWidgetState>(debugLabel: 'change_number_phone_shake');

  // SocialLogIn
  static const googleLogIn = Key('google_log_in');
  static const githubLogIn = Key('github_log_in');

  // ShowTakenStoryScreen
  static final signatureBoundaryKey =
      GlobalKey(debugLabel: 'signature_boundary');

  // ProfileInfoScreen
  static final profileInfoFirstNameShakeKey = GlobalKey<ShakeWidgetState>();
  static final profileInfoLastNameShakeKey = GlobalKey<ShakeWidgetState>();
  static const profileInfoFirstNameInput = ValueKey("first-name-input");
  static const profileInfoLastNameInput = ValueKey("last-name-input");
  static const profileInfoBioInput = ValueKey("bio-input");

  // SettingsScreen
  static const settingsSetProfilePhotoOptions =
      ValueKey("set-profile-photo-option");

  // CropImageScreen
  static const refreshImageCropScreen = ValueKey('refresh_key');
  static const zoomInImageCropScreen = ValueKey('zoom_in_key');
  static const zoomOutImageCropScreen = ValueKey('zoom_out_key');
  static const rotateLeftImageCropScreen = ValueKey('rotate_left_key');
  static const rotateRightImageCropScreen = ValueKey('rotate_right_key');
  static const popupMenuImageCropScreen = ValueKey('popup_menu_key');
  static const popupMenuItemImageCropScreen = ValueKey('popup_menu_item_');
  static const changeColorImageCropScreen = ValueKey('change_color_key');
  static const submitCropImageCropScreen = ValueKey('submit_crop_key');

  // Stories
  static const storyAvatarPrefix = ValueKey('story_avatar_');

  // General
  static const popupMenuButton = ValueKey('popup_menu_button');
  static const popupMenuItemPrefix = ValueKey('popup_menu_item_');

  Keys._();
}

class GlobalKeyCategoryManager {
  // Static map to store keys by category
  static final Map<String, List<GlobalKey>> _keyCategories = {};

  // Static map to store debug labels
  static final Map<GlobalKey, String> _keyDebugLabels = {};

  // Static method to add a key to a category
  static GlobalKey addKey(String category) {
    final key = GlobalKey();
    final debugLabel = '$category-${_getCategoryKeyCount(category)}';

    // Save the key and its debug label
    _keyCategories.putIfAbsent(category, () => []).add(key);
    _keyDebugLabels[key] = debugLabel;

    return key;
  }

  // Static method to get keys for a category
  static List<GlobalKey>? getKeys(String category) {
    return _keyCategories[category];
  }

  // Static method to get debug labels for a category
  static List<String>? getDebugLabels(String category) {
    return _keyCategories[category]
        ?.map((key) => _keyDebugLabels[key] ?? '')
        .toList();
  }

  // Static helper method to get the count of keys in a category
  static int _getCategoryKeyCount(String category) {
    return _keyCategories[category]?.length ?? 0;
  }

  // Static method to get the debug label of a specific key
  static String? getDebugLabel(GlobalKey key) {
    return _keyDebugLabels[key];
  }
}
