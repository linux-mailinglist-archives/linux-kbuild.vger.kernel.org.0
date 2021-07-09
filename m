Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 789553C20C3
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Jul 2021 10:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbhGII2A (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Jul 2021 04:28:00 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:51002 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229685AbhGII2A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jul 2021 04:28:00 -0400
X-UUID: e2fa50fcf82b4f31a3406b086a65e148-20210709
X-UUID: e2fa50fcf82b4f31a3406b086a65e148-20210709
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 54868000; Fri, 09 Jul 2021 16:25:13 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Jul 2021 16:25:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Jul 2021 16:25:12 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <samitolvanen@google.com>
CC:     <clang-built-linux@googlegroups.com>, <keescook@chromium.org>,
        <lecopzer.chen@mediatek.com>, <linux-kbuild@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <masahiroy@kernel.org>,
        <michal.lkml@markovi.net>, <nathan@kernel.org>,
        <ndesaulniers@google.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH v3 1/2] Kbuild: lto: add CONFIG_MAKE_VERSION
Date:   Fri, 9 Jul 2021 16:25:12 +0800
Message-ID: <20210709082512.25208-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CABCJKufWcp6Hx=8btz6pDNcKvQ21n4BSPZ7cp1Tzhxt0+pQOmw@mail.gmail.com>
References: <CABCJKufWcp6Hx=8btz6pDNcKvQ21n4BSPZ7cp1Tzhxt0+pQOmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Tue, Jul 6, 2021 at 2:06 AM Lecopzer Chen <lecopzer.chen@mediatek.com> wrote:
> >
> > > On Sun, Jul 4, 2021 at 7:03 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > >
> > > > On Fri, Jul 2, 2021 at 12:29 PM Lecopzer Chen
> > > > <lecopzer.chen@mediatek.com> wrote:
> > > > >
> > > > > To check the GNU make version. Used by the LTO Kconfig.
> > > > >
> > > > > LTO with MODVERSIONS will fail in generating correct CRC because
> > > > > the makefile rule doesn't work for make with version 3.8X.[1]
> > > > >
> > > > > Thus we need to check make version during selecting on LTO Kconfig.
> > > > > Add CONFIG_MAKE_VERSION which means MAKE_VERSION in canonical digits
> > > > > for arithmetic comparisons.
> > > > >
> > > > > [1] https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/
> > > > > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > > > > ---
> > > >
> > > >
> > > > NACK.
> > > >
> > > > "Let's add MAKE_VERSION >= 40200 restriction
> > > > just because I cannot write correct code that
> > > > works for older Make" is a horrible idea.
> > > >
> > > > Also, Kconfig is supposed to check the compiler
> > > > (or toolchains) capability, not host tool versions.
> > >
> > > I feel like requiring a Make that's half a decade old for a feature
> > > that also requires a toolchain released last October ago isn't
> > > entirely unreasonable.
> > >
> > > That being said, if Masahiro prefers not to rely on the wildcard
> > > function's behavior here, which is a reasonable request, we could
> > > simply use the shell to test for the file's existence:
> > >
> > > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > > index 34d257653fb4..c6bd62f518ff 100644
> > > --- a/scripts/Makefile.build
> > > +++ b/scripts/Makefile.build
> > > @@ -388,7 +388,7 @@ ifeq ($(CONFIG_LTO_CLANG) $(CONFIG_MODVERSIONS),y y)
> > >        cmd_update_lto_symversions =                                     \
> > >         rm -f $@.symversions                                            \
> > >         $(foreach n, $(filter-out FORCE,$^),                            \
> > > -               $(if $(wildcard $(n).symversions),                      \
> > > +               $(if $(shell test -s $(n).symversions && echo y),       \
> > >                         ; cat $(n).symversions >> $@.symversions))
> > >  else
> > >        cmd_update_lto_symversions = echo >/dev/null
> > >
> > > This is not quite as efficient as using wildcard, but should work with
> > > older Make versions too. Thoughts?
> > >
> >
> >
> > I've tested this in both make-4.3 and 3.81, and the CRC is correct.
> > But I'm not sure if anyone would have the "arg list too long" issue.
> >
> > Tested-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> 
> Thank you for testing. This should produce a command identical to the
> wildcard version (with newer Make versions), so that shouldn't be an
> issue. If nobody objects to this approach, would you mind putting this
> into a proper patch and sending it as v4?

Sure, I'll rebase the whole commit and send as v4 soon.


