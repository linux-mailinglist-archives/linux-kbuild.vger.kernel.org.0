Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3B0333B52
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Mar 2021 12:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbhCJL0h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Mar 2021 06:26:37 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:54828 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232670AbhCJL0H (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Mar 2021 06:26:07 -0500
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 12ABPUus013422;
        Wed, 10 Mar 2021 20:25:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 12ABPUus013422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615375530;
        bh=EtPI5/QZah2DyjWRoZyS3HDm98BPv6IVUcYhV4WF/kk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PZCO7Z2y94+u+OqKaHscyOjzMVfEhJZoTiTCIdBtSL4vMDpEZ1Q2cdpTVCLk+AtGz
         U77F8zM2BiGEkOddfCblhCtfdAzQx1PdVSsJYJ+hmheKwxpWOJL1WaH7N/papEwZyV
         ILnnYUoU1Suo1apESMd6boJBgjlVnPIPy+TIHFDdhag3eE4hRIzWEAuMbIpXhuR1Ff
         KKlMX72y5kJmKPNnr805XN9EEOu7thDMq6k1nCPuTnDySZni0xhhqMXgbSg5COsOM7
         4BuAiYt6gPBO+sbn00tqhahA3c3UVwf81iT/9E+dVQr31LEFmZHn4AV6KZG2weGFJL
         GV8/UwL0qvwNQ==
X-Nifty-SrcIP: [209.85.210.176]
Received: by mail-pf1-f176.google.com with SMTP id x7so8407488pfi.7;
        Wed, 10 Mar 2021 03:25:30 -0800 (PST)
X-Gm-Message-State: AOAM530TtGyNzlHOrAzj45TCDEt+qwBT/9klD5rKEZ7Jh7MIAuAn7+v8
        oo1g0e28C81hrRb9YJEQEN04QG40RY3lvW2r2nw=
X-Google-Smtp-Source: ABdhPJw6QDfOuoCC6vgyVkMWd3r+4bJUHr5slmEcw4gwwkO3egn3v/OjmKXfcHsFqGu0gomzgVN2uvXhAc5uvo7AWRc=
X-Received: by 2002:aa7:956d:0:b029:1f1:5ba6:2a58 with SMTP id
 x13-20020aa7956d0000b02901f15ba62a58mr2660757pfq.63.1615375529634; Wed, 10
 Mar 2021 03:25:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1615354376.git.viresh.kumar@linaro.org> <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
In-Reply-To: <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 10 Mar 2021 20:24:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
Message-ID: <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source files
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 10, 2021 at 2:35 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Since the overlays dtb files are now named as .dtbo, there is a lot of
> interest in similarly naming the overlay source dts files as .dtso.
>
> This patch makes the necessary changes to allow .dtso format for overlay
> source files.
>
> Note that we still support generating .dtbo files from .dts files. This
> is required for the source files present in drivers/of/unittest-data/,
> because they can't be renamed to .dtso as they are used for some runtime
> testing as well.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  scripts/Makefile.lib | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index bc045a54a34e..59e86f67f9e0 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -339,7 +339,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>
>  quiet_cmd_dtc = DTC     $@
>  cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> -       $(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
> +       $(DTC) -I dts -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \

Even without "-I dts",

   inform = guess_input_format(arg, "dts");

seems to fall back to "dts" anyway,
but I guess you wanted to make this explicit, correct?

I will drop the ugly -O.
https://patchwork.kernel.org/project/linux-kbuild/patch/20210310110824.782209-1-masahiroy@kernel.org/

I will queue it to linux-kbuild/fixes.



>                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
>         cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
> @@ -347,9 +347,13 @@ cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ;
>  $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
>         $(call if_changed_dep,dtc)
>
> +# Required for of unit-test files as they can't be renamed to .dtso

If you go with *.dtso, I think you will rename
all *.dts under the drivers/ directory.

What is blocking you from making this consistent?






>  $(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
>         $(call if_changed_dep,dtc)
>
> +$(obj)/%.dtbo: $(src)/%.dtso $(DTC) FORCE
> +       $(call if_changed_dep,dtc)
> +
>  overlay-y := $(addprefix $(obj)/, $(overlay-y))
>
>  quiet_cmd_fdtoverlay = DTOVL   $@
> @@ -375,6 +379,9 @@ endef
>  $(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
>         $(call if_changed_rule,dtc,yaml)
>
> +$(obj)/%.dt.yaml: $(src)/%.dtso $(DTC) $(DT_TMP_SCHEMA) FORCE
> +       $(call if_changed_rule,dtc,yaml)
> +
>  dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
>
>  # Bzip2
> --
> 2.25.0.rc1.19.g042ed3e048af
>


-- 
Best Regards
Masahiro Yamada
