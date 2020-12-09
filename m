Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40D7C2D43AA
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Dec 2020 15:01:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732125AbgLIN5n (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Dec 2020 08:57:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:53002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732618AbgLIN5e (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Dec 2020 08:57:34 -0500
X-Gm-Message-State: AOAM531xsR/FJx09ztdBroVjxeLQAXTNihlFTQd5DuJUKk834ILEpu+2
        1K/OhOTBxXUTnObrcY6pLxzPiHTV61AiSa4FdB0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607522213;
        bh=Wxk4863HKHEe6I1SF/Ftfz8urpyIwnx+GowgkvmdTEM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OhO+J7cezWdo79Dq60bATHREUCc5Zb85lYB99a5Z3AMvgAM1wwqc3qRjWmWsI1qcm
         ZMppCu2Cik9QLIqOH5E/UpCbQ4TI2tY/ImAmtXWvIletNk4+JAws1r4YtMHmLHN02D
         NPeJmHdyRnMslLIaM4eb60HFnThXI3c4PRysGJ+GOTasPnE2Txs0BESRPHwuUIMELM
         gMEltWMvwMGEkoy9nZyEphtNC2B9Sgn95xN6l7YM9MoZ7IKyWxHQIMvH6hCbYg5Rmd
         mQ87Nar0sGbXGlK7+vwAXD45zb+I8Wi8r8kCAq7QKZrgYQkC3n5alU3MxwrvMUpAxj
         Jz1NXSZcwQFzw==
X-Google-Smtp-Source: ABdhPJyeU4UwaJeT0CWIh/z9PwvumXuXQQqsTpeFYpQEVXfq2HJZLNqfbHg5g3Fj5hgIKlnzcR/FeRJuZI9xL8QS7lw=
X-Received: by 2002:a17:906:4e53:: with SMTP id g19mr2127255ejw.454.1607522211686;
 Wed, 09 Dec 2020 05:56:51 -0800 (PST)
MIME-Version: 1.0
References: <20201209122437.GA26815@kozik-lap> <20201209130709.GB15469@nautica>
In-Reply-To: <20201209130709.GB15469@nautica>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 9 Dec 2020 14:56:39 +0100
X-Gmail-Original-Message-ID: <CAJKOXPfXkZdVUuunpvLOCEim0TfRwG62hvrZu_R8vGkA+ZOapQ@mail.gmail.com>
Message-ID: <CAJKOXPfXkZdVUuunpvLOCEim0TfRwG62hvrZu_R8vGkA+ZOapQ@mail.gmail.com>
Subject: Re: Broken /usr/bin/env (invalid option)
To:     Dominique Martinet <asmadeus@codewreck.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 9 Dec 2020 at 14:13, Dominique Martinet <asmadeus@codewreck.org> wrote:
>
> Krzysztof Kozlowski wrote on Wed, Dec 09, 2020:
> > Your commit ece075366294 ("ld-version: use /usr/bin/env awk for
> > shebank") breaks current linux-next on Ubuntu 16.04:
> >
> >     $ make defconfig
> >
> >     make[1]: Entering directory '/mnt/data2/linux/linux-upstream/out'
> >       GEN     Makefile
> >     *** Default configuration is based on 'multi_v7_defconfig'
> >     /usr/bin/env: invalid option -- 'S'
> >     Try '/usr/bin/env --help' for more information.
> >     init/Kconfig:39: syntax error
> >     init/Kconfig:38: invalid statement
> >     ../scripts/kconfig/Makefile:80: recipe for target 'defconfig' failed
> >     make[2]: *** [defconfig] Error 1
> >     /mnt/data2/linux/linux-upstream/Makefile:602: recipe for target 'defconfig' failed
> >     make[1]: *** [defconfig] Error 2
> >     make[1]: Leaving directory '/mnt/data2/linux/linux-upstream/out'
> >     Makefile:185: recipe for target '__sub-make' failed
> >     make: *** [__sub-make] Error 2
> >
> > https://krzk.eu/#/builders/12/builds/1170/steps/4/logs/stdio
> >
> > It's not possible to build anything...
>
> Hm, what version of env is that?
> I only checked on a couple of systems that env -S exists, but it might
> not be available (e.g. now I'm looking, at least busybox env does not
> provide -S)

$ env --version
env (GNU coreutils) 8.25

> OTOH, we need -S to split arguments because the kernel splits the
> shebang as [binary, single argument], so without it awk wouldn't work.

None of the other scripts use 'env -S', maybe for the reason.

> Apparently gawk can work without an explicit -f is invoked as gawk (so
> could be used without -S), but that won't be much better wrt
> compatibility in my opinion.
>
>
> I don't see any way to make this work out of the box for me (awk not in
> /usr/bin) and you (env not supporting -S), but I guess I can keep that
> patch around locally...

You could add a wrapper which uses PATH or searches for the awk...
kind of reimplement other tools. Another solution is to clearly
document the requirements for the build system and explicitly say that
older systems like four-year Ubuntu are not supported.

Best regards,
Krzysztof
