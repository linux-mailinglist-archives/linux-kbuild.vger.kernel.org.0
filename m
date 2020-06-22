Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60366202F63
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jun 2020 07:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbgFVFLH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 Jun 2020 01:11:07 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:50329 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgFVFLF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jun 2020 01:11:05 -0400
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 05M5AoTQ012538;
        Mon, 22 Jun 2020 14:10:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 05M5AoTQ012538
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1592802651;
        bh=rtovyjmtjdSI4mT4E8WX06Hp4IUhVZCZ0HVtU3JW7HY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hz4MQDigVkW8NWB38mxig1VvddkdJrlRUq1XJKR+fUdRBF8EdheuglfjDpo0qVWmp
         DM7f7AuU5lKGhRdd7cqoAkgV2Ohs1n9hzOKwsN2TdbtwBk/J6WGetZCe1k1lBpRM6E
         no/MgaM/bUGGkj1fg6dZAi0rnEPdiAnTCVfjWHZRtRtJ5gd/LS7nYws5b4MSVLa2DG
         ynieWT4H/CkkBoV9oM4wgmSyv84eYj+Zq4rTgiTwUYnDzk4nE5kZDfHDO64WA5rMS8
         H/e7qvfyb8kz75p5tHtBT09ygDo3uhlBIbRgDwFbyu9gAH/pdIqJd5NjH38TMP/JL/
         RZ5IDo4wbygYg==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id 190so8887090vsr.9;
        Sun, 21 Jun 2020 22:10:50 -0700 (PDT)
X-Gm-Message-State: AOAM530lLdGu3VbkFa4El+wMjRiKR8LpZL4vljHKEeNktv8+d4IxIAR4
        lmEpwsA3Ibr4nzPUQIWnBwALuWJhDOFauxozsZ8=
X-Google-Smtp-Source: ABdhPJyPzynbMmROc1mJ3Htutmdx5lwoyKIWF79hcxcwmlWiTLyb+tIudJSD1p6ni8qq6It5V4cz6c5spnxbrziJZjc=
X-Received: by 2002:a67:22c7:: with SMTP id i190mr15249326vsi.179.1592802649777;
 Sun, 21 Jun 2020 22:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <591473.1592679153@turing-police>
In-Reply-To: <591473.1592679153@turing-police>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 22 Jun 2020 14:10:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNARevD4o1WCRatKqZcf9-arxsvBcyLKHcNSM1ih+TDS5Mw@mail.gmail.com>
Message-ID: <CAK7LNARevD4o1WCRatKqZcf9-arxsvBcyLKHcNSM1ih+TDS5Mw@mail.gmail.com>
Subject: Re: kbuild: separate kerneldoc warnings from compiler warnings
To:     =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jun 21, 2020 at 3:52 AM Valdis Kl=C4=93tnieks
<valdis.kletnieks@vt.edu> wrote:
>
> This patch introduces a new build flag 'K=3D1' which controls whether ker=
neldoc
> warnings should be issued, separating them from the compiler warnings tha=
t W=3D
> controls.


I do not understand why this change is needed.


IIRC, our goal was to enable this check by default.
https://patchwork.kernel.org/patch/10030521/
but there are so many warnings.


Meanwhile, this is checked only when W=3D is given
because 0-day bot tests with W=3D1 to
block new kerneldoc warnings.

K=3D1 ?   Do people need to learn this new switch?





> Signed-off-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>
>
> diff --git a/Makefile b/Makefile
> index 29abe44ada91..b1c0f9484a66 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1605,6 +1605,7 @@ PHONY +=3D help
>         @echo  '                       (sparse by default)'
>         @echo  '  make C=3D2   [targets] Force check of all c source with=
 $$CHECK'
>         @echo  '  make RECORDMCOUNT_WARN=3D1 [targets] Warn about ignored=
 mcount sections'
> +       @echo  '  make K=3D1   [targets] Warn about problems in kerneldoc=
 comments'
>         @echo  '  make W=3Dn   [targets] Enable extra build checks, n=3D1=
,2,3 where'
>         @echo  '                1: warnings which may be relevant and do =
not occur too often'
>         @echo  '                2: warnings which occur quite often but m=
ay still be relevant'
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 2e8810b7e5ed..9bcb77f5a5f1 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -100,7 +100,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
>          cmd_force_checksrc =3D $(CHECK) $(CHECKFLAGS) $(c_flags) $<
>  endif
>
> -ifneq ($(KBUILD_EXTRA_WARN),)
> +ifneq ($(KBUILD_KDOC_WARN),)
>    cmd_checkdoc =3D $(srctree)/scripts/kernel-doc -none $<
>  endif
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 4aea7cf71d11..3fd5881c91b0 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -17,6 +17,12 @@ endif
>
>  export KBUILD_EXTRA_WARN
>
> +ifeq ("$(origin K)", "command line")
> +  KBUILD_KDOC_WARN :=3D $(K)
> +endif
> +
> +export KBUILD_KDOC_WARN
> +
>  #
>  # W=3D1 - warnings which may be relevant and do not occur too often
>  #
>
>


--=20
Best Regards
Masahiro Yamada
