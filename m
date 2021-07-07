Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B959E3BECC1
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jul 2021 19:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbhGGRFR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Jul 2021 13:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbhGGRFR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Jul 2021 13:05:17 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4959EC06175F
        for <linux-kbuild@vger.kernel.org>; Wed,  7 Jul 2021 10:02:36 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id g5so4184264ybu.10
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Jul 2021 10:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nvt17DC+0V0vDNtkCundvZnkSWcUic46kjkyGHinAVw=;
        b=Ae0a52BSY3240NlXOn9VTQD/j3EZgVypicQrCdtTwLUvb3YFMLxg4gudqyryj9pTdZ
         PV8a4D9s8yKvDhS0OX/NoFMkj1weo6/rOxZACtDgo3+masXCMmxGRH2ra8x50dFulqzd
         OEwlw6slgyGYQ1vb/F1X/4Go6FUKxKmmBco2wehmzPVRUsdqeKBRgajb4MascRslbUPv
         IMMlHLE+AZktRbPkHTXQVhvnmV9fZQAuEzfPF1x3lfeANsUShYuQUhkrMNueVVm7+U1K
         VkL5OzO/HC1K+rUTstP/luufafCIH7p1FWOB36KFmy/GqrjU1aUO3Hf6tNwioZrY2ULZ
         XwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nvt17DC+0V0vDNtkCundvZnkSWcUic46kjkyGHinAVw=;
        b=sVuyLN7kNiH6a4a++yC+iQjb/XQe5tL4ipMVTyHPfsy+Nm6MJhzsKnEbb9S4mA4TLK
         1dhuYDdbSlh6dZWAsMC6kvsVJl1B9a1F4+GayuJu568nEyO/eVyeJqGh7ODSOLt4P9dw
         0acTJS2d4sOemzfVp97C0iep73QBJu8Cd30fwlazFvu4LwDWN+RK+lg5DJVAl7IL2MT7
         ueEQzwRF5zLrHBWQZ61FizRowlY4GI5UTouMuet/IaxLXbrdV+1WFHsQAsIrV9Oohm/x
         7R0rNDmETOenykpTa4cBri7ortS9NLbvMPonf7LQRL1JrMnKygYH5XQZsLwwoFzEexeg
         Q6Mw==
X-Gm-Message-State: AOAM532TDmTeDxcwDq71G5/kKM4Vi2xq+MCn2vR7o1b/BrkLR1cevTaV
        lLJpZUVkEk7OcQanbNehZr5avH2AWgnmhbdjKhTinQ==
X-Google-Smtp-Source: ABdhPJzlRgwilrrNJz8HGx/b4iVPfJuGy8Z2rljlJ8d6eC9eLLYWKI3FFeEhjkxao9u6Nr3f9DXBJCOuQOrKGWgmciw=
X-Received: by 2002:a25:7085:: with SMTP id l127mr35127383ybc.293.1625677355105;
 Wed, 07 Jul 2021 10:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <CABCJKudYQV6Nt=Qq+zY=9JF1WmLVLnx+--3mJA9dkhLMhMvuFg@mail.gmail.com>
 <20210706090607.19421-1-lecopzer.chen@mediatek.com>
In-Reply-To: <20210706090607.19421-1-lecopzer.chen@mediatek.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Wed, 7 Jul 2021 10:02:24 -0700
Message-ID: <CABCJKufWcp6Hx=8btz6pDNcKvQ21n4BSPZ7cp1Tzhxt0+pQOmw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] Kbuild: lto: add CONFIG_MAKE_VERSION
To:     Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc:     clang-built-linux@googlegroups.com, keescook@chromium.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        masahiroy@kernel.org, michal.lkml@markovi.net, nathan@kernel.org,
        ndesaulniers@google.com, yj.chiang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 6, 2021 at 2:06 AM Lecopzer Chen <lecopzer.chen@mediatek.com> wrote:
>
> > On Sun, Jul 4, 2021 at 7:03 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > On Fri, Jul 2, 2021 at 12:29 PM Lecopzer Chen
> > > <lecopzer.chen@mediatek.com> wrote:
> > > >
> > > > To check the GNU make version. Used by the LTO Kconfig.
> > > >
> > > > LTO with MODVERSIONS will fail in generating correct CRC because
> > > > the makefile rule doesn't work for make with version 3.8X.[1]
> > > >
> > > > Thus we need to check make version during selecting on LTO Kconfig.
> > > > Add CONFIG_MAKE_VERSION which means MAKE_VERSION in canonical digits
> > > > for arithmetic comparisons.
> > > >
> > > > [1] https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/
> > > > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > > > ---
> > >
> > >
> > > NACK.
> > >
> > > "Let's add MAKE_VERSION >= 40200 restriction
> > > just because I cannot write correct code that
> > > works for older Make" is a horrible idea.
> > >
> > > Also, Kconfig is supposed to check the compiler
> > > (or toolchains) capability, not host tool versions.
> >
> > I feel like requiring a Make that's half a decade old for a feature
> > that also requires a toolchain released last October ago isn't
> > entirely unreasonable.
> >
> > That being said, if Masahiro prefers not to rely on the wildcard
> > function's behavior here, which is a reasonable request, we could
> > simply use the shell to test for the file's existence:
> >
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index 34d257653fb4..c6bd62f518ff 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -388,7 +388,7 @@ ifeq ($(CONFIG_LTO_CLANG) $(CONFIG_MODVERSIONS),y y)
> >        cmd_update_lto_symversions =                                     \
> >         rm -f $@.symversions                                            \
> >         $(foreach n, $(filter-out FORCE,$^),                            \
> > -               $(if $(wildcard $(n).symversions),                      \
> > +               $(if $(shell test -s $(n).symversions && echo y),       \
> >                         ; cat $(n).symversions >> $@.symversions))
> >  else
> >        cmd_update_lto_symversions = echo >/dev/null
> >
> > This is not quite as efficient as using wildcard, but should work with
> > older Make versions too. Thoughts?
> >
>
>
> I've tested this in both make-4.3 and 3.81, and the CRC is correct.
> But I'm not sure if anyone would have the "arg list too long" issue.
>
> Tested-by: Lecopzer Chen <lecopzer.chen@mediatek.com>

Thank you for testing. This should produce a command identical to the
wildcard version (with newer Make versions), so that shouldn't be an
issue. If nobody objects to this approach, would you mind putting this
into a proper patch and sending it as v4?

Sami
