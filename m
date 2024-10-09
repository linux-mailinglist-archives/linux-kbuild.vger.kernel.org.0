Return-Path: <linux-kbuild+bounces-4016-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4014D9974E0
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 20:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5CB3282A48
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 18:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252FA1A704B;
	Wed,  9 Oct 2024 18:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="siINcN6C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE101922EA;
	Wed,  9 Oct 2024 18:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728498432; cv=none; b=EKo6Y5/99LSfHzjjoIhVe68FBhsdbTT+7xnUsC436FmNlLiWzLCArfnI2Y7JxcH2xKsbCNveyCoAtH2ZGV4AadKZs0zng3LwBSPpW06IaoazKlDuz+jDTU/C9HeRfa6gbDD2UknZYBz+eHFHylqUBc8LQxFyx4CKg4D7tfmivbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728498432; c=relaxed/simple;
	bh=jhZwgy0s6PYh0bkEsa00DYSgW/ye/7lPeDLBcIHBAcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9MH1UitRWx+TLMM6pDJaClyMSTkFGrKreFqjMDFKgtBTWdm7f/O1ExXesbA3DEf4BQEbOsBGnAhdEzbnXxjTfUnnKGXxiJ3gmTs4prlopKkLVS/TKWvIdU5VWgc7S4S/yXcUw0B8uTd+6LDFuoQ4kDR766LSw8zeyUjM+Yxmw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=siINcN6C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5D0C4CEC3;
	Wed,  9 Oct 2024 18:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728498431;
	bh=jhZwgy0s6PYh0bkEsa00DYSgW/ye/7lPeDLBcIHBAcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=siINcN6C3vE7ciZFy936DdBHm9bzuDl0gQkUqevFy0SKNyNt3TFUwNQyiTt6NpAAz
	 1sYQ79TQHwwWQfKoeUT8H9AEP2bEYRg5v5iJ8S2rxjGfGaV8ebZ9mquqM6azvQfe8b
	 UIPgjpsXQYD3lzUAfL8+3HuIrEIdE1Kczsebpl+DHWOzXH5GuHZy24SUVtze51clQw
	 573PYTDoSdjSMdvzNyc1a8ZE0oacqmN0ROp79ujWAuu1V/zNz1Q5W10nMsiNva4dVs
	 3Y/KVl6pKONfcjaQpPbdPhUzWvuYqK62eRmPrsAlEHEulyovNEJQz4JPjOexP1YOGV
	 jVhHxAmZhlO4A==
Date: Wed, 9 Oct 2024 11:27:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: refactor cc-option-yn, cc-disable-warning,
 rust-option-yn macros
Message-ID: <20241009182709.GA3274931@thelio-3990X>
References: <20241009102821.2675718-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009102821.2675718-1-masahiroy@kernel.org>

On Wed, Oct 09, 2024 at 07:27:37PM +0900, Masahiro Yamada wrote:
> cc-option-yn and cc-disable-warning duplicate the compile command seen
> a few lines above. These can be defined based on cc-option.
> 
> I also refactored rustc-option-yn in the same way, although there are
> currently no users of it.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Neat!

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> This avoids applying similar fixes to rustc-option and rustc-option-yn.
> 
>  scripts/Makefile.compiler | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index 057305eae85c..73d611d383b2 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -53,13 +53,11 @@ cc-option = $(call __cc-option, $(CC),\
>  
>  # cc-option-yn
>  # Usage: flag := $(call cc-option-yn,-march=winchip-c6)
> -cc-option-yn = $(call try-run,\
> -	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",y,n)
> +cc-option-yn = $(if $(call cc-option,$1),y,n)
>  
>  # cc-disable-warning
>  # Usage: cflags-y += $(call cc-disable-warning,unused-but-set-variable)
> -cc-disable-warning = $(call try-run,\
> -	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
> +cc-disable-warning = $(if $(call cc-option,-W$(strip $1)),-Wno-$(strip $1))
>  
>  # gcc-min-version
>  # Usage: cflags-$(call gcc-min-version, 70100) += -foo
> @@ -85,5 +83,4 @@ rustc-option = $(call __rustc-option, $(RUSTC),\
>  
>  # rustc-option-yn
>  # Usage: flag := $(call rustc-option-yn,-Cinstrument-coverage)
> -rustc-option-yn = $(call try-run,\
> -	$(RUSTC) $(KBUILD_RUSTFLAGS) $(1) --crate-type=rlib /dev/null --out-dir=$$TMPOUT -o "$$TMP",y,n)
> +rustc-option-yn = $(if $(call rustc-option,$1),y,n)
> -- 
> 2.43.0
> 

