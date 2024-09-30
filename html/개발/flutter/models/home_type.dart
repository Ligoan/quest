import 'package:ai_assistant/screens/features/image_creator_feature.dart';
import 'package:ai_assistant/screens/features/translator_feature.dart';
import '../screens/features/chatbot_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/global.dart';

enum HomeType {
  aiChatBot,
  aiImageCreator,
  aiTranslator,
}

extension MyHomeType on HomeType {
  // title
  String get title => switch (this) {
        HomeType.aiChatBot => 'AI ChatBot',
        HomeType.aiImageCreator => 'AI Image Creator',
        HomeType.aiTranslator => 'Language Translator',
      };

  // lottie
  String get lottie => switch (this) {
        HomeType.aiChatBot => 'chat_bot.json',
        HomeType.aiImageCreator => 'ai_play.json',
        HomeType.aiTranslator => 'translating.json',
      };

  // for allignment
  bool get leftAlign => switch (this) {
        HomeType.aiChatBot => true,
        HomeType.aiImageCreator => false,
        HomeType.aiTranslator => true,
      };

  // for padding
  EdgeInsets get padding => switch (this) {
        HomeType.aiChatBot => EdgeInsets.zero,
        HomeType.aiImageCreator => EdgeInsets.zero,
        HomeType.aiTranslator => const EdgeInsets.all(20),
      };

  // for setting width
  double get width => switch (this) {
        HomeType.aiChatBot => mq.width * 0.5,
        HomeType.aiImageCreator => mq.width * 0.35,
        HomeType.aiTranslator => mq.width * 0.35,
      };

  // for navigation
  VoidCallback get onTap => switch (this) {
        HomeType.aiChatBot => () => Get.to(
              () => const ChatBotFeature(),
            ),
        HomeType.aiImageCreator => () => Get.to(
              () => const ImageCreatorFeature(),
            ),
        HomeType.aiTranslator => () => Get.to(
              () => const TranslatorFeature(),
            ),
      };
}
