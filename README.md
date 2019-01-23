# ACM Certificate Module

[![Build Status](https://travis-ci.com/telia-oss/terraform-aws-acm-certificate.svg?branch=master)](https://travis-ci.com/telia-oss/terraform-aws-acm-certificate)

Use this module for creating and validating an ACM certificate. Bear in mind  that the validation does not represent a real-world 
entity in AWS, therefore changing or deleting it on its own has no immediate effect.

## Examples

* [Simple Example](examples/default/main.tf)

### Notes

For use in an automated pipeline consider setting the wait_for_validation variable to false.  If this is not set this module 
will cause terraform to wait until validation is complete or error after a 45 minute timeout.

## Usage and gotchas
Due to the fact that both the wildcard certificate for a domain/subdomain (e.g *.test.exmple.com) and a site certificate 
(e.g test.example.com) requests use the same DNS valididation record it is important to request both at the same time if 
you need both. In this case set the optional `create_wildcard` parameter to `"true"`

Do not request a certificate for the site `"*"` and select create_wildcard = `"true"` in the same request
### Wildcard at the top of your domain/subdomain
To serve a site at the top of your domain  (e.g. https://example.com) you will need to request a certificate for the site 
`"*"` in the hosted zone. You may also want to read here for how to set the DNS record -  
https://aws.amazon.com/premiumsupport/knowledge-center/route-53-create-alias-records/



## Authors

Currently maintained by [these contributors](../../graphs/contributors).

## License

MIT License. See [LICENSE](LICENSE) for full details.
