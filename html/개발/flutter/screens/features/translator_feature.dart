import 'package:ai_assistant/widgets/language_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/image_controller.dart';
import '../../controllers/translate_controller.dart';
import '../../helper/global.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_loading.dart';

class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  final _c = TranslateController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app abr
      appBar: AppBar(
        title: const Text(
          'Multi Language Translator',
        ),
      ),

      // body
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: mq.height * .02,
          bottom: mq.height * .1,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // from language
            children: [
              InkWell(
                onTap: () => Get.bottomSheet(
                  LanguageSheet(
                    c: _c,
                    s: _c.from,
                  ),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: mq.width * .4,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Obx(
                    () => Text(
                      _c.from.isEmpty ? 'Auto' : _c.from.value,
                    ),
                  ),
                ),
              ),

              IconButton(
                onPressed: _c.swapLanguage,
                icon: Obx(
                  () => Icon(
                    CupertinoIcons.repeat,
                    color: _c.to.isNotEmpty && _c.from.isNotEmpty
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
              ),

              // to language
              InkWell(
                onTap: () => Get.bottomSheet(
                  LanguageSheet(
                    c: _c,
                    s: _c.to,
                  ),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: mq.width * .4,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Obx(
                    () => Text(
                      _c.to.isEmpty ? 'To' : _c.to.value,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // text field
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mq.width * .04,
              vertical: mq.height * .035,
            ),
            child: TextFormField(
              controller: _c.textC,
              minLines: 5,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                hintText: 'Translate anything you want...',
                hintStyle: TextStyle(fontSize: 13.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),

          // result field
          Obx(() => _translateResult()),

          // for adding some space
          SizedBox(
            height: mq.height * 0.04,
          ),

          // translate btn
          CustomBtn(
            onTap: _c.translate,
            text: 'Translate',
          ),
        ],
      ),
    );
  }

  Widget _translateResult() => switch (_c.status.value) {
        Status.none => const SizedBox(),
        Status.complete => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mq.width * .04,
            ),
            child: TextFormField(
              controller: _c.resultC,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        Status.loading => const Align(child: CustomLoading()),
      };
}
