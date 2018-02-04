#Ruby Checkout System

A simple ruby checkout system with flexible promotional rules. 
What are flexible promo rules I hear you say? 
It simply means the json file `promo_rules.json` is responsible for dictating the available promotions for the checkout system


## Specification

```
Our marketing team want to offer promotions as an incentive for our customers to purchase these items.
If you spend over £60, then you get 10% off of your purchase. If you buy 2 or more very cheap chairs
then the price drops to £8.50.
Our check-out can scan items in any order, and because our promotions will change, it needs to be
flexible regarding our promotional rules.
The interface to our checkout looks like this (shown in Ruby):
co = Checkout.new(promotional_rules)
co.scan(item)
co.scan(item)
price = co.total
```


## How to get 