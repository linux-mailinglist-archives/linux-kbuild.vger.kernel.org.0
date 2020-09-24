Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87BB2777AD
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Sep 2020 19:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728645AbgIXRYA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 24 Sep 2020 13:24:00 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:29226 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgIXRYA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Sep 2020 13:24:00 -0400
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 08OHNMh3022365;
        Fri, 25 Sep 2020 02:23:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 08OHNMh3022365
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1600968203;
        bh=joTtiAZjMaYsT1Nb+EImochKGA88DFvnzBk5ymeSa6Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XnIZ+b0Kk9VpVcPQ5TbZfY+2ZDRhVm81Sug4iNmKuz4i8okUW9+jm/8lK01KDjznD
         Jj+PS4O0DJByBjl0eEXDAZII8wDNQTXyCyneXQlFnMnXKOGTpkHKaIHimlN/kh4bVO
         bhB0GJwadc5q4Ch/ff0cJ/FNTl4JQmi9RdyLrEiujIOjO4bHKFdpVFonWjJBj5mXW7
         bNdHZNZNeya6VDRDQ4L9vtOWew9rl8+8z2w/+Jg9FY8tnslQIaJRvS1KiEGqDJQpeP
         s0Tx+OYDM2serqEKofAZ5LzUAK4JUFesXR6q6++oMVgui8+atOPmDlgd98BqhpdW7/
         u43DpOYIEfnkQ==
X-Nifty-SrcIP: [209.85.214.173]
Received: by mail-pl1-f173.google.com with SMTP id c3so87894plz.5;
        Thu, 24 Sep 2020 10:23:22 -0700 (PDT)
X-Gm-Message-State: AOAM5320bJwUsQ29LbeHQALreIhX+pq0zQVfiKryLa9J707yRhXMm+JE
        zr9NHyHn79jxazqTDtQmlqv2X+WkDoCaR5ANc5U=
X-Google-Smtp-Source: ABdhPJwxGkDvbczFQVCA0yU/ETKsepVugFYXutPJdGOG8Q0qMurDnQK9TbgMpfOLov3Gt4majojwcKVXc4Emk+auYWw=
X-Received: by 2002:a17:902:7489:b029:d2:439c:4e0e with SMTP id
 h9-20020a1709027489b02900d2439c4e0emr183827pll.71.1600968201985; Thu, 24 Sep
 2020 10:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200918215010.250580-1-pierre-louis.bossart@linux.intel.com>
 <CAK7LNATUcRpCvu9iQd_s9i5+3kRA96O+DMd-QGbAu-swmVuauw@mail.gmail.com> <d14745a6-fbdc-ff84-5553-18af6d922989@linux.intel.com>
In-Reply-To: <d14745a6-fbdc-ff84-5553-18af6d922989@linux.intel.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 25 Sep 2020 02:22:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQfm5GVH93zAJakB1JpyS1qf93qTUETofOstSJ9jcky3w@mail.gmail.com>
Message-ID: <CAK7LNAQfm5GVH93zAJakB1JpyS1qf93qTUETofOstSJ9jcky3w@mail.gmail.com>
Subject: Re: [PATCH] modpost: allow modpost to fail on warnings
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Filipe Brandenburger <filbranden@google.com>,
        Greg Thelen <gthelen@google.com>,
        Michael Davidson <md@google.com>,
        Eugene Surovegin <surovegin@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 21, 2020 at 11:51 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> Thanks for the review,
>
> >> Set KBUILD_MODPOST_FAIL_ON_WARNINGS to a non-empty value to make the
> >> kbuild fail when modpost generates any warnings. This will avoid
> >> misses such as [1] where the SOF CI did not catch a missing module
> >> license.
> >>
> >> This was initially contributed in 2016 [2], rebase/clean-ups and tests
> >> by Pierre Bossart.
> >>
> >> Test example:
> >> $ KBUILD_MODPOST_FAIL_ON_WARNINGS=1 make
> >>    GEN     Makefile
> >>    DESCEND  objtool
> >>    CALL    sof-dev/scripts/atomic/check-atomics.sh
> >>    CALL    sof-dev/scripts/checksyscalls.sh
> >>    CHK     include/generated/compile.h
> >>    MODPOST Module.symvers
> >> Kernel: arch/x86/boot/bzImage is ready  (#13)
> >> WARNING: modpost: missing MODULE_LICENSE() in sound/soc/intel/boards/snd-soc-sof-sdw.o
> >> make[2]: *** [sof-dev/scripts/Makefile.modpost:114: Module.symvers] Error 2
> >
> >
> > I think [1] should be an error instead of a warning
> > by default.
>
> would the following patch be what you have in mind?


No.
error() does not exist.

merror() exists, but the difference from warn()
is just a prefix.

If any error happens, modpost should return the error code.





> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 422f1cfca289..ae1eb67aa0f2 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2018,7 +2018,7 @@ static void read_symbols(const char *modname)
>          if (!mod->is_vmlinux) {
>                  license = get_modinfo(&info, "license");
>                  if (!license)
> -                       warn("missing MODULE_LICENSE() in %s\n", modname);
> +                       error("missing MODULE_LICENSE() in %s\n", modname);
>                  while (license) {
>                          if (license_is_gpl_compatible(license))
>                                  mod->gpl_compatible = 1;
>
>
> If yes, also wondering if we can still add the option to treat warnings
> as errors as an opt-in behavior?


I want to add a new option only when it is necessary to do so.

I am not sure which warnings are real warnings.


> Thanks!
> -Pierre



-- 
Best Regards
Masahiro Yamada
