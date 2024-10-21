Return-Path: <linux-kbuild+bounces-4220-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 878A49A90D1
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 22:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48382281449
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 20:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308931E1A08;
	Mon, 21 Oct 2024 20:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQABDWUT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBCA19EEC4;
	Mon, 21 Oct 2024 20:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729541820; cv=none; b=ZR3z1Djtcd3bxLCWxfiIuMv8QUumKdfteo2gRCnNamKXTeN9rMvHp1KCfnc58GvrXq3FRTC4Uqck6RKMflrfC9aEDdURQPTRb749+RqtoizxMDWUT8bvN0VmjPAjcb9i1Tw/j+LNvMa9bpels/hvZ9Vmam2VBg9zx7zMgtNnZNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729541820; c=relaxed/simple;
	bh=Xs2L5ZgSVhp2dlD4X4qyRPseQcUOQyGjn2RAcJbqRNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXMDvMYzWF5Do++oi17taxhaol1TpIPPEDsnHmpEt+FdMDALEpA1Ux0jeGXZTCAbrCTmz1grDEqkTfYb38+h8yU37h/KDrPQcQAIbZ1iMRbBlMLfuAiQ5ztshorYrEA80hC2CbRgf/lMbl0NI7sOB07aS8elMpqMWPes3iSuGxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQABDWUT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2BDAC4CEC3;
	Mon, 21 Oct 2024 20:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729541819;
	bh=Xs2L5ZgSVhp2dlD4X4qyRPseQcUOQyGjn2RAcJbqRNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQABDWUTo6RgQOUin+YTSpYEyVh4rDqzUuYx6RTY95pBym+vWvnNbSztgx2OllHNE
	 xB8sV5xmT7+Igi7vyHlEu4sMC09kJBhDLUHHY0foAWJrdPWt7JyZk8HPwI+E+nxt/+
	 vpKsYlUOOWM+TZqL2GXEi8yFpK8eS7MqEsXe1K5tXDGmCA5hwFVPZJZHuUNR/sijne
	 hrJSp+GtVT4qvVDAjawFAhEoOEjhmXIXYn87H5h8jVWDsaSujdyNCMBAMzrSPthZ5e
	 IMjn/5jFb65nTQSbryw3a48Socga+UhWWEGv2DOeXC5G3wc3OalLn8BA7bmj2QZAsw
	 aJcOcpF0MBQNw==
Date: Mon, 21 Oct 2024 13:16:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Koakuma <koachan@protonmail.com>, Andreas Larsson <andreas@gaisler.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de,
	Nicolas Schier <nicolas@fjasle.eu>, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 0/2] sparc/build: Rework CFLAGS for clang compatibility
Message-ID: <20241021201657.GA898643@thelio-3990X>
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com>

Hi Andreas,

On Wed, Jul 17, 2024 at 11:10:14PM +0700, Koakuma wrote:
> This changes the CFLAGS for building the SPARC kernel so that it can be
> built with clang, as a follow up from the discussion in this thread:
> 
> https://lore.kernel.org/lkml/JAYB7uS-EdLABTR4iWZdtFOVa5MvlKosIrD_cKTzgeozCOGRM7lhxeLigFB1g3exX445I_W5VKB-tAzl2_G1zCVJRQjp67ODfsSqiZWOZ9o=@protonmail.com/T/#u
...
> Building with these changes still result in a working kernel,
> at least for Sun T5120, Oracle T4-1, and qemu virtual machines.
> 
> On the LLVM side, the effort for building Linux/SPARC is tracked here:
> https://github.com/llvm/llvm-project/issues/40792
> 
> Signed-off-by: Koakuma <koachan@protonmail.com>
> ---
> Changes in v2:
> - Remove the -mv8plus change; it will be handled on clang side:
>   https://github.com/llvm/llvm-project/pull/98713
> - Add CLANG_TARGET_FLAGS as suggested in v1 review.
> - Link to v1: https://lore.kernel.org/r/20240620-sparc-cflags-v1-1-bba7d0ff7d42@protonmail.com
> 
> ---
> Koakuma (2):
>       sparc/build: Remove all usage of -fcall-used* flags
>       sparc/build: Add SPARC target flags for compiling with clang
> 
>  arch/sparc/Makefile      | 4 ++--
>  arch/sparc/vdso/Makefile | 2 +-
>  scripts/Makefile.clang   | 1 +
>  3 files changed, 4 insertions(+), 3 deletions(-)

Would you be able to help move this series [1] and its companion patch
for the vDSO [2] along to Linus for 6.13? If you are not able to for
whatever reason but the changes look reasonable to you, would you be
able to provide an Ack so it can be chauffeured by someone else, such as
Masahiro/Kbuild or Andrew/-mm?

For the record, I retested these three changes on top of 6.12-rc4, where
they still apply cleanly. Now that the LLVM PR linked above (98713) has
been merged into LLVM main, a clang built straight from llvm-project.git
can build the kernel with this series (I tested at dca43a1c82f1).

[1]: https://lore.kernel.org/all/20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com/
[2]: https://lore.kernel.org/all/20240808-sparc-shr64-v2-1-fd18f1b2cea9@protonmail.com/

Cheers,
Nathan

