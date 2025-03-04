Return-Path: <linux-kbuild+bounces-5957-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7472A4E8ED
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 18:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F2B88C3B8D
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 16:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB4C299B2E;
	Tue,  4 Mar 2025 16:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uNwTkCXL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C61E204C1E;
	Tue,  4 Mar 2025 16:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741105731; cv=none; b=Y4tGqEXUfvkdc0qqC6GPG2dmG9ukU0LFPpr+pkpQzv3loGicI22f85O1YVRWpKyAz3+ixsl9K0NIpsMe/+X8iImh66IoNG1QiLeA7GzDTv8RpPmqeaCMUhk99UniefJ7YuO4gVrfPZRo/BMsiWm/2lRw/ZBj8vDHFypBtepqEcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741105731; c=relaxed/simple;
	bh=lqDg7gYU+818e4TRIz2Zp6nENwnhnzNwXB/jM7gTjZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmbRUiwMdBk7B/xPBhSIPDdO+Vsc0UqK8y3B41XI91k2PXoEo/JnbHfZCtoPjPXfnkdsvMNhzj42X9YpOeuH0aU6z6cXOwP54IZDFe6j51uxp55+A106k6Rm92WPgQBJE6nzjxq3bglFj4RJho0eqIofPytXZBgJ/02k3j9xImo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uNwTkCXL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA79C4CEE5;
	Tue,  4 Mar 2025 16:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741105730;
	bh=lqDg7gYU+818e4TRIz2Zp6nENwnhnzNwXB/jM7gTjZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uNwTkCXLfXwiuaqh7iLk5y3XWPiY1JXK/OGKUOGuMB80rvDgvmVcz0CuY7XoJB6gW
	 WjWtX9m/ml3NqoloVaQK8+n+Y+rnSv/F7iatqbUF5SbkgsM8YO9nfjbIa2U4Mld4F8
	 ywsGb9TiNP2p7RhvGv8Lsuq6whau+k08Bb7X7RFgxyQHJn8Fw/AYcCHACXC/K+YSY7
	 1NaIqSQqbuf4vzxBxSJPNNDkvgL4MC+ihZqW6KBUl4y3y2cAYwAxTysBuBq6Efci+Y
	 H0F02I4OUtdPlogRunR6CtdLYDnhjhiTdTDl5QmovnZY5CVl3AUqgB0X3LyHX36OuT
	 qZx6pziRIq+PQ==
Date: Tue, 4 Mar 2025 17:28:45 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, David Gow <davidgow@google.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: clang: Support building UM with SUBARCH=i386
Message-ID: <20250304162845.GA1479759@ax162>
References: <20250304162124.it.785-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250304162124.it.785-kees@kernel.org>

On Tue, Mar 04, 2025 at 08:21:29AM -0800, Kees Cook wrote:
> The UM builds distinguish i386 from x86_64 via SUBARCH, but we don't
> support building i386 directly with Clang. To make SUBARCH work for
> i386 UM, we need to explicitly test for it.
> 
> This lets me run i386 KUnit tests with Clang:
> 
> $ ./tools/testing/kunit/kunit.py run \
> 	--make_options LLVM=1 \
> 	--make_options SUBARCH=i386
> ...
> 
> Fixes: c7500c1b53bf ("um: Allow builds with Clang")
> Signed-off-by: Kees Cook <kees@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Thomas Weiﬂschuh <linux@weissschuh.net>
> Cc: Bill Wendling <morbo@google.com>
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: llvm@lists.linux.dev
> Cc: linux-kbuild@vger.kernel.org
> ---
>  scripts/Makefile.clang | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 2435efae67f5..b67636b28c35 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -12,6 +12,8 @@ CLANG_TARGET_FLAGS_riscv	:= riscv64-linux-gnu
>  CLANG_TARGET_FLAGS_s390		:= s390x-linux-gnu
>  CLANG_TARGET_FLAGS_sparc	:= sparc64-linux-gnu
>  CLANG_TARGET_FLAGS_x86		:= x86_64-linux-gnu
> +# This is only for i386 UM builds, which need the 32-bit target not -m32
> +CLANG_TARGET_FLAGS_i386		:= i386-linux-gnu
>  CLANG_TARGET_FLAGS_um		:= $(CLANG_TARGET_FLAGS_$(SUBARCH))
>  CLANG_TARGET_FLAGS		:= $(CLANG_TARGET_FLAGS_$(SRCARCH))
>  
> -- 
> 2.34.1
> 

