Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B61A733C199
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Mar 2021 17:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbhCOQXa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Mar 2021 12:23:30 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:33279 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231962AbhCOQW6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Mar 2021 12:22:58 -0400
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 12FGMXOl021913;
        Tue, 16 Mar 2021 01:22:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 12FGMXOl021913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615825353;
        bh=LD+AM6hgEBw4I3onUiko1OAZdxqmf7Chvn4W6NLeOeo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zhoLwrN/0jIhVhOedIcv5B7oUqbyRfwg5WLmT3sXgNfk+WjwPni45vCR/Vf+vxDy3
         q5QM/bfDlpxK3v5WyuiWNZFukEAwev6toOazwQVTscogRdCPW9n7wu6l91l/WNC9/f
         B7SPulTY19fvBrWoyhBEg7oR6FzzEWKqa9LjurWvG4x5Zz+qWdrj4mWl1HZ+En3+8x
         sVXvv5HFOcp/AYFugu92ltZD0dnNbc7ZfyyVtW8iVx1uj5WezzJBtC2KoRvGqwt83K
         fdIi6f42yjHa7o+JeCUm1vFCFRIN9Ewuv/+0AjfXehAdZ2/Anyy75NomGi5pi8vA3Z
         XaBufw7uBjyOg==
X-Nifty-SrcIP: [209.85.210.175]
Received: by mail-pf1-f175.google.com with SMTP id d21so857535pfn.1;
        Mon, 15 Mar 2021 09:22:33 -0700 (PDT)
X-Gm-Message-State: AOAM530gI8kWN/jE3WdXj8BqMnfoghqbe2mWz1mG38ZcS20xQ8/5+6sd
        KV4j0bF7OxCMgxa1LQzRURnTFLmbFmvEr5x5UWk=
X-Google-Smtp-Source: ABdhPJyqPUzhJDm8gyEGApfIOguBmYSN2t7PkceoZE565PaBe9jr7CKOSPlyvmaBu1sauYbXNFZ1TMhebCZYxXfKgWc=
X-Received: by 2002:a65:41c6:: with SMTP id b6mr303989pgq.7.1615825352706;
 Mon, 15 Mar 2021 09:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210302210646.3044738-1-nathan@kernel.org> <20210309205915.2340265-1-nathan@kernel.org>
In-Reply-To: <20210309205915.2340265-1-nathan@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 16 Mar 2021 01:21:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ6goFdV=HuCdiCsr-PSUGxtafHZAa=p=96ieFyFHL8yg@mail.gmail.com>
Message-ID: <CAK7LNAQ6goFdV=HuCdiCsr-PSUGxtafHZAa=p=96ieFyFHL8yg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Makefile: Remove '--gcc-toolchain' flag
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 10, 2021 at 5:59 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> This flag was originally added to allow clang to find the GNU cross
> tools in commit 785f11aa595b ("kbuild: Add better clang cross build
> support"). This flag was not enough to find the tools at times so
> '--prefix' was added to the list in commit ef8c4ed9db80 ("kbuild: allow
> to use GCC toolchain not in Clang search path") and improved upon in
> commit ca9b31f6bb9c ("Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang
> cross compilation"). Now that '--prefix' specifies a full path and
> prefix, '--gcc-toolchain' serves no purpose because the kernel builds
> with '-nostdinc' and '-nostdlib'.
>
> This has been verified with self compiled LLVM 10.0.1 and LLVM 13.0.0 as
> well as a distribution version of LLVM 11.1.0 without binutils in the
> LLVM toolchain locations.
>
> Link: https://reviews.llvm.org/D97902
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>
> v1 -> v2:
>
> * Improve commit message (add history behind flag and link to Fangrui's
>   documentation improvement).


Both applied to linux-kbuild. Thanks.





> I did not carry tags forward so that people could re-review and test.
>
>  Makefile | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 31dcdb3d61fa..182e93d91198 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -568,10 +568,6 @@ ifneq ($(CROSS_COMPILE),)
>  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
>  CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> -GCC_TOOLCHAIN  := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
> -endif
> -ifneq ($(GCC_TOOLCHAIN),)
> -CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
>  ifneq ($(LLVM_IAS),1)
>  CLANG_FLAGS    += -no-integrated-as
>
> base-commit: a38fd8748464831584a19438cbb3082b5a2dab15
> --
> 2.31.0.rc1
>


-- 
Best Regards
Masahiro Yamada
