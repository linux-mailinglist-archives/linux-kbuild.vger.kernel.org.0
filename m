Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58E0C16FF07
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Feb 2020 13:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgBZMaq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Feb 2020 07:30:46 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51991 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgBZMap (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 07:30:45 -0500
Received: by mail-wm1-f67.google.com with SMTP id t23so2869694wmi.1;
        Wed, 26 Feb 2020 04:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=SW3Nz/sbE0+KtIPXD7/IukM64fIQO4nr5iakHdwv+8c=;
        b=VYvrhIlIc/nn4uIyORMlAtvbfxMOiT3mijSBmAkJOJCXlYHPKmAZWm8Qu8DjfNq69a
         6qWc5BP6vQ6k+tbeSPHkcgwDT4gUGnl0IhvsdbC5+AhKVGl3hqF1BBB4amQzsMBu6Qu6
         vLToXjRcqC2HC4ghB8LzPhJNF/LB1KFk85Tb5mthERwS7R7pP97Z4yy28/puGXRz5D6B
         tbnC1k7V6psu06x6eq+MA6jTdorEwsPi6CdB/fY7TL/4FEFRo2LWLX60+wImu3QXmVHX
         t7/EiXpONHX9WCAGF+JeAuMVT/VhBA42+KaydXVn5MtCTUuRozDX7Atn0CTUU8w0S62A
         KPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=SW3Nz/sbE0+KtIPXD7/IukM64fIQO4nr5iakHdwv+8c=;
        b=F6rDIAy1TX8vJaW8W/sLLlZ6q4B1wBaj9eAbBM4FvHLIh9zUvAWOJy9IeSDqCvXigk
         iDaNOq+MbCtk16q/HkC8j7EdxcD9G3hTnV8fB49+Tfo4PLkVdILVmRbxrNqPusevbcaY
         0lN7aiczMn3E8IHQC2rRoHM+2JuykO/glQQuMmm+uP45S2EOTleODALNRummSZ2pxKlF
         9OiJ9MCaU9SAovagEjWtL0Hf2BaWYkRgfxWtQaI8g2QGdNDJqDmAK/5LhSd3mp5DXQr+
         7qyNakzPCrP7/qwEpgb/6zBp850hQlsV7fW7ZprfdSwWD3/bz555Paio7XPzrMNLgP9m
         ZSdQ==
X-Gm-Message-State: APjAAAUg5QlUCVTJJsCKymfd+jZiU1JFarfJqwIekBPwBPSyWinYnEbl
        4YVuah9k5rap1nLmBe1FcMX7xH0jtzVQZiO8CI8=
X-Google-Smtp-Source: APXvYqy8uKiowdSlomhD1NsRVW6CgtErWAKIm+QpbjJVYpi04BrtIv00ZlgOX+VPHSK95fB6a6qX2du+JM+QQ1T997A=
X-Received: by 2002:a7b:cc69:: with SMTP id n9mr4924083wmj.163.1582720243510;
 Wed, 26 Feb 2020 04:30:43 -0800 (PST)
MIME-Version: 1.0
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <CAK7LNASNsOmyqFWYtJHB4UcHAed5C_isWvMJ4MKHu0O=yUy=8w@mail.gmail.com>
 <CAKwvOd=mPg79CrYnDm8=z0iJpKL0FHm9J5qZF0_A6BFXBv8Dow@mail.gmail.com> <CAK7LNAQ83rLAm1GcvrgJbinyAVPpM_SoxfO7RdOAfmXyg2tBdQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQ83rLAm1GcvrgJbinyAVPpM_SoxfO7RdOAfmXyg2tBdQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 26 Feb 2020 13:33:13 +0100
Message-ID: <CA+icZUWSQkYD2MzEY_8U1NMY8LO5NzD0CCuZ8+cH+dBndJm=yQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/ Clang/LLVM
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 26, 2020 at 1:01 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Feb 26, 2020 at 5:52 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Mon, Feb 24, 2020 at 4:34 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > On Tue, Feb 25, 2020 at 2:41 AM Nick Desaulniers
> > > <ndesaulniers@google.com> wrote:
> > > >
> > > > Added to kbuild documentation. Provides more official info on building
> > > > kernels with Clang and LLVM than our wiki.
> > > >
> > > > Suggested-by: Kees Cook <keescook@chromium.org>
> > > > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > > ---
> > >
> > >
> > > Perhaps, is it better to explicitly add it to MAINTAINERS?
> > >
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -4118,6 +4118,7 @@ W:        https://clangbuiltlinux.github.io/
> > >  B:     https://github.com/ClangBuiltLinux/linux/issues
> > >  C:     irc://chat.freenode.net/clangbuiltlinux
> > >  S:     Supported
> > > +F:     Documentation/kbuild/llvm.rst
> > >  K:     \b(?i:clang|llvm)\b
> >
> > I'm happy to leave it to the maintainers of Documentation/.  Otherwise
> > we have a file for which there is no MAINTAINER, which seems
> > ambiguous.
>
> It is common that MAINTAINERS lists per-file (per-driver) maintainers.
> It does not necessarily mean a person who picks up patches.
>
> scripts/get_maintainer.pl lists maintainers that
> match any F:, N:, K: patterns.
> So, both Doc and Kbuild maintainers/ML will still be listed.
>
> Having said that, it is up to you. Either is fine with me.
> Another pattern 'K: \b(?i:clang|llvm)\b'  covers this file anyway.
>
>
> (BTW, I am also happy to see your name as the maintainer of this entry.)
>

+1 (Please drop the BTW - This was suggested in the brainstorming
session on the ClangBuiltLinux Meetup in Zurich).

I suggest to add Nathan and Kees if they are willing to be responsible
for the maintainer job.

- Sedat -
