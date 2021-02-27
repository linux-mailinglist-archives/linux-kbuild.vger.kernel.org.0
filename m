Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 631BF326EDA
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Feb 2021 21:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbhB0UF5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Feb 2021 15:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbhB0UF4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Feb 2021 15:05:56 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF06C061756;
        Sat, 27 Feb 2021 12:05:15 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id z13so13408126iox.8;
        Sat, 27 Feb 2021 12:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=pPLwDk2zrlTCS7ma3hl5yenNNvgqmaQf23Nh8H3r+G0=;
        b=brdjTEjgbxgvPcS8VPwVrrOBBLqoGYBFiWx8NOR/ROph/0CFpz/kzM9Gnq0UNBOb+p
         U/xtNjc45s01upl2sNKK9vUAJfpTDUmfY4MY0FJSRtuIt61G3cavQz76eV/mLzJ+ibE7
         ga0j+ixZ75fmEiteHQfxeJRQ+TImjOEFRoTseHCKofw/ELVUUEN7aQqVey46WtZGhG7U
         vlOySm7Mlcfm9P1iEaS8JUY8jJjVROts557usSVCLWJwrRcUZP2qRziK0OKtob0mkyx8
         cUj92rLwfEZIfDdrXWRIC5Er8DWgxBC9BghCu/C649r+olrR7dUrSOTGvWJQHy+HRFUC
         eEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=pPLwDk2zrlTCS7ma3hl5yenNNvgqmaQf23Nh8H3r+G0=;
        b=sexpPxDzAzxfpu6XwDX9aNmCrd9Yu0tqQ2eBpo0zNhFmfuZROvNpchT+tVlPaPKR6x
         CJdhpol5smxQccyYWqS8sKrgy0Pg7asZ54DmPgq5YGgOEinmmo4g9B/e+tEeR+sQfX6c
         KkAHIn8dAO/+E/WBV9LeU/wHG/HeHGvH+ofehPh95tEPhOZnZ5UhD9uDtzYIDnLirsIK
         qEDQ4MGvjR7aoQ7EX14H30YFUunz8uztyxhJHVTSQOppLIEHaGBzsDw4orNz1I0tEXzq
         fzBTbRSgPlfz1yKh020mGu9GO4UYJKsYdrDXaoKkRUmzjN3zuQAxP7KwA+t/qWPeiCcW
         7rrQ==
X-Gm-Message-State: AOAM530YYwn+t2jI1jSUhhrKdlf5fH/P5kPGbjh81DDFhk85kO91+gaU
        A09Q3Ci2Wkr9L9pP84taD6OxITKIMcF47AcaazQ=
X-Google-Smtp-Source: ABdhPJzGzujnXPZz2n1OgiBLYq4n8jl/zoN4TcFPzQISesqX87BBbnvHQN0hg6rk09DNzERu5byJH2pb339L/79AYb8=
X-Received: by 2002:a5e:8c16:: with SMTP id n22mr7789426ioj.156.1614456314650;
 Sat, 27 Feb 2021 12:05:14 -0800 (PST)
MIME-Version: 1.0
References: <20210226062548.3334081-1-masahiroy@kernel.org>
 <CA+icZUXYLVjs-hXEu_5Vy=TdNvOHhyiXe=hc-jc7SAU04Dtstw@mail.gmail.com>
 <CAK7LNARmQzJwUWcYPj9QKZatYpC6-gegTuJiAvyhR==8ezWdHg@mail.gmail.com> <CA+icZUXGnOCY5O=cupmmjGnVpYA=Q=cm69ih5HrgpV9sOPozYQ@mail.gmail.com>
In-Reply-To: <CA+icZUXGnOCY5O=cupmmjGnVpYA=Q=cm69ih5HrgpV9sOPozYQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sat, 27 Feb 2021 21:05:03 +0100
Message-ID: <CA+icZUWT7hqzA=OT=HU2CqE5EBDFZa7vh3mdtyDjhFSSgv8BkA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: fix UNUSED_KSYMS_WHITELIST for Clang LTO
To:     Masahiro Yamada <masahiroy@kernel.org>
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

On Sat, Feb 27, 2021 at 8:08 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Sat, Feb 27, 2021 at 7:55 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Fri, Feb 26, 2021 at 6:26 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > >
> > > On Fri, Feb 26, 2021 at 7:26 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > >
> > > > Commit fbe078d397b4 ("kbuild: lto: add a default list of used symbols")
> > > > does not work as expected if the .config file has already specified
> > > > CONFIG_UNUSED_KSYMS_WHITELIST="my/own/white/list" before enabling
> > > > CONFIG_LTO_CLANG.
> > > >
> > > > So, the user-supplied whitelist and LTO-specific white list must be
> > > > independent of each other.
> > > >
> > > > I refactored the shell script so CONFIG_MODVERSIONS and CONFIG_CLANG_LTO
> > > > handle whitelists in the same way.
> > > >
> > > > Fixes: fbe078d397b4 ("kbuild: lto: add a default list of used symbols")
> > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

- Sedat -

> > > > ---
> > > >
> > > > Changes in v2:
> > > >   - Rebase on top of Arnd's patch:
> > > >     https://lore.kernel.org/lkml/20210225143456.3829513-1-arnd@kernel.org/
> > > >
> > > >  init/Kconfig                    |  1 -
> > > >  scripts/gen_autoksyms.sh        | 35 ++++++++++++++++++++++++---------
> > > >  scripts/lto-used-symbollist.txt |  6 ------
> > >
> > > People who want to use their own "white-listed" (allow-listed)
> > > symbollist-file can do that via
> > > CONFIG_UNUSED_KSYMS_WHITELIST="my/own/white/list".
> > > Correct?
> > >
> > > Why do you delete the default "scripts/lto-used-symbollist.txt" file
> > > and remove the default in the appropriate Kconfig for people who want
> > > to enable Clang-(Thin)LTO?
> > > These people should now use
> > > CONFIG_UNUSED_KSYMS_WHITELIST="scripts/lto-used-symbollist.txt"?
> > > But again - the file was deleted with your patch.
> > > Do I miss something?
> >
> > I think so.
> >
> > I moved those symbols to scripts/gen_autoksyms.sh
> >
>
> OK, I have overseen hat.
>
> - Sedat -
