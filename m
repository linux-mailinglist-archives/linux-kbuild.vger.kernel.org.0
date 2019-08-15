Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAB2E8F75F
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2019 01:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387598AbfHOXER (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Aug 2019 19:04:17 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37562 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731281AbfHOXER (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Aug 2019 19:04:17 -0400
Received: by mail-pf1-f194.google.com with SMTP id 129so2083639pfa.4
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2019 16:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C0paVUeRwkAoF6xRtck4YRzJFED8y2mJAR0FlFh8+FQ=;
        b=ROop3CtRsN1mpl3TlpwQuxZlYKsNcJlSl5Q0Z5CcVlEZmUVr/KJJzbpPoUtQmYiwrq
         6KJz1RYdzH2WeQjOHjapJC1s4YA2ITXtSIOVp+8riytN/H4DNksBCuL6UW1nXwc+I3UP
         /8Z7zmvc5Krp5G/CudBeMzMnWYDRYOWv113+8jy0bbIGRKLZTkHUGKtjpifEcZN9qKvE
         8cv9G7dSI7EYir+8q6gNM6Q9h4QBT114ulES49ubrOJMXzDIsXuKKDfsk3meWB7KfQa6
         loEjbeLOArWhBFOtJRS4Fa1ha0j9kBjtNYRt5+SM1blcM9aKm8QpKcHWx+OVm/bRRjUT
         SITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C0paVUeRwkAoF6xRtck4YRzJFED8y2mJAR0FlFh8+FQ=;
        b=JzsgDUhlwSN/yMyOZzygsn6fxqEkqwtVgp597VKbMGLp7eTo9sXB+CcZ4ZqFUUemFG
         /k5LpGZgMN8FJt+x83V2cJVPD+ajZ59NC11zItVyEnsOlx2J247/565UpiThquP7yQK0
         t2/ehpWO1q7iDypwBSKXDDVc9O8ojrCbJzq2Ehs1wWspMpTzXj1LjgMUILTWKhZNPe96
         bkbivC/jtihE5zPPRtuYaYe7j+Hefhb/Q/uowB7V6qIEB3Z5tKg0SPeFQmUEXhmKf0mc
         IUdh0Kct4X4XUawbMMdQEQmYODPjDLT4IUVCrGOUPOIDnfpS2VqJigXmI4U+OS0mYI2A
         FraA==
X-Gm-Message-State: APjAAAUtPVxdiHoS4Qsld8wXoYXPfistTHeRZ1lO9gR32jQbhjhtV6Cv
        AfE8WIBifdP77e1msPC2Rkp/TunPrRPjc4CKMYQc4g==
X-Google-Smtp-Source: APXvYqxuQbVR4kKUXSrMUV3M2v/hOwCD7rK0veETUEER9twh5HLxnDFR6DSHVh6KLD1k8+doMTCclhImcMpzJcxCLzU=
X-Received: by 2002:a65:690b:: with SMTP id s11mr1686210pgq.10.1565910255496;
 Thu, 15 Aug 2019 16:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdk+NQCKZ4EXAukaKYK4R9CDaNWVY_aDxXaeQrLfo_Z=nw@mail.gmail.com>
 <20190815225844.145726-1-nhuck@google.com>
In-Reply-To: <20190815225844.145726-1-nhuck@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 15 Aug 2019 16:04:04 -0700
Message-ID: <CAKwvOdmu_=CM-8LOfi556t=ZPi+p2WVYcZ6Sk+ru+EfzPCb-JA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Require W=1 for -Wimplicit-fallthrough with clang
To:     Nathan Huckleberry <nhuck@google.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Joe Perches <joe@perches.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 15, 2019 at 3:59 PM 'Nathan Huckleberry' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> Clang is updating to support -Wimplicit-fallthrough on C
> https://reviews.llvm.org/D64838. Since clang does not
> support the comment version of fallthrough annotations
> this update causes an additional 50k warnings. Most
> of these warnings (>49k) are duplicates from header files.
>
> This patch is intended to be reverted after the warnings
> have been cleaned up.
>
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
> Changes v1->v2
> * Move code to preexisting ifdef
>  scripts/Makefile.extrawarn | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index a74ce2e3c33e..95973a1ee999 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -70,5 +70,6 @@ KBUILD_CFLAGS += -Wno-initializer-overrides
>  KBUILD_CFLAGS += -Wno-format
>  KBUILD_CFLAGS += -Wno-sign-compare
>  KBUILD_CFLAGS += -Wno-format-zero-length
> +KBUILD_CFLAGS += $(call cc-option,-Wno-implicit-fallthrough)

Clang seems to support -Wno-implicit-fallthrough since 3.2.  You can
remove the cc-option, since you'll need a newer clang than that to
build the kernel.
-- 
Thanks,
~Nick Desaulniers
