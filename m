Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE1D33D6F0
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2019 21:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405284AbfFKThs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 Jun 2019 15:37:48 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36837 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405266AbfFKThr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Jun 2019 15:37:47 -0400
Received: by mail-pl1-f193.google.com with SMTP id d21so5545813plr.3
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Jun 2019 12:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FPoxxDVnePPhHUER+oER3oucDE8cdYp68lXRy9Z4zNg=;
        b=k9WZh4iOpYWtOERFcVxwA7ZlNcmKiK5gV6X1KXLLIgNZn+REeO9MREV2X5pbW/pmOe
         UrTduLBgyue13Zaq9MrTZjQN5X2mgOjzFJY7Ib1tQV5Me96dAMOcwx54G0pB5SKo5mmY
         zlwf5lysaK6UXnniIaXfoEH6tiTaEiL46MdhYtNR0Ot22ml1yLwkttqOPyi5lMp10HbN
         XU/n4SePZ4jkJhUIRA6qaUjI0XlTz56USBikTEOZYYlcgVFtsTV5JhGBPqX0tytMuKPa
         lL7TX8wlhlrfrWE8FX7obHiWs55oLP5+0nIOnK/3ELP2MbCmcVYtCA1A6/K/zzHpSb1/
         MMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FPoxxDVnePPhHUER+oER3oucDE8cdYp68lXRy9Z4zNg=;
        b=bngFTP9i5LxPG2csujJKliV1v9Xha8zE7dlxW4WDCTRA/WCbUViyqJ+UCQ5dvFlIoh
         IzwK7Qe7Zu6FjWQdrPnQiV2Jvh+CRpA39ldmbUu4gQR0avGSlJfdYwuYklJod4E0AZ8/
         xTP2BQ9QlZgGYojp1Idkg0+u//iRqTnml2R3apZhrySKG5EhD1yMtOJX3n4xFmzeKnlr
         15STqvLAO9FiTeU7K6IVhali9E2u823C5PIlVvhBlFK2e40FFRwVAmdB0j9b+xgtfN4w
         LuQN81LEJRSYmHCwubH3gO+l1QwvQ5avT+9H9ry/2qmxud+dsERKrbpSx/uIck6a9DzC
         u6/g==
X-Gm-Message-State: APjAAAVyWkisuZ6LSzc0yy6h4mMtHZH8rsXd64JB8gdyPdWGNWGTBOrv
        eRnCdUr/Rl9t+MqAynYTw5Zmt28tGpV0sKHlA6qKrA==
X-Google-Smtp-Source: APXvYqx/0My5JwesbKnFTk6TQKBZUVLR+S7nz6oUlQpnVsyPBzrdUapvqCfOf9Me69/XI6Gva9fSZxSOhyWbsVoU1Q8=
X-Received: by 2002:a17:902:b944:: with SMTP id h4mr75104375pls.179.1560281866598;
 Tue, 11 Jun 2019 12:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190611184331.44242-1-natechancellor@gmail.com>
In-Reply-To: <20190611184331.44242-1-natechancellor@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 11 Jun 2019 12:37:35 -0700
Message-ID: <CAKwvOdkxjweo=s-9tBNGwyjDJfyDfHjT7+DS+-Q-Sx7Ms8uoPg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add -Werror=unknown-warning-option to CLANG_FLAGS
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Peter Smith <peter.smith@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 11, 2019 at 11:43 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
> Suggested-by: Peter Smith <peter.smith@linaro.org>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

I verified this has no negative effect with -Qunused-arguments and the
relative position of the two flags.  The build failure is much more
explicit with this patch:
> error: unknown warning option '-Wno-psabi' [-Werror,-Wunknown-warning-option]

Tested-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index b81e17261250..5f9d09bd2252 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -528,6 +528,7 @@ ifneq ($(GCC_TOOLCHAIN),)
>  CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
>  CLANG_FLAGS    += -no-integrated-as
> +CLANG_FLAGS    += -Werror=unknown-warning-option
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>  KBUILD_AFLAGS  += $(CLANG_FLAGS)
>  export CLANG_FLAGS
> --
> 2.22.0
>


-- 
Thanks,
~Nick Desaulniers
