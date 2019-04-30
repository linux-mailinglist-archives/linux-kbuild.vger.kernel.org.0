Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2A4F312
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Apr 2019 11:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfD3Jd6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Apr 2019 05:33:58 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40922 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbfD3Jd6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Apr 2019 05:33:58 -0400
Received: by mail-ed1-f66.google.com with SMTP id e56so5381067ede.7;
        Tue, 30 Apr 2019 02:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xXVuZT9o/FNmvDm0pIXd3RCS4RdZ9uBOKl62XaEXi0s=;
        b=OEWC0960b3sBt4NuJ41uUOatQP99aY0qXghC+CPlWl4EbzU8FIIufaO25Z0Bfu2/tn
         G8Q7QzNsoCSviGltVES/70t0cltU3Ah5wSE4sLjU15wDNuIoWFeK6OrKK+JBW7G4Juap
         80Wwdv23RT3j29Pu9PriyP1bzYcaDfTQ+kU+lLZYPWvXUcB1ohgNaDOjYuATbSNDZgW1
         ACfu4iwANtRp9Z23ebHqMjQ1DQpETFv8Dz7PXJRG6ksS72lKw/Z7SB0T0IvQtXr9S82t
         ITC4/ggMuWwwsP8UbO1P7tYbrQqPHl7Qe5HKtyJjDdJH6wm4HelbihUIXxmjam8GvwNh
         NCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xXVuZT9o/FNmvDm0pIXd3RCS4RdZ9uBOKl62XaEXi0s=;
        b=a7j+ucBQJ4v5G24v7E0At7btgWW0t9r1xKP1k16PoGqynSGsWka28yg1VbmGfheeiv
         K5u7B+4FcHEDM5nQLYjtS4LBFr9zATGgS5aKnW2x+IkLkgYe6lps9jFCqKmz0p3Z8wv8
         6sZtZLKFoosKfu/wSFsnr2cEXjZ6F8Tmx0+qHgYjXsPaG29mYRmdubrZfxStMMomioFD
         KcWGokTzt4+g51Wu+TCu+m5b52TN37OUeaM8/R6oNHZbCmipN9VKVHmeY9iyDuXj2dy2
         sC4iTPq+tUszEsPgAsnR60r0wjrb4/4jy1Jd0iN8sj52RJjHP7SzyQoENM3SCu/Z7SqE
         ZbYw==
X-Gm-Message-State: APjAAAXZh+yD0ndQmULDWK5UatC/7+Vq/5tLefeDY96hujKth5u6OHGf
        c6E7x2v2iYkX9ElMPxPppTk=
X-Google-Smtp-Source: APXvYqyI6XSUvzs/j55ZG4mgA3Ho9zCb0zC9LtbFNbGktxZFDeY7EI+uYi9vzGFZTWpui/wM21Qrtw==
X-Received: by 2002:a50:a3c5:: with SMTP id t5mr18488914edb.191.1556616836688;
        Tue, 30 Apr 2019 02:33:56 -0700 (PDT)
Received: from archlinux-i9 ([2a01:4f9:2b:2b84::2])
        by smtp.gmail.com with ESMTPSA id r4sm3443236edp.78.2019.04.30.02.33.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Apr 2019 02:33:54 -0700 (PDT)
Date:   Tue, 30 Apr 2019 02:33:52 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] kbuild: Enable -Wsometimes-uninitialized
Message-ID: <20190430093352.GA16941@archlinux-i9>
References: <20190430010037.6216-1-natechancellor@gmail.com>
 <CAK8P3a0gAnruPgGMFcAfoHpj_zDnsn-RJjYiYUXDDj-CrwoO8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0gAnruPgGMFcAfoHpj_zDnsn-RJjYiYUXDDj-CrwoO8A@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 30, 2019 at 09:16:50AM +0200, Arnd Bergmann wrote:
> On Tue, Apr 30, 2019 at 3:01 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > This is Clang's version of GCC's -Wmaybe-uninitialized. Up to this
> > point, it has not been used because -Wuninitialized has been disabled,
> > which also turns off -Wsometimes-uninitialized, meaning that we miss out
> > on finding some bugs [1]. In my experience, it appears to be more
> > accurate than GCC and catch some things that GCC can't.
> >
> > All of these warnings have now been fixed in -next across arm, arm64,
> > and x86_64 defconfig/allyesconfig so this should be enabled for everyone
> > to prevent more from easily creeping in.
> >
> > As of next-20190429:
> >
> > $ git log --oneline --grep="sometimes-uninitialized" | wc -l
> > 45
> >
> > [1]: https://lore.kernel.org/lkml/86649ee4-9794-77a3-502c-f4cd10019c36@lca.pw/
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/381
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >
> > Masahiro, I am not sure how you want to handle merging this with regards
> > to all of the patches floating around in -next but I wanted to send this
> > out to let everyone know this is ready to be turned on.
> >
> > Arnd, are there many remaning -Wsometimes-uninitialized warnings in
> > randconfigs?
> 
> No, I don't see any with the patches that I submitted. I haven't checked
> if there are any that still need to get merged into linux-next though.
> 
> > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > index 768306add591..f4332981ea85 100644
> > --- a/scripts/Makefile.extrawarn
> > +++ b/scripts/Makefile.extrawarn
> > @@ -72,5 +72,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, format)
> >  KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
> >  KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
> >  KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
> > +KBUILD_CFLAGS += $(call cc-option, -Wsometimes-uninitialized)
> >  endif
> >  endif
> 
> This doesn't look right. Shouldn't you remove the line that turns off
> -Wuninitilized
> instead of adding only -Wsometimes-uninitialized?

Well, there are still some outstanding issues with -Wuninitialized
right? Like with DECLARE_WAIT_QUEUE_HEAD_ONSTACK? I'd rather not
add warnings to the build but if you feel strongly, we could turn it on
then fix them after.

Nathan

> 
> If we warn about the instances that may or may not be wrong, we should
> also warn about those that are provably wrong.
> 
>         Arnd
