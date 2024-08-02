Return-Path: <linux-kbuild+bounces-2787-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 663779465F0
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 00:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9777D1C21891
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Aug 2024 22:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F545745F2;
	Fri,  2 Aug 2024 22:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGlIVrYQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441731ABEB6;
	Fri,  2 Aug 2024 22:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722638539; cv=none; b=mv47jYVZTN0w9tyfxne6+uWytGqspmiwnfifTy88vd7W6UsYX+N/kTMTc3n8L4suBXQeYjHrb4QVbJhpdjp/pKSjXyy6Bo0TZIkEtJk2f7YvGglTlO26zfVzyAAebOCGYEzOERcFYVDgNhf73dhSdxRg9a9OGugXzc5ZJ4s/6N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722638539; c=relaxed/simple;
	bh=XNrB//VVqcE7SxjnYzrswtMDOUrFrcTtTzxGahrzo10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9EBmLekNwQl+CFXWKJhMDSE476PDUaPqJ6DCaYElM1h2pC3GVjO9FcLc2qHclBctAAQzqC+mzyye9A2IDGFc/g2ezMwxdzzc+XdASa42Wy5wkDh7waax5oAXQAJFFBpL9tEbeRyL8DrVpFPx5zkWUJ5cw0t4ywDwSyHk2Ljaqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGlIVrYQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2428C4AF0B;
	Fri,  2 Aug 2024 22:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722638538;
	bh=XNrB//VVqcE7SxjnYzrswtMDOUrFrcTtTzxGahrzo10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VGlIVrYQFy5UMofJUIUPO7hEWdYKkie9UhxTVCRXxhXWRLPKoaN/r5a42KOCJw3JU
	 7MVRUmlUH70oMNG2kgJzZ29l3OYmE2dwjZjSGpi/fydKbPmJHvr7rKG7PEil+7Xisv
	 jHhfelSW4LVmhZXWV+u2gpoMjSOBeO3tFI3MbQheNfSjAUBQ65JmIKuCfYro2/Aivc
	 YisLekgwsM+5B+zX08y0m9Ho73MqBsp1tm56ehDt0ma8GUylOT9nsbamwIce/rSwYp
	 cV6+Rx0sI6KL58XqWOY+irds5Lfb4BnF4APJdpYiAHd6z7Wdabs49Yv/aTBO//TUyt
	 zyFZuhTEqeLfw==
Date: Fri, 2 Aug 2024 15:42:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Koakuma <koachan@protonmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 2/2] sparc/build: Add SPARC target flags for compiling
 with clang
Message-ID: <20240802224216.GA853635@thelio-3990X>
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com>
 <20240717-sparc-cflags-v2-2-259407e6eb5f@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717-sparc-cflags-v2-2-259407e6eb5f@protonmail.com>

Hi Koakuma,

On Wed, Jul 17, 2024 at 11:10:16PM +0700, Koakuma wrote:
> clang only supports building 64-bit kernel, so we use the
> sparc64-linux-gnu target.

It should not really matter which sparc target you pick (32-bit or
64-bit), as the comment at the top of the file mentions that
architectures should use the command line options to control word size
and endianness, which arch/sparc does. Not that I really think it is
worth correcting, just thought I would mention :)

> See also: https://lore.kernel.org/lkml/e26PTXUXEz8OYXmaeKn4Mpuejr4IOlFfFwdB5vpsluXlYiqDdlyQTYcDtdAny_o4gO4SfPeQCCN2qpyT6e0nog5EaP3xk2SeUPTrF54p1gM=@protonmail.com/T/#m068e010dcf8b99d3510a90d7532bcdb70e2e2c6b
> 
> Signed-off-by: Koakuma <koachan@protonmail.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks for all the work you have done driving this, it is pretty cool to
see :)

> ---
>  scripts/Makefile.clang | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 6c23c6af797f..2435efae67f5 100644
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
> 2.45.2
> 

