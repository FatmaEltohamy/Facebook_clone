import 'package:facebook/data/models/export_all_models.dart';
import 'package:flutter/material.dart';
import 'responsive.dart';
import 'skeleton_container.dart';
class PostSkeletonContainer extends StatelessWidget {
  final Post post;
  const PostSkeletonContainer({Key? key,required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDeskTop = Responsive.isDesktop(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(horizontal: isDeskTop ? 5.0 : 0.0,),
        elevation: isDeskTop ? 1.0 : 0.0,
        shape: isDeskTop
            ? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )
            : null,
        child: Container(

          // margin: EdgeInsets.symmetric(vertical: 5.0),
          padding: EdgeInsets.symmetric(vertical: 10.0),
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        SkeletonContainer.square(width: 50,height: 50,),
                        SizedBox(width: 8.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SkeletonContainer.square(width: MediaQuery.of(context).size.width*0.2,height: 8,),
                            SizedBox(height: 8.0,),
                            SkeletonContainer.square(width: MediaQuery.of(context).size.width*0.1,height: 8,),
                          ],
                        ),
                      ],
                    ),
                    // _PostHeader(post: post),
                    const SizedBox(
                      height: 20,
                    ),
                    SkeletonContainer.square(width: MediaQuery.of(context).size.width*0.6,height: 8,),
                    const SizedBox(
                      height: 20,
                    ),
                    SkeletonContainer.square(width: MediaQuery.of(context).size.width*0.7,height: 8,),
                    const SizedBox(
                      height: 20,
                    ),
                    SkeletonContainer.square(width: MediaQuery.of(context).size.width*0.5,height: 8,),
                    const SizedBox(
                      height: 20,
                    ),
                    // Text('${post.caption}'),
                    post.imgUrl != ''
                        ? const SizedBox.shrink()
                        : const SizedBox(
                      height: 6.0,
                    )
                  ],
                ),
              ),
              post.imgUrl != ''
                  ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SkeletonContainer.square(width: 600,height: 200,),
              )
                  : const SizedBox.shrink(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
