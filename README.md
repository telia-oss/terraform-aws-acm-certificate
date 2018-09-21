## ACM Certificate Module

[![Build Status](https://travis-ci.com/telia-oss/terraform-aws-acm-certificate.svg?branch=master)](https://travis-ci.com/telia-oss/terraform-aws-acm-certificate)

Use this module for creating and validating an ACM certificate. Bear in mind 
that the validation does not represent a real-world entity in AWS, therefore 
changing or deleting it on its own has no immediate effect.

##### Notes:

For use in an automated pipeline consider setting the wait_for_validation variable to false.  If this is not set this module will cause terraform to wait until validation is complete or error after a 45 minute timeout.