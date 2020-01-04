Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5520B13006B
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Jan 2020 04:37:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbgADDg0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Jan 2020 22:36:26 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:32061 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727274AbgADDg0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 22:36:26 -0500
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0043aDh2023619;
        Sat, 4 Jan 2020 12:36:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0043aDh2023619
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578108974;
        bh=E7v6OsSDfr6V815FU2MY7OtZnfPcFmRdIvSTyf6A5q8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=M2Yv2C4BCcLEiA+O/utwZa5WrRwTqIxLFxjRiKwkX7G+1GJVIp7G/T0t09moraU0O
         8dBsLLVKwOLGoHuSfnJ7M6wO3+sbLlYb5k5qeEW0JfaZgR6KQWoiYcVkeqsCKt5dMF
         D9KQGCWxmzXjHlDfIJPYpaYJSkg98zWhLFOzPKdYksMblnl/ZvwCyORqWR+eBzPZmO
         wuN/jQIiKPAiiTjmRlDFiDfHBra9ftCky5hhIcHMUkRUvG4Z+VAK4vJzjflpfQUBpA
         TiBaTxZLuJR8VaF/sVuMcGmk+QjmRhyRbO4ES7DFLpZF453IYxRCduPxe3RaM8Lqtr
         /Q+p0xXDSDOqg==
X-Nifty-SrcIP: [209.85.221.170]
Received: by mail-vk1-f170.google.com with SMTP id c129so11222716vkh.7;
        Fri, 03 Jan 2020 19:36:14 -0800 (PST)
X-Gm-Message-State: APjAAAVUFwwOtfXLt7Fp93ZV5hWE/Qd3gSq8DbQbo+DFMbweK5KLamyu
        5OVgDt1wSEH9BzTSeVgSMzj3j3l989yFTaT+mm8=
X-Google-Smtp-Source: APXvYqwFrX0S6OIqke8PQUsgzrJ85FumVCcPzymZOA5sJCiSerQ6OnjY8DABR6LmjjZSqaQZJWGUxu05TfzGAAs3kTw=
X-Received: by 2002:a1f:6344:: with SMTP id x65mr52196094vkb.26.1578108973033;
 Fri, 03 Jan 2020 19:36:13 -0800 (PST)
MIME-Version: 1.0
References: <20200103175915.26663-1-masahiroy@kernel.org> <20200103175915.26663-12-masahiroy@kernel.org>
 <20200103195205.GC21515@ravnborg.org>
In-Reply-To: <20200103195205.GC21515@ravnborg.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 4 Jan 2020 12:35:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQXx0RGutdOe4JFLTbjm7=cx9aEKQ-823-irED4SyCmMA@mail.gmail.com>
Message-ID: <CAK7LNAQXx0RGutdOe4JFLTbjm7=cx9aEKQ-823-irED4SyCmMA@mail.gmail.com>
Subject: Re: [PATCH 11/12] initramfs: refactor the initramfs build rules
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Thelen <gthelen@google.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Sam,

On Sat, Jan 4, 2020 at 4:52 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Mashahiro.
>
> I just browsed this fine patchset and noticed...
> >
> > -#####
> > -# Generate the initramfs cpio archive
> > +ramfs-input := $(shell echo $(CONFIG_INITRAMFS_SOURCE))
> > +cpio-data :=
> > +
> > +ifeq ($(words $(ramfs-input)),0)
> > +
> > +# If CONFIG_INITRAMFS_SOURCE is empty, generate a small initramfs with the
> > +# default contents.
> > +ramfs-input := $(srctree)/$(src)/default_cpio_list
> > +
> > +else ifeq ($(words $(ramfs-input)),1)
> > +# If CONFIG_INITRAMFS_SOURCE specifies a single file, and it is suffixed with
> > +# .cpio or .cpio.*, use it directly as an initramfs.
> > +ifneq ($(filter %.cpio,$(ramfs-input)),)
> > +cpio-data := $(ramfs-input)
> > +endif
>
> This part will now work if the file is named foo.cpio.bar.
> $(findstring .cpio, should be used and not $(filter %.cpio
> At least if the comment describes the intended behaviour.


The 'foo.cpio.bar' is taken care of
by ifeq ($(words $(subst .cpio.,$(space),$(ramfs-input))),2)

I admit the comment was confusing.


I will clarify the comments as follows:



# If CONFIG_INITRAMFS_SOURCE specifies a single file, and it is suffixed with
# .cpio, use it directly as an initramfs.
ifneq ($(filter %.cpio,$(ramfs-input)),)
cpio-data := $(ramfs-input)
endif

# If CONFIG_INITRAMFS_SOURCE specifies a single file, and it is suffixed with
# .cpio.*, use it directly as an initramfs, and avoid double compression.
ifeq ($(words $(subst .cpio.,$(space),$(ramfs-input))),2)
cpio-data := $(ramfs-input)
compress-y := shipped
endif






> > +
> > +ifeq ($(words $(subst .cpio.,$(space),$(ramfs-input))),2)
> > +cpio-data := $(ramfs-input)
> > +# If the specified archive is suffixed with .cpio.* (i.e. already compressed),
> > +# we do not double-compress it.
> > +compress-y := shipped
> > +endif
> > +
> > +endif
>
>
>         Sam










--
Best Regards
Masahiro Yamada
