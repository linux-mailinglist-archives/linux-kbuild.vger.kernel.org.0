Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6B754119C3
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Sep 2021 18:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbhITQ23 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Sep 2021 12:28:29 -0400
Received: from mail-ua1-f52.google.com ([209.85.222.52]:39439 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbhITQ21 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Sep 2021 12:28:27 -0400
Received: by mail-ua1-f52.google.com with SMTP id o13so11529695uat.6;
        Mon, 20 Sep 2021 09:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9xo0jIRnxuOOhc30CoYi6LuiF/umxAgJKZ4MGnDGawY=;
        b=AvbAGzmFZrVlKy02rhpai2UDe2k2fRcVQCIo8Cf5AP/tqrfdBVVqyhHDCGwVloe8GA
         i1Y+ItCUBbpJps8OjHbxe5ce1r/TzjRnz3njhy3XP5/0Nn+SrSbCASMbhGurJ0VDf0CF
         Sv8/55IjhgONNhrn6xLPlDoCuGn7SJUt10L/CrPRHn6eI5q9gQ1jJUWhyFLElXH9Tmt1
         bZM5hV2y+sqxFsKDT1LN3XKQq1Kea8jnmScItGLZRqB9uXpfogHTd+S4NZrMNJtnEHDf
         Ax9Kdr+kC2JAHEFC/HAthiHSA4jJjl2lS7V6AemPEj1MPFOa+HAFY1MecWYb+jjbu+Ly
         HinA==
X-Gm-Message-State: AOAM533GBVXpl2NVjfxeQGFZW/t1rw/hT6Qs6T22J0IxAyIj1r1UAELu
        7LjRf+xMJ6wU+U3NaGNZs+uedINMh7s3YeGwjLQ=
X-Google-Smtp-Source: ABdhPJwoB/0/VBD9Bv7XJkpjjyCTFva9x1S/l0eGg68vZoWX7Uope7tWe5j8vOPoSsjhkKDy81kIFBG7m6cIsfz+iVo=
X-Received: by 2002:ab0:6dc7:: with SMTP id r7mr12548577uaf.14.1632155219490;
 Mon, 20 Sep 2021 09:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210907183843.33028-1-ndesaulniers@google.com>
 <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
 <CAKwvOdkuYoke=Sa8Qziveo9aSA2zaNWEcKW8LZLg+d3TPwHkoA@mail.gmail.com>
 <YTfkO2PdnBXQXvsm@elver.google.com> <CAHk-=wgPaQsEr+En=cqCqAC_sWmVP6x5rD2rmZRomH9EnTQL7Q@mail.gmail.com>
 <c8fb537f-26e5-b305-6bc5-06f0d27a4029@infradead.org> <20210913093256.GA12225@amd>
 <YT8d5a6ZVW7JlsRl@kroah.com> <20210913100230.GB11752@amd>
In-Reply-To: <20210913100230.GB11752@amd>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Sep 2021 18:26:48 +0200
Message-ID: <CAMuHMdXGK165nXPJSDdB1hsAfqu3nprXtskZz4z1GcgH_vz+ow@mail.gmail.com>
Subject: Re: [PATCH] Revert "Enable '-Werror' by default for all kernel builds"
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Marco Elver <elver@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        llvm@lists.linux.dev,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-toolchains@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Kees Cook <keescook@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vipin Sharma <vipinsh@google.com>,
        Chris Down <chris@chrisdown.name>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 13, 2021 at 12:50 PM Pavel Machek <pavel@ucw.cz> wrote:
> > > Do we really want developers treat warnings as errors? When the code
> > > is okay but some random version of gcc dislikes it...
> > >
> > > Plus, there's question of stable. We already get ton of churn there
> > > ("this fixes random warning"). WERROR will only encourage that...
> >
> > I will not be backporting this patch to older stable kernels, but I
> > _want_ to see stable builds build with no warnings.  When we add
> > warnings, they are almost always things we need to fix up properly.
>
> Well, everyone _wants_ to see clean builds... unless the price is too
> high.
>
> > Over time, I have worked to reduce the number of build warnings in older
> > stable kernels.  For newer versions of gcc, sometimes that is
> > impossible, but we are close...
>
> You clearly can't backport this patch, but for 5.16-stable, you'll
> have it in, and now warnings are same as errors... and I don't believe
> that's good idea for stable.

The good thing about the config option is that there's now a single point
to enable or disable -Werror.  In the past, maintainers sprinkled -Werror
all over the various Makefiles in the tree, which means you have to
edit multiple files to disable it again.

Background: I've been investigating an issue that involved building old
v2.6.x kernels. Apart from having to use very old compilers, it still caused
compiler warnings that obviously weren't seen with the slightly different
compiler versions used by maintainers who added -Werror.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
