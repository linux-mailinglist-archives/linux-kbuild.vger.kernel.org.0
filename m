Return-Path: <linux-kbuild+bounces-1001-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB6385B43B
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Feb 2024 08:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8BA21F2257D
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Feb 2024 07:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654075BAD2;
	Tue, 20 Feb 2024 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j2UIIrXs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5D65A4CE;
	Tue, 20 Feb 2024 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708415494; cv=none; b=LtGjC72ZB7d/bUP/E2gutAE5JNmM34EdUbGPfU7pus/Xmo4yEwe4NO5CjGZO2/oqjjq5BETbluSzOngPEJVnFc9W2HMFYSMClm7kQHKErcsFPxYm/vPyZLoUu4qi3lSslpdfg/PqSUCm3sm894aU2d8mY4a5ln+tuPQOU4gKZ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708415494; c=relaxed/simple;
	bh=bvx+YhtjNRYp9RwJLSb/J+HAooUu2B88g6FfWZalVLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbtHuDfIzHCbrVv6ktGJo/zjcgTEbBihGtA4QQibLHX8THckPldIp9tatfessua5es/88T/06MKswEwgLtnnLUaAGYH4GVWAXzYP7Mxv1HpftLwdy3NLrNK5REDAA1hY5gqw1bCpqmuuam5/4d+mYJbLScBcdEb+mMZxTzOr6ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j2UIIrXs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB50C433C7;
	Tue, 20 Feb 2024 07:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708415494;
	bh=bvx+YhtjNRYp9RwJLSb/J+HAooUu2B88g6FfWZalVLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2UIIrXs22EGhS6A9SnxTsoWRDOFmMfuD0ieBCUTczytOw7NeSgcZTnlGoOKgLeZA
	 Q2rBkL5E84xXzmPwM1NMC98ARd8eQuU1lVChtgArsxJ81gbc7QOzlhwvAM+X7Hj5jI
	 +aDsFZmsA7ZlhspTo6yYaGVBi7CAlCccvp1J1NpI=
Date: Tue, 20 Feb 2024 08:51:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, stable-commits@vger.kernel.org,
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: Patch "um: Fix adding '-no-pie' for clang" has been added to the
 5.15-stable tree
Message-ID: <2024022024-control-coliseum-1d40@gregkh>
References: <2024021939-dullness-calculate-a293@gregkh>
 <20240219192837.GD2348301@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240219192837.GD2348301@dev-arch.thelio-3990X>

On Mon, Feb 19, 2024 at 12:28:37PM -0700, Nathan Chancellor wrote:
> Hi Greg,
> 
> On Mon, Feb 19, 2024 at 06:02:39PM +0100, gregkh@linuxfoundation.org wrote:
> > 
> > This is a note to let you know that I've just added the patch titled
> > 
> >     um: Fix adding '-no-pie' for clang
> > 
> > to the 5.15-stable tree which can be found at:
> >     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
> > 
> > The filename of the patch is:
> >      um-fix-adding-no-pie-for-clang.patch
> > and it can be found in the queue-5.15 subdirectory.
> > 
> > If you, or anyone else, feels it should not be added to the stable tree,
> > please let <stable@vger.kernel.org> know about it.
> > 
> > 
> > From 846cfbeed09b45d985079a9173cf390cc053715b Mon Sep 17 00:00:00 2001
> > From: Nathan Chancellor <nathan@kernel.org>
> > Date: Tue, 23 Jan 2024 15:59:54 -0700
> > Subject: um: Fix adding '-no-pie' for clang
> > 
> > From: Nathan Chancellor <nathan@kernel.org>
> > 
> > commit 846cfbeed09b45d985079a9173cf390cc053715b upstream.
> > 
> > The kernel builds with -fno-PIE, so commit 883354afbc10 ("um: link
> > vmlinux with -no-pie") added the compiler linker flag '-no-pie' via
> > cc-option because '-no-pie' was only supported in GCC 6.1.0 and newer.
> > 
> > While this works for GCC, this does not work for clang because cc-option
> > uses '-c', which stops the pipeline right before linking, so '-no-pie'
> > is unconsumed and clang warns, causing cc-option to fail just as it
> > would if the option was entirely unsupported:
> > 
> >   $ clang -Werror -no-pie -c -o /dev/null -x c /dev/null
> >   clang-16: error: argument unused during compilation: '-no-pie' [-Werror,-Wunused-command-line-argument]
> > 
> > A recent version of clang exposes this because it generates a relocation
> > under '-mcmodel=large' that is not supported in PIE mode:
> > 
> >   /usr/sbin/ld: init/main.o: relocation R_X86_64_32 against symbol `saved_command_line' can not be used when making a PIE object; recompile with -fPIE
> >   /usr/sbin/ld: failed to set dynamic section sizes: bad value
> >   clang: error: linker command failed with exit code 1 (use -v to see invocation)
> > 
> > Remove the cc-option check altogether. It is wasteful to invoke the
> > compiler to check for '-no-pie' because only one supported compiler
> > version does not support it, GCC 5.x (as it is supported with the
> > minimum version of clang and GCC 6.1.0+). Use a combination of the
> > gcc-min-version macro and CONFIG_CC_IS_CLANG to unconditionally add
> > '-no-pie' with CONFIG_LD_SCRIPT_DYN=y, so that it is enabled with all
> > compilers that support this. Furthermore, using gcc-min-version can help
> > turn this back into
> > 
> >   LINK-$(CONFIG_LD_SCRIPT_DYN) += -no-pie
> > 
> > when the minimum version of GCC is bumped past 6.1.0.
> > 
> > Cc: stable@vger.kernel.org
> > Closes: https://github.com/ClangBuiltLinux/linux/issues/1982
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  arch/um/Makefile |    4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > --- a/arch/um/Makefile
> > +++ b/arch/um/Makefile
> > @@ -118,7 +118,9 @@ archprepare:
> >  	$(Q)$(MAKE) $(build)=$(HOST_DIR)/um include/generated/user_constants.h
> >  
> >  LINK-$(CONFIG_LD_SCRIPT_STATIC) += -static
> > -LINK-$(CONFIG_LD_SCRIPT_DYN) += $(call cc-option, -no-pie)
> > +ifdef CONFIG_LD_SCRIPT_DYN
> > +LINK-$(call gcc-min-version, 60100)$(CONFIG_CC_IS_CLANG) += -no-pie
> 
> 5.15 does not have support for gcc-min-version, so I think this just
> breaks ARCH=um for GCC. I do not think this patch matters much in 5.15
> and earlier, we only test ARCH=um with Linux 6.1 and newer, so it can be
> dropped.

Thanks, now dropped.

greg k-h

