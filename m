Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7D69688D6
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2019 14:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729983AbfGOMVy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Jul 2019 08:21:54 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:20811 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729968AbfGOMVx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jul 2019 08:21:53 -0400
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x6FCLm24018268;
        Mon, 15 Jul 2019 21:21:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x6FCLm24018268
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563193309;
        bh=LbrPTwm2RKTZ91hukzTwHsqfXbDOaNmWM5RF0umencY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WvPBb/F9X1epLFihQ3flS5iTh5z8xA3XC0vJ6LSzEk2YKitXW0i7zhVnSoCvMecU5
         3Ofa3LTSE1LQme5S7uXKUaG3wmhc4+fJa9Kuvk2nEXuKO9kOk7gYxLzKDU55KUhFdF
         98sqa+A7Ys7L2jW72CgNfExeffLSZA7f2zY0fYWZsp74ptIoX1DQqTsDXfP5DMNjLE
         gUHpbCy0m4Cx63mqpMg61/PtzUmRYxIbKnPaUHvOh1dRDU9BWEXYnonvq8nvkh9ZCC
         sbgQrgyfkeXFmTO1hxFpo0NkqS44qaS0KGBquhWG68Jv5tF6aCcXCVmrRrF+Jy6Ti1
         KGjQX/rTNYa/Q==
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id u124so11205086vsu.2;
        Mon, 15 Jul 2019 05:21:49 -0700 (PDT)
X-Gm-Message-State: APjAAAVFQubS+bwaOersGg189MVm51gEAhbARBmv+jodLrFqZBPGMs2w
        futoF4bDv06dj9O1ci8TarRnSSuFepKwx3yXz1A=
X-Google-Smtp-Source: APXvYqxHTtJM+QxG8TFDOEHuDTiqxx0gHvbNimihrfx3rip5pHLQaGwS7WMIPXJvG7rtyLf1lbIviUXOX3J2uxUOpxQ=
X-Received: by 2002:a67:8e0a:: with SMTP id q10mr15956971vsd.215.1563193307894;
 Mon, 15 Jul 2019 05:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190709184919.20178-1-seth.forshee@canonical.com>
In-Reply-To: <20190709184919.20178-1-seth.forshee@canonical.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 15 Jul 2019 21:21:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT1wrc0WVOKGTJ3f1RZ+EUjYtJxmKv_2N6mU2STAUg4RA@mail.gmail.com>
Message-ID: <CAK7LNAT1wrc0WVOKGTJ3f1RZ+EUjYtJxmKv_2N6mU2STAUg4RA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add -fcf-protection=none to retpoline flags
To:     Seth Forshee <seth.forshee@canonical.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 10, 2019 at 3:49 AM Seth Forshee <seth.forshee@canonical.com> wrote:
>
> -mindirect-branch and -fcf-protection are not compatible, and
> so kernel builds fail with a gcc build where -fcf-protection is
> enabled by default. Add -fcf-protection=none to the retpoline
> flags to fix this.
>
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
> ---

Applied to linux-kbuild. Thanks.



>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 3e4868a6498b..050f11d19777 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -636,6 +636,10 @@ RETPOLINE_CFLAGS_CLANG := -mretpoline-external-thunk
>  RETPOLINE_VDSO_CFLAGS_CLANG := -mretpoline
>  RETPOLINE_CFLAGS := $(call cc-option,$(RETPOLINE_CFLAGS_GCC),$(call cc-option,$(RETPOLINE_CFLAGS_CLANG)))
>  RETPOLINE_VDSO_CFLAGS := $(call cc-option,$(RETPOLINE_VDSO_CFLAGS_GCC),$(call cc-option,$(RETPOLINE_VDSO_CFLAGS_CLANG)))
> +# -mindirect-branch is incompatible with -fcf-protection, so ensure the
> +# latter is disabled
> +RETPOLINE_CFLAGS += $(call cc-option,-fcf-protection=none,)
> +RETPOLINE_VDSO_CFLAGS += $(call cc-option,-fcf-protection=none,)
>  export RETPOLINE_CFLAGS
>  export RETPOLINE_VDSO_CFLAGS
>
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
