Return-Path: <linux-kbuild+bounces-5958-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E257BA4E958
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 18:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A43951797E9
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 17:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43521293B42;
	Tue,  4 Mar 2025 17:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/S/n5mc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E78281520;
	Tue,  4 Mar 2025 17:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741108081; cv=none; b=JJ0M0wqEOF+kf/+sj4fpTOrhsflWm/YpTd7VatKcEhWwtpCswN7t9qsoN0pUtDMOIr8mNznv57zZYZpars+HLxcl6XyFleM/PK8AxIWmGSjgRGFSXuAFRxevjbSBMy3wpXjos5g/bNyAng4x9vdccLJWzj/+7pJjY3HaWt44lj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741108081; c=relaxed/simple;
	bh=ExQy865opXw6DJMm2Zy8thSEQ2//ZajmzZjhLDdgip8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNIF2diNE7S7lAZrKhXy2KLBn8+z/VbnN5MS7mW/1cOSm+tt6Q0jblth+YsJpnDOQ7HVZUOLmHUfbzK9iPae6w27UXIVqt+dGG78zB/NQhfrlHuQxr0+wxvwPYwa/p+gaAzi0lBPnIFTqorIbS1YgWS2I0O4cWeY9cBRVm35UWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/S/n5mc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E9FC4CEE7;
	Tue,  4 Mar 2025 17:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741108080;
	bh=ExQy865opXw6DJMm2Zy8thSEQ2//ZajmzZjhLDdgip8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/S/n5mcWu/UBrYJ+TCBDohmSpkaKpp3W/oYgHiI/KuhAbI9KA2kv7BZLyzpMCfOt
	 5Wq8oedYv0QjWahN3qmeV3zxSsUGOq2uOUp/yflUURVb/OTCKj8hW7Vxnp8gBESsjC
	 pc2HyY1m7X1gZDrLSonteoxRMWPrg7RwvOkKcEJgi/fTEGOMeFqPe+AKHrnuCe2evj
	 4+CGuNjEonQLrRuMQXHebM9/xLHR0V2qQ/ZRWoWxw6hWG9Q2EvGTPOkbjYC976JGta
	 kmU7BYLOeu+jvgOx9uHuREM5azgdxWj5CcwgpT/+IY6xkW5/rRoQOEqIASs706Ky6i
	 CHiKZp8kuCXww==
Date: Tue, 4 Mar 2025 09:07:57 -0800
From: Kees Cook <kees@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, David Gow <davidgow@google.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: clang: Support building UM with SUBARCH=i386
Message-ID: <202503040842.1177A1F15B@keescook>
References: <20250303215240.work.379-kees@kernel.org>
 <05a25510-ab44-4eb1-a878-71e84c8aff0d@t-8ch.de>
 <20250304102536.GB2529736@ax162>
 <e1a1531d-6968-4ae8-a3b5-5ea0547ec4b3@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1a1531d-6968-4ae8-a3b5-5ea0547ec4b3@t-8ch.de>

On Tue, Mar 04, 2025 at 03:51:19PM +0100, Thomas Weißschuh wrote:
> On 2025-03-04 11:25:36+0100, Nathan Chancellor wrote:
> > On Mon, Mar 03, 2025 at 11:29:58PM +0100, Thomas Weißschuh wrote:
> > > On 2025-03-03 13:52:41-0800, Kees Cook wrote:
> 
> <snip>
> 
> > > This is also what exists in tools/testing/selftests/lib.mk.
> > > Minus the missing CONFIG_FORTIFY_SOURCE on clang x86_32
> > > and a failure of overflow.DEFINE_FLEX_test (clang 19.1.7).
> > 
> > Does Kees's other patch resolve the second issue? It'll obviously fix
> > the first :P
> > 
> > https://lore.kernel.org/20250303214929.work.499-kees@kernel.org/
> 
> No, it doesn't.
> 
> Running tests with:
> $ .kunit/linux kunit.filter_glob=overflow.DEFINE_FLEX_test kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
> [15:48:30] =================== overflow (1 subtest) ===================
> [15:48:30] # DEFINE_FLEX_test: EXPECTATION FAILED at lib/overflow_kunit.c:1200
> [15:48:30] Expected __builtin_dynamic_object_size(two_but_zero, 0) == expected_raw_size, but
> [15:48:30]     __builtin_dynamic_object_size(two_but_zero, 0) == 12 (0xc)
> [15:48:30]     expected_raw_size == 8 (0x8)
> [15:48:30] [FAILED] DEFINE_FLEX_test
> [15:48:30] # module: overflow_kunit
> [15:48:30] ==================== [FAILED] overflow =====================
> [15:48:30] ============================================================
> [15:48:30] Testing complete. Ran 1 tests: failed: 1
> [15:48:31] Elapsed time: 43.985s total, 0.001s configuring, 43.818s building, 0.133s running
> 
> If I force CONFIG_CC_HAS_COUNTED_BY=n then the test succeeds.
> Clang 19.1.7 from the Arch Linux repos.

I wasn't seeing with Clang 20 from git:
ClangBuiltLinux clang version 20.0.0git (git@github.com:llvm/llvm-project.git 72901fe19eb1e55d0ee1c380ab7a9f57d2f187c5)

But I do see the error with ToT Clang:
ClangBuiltLinux clang version 21.0.0git (git@github.com:llvm/llvm-project.git eee3db5421040cfc3eae6e92ed714650a6f741fa)

Clang 17.1: (does not support counted_by)

    # DEFINE_FLEX_test: missing counted_by
    # DEFINE_FLEX_test: sizeof(two_but_zero): 8
    # DEFINE_FLEX_test: __struct_size(two_but_zero): 12
    # DEFINE_FLEX_test: __member_size(two_but_zero): 12
    # DEFINE_FLEX_test: __member_size(two_but_zero->array): 4

Clang 19.1.1: (actually is _does_ support counted_by, but Linux disables it)

    # DEFINE_FLEX_test: missing counted_by
    # DEFINE_FLEX_test: sizeof(two_but_zero): 8
    # DEFINE_FLEX_test: __struct_size(two_but_zero): 12
    # DEFINE_FLEX_test: __member_size(two_but_zero): 12
    # DEFINE_FLEX_test: __member_size(two_but_zero->array): 4

GCC 13.3:

    # DEFINE_FLEX_test: missing counted_by
    # DEFINE_FLEX_test: sizeof(two_but_zero): 8
    # DEFINE_FLEX_test: __struct_size(two_but_zero): 12
    # DEFINE_FLEX_test: __member_size(two_but_zero): 12
    # DEFINE_FLEX_test: __member_size(two_but_zero->array): 4

Clang 21 (ToT):

    # DEFINE_FLEX_test: has counted_by
    # DEFINE_FLEX_test: sizeof(two_but_zero): 8
    # DEFINE_FLEX_test: __struct_size(two_but_zero): 12
    # DEFINE_FLEX_test: __member_size(two_but_zero): 12
    # DEFINE_FLEX_test: __member_size(two_but_zero->array): 0

GCC 15 (ToT):

    # DEFINE_FLEX_test: has counted_by
    # DEFINE_FLEX_test: sizeof(two_but_zero): 8
    # DEFINE_FLEX_test: __struct_size(two_but_zero): 12
    # DEFINE_FLEX_test: __member_size(two_but_zero): 12
    # DEFINE_FLEX_test: __member_size(two_but_zero->array): 0

It seems like the on-stack sizes with __bdos all agree now, regardless
of the used compiler features. It is only the array size calculation
that now gets masked by counted_by. (i.e. the stack size is overridden
by the zero "count" for the array elements.)

I'll send a fix for the test...

-- 
Kees Cook

