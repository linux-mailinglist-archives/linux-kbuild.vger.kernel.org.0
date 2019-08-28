Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95DCEA08D2
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2019 19:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfH1RoZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 13:44:25 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37124 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbfH1RoY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 13:44:24 -0400
Received: by mail-pg1-f194.google.com with SMTP id d1so119712pgp.4
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2019 10:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=94qXpyDS0THtDB4WwXpF5NYofHpbK853mMaCrKH08oM=;
        b=o51zeIqcgVO6XFBOHsGkXHI9eeRg/kCORZP7XWGbUheVDyBBM2P4l0hhh5v7/lW4Fh
         /BoFhmwS0DOaaW2h8Hap//X+4QGMXUnx+Xzz6IntmHCaJfSE3obLQYBEGe1DB6ugUGoo
         187CxLdT4hE4uF3QL8ysoCmkBexkp5qW52gCbIuAPoU/rdx/9E5M+S0Fk3yHkhsBtFJZ
         9RVIQHxsjqIUvfDohrYhN7A7cOwUE1sz5ZRcIMfgBkOH+goBi/O1ePCpfIEt7j/2vel1
         WQFgofcRJko1f6UyzH2zJy95gHdN1v2I7bLPjQjuQBc7/j8hoGn/do3SHZgLcIZkNVko
         NpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=94qXpyDS0THtDB4WwXpF5NYofHpbK853mMaCrKH08oM=;
        b=ewabNATpiBT+wDu0BjhJE/MS/L6N4AzNhbDSrCOnJ1VUQ8hLHfSdfghyGb061DsNoi
         zqaI6Rhg/iTYsNRi1MQfLGCtLkokTbCWo8PaQ2uvjRMU/K3kTZ824CNx4PHzzn8OG2gB
         Ml8pgvsZPmAkvGTgqN4epszRR3FKcnofeSrRL+DeB5qvFJqQm6oLGQk6VuHSpU/AV/PP
         6UEoG1CEqLU3aucFLj8sZXV6jJS9LsjqyXsnycAmFGVH8Dd16jo5Ehiif8bsvdCnPWyc
         qSB1nZMEk/XbFWewOASNpJnA1A/TjNXQsUpG+VGEYDNUKjVCtviJwkwC/rTDo7yHbTAd
         LjKw==
X-Gm-Message-State: APjAAAUeA+JS7iW1aerqdxOhAv727M54nneL48iKbsYPbf9jPtsR5gF8
        y8Df0CacixAEYMYyZuBnep+SR3A0d58joy4LK6QFMw==
X-Google-Smtp-Source: APXvYqxUoj2b1JtWGXB1HZKQs9OM6muwZaa8rYV9vepLadTGApisRJFpy3gzexw1zj9C9HU5EgImTlUmQvJ0m617STE=
X-Received: by 2002:a17:90a:ac02:: with SMTP id o2mr5499971pjq.134.1567014263717;
 Wed, 28 Aug 2019 10:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190815225844.145726-1-nhuck@google.com> <20190827004155.11366-1-natechancellor@gmail.com>
 <CAK7LNATHj5KrnFa0fvHjuC-=5mV8VBT14vrpPMfuNKWw7wabag@mail.gmail.com>
 <CANiq72ndWZWD-KBT1s-mUxQNa1jaD7oDaCB2+NPiT1chf14Z_g@mail.gmail.com> <CAKwvOdkuDPfOusJRneeTzg7tZ4VKxaRCNg2SgmjVas58cDwe8w@mail.gmail.com>
In-Reply-To: <CAKwvOdkuDPfOusJRneeTzg7tZ4VKxaRCNg2SgmjVas58cDwe8w@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 28 Aug 2019 10:44:12 -0700
Message-ID: <CAKwvOdnOo3RXm3cx5YDtPyM=9Ry7kss-i4HzjxQkK4pjE-n9Lw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Do not enable -Wimplicit-fallthrough for clang
 for now
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Huckleberry <nhuck@google.com>,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 28, 2019 at 10:39 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Aug 28, 2019 at 9:45 AM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Wed, Aug 28, 2019 at 6:21 PM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > >
> > > Applied to linux-kbuild. Thanks.
> > >
> > > (If other clang folks give tags, I will add them later.)
> >
> > Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
>
> I verified that GCC didn't get support for -Wimplicit-fallthrough
> until GCC ~7.1 release, so the cc-option guard is still required.
> Acked-by: Nick Desaulniers <ndesaulniers@google.com>
> Thanks for the patch Nathan.

Also, there's an inconsistency between Makefile vs
scripts/Makefile.extrawarn that's been bugging me: it seems we enable
GCC only flags in Makefile, then disable certain Clang flags in
scripts/Makefile.extrawarn.  Not necessary to fix here and now, but I
hope one day to have one file that has all of the compiler specific
flags in one place (maybe its own file), so I only have to look in one
place.  I know, I know, "patches welcome." ;)

-- 
Thanks,
~Nick Desaulniers
