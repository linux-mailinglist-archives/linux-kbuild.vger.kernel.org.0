Return-Path: <linux-kbuild+bounces-4695-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1ED9CFD5A
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Nov 2024 09:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A135289169
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Nov 2024 08:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E22192598;
	Sat, 16 Nov 2024 08:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gaisler.com header.i=@gaisler.com header.b="h6bntngO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE71663C;
	Sat, 16 Nov 2024 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.231.106.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731745883; cv=none; b=rXykVP13oHdX5TGRLr8ntB6XEbzinmc74wuoGgSKzo+QAa0MwCh6Qlql6cXvmsUvHtj3baNoedFuIChHvesEQ2/N8rBwJBqGnwJ7Tv/fJTLHC+z3Bs01EMw8ZOiIysCkEP7hSzX0G+W7GGnIUb47djqf3LiAyuqMsl9ecqpRA0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731745883; c=relaxed/simple;
	bh=Iyuhl/jr6P9w67XtFsNYU6bXtOQwPW74TNT609bIAtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NOCf0M0zjEkiCHZGd0cRgMkVyiYwN1M0m+JRg61zF4CAfRpeyoBywZsuCgG0QEc4Ql9EdWAGMG7xfFAybQXucvZM1HwDzMUnVKjmxjTje5VGHM9zCsLIO8hbfFa+TmkfIqT/Zrf342Z/Owm8pBjXzeUtS2mIvyNz1oN54wGn0Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; dkim=pass (1024-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=h6bntngO; arc=none smtp.client-ip=94.231.106.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaisler.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4Xr6YK3TmBz1DHcg;
	Sat, 16 Nov 2024 09:31:17 +0100 (CET)
Received: from [10.10.15.6] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4Xr6YJ6SB1z1DDrT;
	Sat, 16 Nov 2024 09:31:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=unoeuro; t=1731745877;
	bh=6ZbV4+IoJk8L+0GgX4YxbWtM3elPBL8i/qWEAd1wwdk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=h6bntngONbblphvXdMJKIwxW0vSHrrQe1DWKjc+cmiB+YDDpyk7QfIgoKFwYR+myg
	 Nysfk+LUFefGh5TcrVY0SoX5HMocliC6/hilK/RFyaYE2vE94+/JPNhyOQNDXrZNQh
	 SMfTzeqwuT4hB2sn1BnauSe9X4KMSveLro46JTxQ=
Message-ID: <cfc033a8-a7de-469b-8afa-0069593c5c6f@gaisler.com>
Date: Sat, 16 Nov 2024 09:31:16 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] sparc/build: Rework CFLAGS for clang compatibility
To: koachan@protonmail.com, "David S. Miller" <davem@davemloft.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 glaubitz@physik.fu-berlin.de, Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org
References: <20241029-sparc-cflags-v3-0-b28745a6bd71@protonmail.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20241029-sparc-cflags-v3-0-b28745a6bd71@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-10-29 15:49, Koakuma via B4 Relay wrote:
> Hello~
> 
> This changes the CFLAGS for building the SPARC kernel so that it can be
> built with clang, as a follow up from the discussion in this thread:
> 
> https://lore.kernel.org/lkml/JAYB7uS-EdLABTR4iWZdtFOVa5MvlKosIrD_cKTzgeozCOGRM7lhxeLigFB1g3exX445I_W5VKB-tAzl2_G1zCVJRQjp67ODfsSqiZWOZ9o=@protonmail.com/T/#u
> 
> The changes are removal of various `-fcall-used-*` flags, and adding
> clang target flags for SPARC:
> 
> - `-fcall-used-*` flags is gated behind cc-option as it is
>   not supported in clang. It should be safe; clang won't use the registers
>   specified as temporaries, but it is a safe change wrt. the ABI.
>   Assembly code can still use those registers as needed.
>   A cursory look at the assembly generated by GCC 13.2 shows that
>   the compiler was able to reallocate uses of those registers into
>   other temporary registers without adding extra spills, so there
>   should be no change in performance.
> 
> - More trivial is to add CLANG_TARGET_FLAGS for SPARC target.
> 
> Building with these changes still result in a working kernel,
> at least for Sun T5120, Oracle T4-1, and qemu virtual machines.
> 
> On the LLVM side, the effort for building Linux/SPARC is tracked here:
> https://github.com/llvm/llvm-project/issues/40792
> 
> Signed-off-by: Koakuma <koachan@protonmail.com>
> ---
> Changes in v3:
> - Use cc-option to allow GCC to still use -fcall-used-* flags.
> - Add documentation on building on SPARC, along with required LLVM version.
> - Link to v2: https://lore.kernel.org/r/20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com
> 
> Changes in v2:
> - Remove the -mv8plus change; it will be handled on clang side:
>   https://github.com/llvm/llvm-project/pull/98713
> - Add CLANG_TARGET_FLAGS as suggested in v1 review.
> - Link to v1: https://lore.kernel.org/r/20240620-sparc-cflags-v1-1-bba7d0ff7d42@protonmail.com
> 
> ---
> Koakuma (2):
>       sparc/build: Put usage of -fcall-used* flags behind cc-option
>       sparc/build: Add SPARC target flags for compiling with clang
> 
>  Documentation/kbuild/llvm.rst | 3 +++
>  arch/sparc/Makefile           | 4 ++--
>  arch/sparc/vdso/Makefile      | 2 +-
>  scripts/Makefile.clang        | 1 +
>  4 files changed, 7 insertions(+), 3 deletions(-)
> ---
> base-commit: c2ee9f594da826bea183ed14f2cc029c719bf4da
> change-id: 20240620-sparc-cflags-e7f2dbbd4b9d
Reviewed-by: Andreas Larsson <andreas@gaisler.com>

I see no pressing need for a v4. Picking the series up to my for-next.

Thanks,
Andreas

