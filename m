Return-Path: <linux-kbuild+bounces-5972-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 480A7A502AF
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 15:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71B0F1897527
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 14:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25C924EF70;
	Wed,  5 Mar 2025 14:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FT3IPME9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FF7204C35;
	Wed,  5 Mar 2025 14:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741185960; cv=none; b=luAuxk4X6Kjx9PGfSVVyJSRIkzaJxA/nwv32iPz8C/9fVOwWe+rBgErhKe0T4KMHU5Dt2OjlG3iSsQVUSvIsHhUJ/NpJ+DHGKBrkdfKlnIG+T5HKrKaVxKp78nP0npSasUXCY7S3YQHf7itpTgDI7pMwPM6WIkiVuax+/budC84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741185960; c=relaxed/simple;
	bh=IJITA4ytTmUFMzhJpi0Z7MN58Xcdm8gfOaBFwHxdNW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCwni12AMGyiz5E8GVcO1LsCXtcPhgLlhvvttV8SZGoUbTbWg7v9Kx/hjrRyZ5WnznO1nj03p8Z5ExKLqIDYHPtqcsCEWe8Krjh0Z1ql6XoIpg7t1ZgJS4pRpiaeyib7QQgEUZiK4TZMKuL00UE0ZhsVeKtsR71Txp8LGQzxmwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FT3IPME9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933EEC4CED1;
	Wed,  5 Mar 2025 14:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741185960;
	bh=IJITA4ytTmUFMzhJpi0Z7MN58Xcdm8gfOaBFwHxdNW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FT3IPME95VlP5ie8KtxCMaGhv9WI7HkAgfV5txTXgSUAmriapmls6XY88Bc6Uq/sD
	 scdeXCE3d2n4As1YBHd89RRWC77MAo8l3T0nfGCDIxatUROgcdF58Dhkvwl1RXq9G7
	 TmBB2FsZdA9RmziGtrzZ94Xi1GnIIu8Nkm7MtN/j2aBJ3m598Oow/b4Juv/dsH3q/t
	 KVPHICTnHEFuWXQdnokU77/RHvyM4lEBeILVBEE/t82FMtoHuM9CJeSCjFu3UbtdNe
	 4phE+5IAs10TfByEyJ6wDCa7r4k/BvQ7dF+VRhNh6OKKhyyajodAuWWNkQPIuy372O
	 +F0IYyZO+GtGA==
Date: Wed, 5 Mar 2025 15:45:54 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, David Gow <davidgow@google.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: clang: Support building UM with SUBARCH=i386
Message-ID: <20250305144554.GA3574115@ax162>
References: <20250303215240.work.379-kees@kernel.org>
 <05a25510-ab44-4eb1-a878-71e84c8aff0d@t-8ch.de>
 <20250304102536.GB2529736@ax162>
 <e1a1531d-6968-4ae8-a3b5-5ea0547ec4b3@t-8ch.de>
 <202503040842.1177A1F15B@keescook>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202503040842.1177A1F15B@keescook>

On Tue, Mar 04, 2025 at 09:07:57AM -0800, Kees Cook wrote:
> On Tue, Mar 04, 2025 at 03:51:19PM +0100, Thomas Weißschuh wrote:
> > No, it doesn't.
> > 
> > Running tests with:
> > $ .kunit/linux kunit.filter_glob=overflow.DEFINE_FLEX_test kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
> > [15:48:30] =================== overflow (1 subtest) ===================
> > [15:48:30] # DEFINE_FLEX_test: EXPECTATION FAILED at lib/overflow_kunit.c:1200
> > [15:48:30] Expected __builtin_dynamic_object_size(two_but_zero, 0) == expected_raw_size, but
> > [15:48:30]     __builtin_dynamic_object_size(two_but_zero, 0) == 12 (0xc)
> > [15:48:30]     expected_raw_size == 8 (0x8)
> > [15:48:30] [FAILED] DEFINE_FLEX_test
> > [15:48:30] # module: overflow_kunit
> > [15:48:30] ==================== [FAILED] overflow =====================
> > [15:48:30] ============================================================
> > [15:48:30] Testing complete. Ran 1 tests: failed: 1
> > [15:48:31] Elapsed time: 43.985s total, 0.001s configuring, 43.818s building, 0.133s running
> > 
> > If I force CONFIG_CC_HAS_COUNTED_BY=n then the test succeeds.
> > Clang 19.1.7 from the Arch Linux repos.
> 
> I wasn't seeing with Clang 20 from git:
> ClangBuiltLinux clang version 20.0.0git (git@github.com:llvm/llvm-project.git 72901fe19eb1e55d0ee1c380ab7a9f57d2f187c5)
> 
> But I do see the error with ToT Clang:
> ClangBuiltLinux clang version 21.0.0git (git@github.com:llvm/llvm-project.git eee3db5421040cfc3eae6e92ed714650a6f741fa)
> 
> Clang 17.1: (does not support counted_by)
> 
>     # DEFINE_FLEX_test: missing counted_by
>     # DEFINE_FLEX_test: sizeof(two_but_zero): 8
>     # DEFINE_FLEX_test: __struct_size(two_but_zero): 12
>     # DEFINE_FLEX_test: __member_size(two_but_zero): 12
>     # DEFINE_FLEX_test: __member_size(two_but_zero->array): 4
> 
> Clang 19.1.1: (actually is _does_ support counted_by, but Linux disables it)
> 
>     # DEFINE_FLEX_test: missing counted_by
>     # DEFINE_FLEX_test: sizeof(two_but_zero): 8
>     # DEFINE_FLEX_test: __struct_size(two_but_zero): 12
>     # DEFINE_FLEX_test: __member_size(two_but_zero): 12
>     # DEFINE_FLEX_test: __member_size(two_but_zero->array): 4
> 
> GCC 13.3:
> 
>     # DEFINE_FLEX_test: missing counted_by
>     # DEFINE_FLEX_test: sizeof(two_but_zero): 8
>     # DEFINE_FLEX_test: __struct_size(two_but_zero): 12
>     # DEFINE_FLEX_test: __member_size(two_but_zero): 12
>     # DEFINE_FLEX_test: __member_size(two_but_zero->array): 4
> 
> Clang 21 (ToT):
> 
>     # DEFINE_FLEX_test: has counted_by
>     # DEFINE_FLEX_test: sizeof(two_but_zero): 8
>     # DEFINE_FLEX_test: __struct_size(two_but_zero): 12
>     # DEFINE_FLEX_test: __member_size(two_but_zero): 12
>     # DEFINE_FLEX_test: __member_size(two_but_zero->array): 0
> 
> GCC 15 (ToT):
> 
>     # DEFINE_FLEX_test: has counted_by
>     # DEFINE_FLEX_test: sizeof(two_but_zero): 8
>     # DEFINE_FLEX_test: __struct_size(two_but_zero): 12
>     # DEFINE_FLEX_test: __member_size(two_but_zero): 12
>     # DEFINE_FLEX_test: __member_size(two_but_zero->array): 0
> 
> It seems like the on-stack sizes with __bdos all agree now, regardless
> of the used compiler features. It is only the array size calculation
> that now gets masked by counted_by. (i.e. the stack size is overridden
> by the zero "count" for the array elements.)
> 
> I'll send a fix for the test...

Just for my own understanding, is this because of the adjustment that
Bill did to the __bdos() calculation in [1]? I think that tracks because
the version of LLVM 20 that you have is pretty old and does not have
that change. I know for a fact I tested the original change to the
overflow KUnit test to adjust the expected calculation result and it
passed but it was before that change as well. If I use a current version
of LLVM 20, I see the failure. If I allow LLVM 18 to use __counted_by(),
the test passes with it. Not that it truly matters but it does explain
how we got to this point.

[1]: https://github.com/llvm/llvm-project/commit/8c62bf54df76e37d0978f4901c6be6554e978b53

Cheers,
Nathan

