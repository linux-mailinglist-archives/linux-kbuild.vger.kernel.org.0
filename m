Return-Path: <linux-kbuild+bounces-1749-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BE08BAAAC
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 May 2024 12:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 868331F22B33
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 May 2024 10:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C6314F114;
	Fri,  3 May 2024 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKsiSOoD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0578150982;
	Fri,  3 May 2024 10:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714731635; cv=none; b=oaT7j0prMVOUIbadL1eNCyZWPw2u3CtlvDRw72Y94mH44UnIzEeMuyR0UzTBg06js0Fz1VGPM55fhondmmpiGHNEZLLKFvxdDBmqzpMcLERSp2l/Is/tEKpp4eAIAj5JUN1GmCY3pMMqscLnmopXOWPgSok1ukEEmbnNRM4294M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714731635; c=relaxed/simple;
	bh=24aSrLJ980/RB/v2Nlvzh56b4DixaRTX3cGcyelsRuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPrQChEf8ndk3J46w4Q34CAI9eaxHV/zWSZR6aKe2BtMnkZgU3GolKUl2vkxo54uXo+fzc3Y5ZCT+c1DJFETjzurKiwpWXO2UBQgD6z5JlHv9oI7pCRH4iunyAJD2HaRTE4CHJMZaLBmiybIhhZRzVhmTeZgQ4h/N9u7tPJ7oMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKsiSOoD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DBC4C4AF18;
	Fri,  3 May 2024 10:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714731634;
	bh=24aSrLJ980/RB/v2Nlvzh56b4DixaRTX3cGcyelsRuc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TKsiSOoDd5jB05QHwZq2d2Q/AzExqeeIX86Wkpemm60/wZPvfSXpIJbcO8UAm7lJx
	 t9TGE1DNdo7HV/NkQWKlD2iP257cbJW5kClI3UVy2mi2PMDIiLVietNaZzbUqTygjs
	 lkBnOv1iMS60L7swl/KgZMjmQjZA0oEzWsniVu+vRPWulpyCopmXeL83OzQEbkbR+j
	 ruXAeB5AmI1ctS6reRcFmCsqtnMn1JJ77QYWrFgM8dW6jQ+BFgKzPUH06pvsd+XqLW
	 nt/WvQpBW1sq/29YiQ7vgNwTdxj9MhSw2I6bB8wDtSYOHz/jPmoMyUfun4NQHU97UY
	 Opkyur0NHvqYw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2dd19c29c41so110673961fa.3;
        Fri, 03 May 2024 03:20:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZHpA+6fxlDh9P6RfLt5dyvkvE2IzlEKydQuY27oQcDljpsjnUgM2itAox8VP+UmDMS9BuwUDC7Nnz9h8W1cR70gf05snZu/tCAUazLmE1MT5PiszCB7es3Pt3fi2EN4JR+CyG
X-Gm-Message-State: AOJu0YyGe1qwC0tyb1ymhTkslNugNs6hCOrSAbLH0VVQoN2M7hCwpSIK
	X5LtmXDT51U4+4c52ULPwyIwDWPbG2RdGNk5HENNjV1j+N457Oir0jpVHcbY92MWm01qocJhYB1
	9lN7P+cI4idHk4NPt4iycRR4zQ8k=
X-Google-Smtp-Source: AGHT+IGP+uIRNlslkXUU92myicxqENqhyk49hCdj5sLaZzOrOjfvk8c1FOJPdJcIA1SaaE6JH4OMhhHWlN7aU5J3wms=
X-Received: by 2002:a2e:9ed4:0:b0:2df:97b1:e21c with SMTP id
 h20-20020a2e9ed4000000b002df97b1e21cmr1464379ljk.31.1714731633251; Fri, 03
 May 2024 03:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501-kbuild-llvm-drop-thinlto-cache-v1-1-c117cc50a24b@kernel.org>
In-Reply-To: <20240501-kbuild-llvm-drop-thinlto-cache-v1-1-c117cc50a24b@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 3 May 2024 19:19:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNATm7dp+vuhNpvw7f50akKGNP0Pp+PQHRC1d3zTAZrmBLg@mail.gmail.com>
Message-ID: <CAK7LNATm7dp+vuhNpvw7f50akKGNP0Pp+PQHRC1d3zTAZrmBLg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Remove support for Clang's ThinLTO caching
To: Nathan Chancellor <nathan@kernel.org>
Cc: morbo@google.com, justinstitt@google.com, nicolas@fjasle.eu, 
	keescook@chromium.org, samitolvanen@google.com, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
	Yifan Hong <elsk@google.com>, Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2024 at 7:55=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> There is an issue in clang's ThinLTO caching (enabled for the kernel via
> '--thinlto-cache-dir') with .incbin, which the kernel occasionally uses
> to include data within the kernel, such as the .config file for
> /proc/config.gz. For example, when changing the .config and rebuilding
> vmlinux, the copy of .config in vmlinux does not match the copy of
> .config in the build folder:
>
>   $ echo 'CONFIG_LTO_NONE=3Dn
>   CONFIG_LTO_CLANG_THIN=3Dy
>   CONFIG_IKCONFIG=3Dy
>   CONFIG_HEADERS_INSTALL=3Dy' >kernel/configs/repro.config
>
>   $ make -skj"$(nproc)" ARCH=3Dx86_64 LLVM=3D1 clean defconfig repro.conf=
ig vmlinux
>   ...
>
>   $ grep CONFIG_HEADERS_INSTALL .config
>   CONFIG_HEADERS_INSTALL=3Dy
>
>   $ scripts/extract-ikconfig vmlinux | grep CONFIG_HEADERS_INSTALL
>   CONFIG_HEADERS_INSTALL=3Dy
>
>   $ scripts/config -d HEADERS_INSTALL
>
>   $ make -kj"$(nproc)" ARCH=3Dx86_64 LLVM=3D1 vmlinux
>   ...
>     UPD     kernel/config_data
>     GZIP    kernel/config_data.gz
>     CC      kernel/configs.o
>   ...
>     LD      vmlinux
>   ...
>
>   $ grep CONFIG_HEADERS_INSTALL .config
>   # CONFIG_HEADERS_INSTALL is not set
>
>   $ scripts/extract-ikconfig vmlinux | grep CONFIG_HEADERS_INSTALL
>   CONFIG_HEADERS_INSTALL=3Dy
>
> Without '--thinlto-cache-dir' or when using full LTO, this issue does
> not occur.
>
> Benchmarking incremental builds on a few different machines with and
> without the cache shows a 20% increase in incremental build time without
> the cache when measured by touching init/main.c and running 'make all'.
>
> ARCH=3Darm64 defconfig + CONFIG_LTO_CLANG_THIN=3Dy on an arm64 host:
>
>   Benchmark 1: With ThinLTO cache
>     Time (mean =C2=B1 =CF=83):     56.347 s =C2=B1  0.163 s    [User: 83.=
768 s, System: 24.661 s]
>     Range (min =E2=80=A6 max):   56.109 s =E2=80=A6 56.594 s    10 runs
>
>   Benchmark 2: Without ThinLTO cache
>     Time (mean =C2=B1 =CF=83):     67.740 s =C2=B1  0.479 s    [User: 718=
.458 s, System: 31.797 s]
>     Range (min =E2=80=A6 max):   67.059 s =E2=80=A6 68.556 s    10 runs
>
>   Summary
>     With ThinLTO cache ran
>       1.20 =C2=B1 0.01 times faster than Without ThinLTO cache
>
> ARCH=3Dx86_64 defconfig + CONFIG_LTO_CLANG_THIN=3Dy on an x86_64 host:
>
>   Benchmark 1: With ThinLTO cache
>     Time (mean =C2=B1 =CF=83):     85.772 s =C2=B1  0.252 s    [User: 91.=
505 s, System: 8.408 s]
>     Range (min =E2=80=A6 max):   85.447 s =E2=80=A6 86.244 s    10 runs
>
>   Benchmark 2: Without ThinLTO cache
>     Time (mean =C2=B1 =CF=83):     103.833 s =C2=B1  0.288 s    [User: 23=
2.058 s, System: 8.569 s]
>     Range (min =E2=80=A6 max):   103.286 s =E2=80=A6 104.124 s    10 runs
>
>   Summary
>     With ThinLTO cache ran
>       1.21 =C2=B1 0.00 times faster than Without ThinLTO cache
>
> While it is unfortunate to take this performance improvement off the
> table, correctness is more important. If/when this is fixed in LLVM, it
> can potentially be brought back in a conditional manner. Alternatively,
> a developer can just disable LTO if doing incremental compiles quickly
> is important, as a full compile cycle can still take over a minute even
> with the cache and it is unlikely that LTO will result in functional
> differences for a kernel change.
>
> Cc: stable@vger.kernel.org
> Fixes: dc5723b02e52 ("kbuild: add support for Clang LTO")
> Reported-by: Yifan Hong <elsk@google.com>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2021
> Reported-by: Masami Hiramatsu <mhiramat@kernel.org>
> Closes: https://lore.kernel.org/r/20220327115526.cc4b0ff55fc53c97683c3e4d=
@kernel.org/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied to linux-kbuild.
Thanks.




> ---
> This is an alternative (and arguably more robust) fix to Yifan's patch
> at https://lore.kernel.org/20240429220756.979347-2-elsk@google.com/.
> ---
>  Makefile | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 40fb2ca6fe4c..6b6a4a757062 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -942,7 +942,6 @@ endif
>  ifdef CONFIG_LTO_CLANG
>  ifdef CONFIG_LTO_CLANG_THIN
>  CC_FLAGS_LTO   :=3D -flto=3Dthin -fsplit-lto-unit
> -KBUILD_LDFLAGS +=3D --thinlto-cache-dir=3D$(extmod_prefix).thinlto-cache
>  else
>  CC_FLAGS_LTO   :=3D -flto
>  endif
> @@ -1477,7 +1476,7 @@ endif # CONFIG_MODULES
>  # Directories & files removed with 'make clean'
>  CLEAN_FILES +=3D vmlinux.symvers modules-only.symvers \
>                modules.builtin modules.builtin.modinfo modules.nsdeps \
> -              compile_commands.json .thinlto-cache rust/test \
> +              compile_commands.json rust/test \
>                rust-project.json .vmlinux.objs .vmlinux.export.c
>
>  # Directories & files removed with 'make mrproper'
> @@ -1783,7 +1782,7 @@ PHONY +=3D compile_commands.json
>
>  clean-dirs :=3D $(KBUILD_EXTMOD)
>  clean: rm-files :=3D $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_EXTMOD)/mo=
dules.nsdeps \
> -       $(KBUILD_EXTMOD)/compile_commands.json $(KBUILD_EXTMOD)/.thinlto-=
cache
> +       $(KBUILD_EXTMOD)/compile_commands.json
>
>  PHONY +=3D prepare
>  # now expand this into a simple variable to reduce the cost of shell eva=
luations
>
> ---
> base-commit: e67572cd2204894179d89bd7b984072f19313b03
> change-id: 20240501-kbuild-llvm-drop-thinlto-cache-f497770692f8
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>


--
Best Regards
Masahiro Yamada

