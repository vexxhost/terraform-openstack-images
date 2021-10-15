terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

locals {
  arch_map = {
    "x86_64": "amd64",
    "aarch64": "arm64",
  }
}

resource "openstack_images_image_v2" "centos-7-20200422" {
  for_each = toset(var.architectures)

  region           = var.region

  name             = "CentOS 7.8 (${each.value}) [2020-04-22]"
  visibility       = "public"
  image_source_url = "https://cloud.centos.org/centos/7/images/CentOS-7-${each.key}-GenericCloud-2003.qcow2"
  image_cache_path = "$HOME/.terraform/${var.region}-image-cache"
  container_format = "bare"
  disk_format      = "qcow2"

  properties = {
    architecture = each.value
  }
}

resource "openstack_images_image_v2" "centos-8-20200611" {
  for_each = toset(var.architectures)

  region           = var.region

  name             = "CentOS 8.2 (${each.value}) [2020-06-11]"
  visibility       = "public"
  image_source_url = "https://cloud.centos.org/centos/8/${each.value}/images/CentOS-8-GenericCloud-8.2.2004-20200611.2.${each.value}.qcow2"
  image_cache_path = "$HOME/.terraform/${var.region}-image-cache"
  container_format = "bare"
  disk_format      = "qcow2"

  properties = {
    architecture = each.value
  }
}

resource "openstack_images_image_v2" "debian-10-20201023" {
  for_each = toset(var.architectures)

  region           = var.region

  name             = "Debian 10.6.1 (${each.value}) [2020-10-23]"
  visibility       = "public"
  image_source_url = "https://cloudfront.debian.net/cdimage/openstack/10.6.1-20201023/debian-10.6.1-20201023-openstack-${local.arch_map[each.key]}.qcow2"
  image_cache_path = "$HOME/.terraform/${var.region}-image-cache"
  container_format = "bare"
  disk_format      = "qcow2"

  properties = {
    architecture = each.value
  }
}

resource "openstack_images_image_v2" "fedora-34-20210427" {
  for_each = toset(var.architectures)

  region           = var.region

  name             = "Fedora 34 (${each.value}) [2021-04-27]"
  visibility       = "public"
  image_source_url = "https://mirrors.kernel.org/fedora/releases/34/Cloud/${each.value}/images/Fedora-Cloud-Base-34-1.2.${each.value}.qcow2"
  image_cache_path = "$HOME/.terraform/${var.region}-image-cache"
  container_format = "bare"
  disk_format      = "qcow2"

  properties = {
    architecture = each.value
  }
}

resource "openstack_images_image_v2" "opensuse-leap-15-20191021" {
  # NOTE(mnaser): OpenSUSE only publishes 15.2 for x86_64
  for_each = toset([
    "x86_64"
  ])

  region           = var.region

  name             = "OpenSUSE Leap 15.2 (${each.value}) [2019-10-21]"
  visibility       = "public"
  image_source_url = "http://ftp.opensuse.org/repositories/Cloud:/Images:/Leap_15.2/images/openSUSE-Leap-15.2-OpenStack.${each.value}.qcow2"
  image_cache_path = "$HOME/.terraform/${var.region}-image-cache"
  container_format = "bare"
  disk_format      = "qcow2"

  properties = {
    architecture = each.value
  }
}

resource "openstack_images_image_v2" "ubuntu-bionic-20201031" {
  for_each = toset(var.architectures)

  region           = var.region

  name             = "Ubuntu 18.04.5 LTS (${each.value}) [2020-10-31]"
  visibility       = "public"
  image_source_url = "https://cloud-images.ubuntu.com/releases/bionic/release-20201031/ubuntu-18.04-server-cloudimg-${local.arch_map[each.key]}.img"
  image_cache_path = "$HOME/.terraform/${var.region}-image-cache"
  container_format = "bare"
  disk_format      = "qcow2"

  properties = {
    architecture = each.value
  }
}

resource "openstack_images_image_v2" "ubuntu-bionic-20210928" {
  for_each = toset(var.architectures)

  region           = var.region

  name             = "Ubuntu 18.04.6 LTS (${each.value}) [2021-09-28]"
  visibility       = "public"
  image_source_url = "https://cloud-images.ubuntu.com/releases/bionic/release-20210928/ubuntu-18.04-server-cloudimg-${local.arch_map[each.key]}.img"
  image_cache_path = "$HOME/.terraform/${var.region}-image-cache"
  container_format = "bare"
  disk_format      = "qcow2"

  properties = {
    architecture = each.value
  }
}

resource "openstack_images_image_v2" "ubuntu-focal-20201102" {
  for_each = toset(var.architectures)

  region           = var.region

  name             = "Ubuntu 20.04.1 LTS (${each.value}) [2020-11-02]"
  visibility       = "public"
  image_source_url = "https://cloud-images.ubuntu.com/releases/focal/release-20201102/ubuntu-20.04-server-cloudimg-${local.arch_map[each.key]}.img"
  image_cache_path = "$HOME/.terraform/${var.region}-image-cache"
  container_format = "bare"
  disk_format      = "qcow2"

  properties = {
    architecture = each.value
  }
}

resource "openstack_images_image_v2" "ubuntu-focal-20211004" {
  for_each = toset(var.architectures)

  region           = var.region

  name             = "Ubuntu 20.04.3 LTS (${each.value}) [2021-10-04]"
  visibility       = "public"
  image_source_url = "https://cloud-images.ubuntu.com/releases/focal/release-20211004/ubuntu-20.04-server-cloudimg-${local.arch_map[each.key]}.img"
  image_cache_path = "$HOME/.terraform/${var.region}-image-cache"
  container_format = "bare"
  disk_format      = "qcow2"

  properties = {
    architecture = each.value
  }
}
