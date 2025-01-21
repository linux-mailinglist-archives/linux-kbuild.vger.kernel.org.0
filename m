Return-Path: <linux-kbuild+bounces-5525-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61099A18781
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 22:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E09A7A162B
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 21:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566231F76D2;
	Tue, 21 Jan 2025 21:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/6AtUgu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4F31B85C5;
	Tue, 21 Jan 2025 21:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737496287; cv=none; b=X5ZlgBZ6pFVa3GRwCRWpxts15LtvGGBv5u2KmZmt8kcmDwyYiWx7P3rQ7WEyGL9R/+eJ7VW96223FQc1diAWBhdA7z86+ryd0LvYIXMZ3I83HTjd7y/PzWaMYJw/QBnT3iR2QDIRsvGsX3y//Zu/uQwYQndxzw+Hrb/Q6Z1AS+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737496287; c=relaxed/simple;
	bh=ghPzPcH4slQD//gSMFh6JByj3Bbfq1ElIu7rxa7KJuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRZW2++ONQ/KHPEit3749RgJck6iE2+RgO6HLWziGFK4Iw47i4N7Q6ABVCjp7MS3FhHWB6XjAa0OBLvSXhVKyIxlSSFR0UNWPEzcx3EihIL5KrG67UKG/WEgQeJQv9mZdTYyG/4TYlBBcAAzE6h+nW+rhhoXcvQQUSwqfKOwKQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/6AtUgu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02207C4CEDF;
	Tue, 21 Jan 2025 21:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737496286;
	bh=ghPzPcH4slQD//gSMFh6JByj3Bbfq1ElIu7rxa7KJuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/6AtUguCkvg8jyLjxP+LSXvzDm8FKRVhkADOgYAZi4sbxxAYbPAx4e6PF1rV4Jty
	 rrc7jFtSZz5wYH3Ur7KUINHmAi3hfdAck/qdFAdfOLseTrwg1Bsq0hCDUawkitKMhT
	 9Pm/Wy4EuWN+GzjB0fEy5MO+GFYZ80NvIXXF6K2GRFNbfpd3srg0UsUAlOHhyrcrSN
	 jY5gMvQv58sr+Cj9HmPdiFmj4fyW47zREPz1VSHLgRIHeFXDGMvRxiVSRFzHHLvrG3
	 MVun19DQL2GM0Gvv2pbgQbqnSFWhmagXRzxlOTtjaRD0PQyyWTy8eeKGru3zHtz2uQ
	 oEg6ssSH5Ez3Q==
Date: Tue, 21 Jan 2025 14:51:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Jakub Jelinek <jakub@redhat.com>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: Use -fzero-init-padding-bits=all
Message-ID: <20250121215122.GA1517789@ax162>
References: <20250121003646.work.168-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121003646.work.168-kees@kernel.org>

On Mon, Jan 20, 2025 at 04:36:53PM -0800, Kees Cook wrote:
> Enable -fzero-init-padding-bits=all when available (GCC 15+). This will
> correctly zero padding bits in structs and unions that might have been
> left uninitialized, and will make sure there is no regression in union
> initializations[1]. This fixes the following stackinit KUnit selftest
> cases that had been XFAIL until now because there was no compiler
> support:
> 
>     ok 38 test_small_hole_static_all # SKIP XFAIL uninit bytes: 3
>     ok 39 test_big_hole_static_all # SKIP XFAIL uninit bytes: 124
>     ok 40 test_trailing_hole_static_all # SKIP XFAIL uninit bytes: 7
>     ok 42 test_small_hole_dynamic_all # SKIP XFAIL uninit bytes: 3
>     ok 43 test_big_hole_dynamic_all # SKIP XFAIL uninit bytes: 124
>     ok 44 test_trailing_hole_dynamic_all # SKIP XFAIL uninit bytes: 7
>     ok 58 test_small_hole_assigned_static_all # SKIP XFAIL uninit bytes: 3
>     ok 59 test_big_hole_assigned_static_all # SKIP XFAIL uninit bytes: 124
>     ok 60 test_trailing_hole_assigned_static_all # SKIP XFAIL uninit bytes: 7
>     ok 62 test_small_hole_assigned_dynamic_all # SKIP XFAIL uninit bytes: 3
>     ok 63 test_big_hole_assigned_dynamic_all # SKIP XFAIL uninit bytes: 124
>     ok 64 test_trailing_hole_assigned_dynamic_all # SKIP XFAIL uninit bytes: 7
> 
> All of the above now pass when built under GCC 15:
> 
>     ./tools/testing/kunit/kunit.py run stackinit --arch=x86_64 \
>         --make_option CC=gcc-15
> 
> Suggested-by: Jakub Jelinek <jakub@redhat.com>
> Link: https://lore.kernel.org/linux-toolchains/Z0hRrrNU3Q+ro2T7@tucnak/ [1]
> Signed-off-by: Kees Cook <kees@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

As far as I understand it, clang has decided to do this unconditionally:

https://github.com/llvm/llvm-project/commit/7a086e1b2dc05f54afae3591614feede727601fa

> ---
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: linux-kbuild@vger.kernel.org
> ---
>  scripts/Makefile.extrawarn | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 1d13cecc7cc7..eb719f6d8d53 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -77,6 +77,9 @@ KBUILD_CFLAGS += $(call cc-option,-Werror=designated-init)
>  # Warn if there is an enum types mismatch
>  KBUILD_CFLAGS += $(call cc-option,-Wenum-conversion)
>  
> +# Explicitly clear padding bits during variable initialization
> +KBUILD_CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
> +
>  KBUILD_CFLAGS += -Wextra
>  KBUILD_CFLAGS += -Wunused
>  
> -- 
> 2.34.1
> 

