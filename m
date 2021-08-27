Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6CD3F9B85
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Aug 2021 17:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233979AbhH0PQZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Aug 2021 11:16:25 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:56024 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233587AbhH0PQZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Aug 2021 11:16:25 -0400
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 17RFFF5m008844;
        Sat, 28 Aug 2021 00:15:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 17RFFF5m008844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630077316;
        bh=C5erIl60YsrbNpBbvDJeRmK8xE1LLCsIeziN2ootUrE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WKIFAQxFZ53ZbX6Wlyxpa0++wJ/D1gai4d/jTdeAay08dlLPk9+TffCgkXtBmmJP2
         CKWANFQY8D3Qq3mL+EQBLRnLTMVvGhvlNQZvL9GrsKcNqsX0YKX94mn+KuvB3mzN/Y
         6WsN8WBndAzDNObuNHxfyOlASmSVeQmJgXIn0EJANLh62FqoZxII2D6DVPmZyU01rd
         UZLUdrqOE4yyThxxzDLj3iCOJ5+TjqbhnTBagd/jFC4FAFtMUNokX7wWMQWeKtaTKF
         Cf/qPlzzEJjucTGxJdi77Ncvc/Inzy5E53usEYvZB4NwEKnsy0U19kEJj99P7nAznA
         AAwPKaNUIvrFQ==
X-Nifty-SrcIP: [209.85.215.178]
Received: by mail-pg1-f178.google.com with SMTP id t1so6237190pgv.3;
        Fri, 27 Aug 2021 08:15:15 -0700 (PDT)
X-Gm-Message-State: AOAM533TP26ebE2J1zvvkeYk8buJFVqI2hp7b99U8UR/MLGpp+HYhYfa
        B26lMMETK0XAV7UMVkOElYQcu+uOHbuR2FGxTz4=
X-Google-Smtp-Source: ABdhPJzG0/c8c9NY8aIrPE3hvkrfSDQChxoBrDwb+YSKC198QyYisZaE/Hz+9M8KW9iuitU4sIq0lI+3U8+WuU8B0lQ=
X-Received: by 2002:a63:d40a:: with SMTP id a10mr6465565pgh.7.1630077315117;
 Fri, 27 Aug 2021 08:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210824165024.303771-1-masahiroy@kernel.org> <YSal/kodID/iE9NO@lillesand.fjasle.eu>
In-Reply-To: <YSal/kodID/iE9NO@lillesand.fjasle.eu>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 28 Aug 2021 00:14:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNASHob175t86dQ4o9x7_ZGTis-_GL5QcWcT75FzJ0vryWg@mail.gmail.com>
Message-ID: <CAK7LNASHob175t86dQ4o9x7_ZGTis-_GL5QcWcT75FzJ0vryWg@mail.gmail.com>
Subject: Re: [PATCH] scripts: add generic install.sh
To:     nicolas@fjasle.eu
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 26, 2021 at 5:25 AM Nicolas Schier <nicolas@fjasle.eu> wrote:
>
> On Wed, 25 Aug 2021 01:50:24 +0900 Masahiro Yamada wrote:
> > Many architectures has a similar install.sh script.
> >
> > The first half is really generic; ensures the kernel image and the map
> > file exist, then invokes ~/bin/${INSTALLKERNEL} or /sbin/${INSTALLKERNEL}
> > if available.
> >
> > The second half is kind of arch-specific. It just copies the kernel image
> > and map file to the destination, but the code is slightly different.
> > (Maybe, this part can be consolidated as well if we want).
> >
> > This patch factors out the generic part into scripts/install.sh, which
> > will architectures to drop the duplicated code.
>       ^
> I am afraid, a word is missing here, e.g.:
> ... which will allow architectures to drop ...?

Yes, I meant "will allow architectures to ..."
I just noticed after the submission.



> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  Makefile           |  8 ++++++++
> >  scripts/install.sh | 43 +++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 51 insertions(+)
> >  create mode 100755 scripts/install.sh
> >
> > diff --git a/Makefile b/Makefile
> > index 185ce47d6734..725eadc4fcb8 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1325,6 +1325,14 @@ scripts_unifdef: scripts_basic
> >
> >  install: sub_make_done :=
> >
> > +# Install $(KBUILD_IMAGE) by default.
> > +# If necessary, override install-image per target.
> > +install-image = $(KBUILD_IMAGE)
> > +
> > +quiet_cmd_install = INSTALL $(INSTALL_PATH)
> > +      cmd_install = scripts/install.sh $(KERNELRELEASE) $(install-image) \
> > +                     System.map "$(INSTALL_PATH)"
> > +
> >  # ---------------------------------------------------------------------------
> >  # Tools
> >
> > diff --git a/scripts/install.sh b/scripts/install.sh
> > new file mode 100755
> > index 000000000000..6ac0e0c0f078
> > --- /dev/null
> > +++ b/scripts/install.sh
> > @@ -0,0 +1,43 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# This file is subject to the terms and conditions of the GNU General Public
> > +# License.  See the file "COPYING" in the main directory of this archive
> > +# for more details.
> > +#
> > +# Copyright (C) 1995 by Linus Torvalds
> > +#
> > +# Adapted from code in arch/i386/boot/Makefile by H. Peter Anvin
> > +#
> > +# Arguments:
> > +#   $1 - kernel version
> > +#   $2 - kernel image file
> > +#   $3 - kernel map file
> > +#   $4 - default install path (blank if root directory)
> > +
> > +verify () {
> > +     if [ ! -f "$1" ]; then
> > +             echo >&2
> > +             echo >&2 " *** Missing file: $1"
> > +             echo >&2 ' *** You need to run "make" before "make install".'
> > +             echo >&2
> > +             exit 1
> > +     fi
> > +}
> > +
> > +# Make sure the files actually exist
> > +verify "$2"
> > +verify "$3"
> > +
> > +# User/arch may have a custom install script
> > +
> > +for script in "~/bin/${INSTALLKERNEL}" "/sbin/${INSTALLKERNEL}" \
>
> Quoted ~ will not be expanded.  Either you need to put the leading ~/
> before the quotes, or replace it by ${HOME}.

A good catch, thank you.




>
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
>
> > +             "arch/${SRCARCH}/install.sh" "arch/${SRCARCH}/boot/install.sh"
> > +do
> > +     if [ -x "${script}" ]; then
> > +             exec "${script}" "$@"
> > +     fi
> > +done
> > +
> > +echo "No install script found" >&2
> > +exit 1
> > --
> > 2.30.2
> >



-- 
Best Regards
Masahiro Yamada
