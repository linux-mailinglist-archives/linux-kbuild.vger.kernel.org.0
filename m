Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C219326C10
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Feb 2021 08:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhB0HJ0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Feb 2021 02:09:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbhB0HJZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Feb 2021 02:09:25 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B15C06174A;
        Fri, 26 Feb 2021 23:08:45 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id f20so12111153ioo.10;
        Fri, 26 Feb 2021 23:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=qVGH2wiGbZpiWspViguKvdqRScf2gnv+vmRA21DFLsY=;
        b=Q4Htg/c6LSzG2fo7loeK7ALQB3/4mwU0kvCZUMlVYS7WxOV2STBFw4bjAo7HVDCFG+
         nwHm1dUiz8IPUBZ+eFmuZfgX8IrVZ91lX5+YI5N611qtqH+9D6qtcCT5fNwWrFzvUp/b
         sn2w8j0MEvbIcoY1M9hYYh+qRzuE9Mh5q+DK+J2bloQxWIPM1b+z3w6o46MGRy9ddhca
         AgOLN5ypLZohW6Dc5+42dKOSpNmPbQQujRokptx/2EAK/A2RG/1COOLQV1vykYrFDm5Q
         rG1wh7X417eaxKayu2QSYbLgMn6AV8eo2IJaV516DH2p5KN4+h47hbUS2rgR9BTQdJo7
         hvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=qVGH2wiGbZpiWspViguKvdqRScf2gnv+vmRA21DFLsY=;
        b=Uqr/RIyKeKEoy0RirIzA1Yrm0RJ0ClNWW8g341d8hNtlb1BO/DxCm/pgNeHyJ1bhwe
         kzBzHQ5HghiGJBxanGis5m+wtoP1v/WjTUZeZXJSYgBQ7pPU1hNdMFCKclrKqktCeHMG
         wXBqZNAyWR8Cu4fpU1Q3B4ADF81laJ/ZSX4AQz3RsQS64tbgB1B/kuqUbTVDyxfWJPOL
         N6yUbC+PwWR120hpIBm0Lrc1mf3FuJsLkyWF3o6Bd4yegsWwlMNwzWMZttW9Ms/aEmb8
         +TXtFi0MsrASsWIMiZ+EERamOy+6Ab3cH3zTsRKkURbU0k8Rnvp8Q8BkyOaoBxuOqwqA
         U4qQ==
X-Gm-Message-State: AOAM5311JZaUTpRlEs+HEjpvAEYXn2G3vNHabe2+lUK8mBcrNXfmu5of
        0QiEUXtCLFa0JZa1jipxvaPpXMYFZPP+nQm0Cy0=
X-Google-Smtp-Source: ABdhPJySDgdt49qPoEjzw22gyawwRGQPrVumJiJJDXm9BO1CPyQwHJnfTg4tPA2YitoyUwLvX/Uc0ssECJqB9N1BzaU=
X-Received: by 2002:a05:6638:2381:: with SMTP id q1mr6553430jat.132.1614409724904;
 Fri, 26 Feb 2021 23:08:44 -0800 (PST)
MIME-Version: 1.0
References: <20210226062548.3334081-1-masahiroy@kernel.org>
 <CA+icZUXYLVjs-hXEu_5Vy=TdNvOHhyiXe=hc-jc7SAU04Dtstw@mail.gmail.com> <CAK7LNARmQzJwUWcYPj9QKZatYpC6-gegTuJiAvyhR==8ezWdHg@mail.gmail.com>
In-Reply-To: <CAK7LNARmQzJwUWcYPj9QKZatYpC6-gegTuJiAvyhR==8ezWdHg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sat, 27 Feb 2021 08:08:33 +0100
Message-ID: <CA+icZUXGnOCY5O=cupmmjGnVpYA=Q=cm69ih5HrgpV9sOPozYQ@mail.gmail.com>
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

On Sat, Feb 27, 2021 at 7:55 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Feb 26, 2021 at 6:26 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Fri, Feb 26, 2021 at 7:26 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > Commit fbe078d397b4 ("kbuild: lto: add a default list of used symbols")
> > > does not work as expected if the .config file has already specified
> > > CONFIG_UNUSED_KSYMS_WHITELIST="my/own/white/list" before enabling
> > > CONFIG_LTO_CLANG.
> > >
> > > So, the user-supplied whitelist and LTO-specific white list must be
> > > independent of each other.
> > >
> > > I refactored the shell script so CONFIG_MODVERSIONS and CONFIG_CLANG_LTO
> > > handle whitelists in the same way.
> > >
> > > Fixes: fbe078d397b4 ("kbuild: lto: add a default list of used symbols")
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > > Changes in v2:
> > >   - Rebase on top of Arnd's patch:
> > >     https://lore.kernel.org/lkml/20210225143456.3829513-1-arnd@kernel.org/
> > >
> > >  init/Kconfig                    |  1 -
> > >  scripts/gen_autoksyms.sh        | 35 ++++++++++++++++++++++++---------
> > >  scripts/lto-used-symbollist.txt |  6 ------
> >
> > People who want to use their own "white-listed" (allow-listed)
> > symbollist-file can do that via
> > CONFIG_UNUSED_KSYMS_WHITELIST="my/own/white/list".
> > Correct?
> >
> > Why do you delete the default "scripts/lto-used-symbollist.txt" file
> > and remove the default in the appropriate Kconfig for people who want
> > to enable Clang-(Thin)LTO?
> > These people should now use
> > CONFIG_UNUSED_KSYMS_WHITELIST="scripts/lto-used-symbollist.txt"?
> > But again - the file was deleted with your patch.
> > Do I miss something?
>
> I think so.
>
> I moved those symbols to scripts/gen_autoksyms.sh
>

OK, I have overseen hat.

- Sedat -
