# terraform-openstack-images

This module allows you to bootstrap an OpenStack cloud by adding images to some
of the most common Linux distributions from their official release sites.  You
can use this to build a collection of the most recent and popular images into
your OpenStack cloud.

It is also the same tooling which is used to deploy images for the VEXXHOST 
[Public Cloud] and [Private Cloud] offering.  Therefore, if you want to add an
image to our public catalog, you can submit a pull request to our repository
and once it is approved and merged, the image should appear in our clouds.

## Usage

Basic usage of this module is as follows:

```hcl
module "openstack-images" {
  source  = "vexxhost/images/openstack"
  version = "~> 1.0"

  region        = "yul1"
  architectures = ["x86_64", "aarch64"]
}
```

The region corresponds to the name of the region that the images should be
uploaded to.  The architectures will determine which images to upload to the
cloud. At the moment, only handling `x86_64` and `aarch64` are the supported
and tested options.

## Contributing

Pull requests are welcome!  We usually vet the images to come from reliable
sources and ensure that the import URLs are stable so that Terraform can cleanly
run this at anytime.

[Public Cloud]: https://vexxhost.com/public-cloud/
[Private Cloud]: https://vexxhost.com/private-cloud/