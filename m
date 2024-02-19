Return-Path: <linux-kbuild+bounces-998-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DB285ABF9
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Feb 2024 20:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF572B21153
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Feb 2024 19:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D60F50A60;
	Mon, 19 Feb 2024 19:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGUT35zH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F291BF3D;
	Mon, 19 Feb 2024 19:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708370920; cv=none; b=L8v+fSaAG+jcx1KY8V1ENUsIBUhD6kENDFdlxCTbMqFHe7wCilthMydanT4Uou9AST1Ttth4QbSUp+alxApnlGd/+77uysuCgEV7j+9GjrMNFZnMwV/rHcwQOfpjAIwoEmYl3lIEe999eoUpGO+M9w0kIV+yQOdmvMmsy5W3Cos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708370920; c=relaxed/simple;
	bh=BcBpyRvLWEYLR63LQp3ENXVhKmAqe7m/TbOBnz6n/j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbJ70CuKMYTJdMHRnzk9vmQtbgu+qjkR6IvaqyypKYIGn5LFAhvP8Ika7FS+pAxvD9xFeC/i9qWSnnp2Hjun6CJ8SxjeeeYaQe7US43NBCe5NPji5G7KvnphV2CyCKl5JALFP1Rh9WYVAJmgq+VHbHgHMCXrdtAwCtFjeRJnqoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGUT35zH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8E8C433F1;
	Mon, 19 Feb 2024 19:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708370919;
	bh=BcBpyRvLWEYLR63LQp3ENXVhKmAqe7m/TbOBnz6n/j4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aGUT35zHgvccxggFIVuUwKbL1ze+7BWcVxc2HHP5PkOt3RaNHT5Bq1YYcL1fpDdaN
	 YDhCQVUrgs9r4NXOVQyX1DKmhudm/nlks3CWF3zTk0wkdZWMIcZ8VrcuJuKpqX5km8
	 phXDfmvDfvkHEY2tfCPBDLlCjddLYMiCeHCx62uvxIa6nfor0dkVeeumtwQjk1ADL+
	 qQzeqcBm1/EHZQFMEPqlcOpYMaBq1PPePkcjgjB1MGVBgBZ/XlTouXJOoH3Zkw94OG
	 6XtteU7FimwBqWnY6wVk/P4YUP8yVXlvyQuuD44VqjMLnr3ZOs1TO5I44x+yKC2G/O
	 aKNF90SptJBBQ==
Date: Mon, 19 Feb 2024 12:28:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: gregkh@linuxfoundation.org
Cc: masahiroy@kernel.org, stable-commits@vger.kernel.org,
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: Patch "um: Fix adding '-no-pie' for clang" has been added to the
 5.15-stable tree
Message-ID: <20240219192837.GD2348301@dev-arch.thelio-3990X>
References: <2024021939-dullness-calculate-a293@gregkh>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024021939-dullness-calculate-a293@gregkh>

Hi Greg,

On Mon, Feb 19, 2024 at 06:02:39PM +0100, gregkh@linuxfoundation.org wrote:
> 
> This is a note to let you know that I've just added the patch titled
> 
>     um: Fix adding '-no-pie' for clang
> 
> to the 5.15-stable tree which can be found at:
>     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
> 
> The filename of the patch is:
>      um-fix-adding-no-pie-for-clang.patch
> and it can be found in the queue-5.15 subdirectory.
> 
> If you, or anyone else, feels it should not be added to the stable tree,
> please let <stable@vger.kernel.org> know about it.
> 
> 
> From 846cfbeed09b45d985079a9173cf390cc053715b Mon Sep 17 00:00:00 2001
> From: Nathan Chancellor <nathan@kernel.org>
> Date: Tue, 23 Jan 2024 15:59:54 -0700
> Subject: um: Fix adding '-no-pie' for clang
> 
> From: Nathan Chancellor <nathan@kernel.org>
> 
> commit 846cfbeed09b45d985079a9173cf390cc053715b upstream.
> 
> The kernel builds with -fno-PIE, so commit 883354afbc10 ("um: link
> vmlinux with -no-pie") added the compiler linker flag '-no-pie' via
> cc-option because '-no-pie' was only supported in GCC 6.1.0 and newer.
> 
> While this works for GCC, this does not work for clang because cc-option
> uses '-c', which stops the pipeline right before linking, so '-no-pie'
> is unconsumed and clang warns, causing cc-option to fail just as it
> would if the option was entirely unsupported:
> 
>   $ clang -Werror -no-pie -c -o /dev/null -x c /dev/null
>   clang-16: error: argument unused during compilation: '-no-pie' [-Werror,-Wunused-command-line-argument]
> 
> A recent version of clang exposes this because it generates a relocation
> under '-mcmodel=large' that is not supported in PIE mode:
> 
>   /usr/sbin/ld: init/main.o: relocation R_X86_64_32 against symbol `saved_command_line' can not be used when making a PIE object; recompile with -fPIE
>   /usr/sbin/ld: failed to set dynamic section sizes: bad value
>   clang: error: linker command failed with exit code 1 (use -v to see invocation)
> 
> Remove the cc-option check altogether. It is wasteful to invoke the
> compiler to check for '-no-pie' because only one supported compiler
> version does not support it, GCC 5.x (as it is supported with the
> minimum version of clang and GCC 6.1.0+). Use a combination of the
> gcc-min-version macro and CONFIG_CC_IS_CLANG to unconditionally add
> '-no-pie' with CONFIG_LD_SCRIPT_DYN=y, so that it is enabled with all
> compilers that support this. Furthermore, using gcc-min-version can help
> turn this back into
> 
>   LINK-$(CONFIG_LD_SCRIPT_DYN) += -no-pie
> 
> when the minimum version of GCC is bumped past 6.1.0.
> 
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1982
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  arch/um/Makefile |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> --- a/arch/um/Makefile
> +++ b/arch/um/Makefile
> @@ -118,7 +118,9 @@ archprepare:
>  	$(Q)$(MAKE) $(build)=$(HOST_DIR)/um include/generated/user_constants.h
>  
>  LINK-$(CONFIG_LD_SCRIPT_STATIC) += -static
> -LINK-$(CONFIG_LD_SCRIPT_DYN) += $(call cc-option, -no-pie)
> +ifdef CONFIG_LD_SCRIPT_DYN
> +LINK-$(call gcc-min-version, 60100)$(CONFIG_CC_IS_CLANG) += -no-pie

5.15 does not have support for gcc-min-version, so I think this just
breaks ARCH=um for GCC. I do not think this patch matters much in 5.15
and earlier, we only test ARCH=um with Linux 6.1 and newer, so it can be
dropped.

Cheers,
Nathan

