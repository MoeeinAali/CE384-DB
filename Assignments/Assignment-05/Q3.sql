use airline_tweets;
db.createCollection("tweets");

// A
db.tweets.find();

// B
db.tweets.find({"airline_sentiment":"negative"});

// C
db.tweets.find({
"airline":"Delta",
"airline_sentiment": "positive"
});


// D
db.tweets.aggregate([
    {
     $group: {
        _id: "$airline",
        positive_count: { $sum: { $cond: [{ $eq: ["$airline_sentiment", "positive"] }, 1, 0] } },
        negative_count: { $sum: { $cond: [{ $eq: ["$airline_sentiment", "negative"] }, 1, 0] } },
        neutral_count: { $sum: { $cond: [{ $eq: ["$airline_sentiment", "neutral"] }, 1, 0] } }
        }
    }
]);

// E
db.tweets.find({
    $or: [
        { "text": { $regex: /تأخیر/ } },
        { "text": { $regex: /لغو/ } }
    ]
});

// F
db.tweets.aggregate([
  {
    $group: {
      _id: "$airline",
      avg_response_time: { $avg: { $toDate: "$tweet_created" } }
    }
  }
]);
