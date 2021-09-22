Welcome to another edition of Methods You Never Knew You Needed!  We here at SHLM Tech greatly appreciated all of the feedback we received following last week's post on the "merchants_that_only_sold_one_item_but_somehow_had_two_items_returned" method.  We can't believe how many of you wonderful readers reached out to let us know that this was the method you were missing in your lives.  

This week we are coming at you with two hot new methods for the multi-merchant sales platform.  The first one, "most_sold_item_for_merchant" allows for a merchant id to be used to search for a merchant's most sold item.  First it creates an array of the given merchant's items using the "find_all_by_merchant_id method.  It iterates through these items and creates an array of item ids.  It then finds the invoice items that are associated with these item ids and creates an array of the ones that were successful.  Next it uses these invoice items to create a hash called "total_quantity" with the item instances as keys and the number of units sold as their corresponding values.  These values are then put into an array and the method .max is used to find the item with the highest quantity.   

I'm sure you're wondering, "but what happens if there's a tie between multiple items??"  Not to worry, this method has you covered.  If a merchant has more than one item tied for first place, the method will output the item ids of the top selling items in one easy to read array.  

While our first method searches for a merchant's most sold item, our second one, "best_item_for_merchant," uses a merchant id to find a merchant's "best" item, or the one that has earned the most money.  Just like our first method of the week, it uses the "find_all_by_merchant_id" method to create an array of the merchant's items and then iterates through these items to create an array of item ids. It then finds the invoice items that are associated with these item ids and creates an array of the ones that were successful.  Similar to the first method, it uses these invoice items to create a hash called "total_revenue" with the item instances as keys and the number of units sold as their corresponding values.  However, instead of storing the values as an item's quantity, it multiplies the quantity by the price of the item.  These revenues are then stored in an array called "sorted_by_revenue" and the first item in the array is returned to the user.  

As you can see, this second method is structurally very similar to the first, but delivers a completely different result.  Both of these methods are incredibly useful for helping merchants and businesses determine which items are doing the best and, as a result, which items could use some help.  

If you've enjoyed what you read please show us some love by liking this post and leaving a comment.  Don't forget to follow us on Instagram and Twitter!  Our handle for both is @super_hot_tech.

We will be back next week with another method you never knew you needed!  