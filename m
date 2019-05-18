Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32E57221AF
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 May 2019 07:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbfERFRp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 18 May 2019 01:17:45 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:20260 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfERFRp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 May 2019 01:17:45 -0400
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x4I5HQht029939;
        Sat, 18 May 2019 14:17:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x4I5HQht029939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558156647;
        bh=kywHDOSLnwkjDkKM0dbYJjVaCTIaJe5E56AK1QSBnpg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qh6Oq87HBAqCLw/HU2vAG8rWwMnRejolP3OWk+hRptk+euLf3tye5OYIAfTrJ/+t0
         25gsgGhYSnZPXmT1AvVAm1ITnKh6NRe03ja5NcAb4gJEkGKBGDGUGnYO2o2LG1tuzb
         f44mk+QX3SOK6OVqMsi6nuhsb2qJjoIt3RNR3DktJ+pQe62GtNgenKrV3nOTTaABDh
         Rnu31a93Qmk97/Shq4mPAlVfvhkb9NmNWPteIFzkzxi1KoCR2J11x1wjKlzP1pmCeF
         U5/Fr/7bliC00+m2mUVgTqTPMYoDFb4FeR6v9Mwaw5Cq7jjH6y5Iv3dbHaPXmcJcEI
         cMNkXzssH8SCg==
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id q13so5982923vso.2;
        Fri, 17 May 2019 22:17:27 -0700 (PDT)
X-Gm-Message-State: APjAAAUn1ZNKEszCFGl3ZDSOotytAzoVo+nIgtjGNPCxfIvQ0VWWwIb3
        n1zeLNKTGFRGrycL0z+/WmFWRa3HmAfwluuL5hg=
X-Google-Smtp-Source: APXvYqyaV41T3lgarcHYIfcGzALfRz/7RFyfIO7aNgfATseO8tC80WC2aOEsHvxw1aU3Z6qXI8oicpisvjEOoiGks+M=
X-Received: by 2002:a67:d382:: with SMTP id b2mr13359094vsj.155.1558156646034;
 Fri, 17 May 2019 22:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190516194818.29230-1-jani.nikula@intel.com>
In-Reply-To: <20190516194818.29230-1-jani.nikula@intel.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 18 May 2019 14:16:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQv-fm2iV6HW_FM0Fe6hNDeJ25c9CS2SbroSOneoepFMQ@mail.gmail.com>
Message-ID: <CAK7LNAQv-fm2iV6HW_FM0Fe6hNDeJ25c9CS2SbroSOneoepFMQ@mail.gmail.com>
Subject: Re: [RFC 1/3] kbuild: add support for ensuring headers are self-contained
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        intel-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 17, 2019 at 4:48 AM Jani Nikula <jani.nikula@intel.com> wrote:
>
> Sometimes it's useful to be able to explicitly ensure certain headers
> remain self-contained, i.e. that they are compilable as standalone
> units, by including and/or forward declaring everything they depend on.
>
> Add special target header-test-y where individual Makefiles can add
> headers to be tested if CONFIG_HEADER_TEST is enabled. This will
> generate a dummy C file per header that gets built as part of extra-y.
>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  Documentation/kbuild/makefiles.txt |  7 +++++++
>  init/Kconfig                       |  9 +++++++++
>  scripts/Makefile.build             | 10 ++++++++++
>  scripts/Makefile.lib               |  3 +++
>  4 files changed, 29 insertions(+)
>
> diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
> index 03c065855eaf..73df58e5ea0c 100644
> --- a/Documentation/kbuild/makefiles.txt
> +++ b/Documentation/kbuild/makefiles.txt
> @@ -1036,6 +1036,13 @@ When kbuild executes, the following steps are followed (roughly):
>         In this example, extra-y is used to list object files that
>         shall be built, but shall not be linked as part of built-in.a.
>
> +    header-test-y
> +
> +       header-test-y specifies headers (*.h) in the current directory that
> +       should be compile tested to ensure they are self-contained,
> +       i.e. compilable as standalone units. If CONFIG_HEADER_TEST is enabled,
> +       this autogenerates dummy sources to include the headers, and builds them
> +       as part of extra-y.
>
>  --- 6.7 Commands useful for building a boot image
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 4592bf7997c0..d91b157201b1 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -95,6 +95,15 @@ config COMPILE_TEST
>           here. If you are a user/distributor, say N here to exclude useless
>           drivers to be distributed.
>
> +config HEADER_TEST
> +       bool "Compile test headers that should be standalone compilable"
> +       help
> +         Compile test headers listed in header-test-y target to ensure they are
> +         self-contained, i.e. compilable as standalone units.
> +
> +         If you are a developer or tester and want to ensure the requested
> +         headers are self-contained, say Y here. Otherwise, choose N.
> +
>  config LOCALVERSION
>         string "Local version - append to kernel release"
>         help
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 76ca30cc4791..4d4bf698467a 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -291,6 +291,16 @@ quiet_cmd_cc_lst_c = MKLST   $@
>  $(obj)/%.lst: $(src)/%.c FORCE
>         $(call if_changed_dep,cc_lst_c)
>
> +# Dummy C sources for header test (header-test-y target)
> +# ---------------------------------------------------------------------------
> +
> +quiet_cmd_header_test = HDRTEST $@
> +      cmd_header_test = echo "\#include \"$(<F)\"" > $@
> +
> +# FIXME: would be nice to be able to limit this implicit rule to header-test-y
> +$(obj)/%.header_test.c: $(src)/%.h FORCE
> +       $(call if_changed,header_test)
> +
>  # Compile assembler sources (.S)
>  # ---------------------------------------------------------------------------
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 8a1f64f17740..c2839de06485 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -66,6 +66,9 @@ extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
>  extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
>  endif
>
> +# Test self-contained headers
> +extra-$(CONFIG_HEADER_TEST) += $(patsubst %.h,%.header_test.o,$(header-test-y))
> +
>  # Add subdir path
>
>  extra-y                := $(addprefix $(obj)/,$(extra-y))
> --
> 2.20.1
>


Thanks, probably we should do this.

At least, this check will be useful
for uapi headers since the kernel does not
test the self-containedness of
exported headers, (then turned out be problematic
later in user-space).

I will take a little time to considier
how far we can extend the idea about
"headers should be self-contained".

Thank you.



-- 
Best Regards
Masahiro Yamada
