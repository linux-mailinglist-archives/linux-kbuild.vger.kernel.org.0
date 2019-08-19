Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF34691B5B
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2019 05:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfHSDGZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 18 Aug 2019 23:06:25 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:55567 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbfHSDGY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Aug 2019 23:06:24 -0400
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x7J35wEe030201;
        Mon, 19 Aug 2019 12:05:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x7J35wEe030201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566183959;
        bh=FvrvXZdRwWZZ1KuvO9EEoL2qJALXtG/9Jo/vp+F3xNE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tipIfDeG6ZLt6NNy+m1S53m2FFGTNuHlwciLyApcwhx9+2XtCtXFRnb3dgVQ3E23Z
         IeXdb+6M/BmJ0CiAPssY4N5XUp/mBf5XgCL5EB9pvHUAaujIkDPpRfre051E0Tfa6Q
         y7mmsCjPRLpxFtuGGtSDj4HTW/RSGwmsZl16TRTXpUWRimwjcGmXArQqyN1hjb0v95
         Rv4msGtPpW0PySfo3AdtS2y2D5YwZt+ru8rkgmwtLUvo+Hv85+3dL3rY0Mtd6vdCiH
         dtcMnVfiQyUzQhMafq8FoUOPNh7CWosTsg9bJsFCRPGadhAuSA9p4NILxvjvTg/1tJ
         L8nUIHraczI/w==
X-Nifty-SrcIP: [209.85.221.179]
Received: by mail-vk1-f179.google.com with SMTP id 82so90314vkf.11;
        Sun, 18 Aug 2019 20:05:59 -0700 (PDT)
X-Gm-Message-State: APjAAAUFO1rQX1jCMZBwMWHBMKbYr0W6ogAQdFOJPWC4RZycgQx/v46L
        Nj1SfQpk1S9JN9jBQDOlbMn+gcpI/8FBFA8SNmI=
X-Google-Smtp-Source: APXvYqwhx55VHoZeo7T6/fDL/ga/52EL6eberou+DA3UuTMH+Bh71njnfuexmvOpPjx50tOl1Kw5t/JARBSO9A34KXw=
X-Received: by 2002:a1f:57c2:: with SMTP id l185mr1860086vkb.84.1566183957703;
 Sun, 18 Aug 2019 20:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdk+NQCKZ4EXAukaKYK4R9CDaNWVY_aDxXaeQrLfo_Z=nw@mail.gmail.com>
 <20190815225844.145726-1-nhuck@google.com> <CAK7LNATsA0foyeaE2W3xe=_Hkf9S=q0eD5WHqwPXkMw8udkDPg@mail.gmail.com>
 <20190818184341.GA6262@archlinux-threadripper>
In-Reply-To: <20190818184341.GA6262@archlinux-threadripper>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 19 Aug 2019 12:05:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQuMcLBHhRy3ygqXoYUfdNpNfLRAgxVKx2+suoAoyso9w@mail.gmail.com>
Message-ID: <CAK7LNAQuMcLBHhRy3ygqXoYUfdNpNfLRAgxVKx2+suoAoyso9w@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Require W=1 for -Wimplicit-fallthrough with clang
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Joe Perches <joe@perches.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 19, 2019 at 3:43 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Mon, Aug 19, 2019 at 01:43:08AM +0900, Masahiro Yamada wrote:
> > Hi.
> >
> > On Fri, Aug 16, 2019 at 7:59 AM Nathan Huckleberry <nhuck@google.com> wrote:
> > >
> > > Clang is updating to support -Wimplicit-fallthrough on C
> > > https://reviews.llvm.org/D64838. Since clang does not
> > > support the comment version of fallthrough annotations
> > > this update causes an additional 50k warnings. Most
> > > of these warnings (>49k) are duplicates from header files.
> > >
> > > This patch is intended to be reverted after the warnings
> > > have been cleaned up.
> > >
> > > Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> > > Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> > > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > > ---
> > > Changes v1->v2
> > > * Move code to preexisting ifdef
> > >  scripts/Makefile.extrawarn | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > > index a74ce2e3c33e..95973a1ee999 100644
> > > --- a/scripts/Makefile.extrawarn
> > > +++ b/scripts/Makefile.extrawarn
> > > @@ -70,5 +70,6 @@ KBUILD_CFLAGS += -Wno-initializer-overrides
> > >  KBUILD_CFLAGS += -Wno-format
> > >  KBUILD_CFLAGS += -Wno-sign-compare
> > >  KBUILD_CFLAGS += -Wno-format-zero-length
> > > +KBUILD_CFLAGS += $(call cc-option,-Wno-implicit-fallthrough)
> > >  endif
> > >  endif
> > > --
> > > 2.23.0.rc1.153.gdeed80330f-goog
> > >
> >
> >
> > Perhaps, is the following even cleaner?
> >
> >
> >
> > diff --git a/Makefile b/Makefile
> > index 1b23f95db176..cebc6bf5372e 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -751,6 +751,9 @@ else
> >  # These warnings generated too much noise in a regular build.
> >  # Use make W=1 to enable them (see scripts/Makefile.extrawarn)
> >  KBUILD_CFLAGS += -Wno-unused-but-set-variable
> > +
> > +# Warn about unmarked fall-throughs in switch statement.
> > +KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
> >  endif
> >
> >  KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
> > @@ -845,9 +848,6 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC)
> > -print-file-name=include)
> >  # warn about C99 declaration after statement
> >  KBUILD_CFLAGS += -Wdeclaration-after-statement
> >
> > -# Warn about unmarked fall-throughs in switch statement.
> > -KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
> > -
> >  # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
> >  KBUILD_CFLAGS += -Wvla
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada
>
> I like this more than anything suggested so far. I think a comment
> should be added regarding why this is only enabled for GCC right now but
> that is pretty easy to revert once we have figured out the right course
> of action.

Agree. This is well-explained in the commit log,
but adding a short comment will be nice.



BTW, I personally like the traditional
comment version of fallthrough annotations.

Is there a plan for Clang to support it
as well as the attribute?

Thanks.

-- 
Best Regards
Masahiro Yamada
