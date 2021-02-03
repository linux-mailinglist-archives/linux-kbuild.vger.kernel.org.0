Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C88430D545
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Feb 2021 09:34:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232632AbhBCId0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Feb 2021 03:33:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232492AbhBCIdY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Feb 2021 03:33:24 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7771DC06178A;
        Wed,  3 Feb 2021 00:32:06 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id e133so13497798iof.8;
        Wed, 03 Feb 2021 00:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=Xl7tdjaRBbAIoUBy33ehOqMQfuVpZM9WRqZuHrL1130=;
        b=fYoUbYVIdYbqHfNuDnfDDMFYNor2qE7r+CeHDRbhfVBaBRU67SSeWYYE0pX2fxdPsc
         JmWaxyGV5SSKbQVIxvSbzT3ldFD9dkbQZn+6g20yyeLBzqnnVJzbp2kqa2dtS9bgaDy4
         y+DAKdr+RPyF0bNFoM6msrAtiHnCZFI6qDqEw9SibYcZq6nCodcUNaCMiyoEj4NM4uNR
         Yg10R66P7G7an9K6YXDb34GqMo5GgOq24MzI6Eb+WT64cps46RPi8uEYXfIjb2pIyrNV
         u905PesB+FQARfyDAKoXwXwflCZ1GvjZQKcw6BqLmA51G5bZt1656R2XvuPUxBZwFG85
         rBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=Xl7tdjaRBbAIoUBy33ehOqMQfuVpZM9WRqZuHrL1130=;
        b=rDbUXAwf0uQro/8EvMjtxDa7KS0FONzLiMzCZijyxAEt1dnN3upXGJkgkE7fUQ/Okl
         VLGn8T1wrCf12wfeHJ07xa3PtYXXhJH7pxbftrrzenoxKOjRVkTSh2lDMuM0lJabni/F
         c31PD2OlDuvGLU1NS2lFXrNx5zT7G79aezrl/Jmt66T7xcWvNsvksYwOrScJP9K6+sR+
         maIPEcEuRPkAldH3KyzlXDAxrMVaK2uou12GDi8UFWAnSE8w/0Fo+whOfVmGZG5FNBpB
         O+nETMm1gRWmlacSFBTLmuKLpjY3sy9+T2An6pBTjt2HutbtUQ1Xwm37uSugAykNrwiN
         +HZQ==
X-Gm-Message-State: AOAM533EVBoWvD6BI7+tafBDWLc2Ybr/49km9SKd7lmsBoj6J2DCqEM3
        yYNQ2f0TN2+tb/ihO3lNR/W+GxS56Z0tn8mVRWY=
X-Google-Smtp-Source: ABdhPJzsAZtBBc6tOJ4anuAwy4HVDfqaUisO41SoAoId9HJNCXVjyHV7EcXFyMEUcgnvPUlR6r7pSzF3rOoBj18AUJ4=
X-Received: by 2002:a6b:f112:: with SMTP id e18mr1565166iog.57.1612341125809;
 Wed, 03 Feb 2021 00:32:05 -0800 (PST)
MIME-Version: 1.0
References: <20210203075239.5505-1-masahiroy@kernel.org>
In-Reply-To: <20210203075239.5505-1-masahiroy@kernel.org>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 3 Feb 2021 09:31:54 +0100
Message-ID: <CA+icZUW-uObu=7xpqUqKTASmBfEgLKMrKgmR_uhmHBN-EwpBVA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix duplicated flags in DEBUG_CFLAGS
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andi Kleen <andi@firstfloor.org>,
        Ian Rogers <irogers@google.com>,
        Mark Wielaard <mark@klomp.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 3, 2021 at 8:53 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Sedat Dilek noticed duplicated debug flags passed when building C
> files with CONFIG_DEBUG_INFO.
>
> I do not know much about his build environment, but yes, Kbuild
> recurses to the top Makefile with some build targets. For example,
> 'make CC=clang bindeb-pkg' reproduces the issue.
>
> With commit 121c5d08d53c ("kbuild: Only add -fno-var-tracking-assignments
> for old GCC versions") applied, DEBUG_CFLAGS is now reset only when
> CONFIG_CC_IS_GCC=y.
>
> Fix it to reset DEBUG_CFLAGS also when using Clang.
>
> Fixes: 121c5d08d53c ("kbuild: Only add -fno-var-tracking-assignments for old GCC versions")
> Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

That fixes the issue for me:

Without patch:

... -Wno-unused-const-variable -g -gdwarf-5 -gz=zlib -g -gdwarf-5
-gz=zlib -pg -mfentry ...

With this patch:
... -Wno-unused-const-variable -g -gdwarf-5 -gz=zlib -pg -mfentry ...

The relevant Kconfigs:

$ grep DEBUG_INFO .config | grep ^CONFIG
CONFIG_DEBUG_INFO=y
CONFIG_DEBUG_INFO_COMPRESSED=y
CONFIG_DEBUG_INFO_DWARF5=y

Latest make-line:

$ /usr/bin/perf_5.10 stat make V=1 -j4 LLVM=1 LLVM_IAS=1
PAHOLE=/opt/pahole/bin/pahole LOCALVERSION=-4-amd64-clang12-
cfi-pgo KBUILD_VERBOSE=1 KBUILD_BUILD_HOST=iniza
KBUILD_BUILD_USER=sedat.dilek@gmail.com
KBUILD_BUILD_TIMESTAMP=2021-02-03 bindeb-pkg
KDEB_PKGVERSION=5.11.0~rc6-4~bull
seye+dileks1

Feel free to add my...

   Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

Thanks again Masahiro.

- Sedat -

> ---
>
>  Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 3d3f67b98ca2..769a38ee81b9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -811,10 +811,12 @@ KBUILD_CFLAGS     += -ftrivial-auto-var-init=zero
>  KBUILD_CFLAGS  += -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
>  endif
>
> +DEBUG_CFLAGS   :=
> +
>  # Workaround for GCC versions < 5.0
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61801
>  ifdef CONFIG_CC_IS_GCC
> -DEBUG_CFLAGS   := $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
> +DEBUG_CFLAGS   += $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
>  endif
>
>  ifdef CONFIG_DEBUG_INFO
> --
> 2.27.0
>
