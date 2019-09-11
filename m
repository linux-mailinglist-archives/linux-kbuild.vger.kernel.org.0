Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16A0EAFC59
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2019 14:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfIKMSc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Sep 2019 08:18:32 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:24589 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbfIKMSc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Sep 2019 08:18:32 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x8BCIMvI026783;
        Wed, 11 Sep 2019 21:18:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x8BCIMvI026783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568204303;
        bh=Ed3nwiN6b5xq4gvRtiybAyMuQmLFKpABFAgTKnx4YT4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TSX5DNu7/AcaFeQKGmZPTpRq/VhhfNAlTQDGVeTw12xGg0H++DgjZNOMfMN2xjRO/
         gL0Pniu0q1mse85bJiKOm9S9FGl1nlOdqTfs4KWazRZWLio+Kut85urTqVQasykqSn
         Kr3L/hqeLuHTEsvm3nYs3TPLpmTyUqhQ0pXXRWkg56VntxiB0oqdfHv5kW/l17w5TY
         Uaee+4RO4uH0K9mJaJKhHPWyGfyl/0dO5Knp2XJpoXTE9RdRsqsdmkuGmuQt3fi/xa
         2vMIak8aYZr2FEWiRkJsO4yQuoOIF6Stq05k92nJHm2AgJ8URSVq+FhQGowxjDksVQ
         h6U3KAtwxq96Q==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id z14so13534277vsz.13;
        Wed, 11 Sep 2019 05:18:23 -0700 (PDT)
X-Gm-Message-State: APjAAAVcCJU6FjPV/n2gMxzf988C1/ps4cO0F6oqCEiV42QV6vai4Fal
        1AO1FimXrkGvKxxqA+dvivQ9qRl0teElRtzXrIg=
X-Google-Smtp-Source: APXvYqwsV/L4MZ5TIeEjBI+o1wwR1AcQMtFkqLldIwHRG0owxZ3rzY7Ehrk8CtIJ+USvd7OaN1GbplwI0irPNXTUH4o=
X-Received: by 2002:a67:eb18:: with SMTP id a24mr19358281vso.155.1568204301793;
 Wed, 11 Sep 2019 05:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190911115353.yngbk6hf6gwctock@decadent.org.uk>
In-Reply-To: <20190911115353.yngbk6hf6gwctock@decadent.org.uk>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 11 Sep 2019 21:17:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT-p0NX8JQ+R221L2SkRgiV7=-TheBVaUtNp4vmkG0OYQ@mail.gmail.com>
Message-ID: <CAK7LNAT-p0NX8JQ+R221L2SkRgiV7=-TheBVaUtNp4vmkG0OYQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kbuild: Add document about reproducible builds
To:     Ben Hutchings <ben@decadent.org.uk>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        ab@php.net
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Ben,


Thanks for this.
Please let me add some comments.


On Wed, Sep 11, 2019 at 8:54 PM Ben Hutchings <ben@decadent.org.uk> wrote:
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
> ---
>  Documentation/kbuild/index.rst               |   1 +
>  Documentation/kbuild/reproducible-builds.rst | 115 +++++++++++++++++++
>  2 files changed, 116 insertions(+)
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
> index 000000000000..4d988faf93b8
> --- /dev/null
> +++ b/Documentation/kbuild/reproducible-builds.rst
> @@ -0,0 +1,115 @@
> +===================
> +Reproducible builds
> +===================
> +
> +It is generally desirable that the building the same source code with
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
> +absolute filenames for the source files.  The ``__FILE__`` macro may
> +also expand to an absolute filename.  This must be overridden by
> +including `prefix-map options`_ in the `KCFLAGS`_ variable.

Do you mean -fmacro-prefix-map ?

If so, it is already taken care of by the top Makefile.
If you use GCC 8 or newer, it is automatically added to
KBUILD_CFLAGS.




> +
> +Generated files in source packages
> +----------------------------------
> +
> +The build processes for some programs under the ``tools/``
> +subdirectory do not completely support out-of-tree builds.  This may
> +cause source packages built using e.g. ``make rpm-pkg`` to include
> +generated files and so be unreproducible.  It may be necessary to
> +clean the source tree completely (``make mrproper`` or
> +``git clean -d -f -x``) before building a source package.


Currently, the source package building does not support
out-of-tree build anyway.

'make O=foo rpm-pkg' fails with an error message.

Building in a pristine source will solve the issue.





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
