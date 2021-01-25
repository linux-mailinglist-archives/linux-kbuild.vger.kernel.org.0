Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 767B0302E70
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Jan 2021 22:56:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733013AbhAYVzZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Jan 2021 16:55:25 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:49124 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733001AbhAYVzO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jan 2021 16:55:14 -0500
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 10PLs0AX013560;
        Tue, 26 Jan 2021 06:54:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 10PLs0AX013560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611611640;
        bh=UX6b6pUkVV6T/bQ7SMCRjpyfBhS2L4xJkhyy+qmYCFU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qEMwILEWC1D9Pv3cg/I6TFtkrEBWBKr00cJU7PSwWioOtRKzYNcGE73cD9ISVxeKB
         jjmUc+25p/1SkUv9I9dZbRb8YWdszSbRKrnvBu1YAYXAnVUxEkALMEOslDpQ2V6pyq
         mrIIUIrD4r3HcrgM+X0ARPZqsURqxi3+7ZbUJD6XGCKPoHH3OCjX05eXgYxrL3Xos4
         JFplKKvX3B/ti7SmVEmdikdJdAf3swJSilMsD1IwlknkZFTsmRro8VLZ/ExOjJ7I0J
         DmOla6W1TS8nJt2tF6iISuAxrG9/uPLPoCUBeOHCs/g3gOsEZMLFoJSdRWWpfNlvbp
         c40P9pU0AhJYQ==
X-Nifty-SrcIP: [209.85.215.182]
Received: by mail-pg1-f182.google.com with SMTP id o16so247094pgg.5;
        Mon, 25 Jan 2021 13:54:00 -0800 (PST)
X-Gm-Message-State: AOAM533hkSnF/qLAiHm5vpB2/KTS4MymyX0NVjV0VE7ejGm7uMAdC89j
        eWIGypeYvosh9Cp0tVuxSNN4wFbp/BQnPK9Y9oE=
X-Google-Smtp-Source: ABdhPJz7jVDUCqkHiYZmSxVfXQ2QVujb2/QrlRWGngD0SSPGjQ4ZtlwG1VPt/V++hNbbdBerKFQCeMW2DEksR/gGNHo=
X-Received: by 2002:a62:2f07:0:b029:1bb:5f75:f985 with SMTP id
 v7-20020a622f070000b02901bb5f75f985mr2194842pfv.76.1611611639601; Mon, 25 Jan
 2021 13:53:59 -0800 (PST)
MIME-Version: 1.0
References: <20210125105757.661240-1-uwe@kleine-koenig.org>
In-Reply-To: <20210125105757.661240-1-uwe@kleine-koenig.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 26 Jan 2021 06:53:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS5t1wew0MMFjdB5HGCAMerhU7pAGiFhcTtCRUAAjGLpw@mail.gmail.com>
Message-ID: <CAK7LNAS5t1wew0MMFjdB5HGCAMerhU7pAGiFhcTtCRUAAjGLpw@mail.gmail.com>
Subject: Re: [PATCH] cmd_dtc: Enable generation of device tree symbols
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        cyril@debamax.com, Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <mripard@kernel.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 25, 2021 at 8:07 PM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.or=
g> wrote:
>
> Adding the -@ switch to dtc results in the binary devicetrees containing
> a list of symbolic references and their paths. This is necessary to
> apply device tree overlays e.g. on Raspberry Pi as described on
> https://www.raspberrypi.org/documentation/configuration/device-tree.md.
>
> Obviously the downside of this change is an increas of the size of the
> generated dtbs, for an arm out-of-tree build (multi_v7_defconfig):
>
>         $ du -s arch/arm/boot/dts*
>         101380  arch/arm/boot/dts-pre
>         114308  arch/arm/boot/dts-post
>
> so this is in average an increase of 12.8% in size.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>


(CCing DT ML.)


https://www.spinics.net/lists/linux-kbuild/msg27904.html

See Rob's comment:

"We've already rejected doing that. Turning on '-@' can grow the dtb
size by a significant amount which could be problematic for some
boards."








> ---
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 213677a5ed33..0683a5808f7f 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -319,7 +319,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>
>  quiet_cmd_dtc =3D DTC     $@
>  cmd_dtc =3D $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc=
-tmp) $< ; \
> -       $(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
> +       $(DTC) -@ -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
>                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
>         cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
> --
> 2.29.2
>


--
Best Regards

Masahiro Yamada
