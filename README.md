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


## Getting started

The promo rules can be found in the JSON file ```promo_rules.json```, in which the Marketing team can edit the rules.
The file must be in the following format. 

```
{
  "value_rules": [
    {
      "minimum_value": 60,
      "discount_decimal": 0.1
    }
  ],
  "volume_rules": {
    "001": {
      "minimum_volume_required": 2,
      "discounted_price": 8.50
    }
  }
}
```

### Value Rules

The `minimum_value` is the amount that a buyer must reach in order to have the relevant discount applied
The `discount_decimal` is the discount rate (in decimal) to be applied to eligible orders. 
 e.g `0.1` will be a 10% discount and so on.
 
 
 
## Using the Checkout

Once your console is all fired up, here's what's next:

```
2.4.1 :001 > require "json"
2.4.1 :002 > require_relative "lib/checkout"
2.4.1 :003 > promo_rules = File.read 'promo_rules.json'
2.4.1 :004 > checkout = Checkout.new promo_rules
2.4.1 :005 > checkout.scan "003"
2.4.1 :006 > checkout.scan "001"
2.4.1 :007 > checkout.scan "001"
2.4.1 :008 > checkout.total
 => 36.95
```