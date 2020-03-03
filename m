Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 185F61777B2
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Mar 2020 14:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbgCCNri (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Mar 2020 08:47:38 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:53762 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728420AbgCCNri (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Mar 2020 08:47:38 -0500
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 023DlOow025241;
        Tue, 3 Mar 2020 22:47:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 023DlOow025241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583243245;
        bh=Im1aXfaJVOP8AAV34lGGh2aGYo+2cFWGzTI+un3OZe0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=paWEy8D44ttfQy8HYItnWwlVc0cBqa4WcjSr1xQrR43jKDiK3jnrjgYKxHnh8b1Lm
         nkuFC5T8hDGKbnIfT/TJzYuw/HG2PVVXIJiYRzfeuVOr108zIkkLi4FSG/8xwVP4Gl
         gFO6qLxhYjY58tJHJt9bR12UIQHCboaMYQrl2DksQszYwxXUh/kFXLmGm8SP6H7HNO
         KFGFXHTT/IxguJRVENcpDNmlRzbWj+7809KsufpF7Kn9GqMm0rGlcCRNAn8HPgr6ty
         q3sZIa8N1+4IdgNYXi+sJYOygSrFC5zKIDeTqW2lBrNla5O0q8tvOgO7QRH+9b1ObP
         2yHrI0ameJMMg==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id n27so2400639vsa.0;
        Tue, 03 Mar 2020 05:47:24 -0800 (PST)
X-Gm-Message-State: ANhLgQ3UZdIXS51PD4gp6YV37KKsMrNCYvqZA+0YucBT2IKYT6Vu63lU
        vWM6INbZSE62/XAf6hEb807lDk1PVLk4DMZZXzU=
X-Google-Smtp-Source: ADFU+vsOnczoGMXk0HGb7/YYFGR+pKutemWYtSXfgQEgdoEncfX8976RLmzzapPsqlF+H5ZWaIyvjYzI8co1XX5TRnY=
X-Received: by 2002:a67:2ed8:: with SMTP id u207mr2447716vsu.54.1583243243860;
 Tue, 03 Mar 2020 05:47:23 -0800 (PST)
MIME-Version: 1.0
References: <20200228034640.25247-1-masahiroy@kernel.org> <CAK7LNAS9uWyvFeVkxtbkuBrnqumYzzLfcsUrVByHHyons4m8hA@mail.gmail.com>
In-Reply-To: <CAK7LNAS9uWyvFeVkxtbkuBrnqumYzzLfcsUrVByHHyons4m8hA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 3 Mar 2020 22:46:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNATyuyU46qXngDr80d51cs0-J=00jkgL1rdASUMfgmfKOw@mail.gmail.com>
Message-ID: <CAK7LNATyuyU46qXngDr80d51cs0-J=00jkgL1rdASUMfgmfKOw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use KBUILD_DEFCONFIG as the fallback for DEFCONFIG_LIST
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>, linux-um@lists.infradead.org,
        sparclinux <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 28, 2020 at 12:48 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Feb 28, 2020 at 12:47 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Most of the Kconfig commands (except defconfig and all*config) read
> > the .config file as a base set of CONFIG options.
> >
> > When it does not exist, the files in DEFCONFIG_LIST are searched in
> > this order and loaded if found.
> >
> > I do not see much sense in the last two lines in DEFCONFIG_LIST.
> >
> > [1] ARCH_DEFCONFIG
> >
> > The entry for DEFCONFIG_LIST is guarded by 'depends on !UML'. So, the
> > ARCH_DEFCONFIG definition in arch/x86/um/Kconfig is meaningless.
> >
> > arch/{sh,sparc,x86}/Kconfig define ARCH_DEFCONFIG depending on 32 or
> > 64 bit variant symbols. This is a little bit strange; ARCH_DEFCONFIG
> > should be a fixed string because the base config file is loaded before
> > the symbol evaluation stage.
> >
> > Using KBUILD_DEFCONFIG makes more sense because it is fixed before
> > Kconfig is invoked. Fortunately, arch/{sh,sparc,x86}/Makefile define it
> > in the same way, and it works as expected. Hence, replace ARCH_DEFCONFIG
> > with "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)".
> >
> > [2] arch/$(ARCH)/defconfig
> >
> > This file path is no longer valid. The defconfig files are always located
> > in the arch configs/ directories.
> >
> >   $ find arch -name defconfig | sort
> >   arch/alpha/configs/defconfig
> >   arch/arm64/configs/defconfig
> >   arch/csky/configs/defconfig
> >   arch/nds32/configs/defconfig
> >   arch/riscv/configs/defconfig
> >   arch/s390/configs/defconfig
> >   arch/unicore32/configs/defconfig
> >
> > The path arch/*/configs/defconfig is already covered by
> > "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)". So, this file path is
> > not necessary.
> >
> > I moved the default KBUILD_DEFCONFIG to the top Makefile. Otherwise,
> > the 7 architectures listed above would end up with endless loop of
> > syncconfig.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
>
> I forgot to say this.
> This is v2.
>
> Changes in v2:
>   - Move KBUILD_DEFCONFIG to fix endless loop of syncconfig
>
>

Applied to linux-kbuild.


Best Regards
Masahiro Yamada
