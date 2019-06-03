Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEA9833604
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jun 2019 19:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbfFCRGC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Jun 2019 13:06:02 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:36556 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfFCRGC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Jun 2019 13:06:02 -0400
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x53H5eMA013417;
        Tue, 4 Jun 2019 02:05:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x53H5eMA013417
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559581541;
        bh=Wh5AphhhG1/9gl6DKkWi7+nu/0r7jfAo3cQVWcxAvMs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0rLthD9otS2AiG3E5/GnQ9HdNW3XSBUtY1AgtUllZqLGN/GyYtGBzhjPaMSYYa8oL
         sDYy02WMCIdG1NQAvo8+T+PaBJJpbLqjMOqZ+hKaF6xEsY0PFLaKozs8Oyj66HCNYt
         YP1X3LRuifgSA6G3eplD7aY+soa6gJbpJIk7dVlo8nl3o59Tt1QLYf2tL8LRyPdlEt
         +TzudGaRNejOjJEJuOjAQmxAJ5HzlcXbF4J0coFYXo+jwHkLPvPrYBspaaE7XBJ49Y
         LaVNCbS6574sp9Kp00/9qm8biOMzj7gcG4w9oKxaMXfw5WDeGuRILPexR5MBjuriIW
         mWseMnvECxqbQ==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id l20so11722722vsp.3;
        Mon, 03 Jun 2019 10:05:40 -0700 (PDT)
X-Gm-Message-State: APjAAAVSwB/21Kh3ClJv5BQL5H38tUQG4VAvUNP6PxfGwiHK4FpjHKpT
        J1cD+JGsYWNxUXWoNUxep1c3202zLfke8aTyFtw=
X-Google-Smtp-Source: APXvYqw1j0h7dPq91qeFgfmPoCwM4xqnEZm+YWjuPynChyFgxLznq6Qu/I8GHSTUygSJrljgMIdoqGz9DwIKMY/Ejiw=
X-Received: by 2002:a67:1783:: with SMTP id 125mr2680825vsx.54.1559581539601;
 Mon, 03 Jun 2019 10:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190516194818.29230-1-jani.nikula@intel.com> <20190524174011.GA23737@ravnborg.org>
In-Reply-To: <20190524174011.GA23737@ravnborg.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 4 Jun 2019 02:05:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNARY_L3Oyi7hhCZXVwNRAsf6ceSarTNDrzdfXQGj1tDFJw@mail.gmail.com>
Message-ID: <CAK7LNARY_L3Oyi7hhCZXVwNRAsf6ceSarTNDrzdfXQGj1tDFJw@mail.gmail.com>
Subject: Re: [RFC 1/3] kbuild: add support for ensuring headers are self-contained
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        intel-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Sam,


On Sat, May 25, 2019 at 2:40 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Jani
>
> > Sometimes it's useful to be able to explicitly ensure certain headers
> > remain self-contained, i.e. that they are compilable as standalone
> > units, by including and/or forward declaring everything they depend on.
> >
> > Add special target header-test-y where individual Makefiles can add
> > headers to be tested if CONFIG_HEADER_TEST is enabled. This will
> > generate a dummy C file per header that gets built as part of extra-y.
>
> Very useful, thanks.
> I have cooked up something ad-hoc a couple of times but having it as a
> standard feature in the build system is much better.
> The we can let some of our infrastructure pick up an issues
> automatically.
>
> >
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: Michal Marek <michal.lkml@markovi.net>
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > ---
> >  Documentation/kbuild/makefiles.txt |  7 +++++++
> >  init/Kconfig                       |  9 +++++++++
> >  scripts/Makefile.build             | 10 ++++++++++
> >  scripts/Makefile.lib               |  3 +++
> >  4 files changed, 29 insertions(+)
> >
> > diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
> > index 03c065855eaf..73df58e5ea0c 100644
> > --- a/Documentation/kbuild/makefiles.txt
> > +++ b/Documentation/kbuild/makefiles.txt
> > @@ -1036,6 +1036,13 @@ When kbuild executes, the following steps are followed (roughly):
> >       In this example, extra-y is used to list object files that
> >       shall be built, but shall not be linked as part of built-in.a.
> >
> > +    header-test-y
> > +
> > +     header-test-y specifies headers (*.h) in the current directory that
> > +     should be compile tested to ensure they are self-contained,
> > +     i.e. compilable as standalone units. If CONFIG_HEADER_TEST is enabled,
> > +     this autogenerates dummy sources to include the headers, and builds them
> > +     as part of extra-y.
> Do we want to restrict this to current directory only?
> Sometimes we could use this for headers in include/ but let it
> trigger for the relevant subsystem.
> So for example drivers/gpu/drm/Makefile will include the rules
> for all headers in include/drm/*
>
> The alternative would be Makefiles (of Kbuild files)
> scattered in the directories with headers and then some
> infrastructure to visit those.
>
> Follow patch extend the header-test feature to work with
> headers in include/

Following the obj-y pattern,
I want to make header-test-y relative to $(obj).



> Example:
> # Header files from this directory
> header-test-y += drm_crtc_helper_internal.h
> header-test-y += drm_crtc_internal.h

These are described in drivers/gpu/drm/Makefile.

> ..
> .
> # Header files from include/drm
> header-test-y += drm/amd_asic_type.h
> header-test-y += drm/ati_pcigart.h

These are described in $(srctree)/include/Makefile.


> ...
>
>
> In the patch $* is used to get the "stem" from the pattern.
> This is the filname of the header file without extension.
>
>
>         Sam
>
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 4d4bf698467a..ca132ab3a551 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -295,11 +295,10 @@ $(obj)/%.lst: $(src)/%.c FORCE
>  # ---------------------------------------------------------------------------
>
>  quiet_cmd_header_test = HDRTEST $@
> -      cmd_header_test = echo "\#include \"$(<F)\"" > $@
> +      cmd_header_test = echo "\#include <$(2).h>" > $@
>
> -# FIXME: would be nice to be able to limit this implicit rule to header-test-y
> -$(obj)/%.header_test.c: $(src)/%.h FORCE
> -       $(call if_changed,header_test)
> +$(obj)/%.header_test.c:
> +       $(call cmd,header_test,$*)
>
>  # Compile assembler sources (.S)
>  # ---------------------------------------------------------------------------
>

Agree, this is much better,
and it is what scripts/Makefile.asm-generic does.

But, you do not need to pass '$*' via the argument.



I prefer this:

quiet_cmd_header_test = HDRTEST $@
      cmd_header_test = echo "\#include \"$*.h\"" > $@

$(obj)/%.header_test.c:
        $(call cmd,header_test)


-- 
Best Regards
Masahiro Yamada
