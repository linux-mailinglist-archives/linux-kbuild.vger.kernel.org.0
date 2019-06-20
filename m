Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1EB24D28E
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2019 17:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfFTP4d (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Jun 2019 11:56:33 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:26392 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbfFTP4d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Jun 2019 11:56:33 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x5KFuLr4020476;
        Fri, 21 Jun 2019 00:56:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x5KFuLr4020476
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561046182;
        bh=KH4vdpFNwMSkX/YOwDIbPLEaeaLVO5AksjtcFewy9bs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YmrnKRAs6azlteGwRCluenSsb5KVU1SFDE9M1nNyiQcG7EdmKcZbWCp2dpVv0tNKK
         FXWtRuNRB8UtgSox4DU+osKCpVWG3UaoZYE+iITMW+Sypcu0oLi5F1b04gapQbzVF4
         w4eKDNUwqq1UEJEVGP2CJS4w/w0AM5Qi2Q+affb4I17W4bDwyck75sQJ3jZ7znjJwf
         oOGgjMiU+ojEkHHXtrBspaWzXI4UuTM8O99Eubjusnw8qw27/N4nuiGHEQw2uZK4ph
         jFypiZp/msoqh5ZNjzY0KvdH1Lfyl+DRTq25zbM1buHQKrl2jEuGPxislOXLui1k4Q
         zSwhKfks8r8YQ==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id n21so1849351vsp.12;
        Thu, 20 Jun 2019 08:56:22 -0700 (PDT)
X-Gm-Message-State: APjAAAVUsWla7/nFE3mInXpffYEKCPUpzk3epNq4ir384BOkUYm8mbB4
        Z7qOSBC4xw1Qnd/ofq9K9l8pqlH71HjLIg74RJU=
X-Google-Smtp-Source: APXvYqwOyFw1S3lwiDmQjZH8FJFuz02X1ZoVDFVJaXiAqOqKaI5O77DFzW9dVW3ZeR/GZDrzoEikMulqe6e92/t12lA=
X-Received: by 2002:a67:cd1a:: with SMTP id u26mr32273401vsl.155.1561046181328;
 Thu, 20 Jun 2019 08:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190616174805.3069-1-yamada.masahiro@socionext.com> <20190616174805.3069-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190616174805.3069-2-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 21 Jun 2019 00:55:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNARHVrUdCAi_egRpNwWs4EFESC2FPd6j-ygVEHKZsS6anA@mail.gmail.com>
Message-ID: <CAK7LNARHVrUdCAi_egRpNwWs4EFESC2FPd6j-ygVEHKZsS6anA@mail.gmail.com>
Subject: Re: [PATCH 2/2] lib/raid6: refactor unroll rules with pattern rules
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 17, 2019 at 2:49 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> This Makefile repeats very similar rules.
>
> Let's use pattern rules. $(UNROLL) can be replaced with $*.
>
> No intended change in behavior.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.

>
>  lib/raid6/Makefile | 97 ++++++----------------------------------------
>  1 file changed, 11 insertions(+), 86 deletions(-)
>
> diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
> index 74004037033f..42695bc8d451 100644
> --- a/lib/raid6/Makefile
> +++ b/lib/raid6/Makefile
> @@ -12,9 +12,6 @@ raid6_pq-$(CONFIG_S390) += s390vx8.o recov_s390xc.o
>
>  hostprogs-y    += mktables
>
> -quiet_cmd_unroll = UNROLL  $@
> -      cmd_unroll = $(AWK) -f$(srctree)/$(src)/unroll.awk -vN=$(UNROLL) < $< > $@
> -
>  ifeq ($(CONFIG_ALTIVEC),y)
>  altivec_flags := -maltivec $(call cc-option,-mabi=altivec)
>
> @@ -50,111 +47,39 @@ CFLAGS_REMOVE_neon8.o += -mgeneral-regs-only
>  endif
>  endif
>
> -targets += int1.c
> -$(obj)/int1.c:   UNROLL := 1
> -$(obj)/int1.c:   $(src)/int.uc $(src)/unroll.awk FORCE
> -       $(call if_changed,unroll)
> -
> -targets += int2.c
> -$(obj)/int2.c:   UNROLL := 2
> -$(obj)/int2.c:   $(src)/int.uc $(src)/unroll.awk FORCE
> -       $(call if_changed,unroll)
> -
> -targets += int4.c
> -$(obj)/int4.c:   UNROLL := 4
> -$(obj)/int4.c:   $(src)/int.uc $(src)/unroll.awk FORCE
> -       $(call if_changed,unroll)
> -
> -targets += int8.c
> -$(obj)/int8.c:   UNROLL := 8
> -$(obj)/int8.c:   $(src)/int.uc $(src)/unroll.awk FORCE
> -       $(call if_changed,unroll)
> -
> -targets += int16.c
> -$(obj)/int16.c:  UNROLL := 16
> -$(obj)/int16.c:  $(src)/int.uc $(src)/unroll.awk FORCE
> -       $(call if_changed,unroll)
> +quiet_cmd_unroll = UNROLL  $@
> +      cmd_unroll = $(AWK) -f$(srctree)/$(src)/unroll.awk -vN=$* < $< > $@
>
> -targets += int32.c
> -$(obj)/int32.c:  UNROLL := 32
> -$(obj)/int32.c:  $(src)/int.uc $(src)/unroll.awk FORCE
> +targets += int1.c int2.c int4.c int8.c int16.c int32.c
> +$(obj)/int%.c: $(src)/int.uc $(src)/unroll.awk FORCE
>         $(call if_changed,unroll)
>
>  CFLAGS_altivec1.o += $(altivec_flags)
> -targets += altivec1.c
> -$(obj)/altivec1.c:   UNROLL := 1
> -$(obj)/altivec1.c:   $(src)/altivec.uc $(src)/unroll.awk FORCE
> -       $(call if_changed,unroll)
> -
>  CFLAGS_altivec2.o += $(altivec_flags)
> -targets += altivec2.c
> -$(obj)/altivec2.c:   UNROLL := 2
> -$(obj)/altivec2.c:   $(src)/altivec.uc $(src)/unroll.awk FORCE
> -       $(call if_changed,unroll)
> -
>  CFLAGS_altivec4.o += $(altivec_flags)
> -targets += altivec4.c
> -$(obj)/altivec4.c:   UNROLL := 4
> -$(obj)/altivec4.c:   $(src)/altivec.uc $(src)/unroll.awk FORCE
> -       $(call if_changed,unroll)
> -
>  CFLAGS_altivec8.o += $(altivec_flags)
> -targets += altivec8.c
> -$(obj)/altivec8.c:   UNROLL := 8
> -$(obj)/altivec8.c:   $(src)/altivec.uc $(src)/unroll.awk FORCE
> +targets += altivec1.c altivec2.c altivec4.c altivec8.c
> +$(obj)/altivec%.c: $(src)/altivec.uc $(src)/unroll.awk FORCE
>         $(call if_changed,unroll)
>
>  CFLAGS_vpermxor1.o += $(altivec_flags)
> -targets += vpermxor1.c
> -$(obj)/vpermxor1.c: UNROLL := 1
> -$(obj)/vpermxor1.c: $(src)/vpermxor.uc $(src)/unroll.awk FORCE
> -       $(call if_changed,unroll)
> -
>  CFLAGS_vpermxor2.o += $(altivec_flags)
> -targets += vpermxor2.c
> -$(obj)/vpermxor2.c: UNROLL := 2
> -$(obj)/vpermxor2.c: $(src)/vpermxor.uc $(src)/unroll.awk FORCE
> -       $(call if_changed,unroll)
> -
>  CFLAGS_vpermxor4.o += $(altivec_flags)
> -targets += vpermxor4.c
> -$(obj)/vpermxor4.c: UNROLL := 4
> -$(obj)/vpermxor4.c: $(src)/vpermxor.uc $(src)/unroll.awk FORCE
> -       $(call if_changed,unroll)
> -
>  CFLAGS_vpermxor8.o += $(altivec_flags)
> -targets += vpermxor8.c
> -$(obj)/vpermxor8.c: UNROLL := 8
> -$(obj)/vpermxor8.c: $(src)/vpermxor.uc $(src)/unroll.awk FORCE
> +targets += vpermxor1.o vpermxor2.o vpermxor4.o vpermxor8.o
> +$(obj)/vpermxor%.c: $(src)/vpermxor.uc $(src)/unroll.awk FORCE
>         $(call if_changed,unroll)
>
>  CFLAGS_neon1.o += $(NEON_FLAGS)
> -targets += neon1.c
> -$(obj)/neon1.c:   UNROLL := 1
> -$(obj)/neon1.c:   $(src)/neon.uc $(src)/unroll.awk FORCE
> -       $(call if_changed,unroll)
> -
>  CFLAGS_neon2.o += $(NEON_FLAGS)
> -targets += neon2.c
> -$(obj)/neon2.c:   UNROLL := 2
> -$(obj)/neon2.c:   $(src)/neon.uc $(src)/unroll.awk FORCE
> -       $(call if_changed,unroll)
> -
>  CFLAGS_neon4.o += $(NEON_FLAGS)
> -targets += neon4.c
> -$(obj)/neon4.c:   UNROLL := 4
> -$(obj)/neon4.c:   $(src)/neon.uc $(src)/unroll.awk FORCE
> -       $(call if_changed,unroll)
> -
>  CFLAGS_neon8.o += $(NEON_FLAGS)
> -targets += neon8.c
> -$(obj)/neon8.c:   UNROLL := 8
> -$(obj)/neon8.c:   $(src)/neon.uc $(src)/unroll.awk FORCE
> +targets += neon1.c neon2.c neon4.c neon8.c
> +$(obj)/neon%.c: $(src)/neon.uc $(src)/unroll.awk FORCE
>         $(call if_changed,unroll)
>
>  targets += s390vx8.c
> -$(obj)/s390vx8.c:   UNROLL := 8
> -$(obj)/s390vx8.c:   $(src)/s390vx.uc $(src)/unroll.awk FORCE
> +$(obj)/s390vx%.c: $(src)/s390vx.uc $(src)/unroll.awk FORCE
>         $(call if_changed,unroll)
>
>  quiet_cmd_mktable = TABLE   $@
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
