Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11B818F736
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2019 00:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731206AbfHOWvE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Aug 2019 18:51:04 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38022 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfHOWvE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Aug 2019 18:51:04 -0400
Received: by mail-pl1-f196.google.com with SMTP id m12so1619843plt.5
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2019 15:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/v3iWh/+wCNK2FG7LH7UyEMlyFu2SkyD9UW+AeAr0AY=;
        b=ZhpZ9v79BhyT+jH8/5OzUlji+S94UShd+bAFGRKrzTz0BoaqZq3XWKiNqfUgebGO6e
         S8F+EqE31kliFNJaCz2QQluFj/eO5c/Jk+WQWsK7M2YjLn8ohio8UURhp6NFNYGrEHtl
         woKRoop1IizdfzC6bg/2KcTIvWMLqph4uiqzQEgonIb214ZmC55nbufyOtC4G+nJGIoW
         lQvJZtTCEG4POS0t/pruyd30q3s8qZWvWDN7MZ8TLUCqVm3Incx10VysyBs3t+zHfkkb
         rUL9/T2+l/fCo+v2W666H9+QebYamw1YpaHxNRgCnkWuEdS5DJYO68o7ZxogamgS5Ivr
         QrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/v3iWh/+wCNK2FG7LH7UyEMlyFu2SkyD9UW+AeAr0AY=;
        b=X8YxefaTfZzS68HRuxZB7tkhhZHu/zMZqhB3Xf6MRyFMDZkjCLNyv3A6LJCqcD58vg
         /Q4b81KIrIuOklgu+zyD269C5dDK/z6jRKQ/x//LA//b9M4YcjSQKHHtz446Be+t1tSf
         H+1pG8kZqVJvRvJWfmXVwecNJ9bxfPVZtxKTlZiG58pqpiz9rWMuHDqSi0wUBWeCY3re
         nDXy7LIafwmEhBCGjKuCtccaz0W3oxLNQD+w+Dt3DFdmIan9P4QjGkL/Do1BrF02vyYI
         lDPNcgGZU82Dk862j9AaALDDk4wji/NS/cpK4hvQKTfTKfvInXcaE/zVNExHRbtJJ/h5
         4twg==
X-Gm-Message-State: APjAAAU6OnvzaVghT/do+hS8DFOg5xj/S3vUf5vBPqvHp0tyojJtO0ef
        Vmz5pwdAvpsI/oxTOl1EK75qx9F6Ng7QEG+JbtCbpw==
X-Google-Smtp-Source: APXvYqxVmYDdpPz43OO5Ppbbh15GD3kJ/Tw9SJrXlqJFN/feM4Pwr7eulmP5KHo/fcaDIU+gPMQ1Yi3F+XS/Qf4+0/Y=
X-Received: by 2002:a17:902:a9c3:: with SMTP id b3mr6292093plr.179.1565909463409;
 Thu, 15 Aug 2019 15:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190815182029.197604-1-nhuck@google.com> <20190815204529.GA69414@archlinux-threadripper>
In-Reply-To: <20190815204529.GA69414@archlinux-threadripper>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 15 Aug 2019 15:50:52 -0700
Message-ID: <CAKwvOdk+NQCKZ4EXAukaKYK4R9CDaNWVY_aDxXaeQrLfo_Z=nw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Require W=1 for -Wimplicit-fallthrough with clang
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Joe Perches <joe@perches.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 15, 2019 at 1:45 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Thu, Aug 15, 2019 at 11:20:29AM -0700, 'Nathan Huckleberry' via Clang Built Linux wrote:
> > Clang is updating to support -Wimplicit-fallthrough on C
> > https://reviews.llvm.org/D64838. Since clang does not
> > support the comment version of fallthrough annotations
> > this update causes an additional 50k warnings. Most
> > of these warnings (>49k) are duplicates from header files.
> >
> > This patch is intended to be reverted after the warnings
> > have been cleaned up.
> >
> > Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> > ---
> >  Makefile                   | 4 ++++
> >  scripts/Makefile.extrawarn | 3 +++
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/Makefile b/Makefile
> > index 1b23f95db176..93b9744e66a2 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -846,7 +846,11 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
> >  KBUILD_CFLAGS += -Wdeclaration-after-statement
> >
> >  # Warn about unmarked fall-throughs in switch statement.
> > +# If the compiler is clang, this warning is only enabled if W=1 in
> > +# Makefile.extrawarn
> > +ifndef CONFIG_CC_IS_CLANG
> >  KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
> > +endif
> >
> >  # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
> >  KBUILD_CFLAGS += -Wvla
> > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > index a74ce2e3c33e..e12359d69bb7 100644
> > --- a/scripts/Makefile.extrawarn
> > +++ b/scripts/Makefile.extrawarn
> > @@ -30,6 +30,9 @@ warning-1 += $(call cc-option, -Wunused-but-set-variable)
> >  warning-1 += $(call cc-option, -Wunused-const-variable)
> >  warning-1 += $(call cc-option, -Wpacked-not-aligned)
> >  warning-1 += $(call cc-option, -Wstringop-truncation)
> > +ifdef CONFIG_CC_IS_CLANG
> > +KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
>
> Shouldn't this be warning-1?

+1

>
> > +endif
> >  # The following turn off the warnings enabled by -Wextra
> >  warning-1 += -Wno-missing-field-initializers
> >  warning-1 += -Wno-sign-compare
> > --
> > 2.23.0.rc1.153.gdeed80330f-goog
> >
>
> I am still not a huge fan of the CONFIG_CC_IS_CLANG ifdefs but I don't
> really see a much cleaner way to get around this. Some that come to
> mind:
>
> * Leave Makefile alone and add
>
> KBUILD_CFLAGS += -Wno-implicit-fallthrough
>
> in the CONFIG_CC_IS_CLANG section of scripts/Makefile.extrawarn

Yeah, I think this might be cleaner.  -Wimplicit-fallthrough
-Wno-implicit-fallthrough will be passed to Clang, but "last one
wins."  A smaller patch makes it more likely to be revertable without
potentially having to resolve any conflicts.  Would you mind sending a
V2 with that change? You can include Nathan's Suggested-by tag.
-- 
Thanks,
~Nick Desaulniers
