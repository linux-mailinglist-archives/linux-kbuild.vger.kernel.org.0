Return-Path: <linux-kbuild+bounces-6710-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B803A953EE
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Apr 2025 18:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CDF0188E9B4
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Apr 2025 16:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7B71DC99C;
	Mon, 21 Apr 2025 16:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkEOPtLM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAD71CAA79;
	Mon, 21 Apr 2025 16:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745252252; cv=none; b=hnfrRZBCyrs7p1U6AabQeLdGvXfcM9vZJ3wXO1HcCtJ0cyPJG+DrOYSVfvBITQqiisjL3TjmS9JLtDBovgPDx1oqDYM/jJRpIPlLavPkPcXZ3Yi6dVp2LABnKtam9xdhhDYChyDxibmyMJ69BnpMy0VeHrTMVTRs+XAC9hf85UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745252252; c=relaxed/simple;
	bh=zZjJug2ojlk7B/L1/Ay2G/DAGNeupwICVA+YK/CB0Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xqqtss7oR6NIEyv7pMUjZddx3wvjw96byKDJgNTJyKnoxbmrUzWD/bLPaUVDerrnECFnY2CzvKIN8I+fMPpQpCKa581IqyIzSGR/mPO/TR0guLPY9n+j8niU53v/hI/OG+oY56snzDDenuIfH9Hb2htXZk5LWT5Eg2xFR+qqJ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkEOPtLM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE144C4CEE4;
	Mon, 21 Apr 2025 16:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745252251;
	bh=zZjJug2ojlk7B/L1/Ay2G/DAGNeupwICVA+YK/CB0Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RkEOPtLMEvJT0lnK8J8+VHN4kf4nhgwNj6DETp7+HlYoJEdJ+b9Hey4FsCSv1s5ym
	 Bq1DqzrRtCxIcCRvwaWFNaPwYarfJXzFTyUrz68mYLrSnwNWs8yYjGcn4VnNFCGeje
	 I9Vz9HK7PcdIYjVR+K7OvHg0UMOhzPEvoEZvzRplEmGWdt+rDgQ/eOEbbYw2sT4igJ
	 M05A5+SbFbSvdYHS6SykX/UHmm1HYeGCBoavZSPBwOgvizlV36aWXysKehqpahNZ6K
	 Qpv+p9coAmfOHWOTj8iMNHa0w6SthNyNUXUPL92YjEuMGyxnbt71f8G6vAIZCZ6gSs
	 dA0DlW+yXI2Bw==
Date: Mon, 21 Apr 2025 09:17:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: Switch from -Wvla to -Wvla-larger-than=0
Message-ID: <20250421161725.GA3253782@ax162>
References: <20250418213235.work.532-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418213235.work.532-kees@kernel.org>

On Fri, Apr 18, 2025 at 02:32:39PM -0700, Kees Cook wrote:
> Variable Length Arrays (VLAs) on the stack must not be used in the kernel.
> Function parameter VLAs[1] should be usable, but -Wvla will warn for
> those. For example, this will produce a warning but it is not using a
> stack VLA:
> 
>     int something(size_t n, int array[n]) { ...
> 
> Clang has no way yet to distinguish between the VLA types[2], so
> depend on GCC for now to keep stack VLAs out of the tree by using GCC's
> -Wvla-larger-than=0 option (though GCC may split -Wvla[3] similarly to
> how Clang is planning to).
> 
> Switch to -Wvla-larger-than=0 and adjust the two VLA-checking selftests
> to disable the updated option name.
> 
> Link: https://en.cppreference.com/w/c/language/array [1]
> Link: https://github.com/llvm/llvm-project/issues/57098 [2]
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98217 [3]
> Signed-off-by: Kees Cook <kees@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

>  lib/Makefile               | 2 +-
>  mm/kasan/Makefile          | 2 +-
>  scripts/Makefile.extrawarn | 9 +++++++--
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/Makefile b/lib/Makefile
> index f07b24ce1b3f..37b6e5782ecb 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -71,7 +71,7 @@ CFLAGS_test_bitops.o += -Werror
>  obj-$(CONFIG_TEST_SYSCTL) += test_sysctl.o
>  obj-$(CONFIG_TEST_IDA) += test_ida.o
>  obj-$(CONFIG_TEST_UBSAN) += test_ubsan.o
> -CFLAGS_test_ubsan.o += $(call cc-disable-warning, vla)
> +CFLAGS_test_ubsan.o += $(call cc-option, -Wno-vla-larger-than)
>  CFLAGS_test_ubsan.o += $(call cc-disable-warning, unused-but-set-variable)
>  UBSAN_SANITIZE_test_ubsan.o := y
>  obj-$(CONFIG_TEST_KSTRTOX) += test-kstrtox.o
> diff --git a/mm/kasan/Makefile b/mm/kasan/Makefile
> index 1a958e7c8a46..0e326116a70b 100644
> --- a/mm/kasan/Makefile
> +++ b/mm/kasan/Makefile
> @@ -35,7 +35,7 @@ CFLAGS_shadow.o := $(CC_FLAGS_KASAN_RUNTIME)
>  CFLAGS_hw_tags.o := $(CC_FLAGS_KASAN_RUNTIME)
>  CFLAGS_sw_tags.o := $(CC_FLAGS_KASAN_RUNTIME)
>  
> -CFLAGS_KASAN_TEST := $(CFLAGS_KASAN) $(call cc-disable-warning, vla)
> +CFLAGS_KASAN_TEST := $(CFLAGS_KASAN) $(call cc-option, -Wno-vla-larger-than)
>  ifndef CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
>  # If compiler instruments memintrinsics by prefixing them with __asan/__hwasan,
>  # we need to treat them normally (as builtins), otherwise the compiler won't
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index d75897559d18..0229b10c5d81 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -45,8 +45,13 @@ endif
>  # These result in bogus false positives
>  KBUILD_CFLAGS += $(call cc-disable-warning, dangling-pointer)
>  
> -# Variable Length Arrays (VLAs) should not be used anywhere in the kernel
> -KBUILD_CFLAGS += -Wvla
> +# Stack Variable Length Arrays (VLAs) must not be used in the kernel.
> +# Function array parameters should, however, be usable, but -Wvla will
> +# warn for those. Clang has no way yet to distinguish between the VLA
> +# types, so depend on GCC for now to keep stack VLAs out of the tree.
> +# https://github.com/llvm/llvm-project/issues/57098
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98217
> +KBUILD_CFLAGS += $(call cc-option,-Wvla-larger-than=0)
>  
>  # disable pointer signed / unsigned warnings in gcc 4.0
>  KBUILD_CFLAGS += -Wno-pointer-sign
> -- 
> 2.34.1
> 

