Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E35B391CD6
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 May 2021 18:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233575AbhEZQUM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 May 2021 12:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233109AbhEZQUM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 May 2021 12:20:12 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E6EC061574;
        Wed, 26 May 2021 09:18:39 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id z38so2833191ybh.5;
        Wed, 26 May 2021 09:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j9+U4zzMSY1RadPEggsDzC3pcoNOFBiHJ55OHUPkriQ=;
        b=i7OhssDathCe8u+V0I0yR8otfcJYCr85x+G3AEnOHWilKWzUSOFd2VJDAZGexdrmpu
         QgdRuuXrjB5H/Q5IBfoPjn8f21wkFLHRSG84vlBefRM5zE42hpRB48KbVqUhiztot5O6
         QnaKwRszjEZCvfpSNKuNmIKScWeyuoP8D96MaYavHmJ4iMqMyNYF1DLqF5Vra9rAu5VG
         LONef8o3WhHpRvLnIp3iPs8citf+1L5Oi5GQ426ZLS1hvMvGr8aEyVDZnd54+847vcjF
         AvHkW7IlT3cyB/jiq7daD8iYMNe18EFcaqcXtM4dsz0Wr3eyfnO8Kl+QI1bVxyQEskIa
         M2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j9+U4zzMSY1RadPEggsDzC3pcoNOFBiHJ55OHUPkriQ=;
        b=nBiKv40+9TnRA048pvzR7Vj4q29BucdvbdagDC1eHooCuyenB4rNpUjR7Hx8ILM9+h
         vUw02LRdoHR4U7UzlDcwAM6MYrfedKCIVZ5jjOon6Ubi7GnggTiA6tERKZsBI5KoN3X4
         YmjAtRy0sAzgqlaRarfSpNENFjXgQPxNrU7eu3DwE4kbfTQ/CmGfxdgKB6MOZopUZLRA
         6toOoWnItRypSYNnL9dnN2VWDBj+2IsH0BJJLEz3xG/EIKw8ei+XC3wRtzAxlSg8zhzL
         U0uKoM61gIlk/zl6U7kbwF/Z7xwD3W4lQ/Hj+dMQpmzoRMu/Xros5/9+5g1tMt28FlD4
         0+eg==
X-Gm-Message-State: AOAM532i3SY+fQZYRTM95fr4AqbbO1SjRSfhOpGEqt9Gyn4yIDsJKLrh
        Tcow6ZwdlbpXO2VvKT+KV6So1EWvHRYpBPg/KrU=
X-Google-Smtp-Source: ABdhPJy8DXZKjSTHT5kJfAYsvUaN7xEVzURqGqdgOYUAUx/+mgpUvcDl/mEwGLlAg6iLgAyDiW2T7GbI/qeNneClPMg=
X-Received: by 2002:a25:7246:: with SMTP id n67mr51162695ybc.510.1622045918363;
 Wed, 26 May 2021 09:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210518142302.1046718-1-javierm@redhat.com>
In-Reply-To: <20210518142302.1046718-1-javierm@redhat.com>
From:   Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date:   Wed, 26 May 2021 09:18:27 -0700
Message-ID: <CAEf4BzYqA1Upbm75aW-Rs-WCqQ6KRnSje-uTis2fw749_f8tRw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: quote OBJCOPY var to avoid a pahole call break
 the build
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 18, 2021 at 7:23 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> The ccache tool can be used to speed up cross-compilation, by calling the
> compiler and binutils through ccache. For example, following should work:
>
>     $ export ARCH=arm64 CROSS_COMPILE="ccache aarch64-linux-gnu-"
>
>     $ make M=drivers/gpu/drm/rockchip/
>
> but pahole fails to extract the BTF info from DWARF, breaking the build:
>
>       CC [M]  drivers/gpu/drm/rockchip//rockchipdrm.mod.o
>       LD [M]  drivers/gpu/drm/rockchip//rockchipdrm.ko
>       BTF [M] drivers/gpu/drm/rockchip//rockchipdrm.ko
>     aarch64-linux-gnu-objcopy: invalid option -- 'J'
>     Usage: aarch64-linux-gnu-objcopy [option(s)] in-file [out-file]
>      Copies a binary file, possibly transforming it in the process
>     ...
>     make[1]: *** [scripts/Makefile.modpost:156: __modpost] Error 2
>     make: *** [Makefile:1866: modules] Error 2
>
> this fails because OBJCOPY is set to "ccache aarch64-linux-gnu-copy" and
> later pahole is executed with the following command line:
>
>     LLVM_OBJCOPY=$(OBJCOPY) $(PAHOLE) -J --btf_base vmlinux $@
>
> which gets expanded to:
>
>     LLVM_OBJCOPY=ccache aarch64-linux-gnu-objcopy pahole -J ...
>
> instead of:
>
>     LLVM_OBJCOPY="ccache aarch64-linux-gnu-objcopy" pahole -J ...
>
> Fixes: 5f9ae91f7c0 ("kbuild: Build kernel module BTFs if BTF is enabled and pahole supports it")
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>

LGTM. Masahiro, would you like us to take this through bpf tree or
you'll apply this to kbuild one?

Acked-by: Andrii Nakryiko <andrii@kernel.org>

>  scripts/Makefile.modfinal | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index dd87cea9fba..a7883e45529 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -59,7 +59,7 @@ quiet_cmd_ld_ko_o = LD [M]  $@
>  quiet_cmd_btf_ko = BTF [M] $@
>        cmd_btf_ko =                                                     \
>         if [ -f vmlinux ]; then                                         \
> -               LLVM_OBJCOPY=$(OBJCOPY) $(PAHOLE) -J --btf_base vmlinux $@; \
> +               LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J --btf_base vmlinux $@; \
>         else                                                            \
>                 printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
>         fi;
> --
> 2.31.1
>
