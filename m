Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2838302E83
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Jan 2021 22:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732853AbhAYV5p (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Jan 2021 16:57:45 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:37385 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733082AbhAYV5a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jan 2021 16:57:30 -0500
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 10PLu2PO005199;
        Tue, 26 Jan 2021 06:56:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 10PLu2PO005199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611611762;
        bh=k13xTgp4YHfTY2q/O6bg9I8kJdCvKuXvFQLmI3+RhI0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dK+2GFRbXjlPKnrgk8h81RgCsjUI9MVHCbCaBBuEVQjhvutSMBuEZXNBIWmWjKSdG
         XiXo/6Mv9j7AFxAcohOluO0dJ0Ed5DUu86XQeptwtct8i9alY6b+PGo9Mmh+dOKBw2
         7G1kNyOdVr+BTPCUuoinkmG23bwq5kxcqt2pK5epUH6NNIJpOIeVGQ5gtBNlEHNpPc
         K5UwWWH2oEt3t60j54TwiN5r+kJjJGdFC40Ppuv3cH+p+NNxPRKoLmb8/Yy8+HlEzR
         76zaYkHH8EZqBTfn/6Q9AnQFuMwQh7Rlr8f6CmfhJjFtkWO1cFlfijPsP3u0XGFY0B
         acRIvx6RKTqRA==
X-Nifty-SrcIP: [209.85.210.174]
Received: by mail-pf1-f174.google.com with SMTP id q20so9185709pfu.8;
        Mon, 25 Jan 2021 13:56:02 -0800 (PST)
X-Gm-Message-State: AOAM532kAxYqbmUQKWe8VOBIEBKCjxlsNykuJA1C4WPRFDC2by/4qOQr
        czUAzMiBDZqVkugmxDUfbaTgAhOQmRyOo3+Ynqs=
X-Google-Smtp-Source: ABdhPJxdcIWBPAyh3WbuAUW/EWSOSODCsrlOwl2RnFKZ8jqnC8tLenx9emKykYOcLkOUSZ1xRTq+RAj98lrdZe1Yb2M=
X-Received: by 2002:a63:1f1d:: with SMTP id f29mr2556604pgf.47.1611611761596;
 Mon, 25 Jan 2021 13:56:01 -0800 (PST)
MIME-Version: 1.0
References: <20210123133333.736453-1-masahiroy@kernel.org>
In-Reply-To: <20210123133333.736453-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 26 Jan 2021 06:55:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNASV+JWG+1vuEqFUWUk=AW8TkwwSrEGaciOkJwQ8xU0+AQ@mail.gmail.com>
Message-ID: <CAK7LNASV+JWG+1vuEqFUWUk=AW8TkwwSrEGaciOkJwQ8xU0+AQ@mail.gmail.com>
Subject: Re: [PATCH v2] doc: gcc-plugins: drop more stale information
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Robert Karszniewicz <r.karszniewicz@phytec.de>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-hardening@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jan 23, 2021 at 10:34 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> [1] Drop the version information
>
> The range of the supported GCC versions are always changing. The
> current minimal GCC version is 4.9, and commit 1e860048c53e
> ("gcc-plugins: simplify GCC plugin-dev capability test") removed the
> old code accordingly.
>
> We do not need to mention specific version ranges like "all gcc versions
> from 4.5 to 6.0" since we forget to update the documentation when we
> raise the minimal compiler version.
>
> [2] Drop the C compiler statements
>
> Since commit 77342a02ff6e ("gcc-plugins: drop support for GCC <= 4.7")
> the GCC plugin infrastructure only supports g++.
>
> [3] Drop supported architectures
>
> As of v5.11-rc4, the infrastructure supports more architectures;
> arm, arm64, mips, powerpc, riscv, s390, um, and x86. (just grep
> "select HAVE_GCC_PLUGINS") Again, we miss to update this document when a
> new architecture is supported. Let's just say "only some architectures".
>
> [4] Update the apt-get example
>
> We are now discussing to bump the minimal version to GCC 5. The GCC 4.9
> support will be removed sooner or later. Change the package example to
> gcc-10-plugin-dev while we are here.
>
> [5] Update the build target
>
> Since commit ce2fd53a10c7 ("kbuild: descend into scripts/gcc-plugins/
> via scripts/Makefile"), "make gcc-plugins" is not supported.
> "make scripts" builds all the enabled plugins, including some other
> tools.
>
> [6] Update the steps for adding a new plugin
>
> At first, all CONFIG options for GCC plugins were located in arch/Kconfig.
> After commit 45332b1bdfdc ("gcc-plugins: split out Kconfig entries to
> scripts/gcc-plugins/Kconfig"), scripts/gcc-plugins/Kconfig became the
> central place to collect plugin CONFIG options. In my understanding,
> this requirement no longer exists because commit 9f671e58159a ("security:
> Create "kernel hardening" config area") moved some of plugin CONFIG
> options to another file. Find an appropriate place to add the new CONFIG.
>
> The sub-directory support was never used by anyone, and removed by
> commit c17d6179ad5a ("gcc-plugins: remove unused GCC_PLUGIN_SUBDIR").
>
> Remove the useless $(src)/ prefix.


Applied to linux-kbuild.




> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - Remove the info about sub-directory support
>
>  Documentation/kbuild/gcc-plugins.rst | 31 +++++++++++++---------------
>  1 file changed, 14 insertions(+), 17 deletions(-)
>
> diff --git a/Documentation/kbuild/gcc-plugins.rst b/Documentation/kbuild/gcc-plugins.rst
> index 63379d0150e3..979887558e72 100644
> --- a/Documentation/kbuild/gcc-plugins.rst
> +++ b/Documentation/kbuild/gcc-plugins.rst
> @@ -11,16 +11,13 @@ compiler [1]_. They are useful for runtime instrumentation and static analysis.
>  We can analyse, change and add further code during compilation via
>  callbacks [2]_, GIMPLE [3]_, IPA [4]_ and RTL passes [5]_.
>
> -The GCC plugin infrastructure of the kernel supports all gcc versions from
> -4.5 to 6.0, building out-of-tree modules, cross-compilation and building in a
> -separate directory.
> -Plugin source files have to be compilable by both a C and a C++ compiler as well
> -because gcc versions 4.5 and 4.6 are compiled by a C compiler,
> -gcc-4.7 can be compiled by a C or a C++ compiler,
> -and versions 4.8+ can only be compiled by a C++ compiler.
> +The GCC plugin infrastructure of the kernel supports building out-of-tree
> +modules, cross-compilation and building in a separate directory.
> +Plugin source files have to be compilable by a C++ compiler.
>
> -Currently the GCC plugin infrastructure supports only the x86, arm, arm64 and
> -powerpc architectures.
> +Currently the GCC plugin infrastructure supports only some architectures.
> +Grep "select HAVE_GCC_PLUGINS" to find out which architectures support
> +GCC plugins.
>
>  This infrastructure was ported from grsecurity [6]_ and PaX [7]_.
>
> @@ -53,8 +50,7 @@ $(src)/scripts/gcc-plugins/gcc-generate-simple_ipa-pass.h,
>  $(src)/scripts/gcc-plugins/gcc-generate-rtl-pass.h**
>
>         These headers automatically generate the registration structures for
> -       GIMPLE, SIMPLE_IPA, IPA and RTL passes. They support all gcc versions
> -       from 4.5 to 6.0.
> +       GIMPLE, SIMPLE_IPA, IPA and RTL passes.
>         They should be preferred to creating the structures by hand.
>
>
> @@ -62,9 +58,9 @@ Usage
>  =====
>
>  You must install the gcc plugin headers for your gcc version,
> -e.g., on Ubuntu for gcc-4.9::
> +e.g., on Ubuntu for gcc-10::
>
> -       apt-get install gcc-4.9-plugin-dev
> +       apt-get install gcc-10-plugin-dev
>
>  Or on Fedora::
>
> @@ -76,7 +72,7 @@ Enable a GCC plugin based feature in the kernel config::
>
>  To compile only the plugin(s)::
>
> -       make gcc-plugins
> +       make scripts
>
>  or just run the kernel make and compile the whole kernel with
>  the cyclomatic complexity GCC plugin.
> @@ -85,7 +81,8 @@ the cyclomatic complexity GCC plugin.
>  4. How to add a new GCC plugin
>  ==============================
>
> -The GCC plugins are in $(src)/scripts/gcc-plugins/. You can use a file or a directory
> -here. It must be added to $(src)/scripts/gcc-plugins/Makefile,
> -$(src)/scripts/Makefile.gcc-plugins and $(src)/arch/Kconfig.
> +The GCC plugins are in scripts/gcc-plugins/. You need to put plugin source files
> +right under scripts/gcc-plugins/. Creating subdirectories is not supported.
> +It must be added to scripts/gcc-plugins/Makefile, scripts/Makefile.gcc-plugins
> +and a relevant Kconfig file.
>  See the cyc_complexity_plugin.c (CONFIG_GCC_PLUGIN_CYC_COMPLEXITY) GCC plugin.
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
