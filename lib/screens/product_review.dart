import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductReview extends StatefulWidget {
  final String prodId, prodTitle, imageUrl;

  ProductReview(this.prodId, this.prodTitle, this.imageUrl);

  @override
  _ProductReviewState createState() => _ProductReviewState();
}

class _ProductReviewState extends State<ProductReview> {
  double rating = 1;
  String ratingText = 'Hated it';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hyper Store'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                child: CachedNetworkImage(
                        imageUrl: widget.imageUrl,
                        progressIndicatorBuilder: (context, url, downloadProgress) => 
                          Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                        fit: BoxFit.cover,
                      ),
              ),

              const SizedBox(height: 10),

              Text(widget.prodTitle),

              const SizedBox(height: 20),

              RatingBar.builder(
                initialRating: 1,
                minRating: 1,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                glowColor: Colors.grey,
                itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber), 
                updateOnDrag: true,
                onRatingUpdate: (rating) {
                  setState(() {
                    this.rating = rating;
                    if(rating == 1)
                      ratingText = 'Hated it';
                    else if(rating == 2)
                      ratingText = 'Disliked it';
                    else if(rating == 3)
                      ratingText = 'It\'s OK';
                    else if(rating == 4)
                      ratingText = 'Liked it';
                    else if(rating == 5)
                      ratingText = 'Loved it';
                  });
                }
              ),

              const SizedBox(height: 10),

              Text(ratingText + '!'),

              const SizedBox(height: 10),


            ],
          ),
        ),
      ),
    );
  }
}