Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE6BDB2DE8
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Sep 2019 05:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfIODZs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 14 Sep 2019 23:25:48 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:18522 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfIODZs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 14 Sep 2019 23:25:48 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x8F3PPBu010343;
        Sun, 15 Sep 2019 12:25:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x8F3PPBu010343
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568517926;
        bh=r0HPqUsl/k/QNgPeV+d+68lVGYyK6zGtTTabSn++Q7g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=w+ve9FXpG3pLMPv3pPY4qjKR1vLy+RFpvuNPM7H8HaZMMbWwO9GriMLwqJ5MJEzEs
         Aq0lLBDDsAhOY8xy97AOELE1B0erptptHoCa0ohQEPrQ7qE0+53HiLM1A41aNt7mk5
         NbTYSmDUABW6/L+AzggeUsl60GrBjzqyCpLo2ydwN92GuV0PuqaGB+OG4vUypRnUBk
         LKRXNZISfFMFiz7crGOv5pFfGQL0ctvAP65ipBT8VglqWXBjpq/r0ostS0qsX7Bo89
         nIOkDCBVIMYZPSOKGbUHHUOvw2R9oaQnPbMRHPL1hzZ7ILKxroX+/xiMPYTUMkboDe
         M/WxfCHf9eu9A==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id m22so21137415vsl.9;
        Sat, 14 Sep 2019 20:25:26 -0700 (PDT)
X-Gm-Message-State: APjAAAUDyDuBGcI8m53ny66OGSL74bXOjNJ8ZpOIe61FvpA327OzttBP
        wlYPzFwtHhPzhf6+eGpdv6G2hvwJ27FOu2Gq/Nk=
X-Google-Smtp-Source: APXvYqzNLlXCRfub1bq1zQF7sPoEp/CjIHSGeWJHQx0wjhXiJGkjRi4iffZhm5JQ1SNhTWxuS8j7dOwNyQ6fwDbt7eA=
X-Received: by 2002:a67:1e87:: with SMTP id e129mr4551103vse.179.1568517925037;
 Sat, 14 Sep 2019 20:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190914112420.qift4wjk7llxg57x@decadent.org.uk>
In-Reply-To: <20190914112420.qift4wjk7llxg57x@decadent.org.uk>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sun, 15 Sep 2019 12:24:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNASCiu51GtqiSZ8kydmYfNCCUg06AtZR93Hfa6bKwYb4fg@mail.gmail.com>
Message-ID: <CAK7LNASCiu51GtqiSZ8kydmYfNCCUg06AtZR93Hfa6bKwYb4fg@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: kbuild: Add document about reproducible builds
To:     Ben Hutchings <ben@decadent.org.uk>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        ab@php.net
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 14, 2019 at 8:24 PM Ben Hutchings <ben@decadent.org.uk> wrote:
>
> In the Distribution Kernels track at Linux Plumbers Conference there
> was some discussion around the difficulty of making kernel builds
> reproducible.
>
> This is a solved problem, but the solutions don't appear to be
> documented in one place.  This document lists the issues I know about
> and the settings needed to ensure reproducibility.
>
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>


Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Thanks.

> ---
> v2:
> * Delete extra "the" in the first paragraph.
> * Rewrite paragraph about filenames to reflect that -fmacro-prefix-map
>   is used by default.
> * Rewrite paragraph about source packages to be clearer.
>
>  Documentation/kbuild/index.rst               |   1 +
>  Documentation/kbuild/reproducible-builds.rst | 122 +++++++++++++++++++
>  2 files changed, 123 insertions(+)
>  create mode 100644 Documentation/kbuild/reproducible-builds.rst
>
> diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.rst
> index e323a3f2cc81..0f144fad99a6 100644
> --- a/Documentation/kbuild/index.rst
> +++ b/Documentation/kbuild/index.rst
> @@ -18,6 +18,7 @@ Kernel Build System
>      headers_install
>
>      issues
> +    reproducible-builds
>
>  .. only::  subproject and html
>
> diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
> new file mode 100644
> index 000000000000..ab92e98c89c8
> --- /dev/null
> +++ b/Documentation/kbuild/reproducible-builds.rst
> @@ -0,0 +1,122 @@
> +===================
> +Reproducible builds
> +===================
> +
> +It is generally desirable that building the same source code with
> +the same set of tools is reproducible, i.e. the output is always
> +exactly the same.  This makes it possible to verify that the build
> +infrastructure for a binary distribution or embedded system has not
> +been subverted.  This can also make it easier to verify that a source
> +or tool change does not make any difference to the resulting binaries.
> +
> +The `Reproducible Builds project`_ has more information about this
> +general topic.  This document covers the various reasons why building
> +the kernel may be unreproducible, and how to avoid them.
> +
> +Timestamps
> +----------
> +
> +The kernel embeds a timestamp in two places:
> +
> +* The version string exposed by ``uname()`` and included in
> +  ``/proc/version``
> +
> +* File timestamps in the embedded initramfs
> +
> +By default the timestamp is the current time.  This must be overridden
> +using the `KBUILD_BUILD_TIMESTAMP`_ variable.  If you are building
> +from a git commit, you could use its commit date.
> +
> +The kernel does *not* use the ``__DATE__`` and ``__TIME__`` macros,
> +and enables warnings if they are used.  If you incorporate external
> +code that does use these, you must override the timestamp they
> +correspond to by setting the `SOURCE_DATE_EPOCH`_ environment
> +variable.
> +
> +User, host
> +----------
> +
> +The kernel embeds the building user and host names in
> +``/proc/version``.  These must be overridden using the
> +`KBUILD_BUILD_USER and KBUILD_BUILD_HOST`_ variables.  If you are
> +building from a git commit, you could use its committer address.
> +
> +Absolute filenames
> +------------------
> +
> +When the kernel is built out-of-tree, debug information may include
> +absolute filenames for the source files.  This must be overridden by
> +including the ``-fdebug-prefix-map`` option in the `KCFLAGS`_ variable.
> +
> +Depending on the compiler used, the ``__FILE__`` macro may also expand
> +to an absolute filename in an out-of-tree build.  Kbuild automatically
> +uses the ``-fmacro-prefix-map`` option to prevent this, if it is
> +supported.
> +
> +The Reproducible Builds web site has more information about these
> +`prefix-map options`_.
> +
> +Generated files in source packages
> +----------------------------------
> +
> +The build processes for some programs under the ``tools/``
> +subdirectory do not completely support out-of-tree builds.  This may
> +cause a later source package build using e.g. ``make rpm-pkg`` to
> +include generated files.  You should ensure the source tree is
> +pristine by running ``make mrproper`` or ``git clean -d -f -x`` before
> +building a source package.
> +
> +Module signing
> +--------------
> +
> +If you enable ``CONFIG_MODULE_SIG_ALL``, the default behaviour is to
> +generate a different temporary key for each build, resulting in the
> +modules being unreproducible.  However, including a signing key with
> +your source would presumably defeat the purpose of signing modules.
> +
> +One approach to this is to divide up the build process so that the
> +unreproducible parts can be treated as sources:
> +
> +1. Generate a persistent signing key.  Add the certificate for the key
> +   to the kernel source.
> +
> +2. Set the ``CONFIG_SYSTEM_TRUSTED_KEYS`` symbol to include the
> +   signing key's certificate, set ``CONFIG_MODULE_SIG_KEY`` to an
> +   empty string, and disable ``CONFIG_MODULE_SIG_ALL``.
> +   Build the kernel and modules.
> +
> +3. Create detached signatures for the modules, and publish them as
> +   sources.
> +
> +4. Perform a second build that attaches the module signatures.  It
> +   can either rebuild the modules or use the output of step 2.
> +
> +Structure randomisation
> +-----------------------
> +
> +If you enable ``CONFIG_GCC_PLUGIN_RANDSTRUCT``, you will need to
> +pre-generate the random seed in
> +``scripts/gcc-plgins/randomize_layout_seed.h`` so the same value
> +is used in rebuilds.
> +
> +Debug info conflicts
> +--------------------
> +
> +This is not a problem of unreproducibility, but of generated files
> +being *too* reproducible.
> +
> +Once you set all the necessary variables for a reproducible build, a
> +vDSO's debug information may be identical even for different kernel
> +versions.  This can result in file conflicts between debug information
> +packages for the different kernel versions.
> +
> +To avoid this, you can make the vDSO different for different
> +kernel versions by including an arbitrary string of "salt" in it.
> +This is specified by the Kconfig symbol ``CONFIG_BUILD_SALT``.
> +
> +.. _KBUILD_BUILD_TIMESTAMP: kbuild.html#kbuild-build-timestamp
> +.. _KBUILD_BUILD_USER and KBUILD_BUILD_HOST: kbuild.html#kbuild-build-user-kbuild-build-host
> +.. _KCFLAGS: kbuild.html#kcflags
> +.. _prefix-map options: https://reproducible-builds.org/docs/build-path/
> +.. _Reproducible Builds project: https://reproducible-builds.org/
> +.. _SOURCE_DATE_EPOCH: https://reproducible-builds.org/docs/source-date-epoch/



-- 
Best Regards
Masahiro Yamada
