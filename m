Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E716A2FD9EB
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 20:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387604AbhATTnT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 14:43:19 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:20333 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388299AbhATTnJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 14:43:09 -0500
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 10KJfoZX026396;
        Thu, 21 Jan 2021 04:41:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 10KJfoZX026396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611171711;
        bh=ti5t2+h/e4Lbyj+1QRC0zgdTTPkyy4j846BUxXsIkR4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=13qZrKqmZQfNbu92u5lKRiqL5lSDM/wWFqKSnFIjDrJVoyPEsCVUbw6TOAph0nG35
         by/htD/qjAG2s08c+Pac2wiRlhA1oIfQpJmLC6TiV4ASMQX5QVaqtDEZarTArEyHsR
         vxEgCiitVwTyhLOZnL0SDqhs0gVFYphGWjJKm4Sdn6oTVVshGJzBu0Gi2zUSkMWHxY
         44EAbILzkb5YgNcO9Flh6tsW58uNRP9bQEft+uxVw/SjpvGo7GhDtAHfNytDnBF/TP
         vMN9NkNOqYXtRTgEex1WuVvxI4f3fM3ikIuVhwSqkUZ46VDIXoGSX6H358yt7p3FVS
         qMddgv8hY+n1A==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id kx7so2825409pjb.2;
        Wed, 20 Jan 2021 11:41:50 -0800 (PST)
X-Gm-Message-State: AOAM532TMe7zNs9jJ3jZ/UQkynk/ZFVwFUSjKFA1sNYFC5pD4xioKmo6
        u4D++s9NQRx+JT4GyyfDfgBdWKibkHeJMGO28uw=
X-Google-Smtp-Source: ABdhPJxoymgbyKA25iyxeoVOcrQit6QG1N56wLwDpqMYB5zV/DesKRJNJ3uIVskeTs8p+XyRUL02XSQTbs2KIsrrWwA=
X-Received: by 2002:a17:90a:3481:: with SMTP id p1mr7454548pjb.198.1611171710150;
 Wed, 20 Jan 2021 11:41:50 -0800 (PST)
MIME-Version: 1.0
References: <20210108003035.1930475-1-willmcvicker@google.com>
 <CAK7LNARzf6Q4-X8hf5QmXBxJUtOECqE0Y6EQVrQ7kmnzaBKk3A@mail.gmail.com>
 <CABYd82ajiVkYaLPJzaWhVwi_b0nEU=qQGXp34rgYmKQ07skrfg@mail.gmail.com> <CABYd82a=xJr7AoWFPmahOarbUZSxxOA_+VQbN2EK0unZU-bjTg@mail.gmail.com>
In-Reply-To: <CABYd82a=xJr7AoWFPmahOarbUZSxxOA_+VQbN2EK0unZU-bjTg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 21 Jan 2021 04:41:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQhsiaumkLF21zTkpOHCpQyCzxdrGX=897Bsc8w=aMapw@mail.gmail.com>
Message-ID: <CAK7LNAQhsiaumkLF21zTkpOHCpQyCzxdrGX=897Bsc8w=aMapw@mail.gmail.com>
Subject: Re: [PATCH v5] modules: introduce the MODULE_SCMVERSION config
To:     Will McVicker <willmcvicker@google.com>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Saravana Kannan <saravanak@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 20, 2021 at 9:19 AM Will McVicker <willmcvicker@google.com> wrote:
>
> Hi Masahiro,
>
> After testing your suggestions for module_srcpath, I remembered why I
> needed this:
>
> +ifneq ($(realpath $(srctree)/$(KBUILD_EXTMOD) 2>/dev/null),)
> +       module_srcpath := $(srctree)/$(KBUILD_EXTMOD)
> +else
> +       module_srcpath := $(KBUILD_EXTMOD)
> +endif
>
> Basically KBUILD_EXTMOD actually has two uses when defined as a relative path:
>
> (1) defines the path to the external module's source relative to $(srctree)
> (2) defines the path to the external module's build artifacts relative
> to $(objtree)
>
> Since setlocalversion is run from $(objtree), we need to use
> $(srctree)/$(KBUILD_EXTMOD) when it's a relative path. Just to note,
> if I do just use KBUILD_EXTMOD, then the script setlocalversion fails
> to find the srctree and returns an empty string.
>
> Please correct me if I'm wrong. I messed around with this by adding
> many prints to Makefile.modpost and setlocalversion to make sure
> everything was defined as expected.



Hmm, you are right.

I did not know the current Kbuild works like that.

But, I do not want to uglify the code
just for supporting this rare use-case.


Rather, I want to apply this
https://lore.kernel.org/patchwork/patch/1368277/


and, still want to see as simple code as the following:


--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -66,6 +66,7 @@ ifeq ($(KBUILD_EXTMOD),)

 input-symdump := vmlinux.symvers
 output-symdump := Module.symvers
+module-srcpath := $(srctree)

 else

@@ -82,9 +83,20 @@ MODPOST += -e

 input-symdump := Module.symvers $(KBUILD_EXTRA_SYMBOLS)
 output-symdump := $(KBUILD_EXTMOD)/Module.symvers
+module-srcpath := $(KBUILD_EXTMOD)

 endif





-- 
Best Regards
Masahiro Yamada
