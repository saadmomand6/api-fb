import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/Models/blog_models.dart';
import 'package:practice/controllers/blogs_controller.dart';

class BlogsView extends StatelessWidget {
  const BlogsView({super.key});

  @override
  Widget build(BuildContext context) {
    BlogController blogsController = Get.put(BlogController());
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('bLOGS'),
            ),
            body: Column(children: [
              Expanded(
                  child:
                      // FutureBuilder(
                      // future: blogsController.getblogs(),
                      // builder: (context,AsyncSnapshot<List<dynamic>> snapshot) {
                      // if (!snapshot.hasData) {
                      //   return pateintDetailsTileShimmer(
                      //             basecolor: Colors.grey.shade200,
                      //             highlightcolor: Colors.grey.shade100,
                      //             status: 1,
                      //             maincolor: const Color(0xffF7F7F7),
                      //             horizontalmargin: 20,verticalmargin: 5
                      //   );
                      // }
                      // else{
                      //   return
                      Obx(
                () => ListView.builder(
                    itemCount: blogsController.blist.length,
                    itemBuilder: (context, index) {
                      BlogsModel patList = blogsController.blist[index];
                      return ListTile(
                        leading: Text(patList.id.toString()),
                        title: Text(patList.author!.toString()),
                        trailing: InkWell(
                            onTap: () {
                              var data = {
                                "title": "Blog",
                                "content": "This is blog 2",
                                "author": "Saad"
                              };
                              blogsController.postblog(data, context);
                            },
                            child: const Icon(Icons.add)),
                      );
                    }),
              )
                  //   }
                  // }
                  // ),
                  //          ),
                  //   ],
                  // ),
                  ),
            ])));
  }
}
