Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD469332A99
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Mar 2021 16:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbhCIPfF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Mar 2021 10:35:05 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:58560 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbhCIPfF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Mar 2021 10:35:05 -0500
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 129FYSbl016202;
        Wed, 10 Mar 2021 00:34:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 129FYSbl016202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615304069;
        bh=zIB1c5hEd1cXXpxWSOfZU5o4T77yG0IZKzbiDL/hDfo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XhvjdxJ5Li1qJUNNSsS300Lr8Iv9wvvb37LG4LF7xAM7BD8T606JxKkXD2GZl7jOz
         Z5GmbWhT3s+qyma5onANl5xW/58ktqFwdGOKTG9/4fXjAFRRQVp16KU4fjAq54Uel3
         6vvN0xGBX5YoUTXmsuFhv5wC5KVY1QaJe4LvJHE9eYYWNwQnhRAQ8fPWBiv0PYQJPV
         1HEcy30W1NHdWszgOPZLDG77EXheWKjDryrWNhevlUOJJdB6n/kbAqBwvh68UBdPFG
         2D2p7eDrkxMofR1QUuAVFMmSLS3urJW8Q0Op8qt9jpdizowmW62Q/Ai4YjBQZ1JkCA
         6TNJUMopIm7mg==
X-Nifty-SrcIP: [209.85.215.177]
Received: by mail-pg1-f177.google.com with SMTP id a4so9009765pgc.11;
        Tue, 09 Mar 2021 07:34:29 -0800 (PST)
X-Gm-Message-State: AOAM5330WP94m8tt6fpTBdHeE8kdqIU+sTgWoDPcLuCNya2K7jv/gj7S
        wsuV7vrSJU1T8laZ3b0hP7/pMMTr67dLwd2DpiE=
X-Google-Smtp-Source: ABdhPJy8oJqe2Bz1jzTqDXueXHdTTWQSaS9b8Ua5bhwFbShoYMVzuEJQPEesQD/ofWZBQUpbJNcvifflTTqXNZ6hbMc=
X-Received: by 2002:a65:428b:: with SMTP id j11mr25609321pgp.47.1615304068324;
 Tue, 09 Mar 2021 07:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20210306061121.2023529-1-masahiroy@kernel.org>
In-Reply-To: <20210306061121.2023529-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 10 Mar 2021 00:33:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQojkdz7w2iQtUfiu9bX0XPtNgoSfZMF2jX_QT4_xstNg@mail.gmail.com>
Message-ID: <CAK7LNAQojkdz7w2iQtUfiu9bX0XPtNgoSfZMF2jX_QT4_xstNg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rename multi-used-* to multi-obj-*
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Mar 6, 2021 at 3:11 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I think multi-obj-* is clearer, and more consisten with real-obj-*.
>
> Rename as follows:
>
>   multi-used-y  ->  multi-obj-y
>   multi-used-m  ->  multi-obj-m
>   multi-used    ->  multi-obj-ym
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Fixed the typo "consisten" to "consistent",
and applied to linux-kbuild.




> ---
>
>  scripts/Makefile.build |  6 +++---
>  scripts/Makefile.lib   | 10 +++++-----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 1b6094a13034..56cf8eb475cf 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -444,11 +444,11 @@ quiet_cmd_link_multi-m = LD [M]  $@
>        cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^)
>  endif
>
> -$(multi-used-m): FORCE
> +$(multi-obj-m): FORCE
>         $(call if_changed,link_multi-m)
> -$(call multi_depend, $(multi-used-m), .o, -objs -y -m)
> +$(call multi_depend, $(multi-obj-m), .o, -objs -y -m)
>
> -targets += $(multi-used-m)
> +targets += $(multi-obj-m)
>  targets := $(filter-out $(PHONY), $(targets))
>
>  # Add intermediate targets:
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index eee59184de64..e60be0bddda2 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -48,9 +48,9 @@ endif
>  suffix-search = $(foreach s,$(2),$($(1:.o=$s)))
>  # If $(foo-objs), $(foo-y), $(foo-m), or $(foo-) exists, foo.o is a composite object
>  multi-search = $(sort $(foreach m,$(1), $(if $(strip $(call suffix-search,$(m),$(2) -)), $(m))))
> -multi-used-y := $(call multi-search,$(obj-y),-objs -y)
> -multi-used-m := $(call multi-search,$(obj-m),-objs -y -m)
> -multi-used   := $(multi-used-y) $(multi-used-m)
> +multi-obj-y := $(call multi-search,$(obj-y),-objs -y)
> +multi-obj-m := $(call multi-search,$(obj-m),-objs -y -m)
> +multi-obj-ym := $(multi-obj-y) $(multi-obj-m)
>
>  # Replace multi-part objects by their individual parts,
>  # including built-in.a from subdirectories
> @@ -92,12 +92,12 @@ obj-m               := $(addprefix $(obj)/,$(obj-m))
>  lib-y          := $(addprefix $(obj)/,$(lib-y))
>  real-obj-y     := $(addprefix $(obj)/,$(real-obj-y))
>  real-obj-m     := $(addprefix $(obj)/,$(real-obj-m))
> -multi-used-m   := $(addprefix $(obj)/,$(multi-used-m))
> +multi-obj-m    := $(addprefix $(obj)/, $(multi-obj-m))
>  subdir-ym      := $(addprefix $(obj)/,$(subdir-ym))
>
>  # Finds the multi-part object the current object will be linked into.
>  # If the object belongs to two or more multi-part objects, list them all.
> -modname-multi = $(sort $(foreach m,$(multi-used),\
> +modname-multi = $(sort $(foreach m,$(multi-obj-ym),\
>                 $(if $(filter $*.o, $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))),$(m:.o=))))
>
>  __modname = $(if $(modname-multi),$(modname-multi),$(basetarget))
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
