Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88AC418625
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 09:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfEIHZ4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 03:25:56 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:54534 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbfEIHZ4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 03:25:56 -0400
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x497PmY2018718;
        Thu, 9 May 2019 16:25:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x497PmY2018718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557386749;
        bh=U2anJwPobpZqhjkwXn9/pVPlRyECkiV0exOnjsPnOa0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=p5mZZXrmsUhjqumjrrqfyHbndzLSA8hnkYnm7zn/kvwnflc4oxdQ6apcS+OM5O2xI
         afqBcbjAXsYobAyCoLw7fhPzX1OWyETRmI9VmFjzv0UKP4MderOu29lPF9+XuP9wYB
         gsjbYNDLRX/7DUq7kgxP1wZBmH/StcpJ5HDdUvZYNF5zxKjf2kJTPIYqTvGHzb+DH3
         anBv0U/g8y/axGtk5oCFF7lk5aFnGmDpVNvmp+MRBvX8tl99XXafbSdfOh3Bo5HWel
         0YhhrwxTSN1bCGE8gvxHBGpf5v+evNyqLp3paaXZB7oFeaHo5+cPfKGKjMn/hQ3qvd
         8SqhAiqhYZBoA==
X-Nifty-SrcIP: [209.85.221.176]
Received: by mail-vk1-f176.google.com with SMTP id d77so335437vke.13;
        Thu, 09 May 2019 00:25:49 -0700 (PDT)
X-Gm-Message-State: APjAAAX9/9rp6wBMEnoNrjA41gsPYRLxmAIsmOqMuBCC3NuE+50fKBlp
        PF6+NzT6Mck4WmhnBwynOXd4I4+Vcl0dA9kVBgs=
X-Google-Smtp-Source: APXvYqw1qCogWjqOu46H9RSkdMIWwMnnDoQ8OTyb6OBjTLfU5O4awe2tNwpJXBF5ys2TdOn5uolJ45I4c6/aLHz9hHE=
X-Received: by 2002:a1f:d585:: with SMTP id m127mr829804vkg.34.1557386747887;
 Thu, 09 May 2019 00:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190509064635.1445-1-yamada.masahiro@socionext.com> <CA+icZUV03ZF_FWMMyY=36-zQZPWO0YUBuSs9bjQqpmXJzVYYRA@mail.gmail.com>
In-Reply-To: <CA+icZUV03ZF_FWMMyY=36-zQZPWO0YUBuSs9bjQqpmXJzVYYRA@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 9 May 2019 16:25:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNATgQaHU+6WiMvx0AAf=9AJ5nrL8f8=SJMOCJNQNb_=X1w@mail.gmail.com>
Message-ID: <CAK7LNATgQaHU+6WiMvx0AAf=9AJ5nrL8f8=SJMOCJNQNb_=X1w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add some extra warning flags unconditionally
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 9, 2019 at 4:11 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Thu, May 9, 2019 at 8:47 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > These flags are documented in the GCC 4.6 manual, and recognized by
> > Clang as well. Let's rip off the cc-option / cc-disable-warning switches.
> >
>
> BTW, is this a speedup when doing CC/LD FLAGS etc checks unconditionally?

Yes.
cc-option is somewhat costly because it invoked the compiler to
check if the given flag is supported.

So, I want to get rid of as many cc-option calls as possible.


> Asking in general - do you have any numbers :-)?

Removing a couple of cc-options does not make
a measurable difference in general use-cases.

But, this might be more beneficial for chrome OS
because $(CC) is a wrapper and invoking it is much more expensive.




>
> - Sedat -
>
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  scripts/Makefile.extrawarn | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > index 523c4cafe2dc..3ab8d1a303cd 100644
> > --- a/scripts/Makefile.extrawarn
> > +++ b/scripts/Makefile.extrawarn
> > @@ -23,15 +23,16 @@ warning-  := $(empty)
> >  warning-1 := -Wextra -Wunused -Wno-unused-parameter
> >  warning-1 += -Wmissing-declarations
> >  warning-1 += -Wmissing-format-attribute
> > -warning-1 += $(call cc-option, -Wmissing-prototypes)
> > +warning-1 += -Wmissing-prototypes
> >  warning-1 += -Wold-style-definition
> > -warning-1 += $(call cc-option, -Wmissing-include-dirs)
> > +warning-1 += -Wmissing-include-dirs
> >  warning-1 += $(call cc-option, -Wunused-but-set-variable)
> >  warning-1 += $(call cc-option, -Wunused-const-variable)
> >  warning-1 += $(call cc-option, -Wpacked-not-aligned)
> >  warning-1 += $(call cc-option, -Wstringop-truncation)
> > -warning-1 += $(call cc-disable-warning, missing-field-initializers)
> > -warning-1 += $(call cc-disable-warning, sign-compare)
> > +# The following turn off the warnings enabled by -Wextra
> > +warning-1 += -Wno-missing-field-initializers
> > +warning-1 += -Wno-sign-compare
> >
> >  warning-2 := -Waggregate-return
> >  warning-2 += -Wcast-align
> > @@ -39,8 +40,8 @@ warning-2 += -Wdisabled-optimization
> >  warning-2 += -Wnested-externs
> >  warning-2 += -Wshadow
> >  warning-2 += $(call cc-option, -Wlogical-op)
> > -warning-2 += $(call cc-option, -Wmissing-field-initializers)
> > -warning-2 += $(call cc-option, -Wsign-compare)
> > +warning-2 += -Wmissing-field-initializers
> > +warning-2 += -Wsign-compare
> >  warning-2 += $(call cc-option, -Wmaybe-uninitialized)
> >  warning-2 += $(call cc-option, -Wunused-macros)
> >
> > --
> > 2.17.1
> >
> > --
> > You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> > To post to this group, send email to clang-built-linux@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20190509064635.1445-1-yamada.masahiro%40socionext.com.
> > For more options, visit https://groups.google.com/d/optout.



-- 
Best Regards
Masahiro Yamada
