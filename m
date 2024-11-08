Return-Path: <linux-kbuild+bounces-4576-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7339C245B
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 18:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7A1A1F27CE3
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 17:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DFA21C164;
	Fri,  8 Nov 2024 17:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TzoWCT0k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F9E21B458;
	Fri,  8 Nov 2024 17:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731088001; cv=none; b=uLKFvcbVy2APetz4FpwkhyrX3DWBU+KgylaikdS/epGLxcgGOKLikxqZKUEsV2GQya3WcgrZfdhTj3ztTV5VlyFYvzvmjVKSJyA73AfnyEBSW5fjCvo9Gldwe/gP70mbDAc+kym7atopoGefqUClbJJO/e6zsNj8ToGTu4DA1wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731088001; c=relaxed/simple;
	bh=v6CMakwqFx7aJagpFs1cS1sDWNqmR4HwbpiSyjF0JjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQUjqbYbBD32Oa/7ENHzbJu6jmdQE0xyjbJDItDM2Ok6TVwNBnJbl4M84i41WZqW3kgNNnnncCHaUoKGXQTaoPXMQjkAHarhv5arS7wtE8L+LZ/Q2QXCsCYgUZGoerDmHwW02sdTZy6i1/x2PDcj4Mut9lxQRinCaAKSy2WxZ2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TzoWCT0k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D023C4CECD;
	Fri,  8 Nov 2024 17:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731088001;
	bh=v6CMakwqFx7aJagpFs1cS1sDWNqmR4HwbpiSyjF0JjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TzoWCT0km7qIjw6wL3OQkxyzDX0V9ucpTetlaamJ9ckgAU38Z9fLuOVnzv4AlDvCg
	 9spSlI7s5sY68DEpeZU6kS4yCQ0Nd03kJDWqLxJJ92HtF1KVbTzYwICdBgl3tbevsA
	 rTHxnrdXb2uWxrt9SpkCooT2WbBTay8FoA1Vwpohti1nCZ/SAua3oLJqYtDqHbAopu
	 V4Y//A82tSDQwwHOxjL9O4Cn1r9TOTp7I2LcWl00oXrKLYPIi083zMJD78lkNASHeB
	 urKvx5ZfAq/7qeZT8kibjd8hh841efdPtqAqG7WpBE7uHT+oXkByZqA+NHbHlPRpnF
	 O5uFOfViW09gg==
Date: Fri, 8 Nov 2024 10:46:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rong Xu <xur@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Han Shen <shenhan@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: Fix Propeller build option
Message-ID: <20241108174638.GC2564051@thelio-3990X>
References: <20241108051030.2918950-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108051030.2918950-1-xur@google.com>

Hi Rong,

Thanks for the quick patch!

On Thu, Nov 07, 2024 at 09:10:30PM -0800, Rong Xu wrote:
> The '-fbasic-block-sections=labels' option has been deprecated with
> the following llvm patch:
> https://github.com/llvm/llvm-project/pull/110039
> 
> The old option still works, but with a warning like
>   clang: warning: argument '-fbasic-block-sections=labels' \
>   is deprecated, use '-fbasic-block-address-map' instead [-Wdeprecated]
> 
> Currently, the option change is only in the ToT clang (v20) and not yet
> released in v19.

I think this whole block could be a little easier to read and understand
with some more standard kernel commit message practices. I would combine
the first and third block into one sentence and I would unwrap the
warning text (it is okay to be long for a little clarity). Perhaps
something like this?

  | The '-fbasic-block-sections=labels' option has been deprecated in tip of
  | tree clang (20.0.0) [1]. While the option still works, a warning is
  | emitted:
  |
  |   clang: warning: argument '-fbasic-block-sections=labels' is deprecated, use '-fbasic-block-address-map' instead [-Wdeprecated]

then putting:

  | Link: https://github.com/llvm/llvm-project/pull/110039 [1]

right above your Signoff.

> This patch adds a check to the Makefile to set the proper option.

Try to avoid saying "this patch" in kernel commit messages, it is
implicit. It would be cleaner to say something like:

  | Add a version check to set the proper option.

You can see some more commit message tips in sections 4.2.3 to 4.2.6 in
the tip documentation:

https://docs.kernel.org/process/maintainer-tip.html#changelog

> If the option change is later integrated in v19.x, we need to update the
> check accordingly.

I think it is worth dropping this sentence entirely, as I would argue
that it is pretty unlikely that this option gets backported to
release/19.x, since it would basically accelerate the deprecation
timeline, which seems unreasonable to do in a stable release.

> Signed-off-by: Rong Xu <xur@google.com>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  scripts/Makefile.propeller | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.propeller b/scripts/Makefile.propeller
> index 344190717e47..1a68ea0d1fe4 100644
> --- a/scripts/Makefile.propeller
> +++ b/scripts/Makefile.propeller
> @@ -5,7 +5,13 @@ ifdef CLANG_PROPELLER_PROFILE_PREFIX
>    CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=list=$(CLANG_PROPELLER_PROFILE_PREFIX)_cc_profile.txt -ffunction-sections
>    KBUILD_LDFLAGS += --symbol-ordering-file=$(CLANG_PROPELLER_PROFILE_PREFIX)_ld_profile.txt --no-warn-symbol-ordering
>  else
> -  CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=labels
> +  # Staring with clang v20, the '-fbasic-block-sections=labels' option is
> +  # deprecated. Use the recommended '-fbasic-block-address-map' option.

Might be worth linking the specific change here for archeology sake.

> +  ifeq ($(call clang-min-version, 200000),y)
> +    CFLAGS_PROPELLER_CLANG := -fbasic-block-address-map
> +  else
> +    CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=labels
> +  endif
>  endif
>  
>  # Propeller requires debug information to embed module names in the profiles.
> @@ -21,7 +27,11 @@ ifdef CONFIG_LTO_CLANG_THIN
>    ifdef CLANG_PROPELLER_PROFILE_PREFIX
>      KBUILD_LDFLAGS += --lto-basic-block-sections=$(CLANG_PROPELLER_PROFILE_PREFIX)_cc_profile.txt
>    else
> -    KBUILD_LDFLAGS += --lto-basic-block-sections=labels
> +    ifeq ($(call clang-min-version, 200000),y)

Would it be better/more accurate to check the LLD version here? I doubt
it would really happen but it is possible for someone to have LLVM=1
(using their system wide ld.lld and LLVM tools) and CC=clang-20 to just
use an updated clang. Perhaps:

  ifeq ($(call test-ge, $(CONFIG_LLD_VERSION), 200000),y)

here?

> +       KBUILD_LDFLAGS += --lto-basic-block-address-map
> +    else
> +       KBUILD_LDFLAGS += --lto-basic-block-sections=labels
> +    endif
>    endif
>  endif
>  
> 
> base-commit: 0dcc2d1066150787017a71f035145c566597dec7
> -- 
> 2.47.0.277.g8800431eea-goog
> 

