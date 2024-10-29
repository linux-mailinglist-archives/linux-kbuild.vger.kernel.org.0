Return-Path: <linux-kbuild+bounces-4385-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1C59B55BB
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2024 23:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DD362857DC
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2024 22:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17C120ADDD;
	Tue, 29 Oct 2024 22:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dX12qOAv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689FB20A5DB;
	Tue, 29 Oct 2024 22:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730240689; cv=none; b=clrfPqLmF+62/B7lq/b6jXccmxIJQEioR7D/bqo8SE4gtUe4QB8inW4hzfMcSwycQrwQsz5IJ5CDDl4OLS5ocZfQ08va/jwaGSdB1+8BiQfK6iSUn59gO0iXfi4FcdSeP5AmZUzAmkrtdXI6V4HzNYos4k+jqO+ikSB7nEoIkyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730240689; c=relaxed/simple;
	bh=DaBqTA3A7xl7Kvfy6PSQ6meDmsp/mY+pO3DkEcw1UKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STXH5Yqwo4BnD5ydEQTj59dJmWX1H0aJgorbxSHPz2NHvM+zSBW5P0DT7MW5mInpB0Z2Fqx/vl/WhYi8p05kiB3KaRvDWIU+jFw7hS0c5z9z9z9KWQ6b1mjXdjpgI9CSxrWpl6UY4bUOrSOnzYHkv/0zjhwPkxJIjewyQFccMqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dX12qOAv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D6EC4CECD;
	Tue, 29 Oct 2024 22:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730240689;
	bh=DaBqTA3A7xl7Kvfy6PSQ6meDmsp/mY+pO3DkEcw1UKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dX12qOAvnAJxkAgkZjTdRWtA7qyqDL6ou6eSRhOnt8OJ/8nUWZvhcfWN2lKZhegPk
	 YUquYoFDgLfB1HL/6VZnY5tbIZpqunyp6hcWSI4gP5NbsBzcj8kyAqvp8jjD6u079F
	 mKENJ/+uSPUdJ1LIViq0iK/XAcTYKXlB9RZX9wU8BlHOZTdj/hkJ5uDvoOlHMXFbrQ
	 JOteQ0lL8y1tsnd9CuDai+bFR7IOAKS9qFxl59lR11Uaeq/TwrJe25dr6vH8hJNZva
	 WdU2KcbWkSRszJ3L/bsFlZ+rg8CH5V/Sb+CCvdEfUr3NY9QgEECP5hNQ2fJrt3/96t
	 XInqxxc4sYM3w==
Date: Tue, 29 Oct 2024 15:24:46 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: koachan@protonmail.com
Cc: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Jonathan Corbet <corbet@lwn.net>, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] sparc/build: Add SPARC target flags for compiling
 with clang
Message-ID: <20241029222446.GB2632697@thelio-3990X>
References: <20241029-sparc-cflags-v3-0-b28745a6bd71@protonmail.com>
 <20241029-sparc-cflags-v3-2-b28745a6bd71@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029-sparc-cflags-v3-2-b28745a6bd71@protonmail.com>

On Tue, Oct 29, 2024 at 09:49:08PM +0700, Koakuma via B4 Relay wrote:
> From: Koakuma <koachan@protonmail.com>
> 
> clang only supports building 64-bit kernel, so we use the
> sparc64-linux-gnu target.
> 
> See also: https://lore.kernel.org/lkml/e26PTXUXEz8OYXmaeKn4Mpuejr4IOlFfFwdB5vpsluXlYiqDdlyQTYcDtdAny_o4gO4SfPeQCCN2qpyT6e0nog5EaP3xk2SeUPTrF54p1gM=@protonmail.com/T/#m068e010dcf8b99d3510a90d7532bcdb70e2e2c6b
> 
> Signed-off-by: Koakuma <koachan@protonmail.com>

Acked-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Documentation/kbuild/llvm.rst | 3 +++
>  scripts/Makefile.clang        | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index 6dc66b4f31a7bb62ba5bb6174730dc0a69ee0bba..bc8a283bc44bbfa9948ad3c9fe8031269ce10be4 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -179,6 +179,9 @@ yet. Bug reports are always welcome at the issue tracker below!
>     * - s390
>       - Maintained
>       - ``LLVM=1`` (LLVM >= 18.1.0), ``CC=clang`` (LLVM < 18.1.0)
> +   * - sparc (sparc64 only)
> +     - Maintained
> +     - ``CC=clang LLVM_IAS=0`` (LLVM >= 20)
>     * - um (User Mode)
>       - Maintained
>       - ``LLVM=1``
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 6c23c6af797fb016232914589c948208345417ad..2435efae67f53a26d55a1c0f1bf254a49d9fc731 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -10,6 +10,7 @@ CLANG_TARGET_FLAGS_mips		:= mipsel-linux-gnu
>  CLANG_TARGET_FLAGS_powerpc	:= powerpc64le-linux-gnu
>  CLANG_TARGET_FLAGS_riscv	:= riscv64-linux-gnu
>  CLANG_TARGET_FLAGS_s390		:= s390x-linux-gnu
> +CLANG_TARGET_FLAGS_sparc	:= sparc64-linux-gnu
>  CLANG_TARGET_FLAGS_x86		:= x86_64-linux-gnu
>  CLANG_TARGET_FLAGS_um		:= $(CLANG_TARGET_FLAGS_$(SUBARCH))
>  CLANG_TARGET_FLAGS		:= $(CLANG_TARGET_FLAGS_$(SRCARCH))
> 
> -- 
> 2.47.0
> 
> 

