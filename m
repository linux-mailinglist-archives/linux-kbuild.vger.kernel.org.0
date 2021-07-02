Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B62EE3B9AF6
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Jul 2021 05:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234745AbhGBDXw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 1 Jul 2021 23:23:52 -0400
Received: from [210.61.82.184] ([210.61.82.184]:48521 "EHLO
        mailgw02.mediatek.com" rhost-flags-FAIL-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S234731AbhGBDXw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Jul 2021 23:23:52 -0400
X-UUID: b8b6fa4102924558afc3271190e5e027-20210702
X-UUID: b8b6fa4102924558afc3271190e5e027-20210702
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1843929319; Fri, 02 Jul 2021 11:21:05 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Jul 2021 11:21:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Jul 2021 11:21:03 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <ndesaulniers@google.com>
CC:     <clang-built-linux@googlegroups.com>, <keescook@chromium.org>,
        <lecopzer.chen@mediatek.com>, <linux-kbuild@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <masahiroy@kernel.org>,
        <michal.lkml@markovi.net>, <nathan@kernel.org>,
        <samitolvanen@google.com>, <yj.chiang@mediatek.com>
Subject: Re: [RESEND PATCH v2 1/2] Kbuild: lto: add CONFIG_MAKE_VERSION
Date:   Fri, 2 Jul 2021 11:21:03 +0800
Message-ID: <20210702032103.7787-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAKwvOdkGjz-rH8AHudO3dJmSt+48FSJ8iT-eCacwyeMhWv909w@mail.gmail.com>
References: <CAKwvOdkGjz-rH8AHudO3dJmSt+48FSJ8iT-eCacwyeMhWv909w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Thu, Jul 1, 2021 at 2:28 AM Lecopzer Chen <lecopzer.chen@mediatek.com> wrote:
> >
> > To check the GNU make version. Used by the LTO Kconfig.
> >
> > LTO with MODVERSIONS will fail in generating correct CRC because
> > the makefile rule doesn't work for make with version 3.8X.[1]
> >
> > Thus we need to check make version during selecting on LTO Kconfig.
> > Add CONFIG_MAKE_VERSION which means MAKE_VERSION in canonical digits
> > for arithmetic comparisons.
> >
> > [1] https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/
> > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > ---
> >  Makefile                |  2 +-
> >  init/Kconfig            |  4 ++++
> >  scripts/make-version.sh | 13 +++++++++++++
> >  3 files changed, 18 insertions(+), 1 deletion(-)
> >  create mode 100755 scripts/make-version.sh
> >
> > diff --git a/Makefile b/Makefile
> > index 88888fff4c62..2402745b2ba9 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -516,7 +516,7 @@ CLANG_FLAGS :=
> >
> >  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
> >  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
> > -export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> > +export PERL PYTHON3 CHECK CHECKFLAGS MAKE MAKE_VERSION UTS_MACHINE HOSTCXX
> >  export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
> >  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
> >
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 55f9f7738ebb..ecc110504f87 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -86,6 +86,10 @@ config CC_HAS_ASM_INLINE
> >  config CC_HAS_NO_PROFILE_FN_ATTR
> >         def_bool $(success,echo '__attribute__((no_profile_instrument_function)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
> >
> > +config MAKE_VERSION
> > +       int
> > +       default $(shell,$(srctree)/scripts/make-version.sh $(MAKE_VERSION))
> > +
> >  config CONSTRUCTORS
> >         bool
> >
> > diff --git a/scripts/make-version.sh b/scripts/make-version.sh
> > new file mode 100755
> > index 000000000000..ce5af96696cc
> > --- /dev/null
> > +++ b/scripts/make-version.sh
> > @@ -0,0 +1,13 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Print the linker name and its version in a 5 or 6-digit form.
> 
> The linker? 

my bad, I'll fix this, thanks



