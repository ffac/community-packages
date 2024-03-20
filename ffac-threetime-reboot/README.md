threetime reboot
=============

This script is meant to restart devices from target mediatek-filogic three
times a day. This is meant to counteract instabilities in the new target.

Create a file `modules` with the following content in your `./gluon/site/`
directory and add these lines:

```
GLUON_SITE_FEEDS="community"
PACKAGES_EULENFUNK_REPO=https://github.com/freifunk-gluon/community-packages.git
PACKAGES_EULENFUNK_COMMIT=*/missing/*
PACKAGES_EULENFUNK_BRANCH=master
```

Now you can add the package `ffac-threetime-reboot` to your site.mk
(`*/missing/*` has to be replaced by the github-commit-ID of the version you
want to use, you have to pick it manually.)

I want to thank Eulenfunk developers for their weeklyreboot package.
This package is based on `ffac-weeklyreboot`
