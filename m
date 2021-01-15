Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAF262F6FE2
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Jan 2021 02:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbhAOBOS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 20:14:18 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:28094 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbhAOBOR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 20:14:17 -0500
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 10F1DMuT021862;
        Fri, 15 Jan 2021 10:13:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 10F1DMuT021862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1610673203;
        bh=gQ/RwFs5PWoR2SEEMGT7lEv/knCoOXqDWqUOuxqfUzU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0k7OT8BOE3ksIs5m0aQO0nyH0Lok2wVEIeGevS5QBPcA7bhW6Avjebnn+W2ExfPPG
         NyDuY+1UKrvKMapPcuEehwUaLsi27XW7DFWF43HwVQ7ZBMKWcDZ0pBYbZ2LJq9WnFq
         t2fOfcWztDiOpwWzX+RxpLFnZPi4X/ZR8FcZlred9aPm0vuVH9fpwPi0O6xrsbjZmC
         /5sAJkwaeWeT2nwsWvHxSdBEHHL4q+BnwkFU7rW6fkiyOvW96jCz307PxGw7Vpsoix
         nAgONjj1B62nzkwUoBdvACnP/m4D6uT3yAKyO8t5GyNZe/MhTrGvBM1vrEt+rC2E5O
         XGJy0uPtDLdIw==
X-Nifty-SrcIP: [209.85.215.172]
Received: by mail-pg1-f172.google.com with SMTP id 15so4964515pgx.7;
        Thu, 14 Jan 2021 17:13:23 -0800 (PST)
X-Gm-Message-State: AOAM532rr3gDq2E9pVLE/c5zMEktfYO19q7IHgijoU8bTtf2iska05xl
        pAu0RrxgSVMavBglZQ8YOs2BDe8VtOvANAAKPy0=
X-Google-Smtp-Source: ABdhPJxzUpmUcJjmVLWnA5oELtKMrSv8yo0Bvbi7Hzav6EibhHUFBuLW+W8RHRjePT54Waena/fvoCTMJ/2u7OqHHCs=
X-Received: by 2002:a63:ff09:: with SMTP id k9mr10219720pgi.175.1610673202305;
 Thu, 14 Jan 2021 17:13:22 -0800 (PST)
MIME-Version: 1.0
References: <1610500731-30960-2-git-send-email-jjohnson@codeaurora.org> <1610660990-18812-1-git-send-email-jjohnson@codeaurora.org>
In-Reply-To: <1610660990-18812-1-git-send-email-jjohnson@codeaurora.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 15 Jan 2021 10:12:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNASHC5sNWxL0Ve8=f6=Gpf8ekVS41ETacBCTv5p72SVkNA@mail.gmail.com>
Message-ID: <CAK7LNASHC5sNWxL0Ve8=f6=Gpf8ekVS41ETacBCTv5p72SVkNA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: handle excessively long argument lists
To:     Jeff Johnson <jjohnson@codeaurora.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Prasad Sodagudi <psodagud@quicinc.com>, eberman@quicinc.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 15, 2021 at 6:50 AM Jeff Johnson <jjohnson@codeaurora.org> wrote:
>
> From: Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>
>
> Modules with a large number of compilation units may be
> exceeding AR and LD command argument list. Handle this gracefully by
> writing the long argument list in a file. The command line options
> read from file are inserted in place of the original @file option.
>
> The usage is well documented at
> https://www.gnu.org/software/make/manual/html_node/File-Function.html
>
> Signed-off-by: Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>
> Signed-off-by: Jeff Johnson <jjohnson@codeaurora.org>
> ---




First, is this a real problem?
If so, which module is exceeding the command line limit?


$(file ) is only supported by GNU Make 4.0 or later.

The current minimum version is GNU Make 3.81.

If we need this feature,
Documentation/process/changes.rst must be updated.




But, more importantly, none of your patches
works correctly.



Since $(file ...) is evaluated into an empty string,
your patches would break the Kbuild ability
that detects the command changes.




Steps to reproduce the problem
------------------------------



[1] add a module foo that consists of
    three objects foo1.o, foo2.o, foo3.o

For example, like follows:


obj-m += foo.o
foo-objs := foo1.o foo2.o foo3.o



[2] Run 'make modules'

You will get the module foo.



[3] Drop foo3.o from the module members

Change Makefile as follows:

obj-m += foo.o
foo-objs := foo1.o foo2.o



[4] Re-run 'make modules'





The current build system cleverly
notices the Makefile change, and
correctly rebuilds the foo module.

With your patch set applied,
the build system would not rebuild
the module.







> Changes in v2:
>   - Remove spurious endif
>
> scripts/Makefile.build | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 252b7d2..787dca2 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -425,7 +425,10 @@ $(obj)/lib.a: $(lib-y) FORCE
>  # module is turned into a multi object module, $^ will contain header file
>  # dependencies recorded in the .*.cmd file.
>  quiet_cmd_link_multi-m = LD [M]  $@
> -      cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^)
> +      cmd_link_multi-m =                                       \
> +       $(file >$@.in,$(filter %.o,$^))                         \
> +       $(LD) $(ld_flags) -r -o $@ @$@.in;                      \
> +       rm -f $@.in
>
>  $(multi-used-m): FORCE
>         $(call if_changed,link_multi-m)
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
Best Regards
Masahiro Yamada
