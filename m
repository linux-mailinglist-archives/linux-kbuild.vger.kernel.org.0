Return-Path: <linux-kbuild+bounces-5808-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7691A38B9E
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 19:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A9DB18944E2
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 18:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD66822DFBF;
	Mon, 17 Feb 2025 18:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TS/SMsuD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887A7137C35;
	Mon, 17 Feb 2025 18:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739818502; cv=none; b=ShlZHA9ts49MLk0EPXOodHjieWpTou4v2Z8l2WDKv32e5K5aEKGLKwcu0aYD9Aob8eXTWnR12CZS4zV696GkEZg84wQlStzNMYXfb1pvQhUzU4zt5Yr4bfNZf+zcG0cjOqExaSdCPW+0QGerm+r8Fx7dMNdH2HQt+y6m7qqSldQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739818502; c=relaxed/simple;
	bh=Tqbh4I2DxBUjZqDu585rxe+RDN/kxswkQgYyawvMlPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kA0vrAonkOl1tF7t4lbkVFAnIW8YWxj21BjW+KFF6AF+NUaN0dcA9uDGJ+kmWnJdcoPLnbyMBKDNeeu0ANmY7g6XetCVvEzCG4V9wv7HOAPtjm4TUYmH+zdd2Se/zpaTR6iSlSMZUdMM9Dgm9z8la2orI6dS2App8li6XvB+WaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TS/SMsuD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A4FC4CED1;
	Mon, 17 Feb 2025 18:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739818502;
	bh=Tqbh4I2DxBUjZqDu585rxe+RDN/kxswkQgYyawvMlPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TS/SMsuDJRBUEMsQKkbR5RQBT44JpwsqHZjtu4QGib/fqIClvQUKgDdtBKAUgaypl
	 ZLHeEiiyk+rU/TAveQVNFxusS9sqKvjuKGgQ0S9PWKY9zi3Cbdl8rpt2XWGsY712zb
	 pf/6BTpMKWS2I2dZYbajKoxxAZAdseDSDGufeahc86wUd5mIMHNeXapm6bWipArYce
	 2JAeyDhRnX0/Md+eSiIEnSQ1GHD6vrH0JOgKbKbif9rfi7PIuwQNjK0B7uv962tEdb
	 PsZ5k74Gzo1eQAPi4tD585cY0hAIr8FQfqRSnwETHEIso4SpWuadNijK2j8f++iT97
	 AroJ1X0Yos1/w==
Date: Mon, 17 Feb 2025 10:54:56 -0800
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: userprogs: use correct lld when linking
 through clang
Message-ID: <20250217185456.GA435791@ax162>
References: <20250217-kbuild-userprog-fixes-v2-1-4da179778be0@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250217-kbuild-userprog-fixes-v2-1-4da179778be0@linutronix.de>

On Mon, Feb 17, 2025 at 08:27:54AM +0100, Thomas Weiﬂschuh wrote:
> The userprog infrastructure links objects files through $(CC).
> Either explicitly by manually calling $(CC) on multiple object files or
> implicitly by directly compiling a source file to an executable.
> The documentation at Documentation/kbuild/llvm.rst indicates that ld.lld
> would be used for linking if LLVM=1 is specified.
> However clang instead will use either a globally installed cross linker
> from $PATH called ${target}-ld or fall back to the system linker, which
> probably does not support crosslinking.
> For the normal kernel build this is not an issue because the linker is
> always executed directly, without the compiler being involved.
> 
> Explicitly pass --ld-path to clang so $(LD) is respected.
> As clang 13.0.1 is required to build the kernel, this option is available.
> 
> Fixes: 7f3a59db274c ("kbuild: add infrastructure to build userspace programs")
> Cc: stable@vger.kernel.org # needs wrapping in $(cc-option) for < 6.9
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> Reproducer, using nolibc to avoid libc requirements for cross building:
> 
> $ tail -2 init/Makefile
> userprogs-always-y += test-llvm
> test-llvm-userccflags += -nostdlib -nolibc -static -isystem usr/ -include $(srctree)/tools/include/nolibc/nolibc.h
> 
> $ cat init/test-llvm.c
> int main(void)
> {
> 	return 0;
> }
> 
> $ make ARCH=arm64 LLVM=1 allnoconfig headers_install init/
> 
> Validate that init/test-llvm builds and has the correct binary format.
> ---
> Changes in v2:
> - Use --ld-path instead of -fuse-ld
> - Drop already applied patch
> - Link to v1: https://lore.kernel.org/r/20250213-kbuild-userprog-fixes-v1-0-f255fb477d98@linutronix.de
> ---
>  Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 96407c1d6be167b04ed5883e455686918c7a75ee..b41c164533d781d010ff8b2522e523164dc375d0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1123,6 +1123,11 @@ endif
>  KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
>  KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
>  
> +# userspace programs are linked via the compiler, use the correct linker
> +ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_LD_IS_LLD),yy)
> +KBUILD_USERLDFLAGS += --ld-path=$(LD)
> +endif
> +
>  # make the checker run with the right architecture
>  CHECKFLAGS += --arch=$(ARCH)
>  
> 
> ---
> base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
> change-id: 20250213-kbuild-userprog-fixes-4f07b62ae818
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> 

