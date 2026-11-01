import 'package:flutter/material.dart';
import 'package:nike/data/comment.dart';

class CommentItem extends StatelessWidget {
  final CommentEntity data;
  const CommentItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.fromLTRB(9, 0, 8, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    data.title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data.email,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Text(
                data.date,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 8,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(data.content, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
