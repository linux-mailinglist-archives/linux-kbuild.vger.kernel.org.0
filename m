Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63F6F326C0A
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Feb 2021 07:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbhB0G4T (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Feb 2021 01:56:19 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:44448 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhB0G4T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Feb 2021 01:56:19 -0500
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 11R6tHvD029484;
        Sat, 27 Feb 2021 15:55:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 11R6tHvD029484
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614408917;
        bh=bHffv351LtHI0LzqaBGpYJnkjtPtn6I884Zf4L50dws=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=e6sy3FPUht0xrp+ulnLBX1ai8s9jAuI/wE0xaEkH2BYO+qcR1CfnVO7+6SVK3u6fv
         8NZB2kjSjbkhZFqCi0PpfHayFzZtC62gTLjJVaWQdShYh31kVVfQKmzq4VdDTeQpPX
         mp1SiLVHOcOldseHcw0DqqoTZO5knOpuAXcSz08a4O8DUlko9MkhO0AmZay0iP28jF
         VYZhSB+WUpGGIpenv+0oalS/HG6UR7ntDETh7nMeHFnAbZfS2w833ndZSqVKyWuGco
         pPC+WsUgtpf3QqeYixbyAfYlmCgqzi9oZvlFtQaN555Pi7zZTW/00asuAhAnFYlKaX
         iePhUxvgKy4tA==
X-Nifty-SrcIP: [209.85.210.180]
Received: by mail-pf1-f180.google.com with SMTP id 201so7774198pfw.5;
        Fri, 26 Feb 2021 22:55:17 -0800 (PST)
X-Gm-Message-State: AOAM532riPo1jg9lhisUIlBw1qa4iCY4+G5dX2pexnJ/Yi1M2sgo2J7a
        WaCzn8r0Nn9CzQLBY0F0UZRlN5Dj2AOYMCe7DcY=
X-Google-Smtp-Source: ABdhPJyZn4kUkkoqOs7sfR9iAupy1Oo7fwn/GRCA9/SQl0DFc80L7dqVoXZVyI06m3DD6jxn0Sipf4hpI2RFxephv7A=
X-Received: by 2002:a62:1412:0:b029:1ec:bc11:31fd with SMTP id
 18-20020a6214120000b02901ecbc1131fdmr6450801pfu.76.1614408916611; Fri, 26 Feb
 2021 22:55:16 -0800 (PST)
MIME-Version: 1.0
References: <20210226062548.3334081-1-masahiroy@kernel.org> <CA+icZUXYLVjs-hXEu_5Vy=TdNvOHhyiXe=hc-jc7SAU04Dtstw@mail.gmail.com>
In-Reply-To: <CA+icZUXYLVjs-hXEu_5Vy=TdNvOHhyiXe=hc-jc7SAU04Dtstw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 27 Feb 2021 15:54:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNARmQzJwUWcYPj9QKZatYpC6-gegTuJiAvyhR==8ezWdHg@mail.gmail.com>
Message-ID: <CAK7LNARmQzJwUWcYPj9QKZatYpC6-gegTuJiAvyhR==8ezWdHg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: fix UNUSED_KSYMS_WHITELIST for Clang LTO
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 26, 2021 at 6:26 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Fri, Feb 26, 2021 at 7:26 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Commit fbe078d397b4 ("kbuild: lto: add a default list of used symbols")
> > does not work as expected if the .config file has already specified
> > CONFIG_UNUSED_KSYMS_WHITELIST="my/own/white/list" before enabling
> > CONFIG_LTO_CLANG.
> >
> > So, the user-supplied whitelist and LTO-specific white list must be
> > independent of each other.
> >
> > I refactored the shell script so CONFIG_MODVERSIONS and CONFIG_CLANG_LTO
> > handle whitelists in the same way.
> >
> > Fixes: fbe078d397b4 ("kbuild: lto: add a default list of used symbols")
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> > Changes in v2:
> >   - Rebase on top of Arnd's patch:
> >     https://lore.kernel.org/lkml/20210225143456.3829513-1-arnd@kernel.org/
> >
> >  init/Kconfig                    |  1 -
> >  scripts/gen_autoksyms.sh        | 35 ++++++++++++++++++++++++---------
> >  scripts/lto-used-symbollist.txt |  6 ------
>
> People who want to use their own "white-listed" (allow-listed)
> symbollist-file can do that via
> CONFIG_UNUSED_KSYMS_WHITELIST="my/own/white/list".
> Correct?
>
> Why do you delete the default "scripts/lto-used-symbollist.txt" file
> and remove the default in the appropriate Kconfig for people who want
> to enable Clang-(Thin)LTO?
> These people should now use
> CONFIG_UNUSED_KSYMS_WHITELIST="scripts/lto-used-symbollist.txt"?
> But again - the file was deleted with your patch.
> Do I miss something?

I think so.

I moved those symbols to scripts/gen_autoksyms.sh





-- 
Best Regards
Masahiro Yamada
