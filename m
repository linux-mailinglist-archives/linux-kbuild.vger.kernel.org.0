Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5A719C820
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2020 19:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390085AbgDBRdc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Apr 2020 13:33:32 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37081 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389875AbgDBRdc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 13:33:32 -0400
Received: by mail-pf1-f196.google.com with SMTP id u65so2081764pfb.4
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2020 10:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2Yk5kZzRfldGKF/5/inhs23oSA0DsXNr92E4/iY/l88=;
        b=VHJ5LUdWHU3S02IVrabP6ESD6AkRMxRJICpiGiJwyCuYdd8WWemAwkbx5Qvc40YeLz
         TeN2UtDLez/g3vWpbmeIAnAWJLpLZ4qHmTI19j4q4JnIPD1HFDenWdoTrFrTNbiqs3Qz
         +Nmw80GQr2mw63bFGUsfcN6lM4WyhY5Nn+aZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2Yk5kZzRfldGKF/5/inhs23oSA0DsXNr92E4/iY/l88=;
        b=cyHQegpqtqy3GVoW67kFDhcdE4Hh4PUzin2cmopC5xLxcmbfonbde7jSU+H11If2JI
         tgnRq44lyFsUHGlALuF3etRtSzzvkTOVxBInbD45sTeiJb+n9LVZA7ixRxvPshI9f58H
         jDu6NBPhdWKxc1Z08lqAqpnBVdBPmf+UhX3tcCqCUhYraMyDtjjFnNx4Xag4RMLEyCD0
         rOZDM/QpooQ5/Cic8yLL267CfUBYlz43H8SsFokgYntPqJWBCQ8F10K6+u+fZuqDBOjd
         L/g0jZUlpao42qCBRLWnLknBXyjARdFasJCvXsTFM+tPeZ2PPYC4VIJbWa3SAYDCBW5Q
         C9Xw==
X-Gm-Message-State: AGi0PuY2Up1jutX7GsYBvdz7S8/+/8oqh8M+pYZsRisAj5yTATqyqMdI
        0B0XxWlyqSwz39OractWox/QQrBQHWw=
X-Google-Smtp-Source: APiQypKK/NhhRqOlZkqY6+NjBvK2Ma/2YXsDptmExZj9HROBHH4bcDJtMeTvHWzi98Zad19pJicSXg==
X-Received: by 2002:a62:2cc3:: with SMTP id s186mr4180269pfs.236.1585848810547;
        Thu, 02 Apr 2020 10:33:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f9sm3006548pgj.2.2020.04.02.10.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 10:33:29 -0700 (PDT)
Date:   Thu, 2 Apr 2020 10:33:28 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
Message-ID: <202004021031.511103E30D@keescook>
References: <202004020117.6E434C035@keescook>
 <CAK7LNAQGTAgtADfY4H-k8X1J9nTMeOWvo8ZFfrUSHQUbhgcLKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQGTAgtADfY4H-k8X1J9nTMeOWvo8ZFfrUSHQUbhgcLKw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 03, 2020 at 02:00:52AM +0900, Masahiro Yamada wrote:
> Hi Kees,
> 
> On Thu, Apr 2, 2020 at 5:18 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > When doing Clang builds of the kernel, it is possible to link with
> > either ld.bfd (binutils) or ld.lld (LLVM), but it is not possible to
> > discover this from a running kernel. Add the "$LD -v" output to
> > /proc/version.
> >
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  init/Makefile       | 2 +-
> >  scripts/mkcompile_h | 8 ++++++--
> >  2 files changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/init/Makefile b/init/Makefile
> > index 6246a06364d0..82c15bdb42d7 100644
> > --- a/init/Makefile
> > +++ b/init/Makefile
> > @@ -35,4 +35,4 @@ include/generated/compile.h: FORCE
> >         @$($(quiet)chk_compile.h)
> >         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@   \
> >         "$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"    \
> > -       "$(CONFIG_PREEMPT_RT)" "$(CC) $(KBUILD_CFLAGS)"
> > +       "$(CONFIG_PREEMPT_RT)" "$(LD)" "$(CC) $(KBUILD_CFLAGS)"
> > diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> > index 3a5a4b210c86..f98c07709370 100755
> > --- a/scripts/mkcompile_h
> > +++ b/scripts/mkcompile_h
> > @@ -6,7 +6,8 @@ ARCH=$2
> >  SMP=$3
> >  PREEMPT=$4
> >  PREEMPT_RT=$5
> > -CC=$6
> > +LD=$6
> > +CC=$7
> 
> 
> Just a nit.
> 
> If you just append 'LD',
> you do not need to touch the 'CC=$6' line.

Oh! Yes, good point. I had convinced myself that the "CC=$6" was dropping
all the passed-in KBUILD_CFLAGS, but I failed to notice the double quotes.

> If you do not mind, I will fold the following
> on top of your patch.

Yes, that would be great; thanks!

-Kees

> 
> 
> 
> 
> --- a/init/Makefile
> +++ b/init/Makefile
> @@ -35,4 +35,4 @@ include/generated/compile.h: FORCE
>         @$($(quiet)chk_compile.h)
>         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@   \
>         "$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"    \
> -       "$(CONFIG_PREEMPT_RT)" "$(LD)" "$(CC) $(KBUILD_CFLAGS)"
> +       "$(CONFIG_PREEMPT_RT)" "$(CC) $(KBUILD_CFLAGS)" "$(LD)"
> diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> index 8b38a96163e2..5b80a4699740 100755
> --- a/scripts/mkcompile_h
> +++ b/scripts/mkcompile_h
> @@ -6,8 +6,8 @@ ARCH=$2
>  SMP=$3
>  PREEMPT=$4
>  PREEMPT_RT=$5
> -LD=$6
> -CC=$7
> +CC=$6
> +LD=$7
> 
> 
> 
> 
> 
> 
> --
> Best Regards
> Masahiro Yamada

-- 
Kees Cook
