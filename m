Return-Path: <linux-kbuild+bounces-6395-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AEDA79C34
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Apr 2025 08:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 464D41715B7
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Apr 2025 06:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0002A1A0BCF;
	Thu,  3 Apr 2025 06:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjcG3lq1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4B51A08A3;
	Thu,  3 Apr 2025 06:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743662332; cv=none; b=HSl+vCPOn3FdMjqGG7H7pO2+j3BGBjrA5j3Ob12ohzA2DaTdeEa0jkqaT5bq7mWqfDzeXBnL66FgpgmSMbffmlUkNfkmWGfdTwbY3KsdMj0GruRJ838qWDd/ECK7mHgqPh4ivg5xesSOUhlKbiWPlv2EkxBbWblF8Xbyl/Sls3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743662332; c=relaxed/simple;
	bh=2/tAIarhHMgZpqgml0rAXbaj403ah+N1dDuDl5YUD4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ff/nNtXlEnGiD0mTzb009J4WsSUmtmL4eQe5BPk2Wm5Iiu2uihEzl972qB5r3w6rnkRZIWbeJj6Ynz4wYrzT6Yx84YKUK86IduOKgSbSnQ5unOGMzOLf0Gvw7qsxCyMJ8VU2QbX28gtTWdKHf8Ac3LW4Ke4aDMR6F2yEowb09bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjcG3lq1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358A3C4AF0C;
	Thu,  3 Apr 2025 06:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743662332;
	bh=2/tAIarhHMgZpqgml0rAXbaj403ah+N1dDuDl5YUD4g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jjcG3lq1WkVbTto5R6Sr0OQQAtu+hmbuYvbwt/TWvMAr2jk3HFuXk7vvaRqZ1NjCy
	 rFwRBDVcphMkMwnBb+/1x37s/eGqUNjdl8SL9LhRY0gimuLuQLIfCTExGcZXe1doJV
	 A2Atovl9RzyOD8Q41JU2PbIc5s6OH/7994AUW/P7GnFcBgxxf0QQC+iisJu4qRGyan
	 f2ir04R+NLdjQWg1Bz4Dg0uXN5nXOvdlvqfV5MBTcekIVentKU7+DdG84NY66TROVG
	 SvnQOI/SEnnbO0AzNPVxJpwjWTp/lxwzVsPv9bNeyQ9wE4xf494VG6s3/Wl5Ycay6T
	 j0ycWugI+HlFQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so692412e87.2;
        Wed, 02 Apr 2025 23:38:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUprjdQBsPlZMS2GOQdSdaxNvUzw3K8oGgzuvVOLtvZCTLTZWO8kR6fgvdh3HHzE9zu4Az0nnT4GPdf1KY=@vger.kernel.org, AJvYcCXhJoosHgPk7fag8BazbRSZfY7T+2wd1+pdDUgLKIvf6FO2fwCMEUKOMN1GuTlo9tldbk9v+FVBSd9WbjHg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/JlLCpT032BmehqLOswus15tdOHvcqDHWaEz01jqRZiMLbYHm
	IH9R1vym+pM59cMNhrekoV0jp5nJ52jgtx5mDnw1fh+Blr5Pfc35ruYsNCYD03u+iibTvrxgzkK
	Nt2QT6bXGzWf8jTQ5H6yYfj04ky0=
X-Google-Smtp-Source: AGHT+IE4yQD8rhYnVSRXOnS3Y6pofP5obI3okmQ0iC4wJLgbKdsBb0CIGQU6+0Kd5+8+3okm+rb8AazhaZjHp1lAMRE=
X-Received: by 2002:a05:6512:1149:b0:545:3031:40aa with SMTP id
 2adb3069b0e04-54b10db738dmr6083399e87.9.1743662330387; Wed, 02 Apr 2025
 23:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328075536.238782-1-alexghiti@rivosinc.com>
In-Reply-To: <20250328075536.238782-1-alexghiti@rivosinc.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 3 Apr 2025 09:38:39 +0300
X-Gmail-Original-Message-ID: <CAMj1kXGaUZZoKUMEJtv4Fvckub_kRcHBZbpMxet-skqOLD7SNw@mail.gmail.com>
X-Gm-Features: AQ5f1JokvVmdXrd19nwvBkB35c-v0phYNi9QPm4nTBBdR2jkB4tn0Cxxj2EhIIw
Message-ID: <CAMj1kXGaUZZoKUMEJtv4Fvckub_kRcHBZbpMxet-skqOLD7SNw@mail.gmail.com>
Subject: Re: [PATCH] scripts: Introduce ARCH_WANTS_RELA_DYN to avoid stripping
 .rela.dyn section
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Mar 2025 at 08:55, Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> riscv uses the .rela.dyn section to relocate the kernel at runtime but
> that section is stripped from vmlinux. That prevents kexec to
> successfully load vmlinux since it does not contain the relocations info
> needed.
>
> Fix this by introducing a new config ARCH_WANTS_RELA_DYN that prevents
> .rela.dyn to be stripped.
>
> Fixes: 71d815bf5dfd ("kbuild: Strip runtime const RELA sections correctly")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Apologies for the breakage.



> ---
>  arch/Kconfig         | 7 +++++++
>  arch/riscv/Kconfig   | 1 +
>  scripts/Makefile.lib | 4 +++-
>  3 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index b8a4ff365582..d93f50ecb8f9 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1544,6 +1544,13 @@ config HAVE_ARCH_PREL32_RELOCATIONS
>           architectures, and don't require runtime relocation on relocatable
>           kernels.
>
> +config ARCH_WANTS_RELA_DYN

I don't think we need this - just preserve .rela.dyn in all cases.

> +       bool
> +       depends on RELOCATABLE
> +       help
> +         This prevents the .rela.dyn section to be stripped from vmlinux since
> +         it is needed to relocate the kernel at runtime.
> +
>  config ARCH_USE_MEMREMAP_PROT
>         bool
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 7612c52e9b1e..d58053efa4e4 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -84,6 +84,7 @@ config RISCV
>         select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
>         select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
>         select ARCH_WANTS_NO_INSTR
> +       select ARCH_WANTS_RELA_DYN if RELOCATABLE
>         select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
>         select ARCH_WEAK_RELEASE_ACQUIRE if ARCH_USE_QUEUED_SPINLOCKS
>         select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index cad20f0e66ee..e59210a9fde0 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -376,8 +376,10 @@ quiet_cmd_ar = AR      $@
>  quiet_cmd_objcopy = OBJCOPY $@
>  cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
>
> +objcopy-args-$(CONFIG_ARCH_WANTS_RELA_DYN) += --remove-section=!.rela.dyn
> +
>  quiet_cmd_strip_relocs = RSTRIP  $@
> -cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
> +cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $(objcopy-args-y) $@
>
>  # Gzip
>  # ---------------------------------------------------------------------------
> --
> 2.39.2
>

