import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:techblog/component/my_componnent.dart';
import 'package:techblog/constant/my_strings.dart';
import 'package:techblog/controller/article/mange_article_controller.dart';

class ArticleContentEditor extends StatelessWidget {
  ArticleContentEditor({super.key});
  final HtmlEditorController controller = HtmlEditorController();
  var manageArticleController = Get.put(MangeArticleController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.clearFocus();
      },
      child: Scaffold(
        appBar: appBar("نوشتن یا ویرایش"),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: MyStrings.hintArticleContentEditor,
                  shouldEnsureVisible: true,
                  initialText:
                      manageArticleController.articleInfoModel.value.content!,
                ),
                callbacks: Callbacks(
                  onChangeContent: (p0) {
                    manageArticleController.articleInfoModel.update((val) {
                      val?.content = p0;
                    });
                    debugPrint(
                        manageArticleController.articleInfoModel.value.content);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
