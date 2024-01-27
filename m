Return-Path: <linux-kbuild+bounces-682-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AE583EC32
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jan 2024 10:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40A761F225F7
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jan 2024 09:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A9F1DFEB;
	Sat, 27 Jan 2024 09:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVHa/WHN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4757017FD;
	Sat, 27 Jan 2024 09:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706346193; cv=none; b=gzs1FM2Kvayhb7T4fBUfCZcbg/WR2MGjFwGV8T9LKndxiN/VA0HeE5azzRwvUeNqvsF5MSS5XUYM8yWNDFCgy2TDWRzHDZMf8TpNRbXhwQdZLbPPLqqP0oDPrQDiF/Emk9SqP9SJscNdoCfQMz0jg9Yn8of6kHA22tBktNSji4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706346193; c=relaxed/simple;
	bh=3CEC9+s/RgV3W453q4JCCo7clahZ+kguMoxyN5D2wY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UrGfopSfgC+94ZOP82gwnyZxjUay4UG3Vebo/J3BD9p17hjSccKgQYb5dGdCH2Wt9dlnPNKZoZcTWeUKkqpqb+i9UO8BqklcmqxSNaY5qODnHLI89+wUzB4Ke5pXO72M8UukzGuoS7RAq7LNQ71mununreW/Rf95uYyOJLyB2/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVHa/WHN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BD3C433C7;
	Sat, 27 Jan 2024 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706346192;
	bh=3CEC9+s/RgV3W453q4JCCo7clahZ+kguMoxyN5D2wY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVHa/WHNCuTpM+sFtsfuqn5gAIFVBhVSGCWQh0dAYjNRAKKYFiWAck8Phpf1076cx
	 +FY+5nM+daqdHFi39v9JU6iAKmKKPheUYi/YPOP1NLRGTUJVV1+R25ZYZgOdSeYvly
	 snfv46B3E69rNby/TgxZNxhcc4w+cC+nCii/gUGB/AReNjw6niP1tU88VU6B2ZUKR/
	 MI2+XIk4JMWw4Eav7Lct+D+FEEVBMffYhSUmuy7GSiBDcRAfAimiUiWUpUuvMDdzsV
	 emOLwwqOOa4vcyUbaG2AH5WWp1okWyeSVhqHlSlque+bHV2xLknpNLllSzkUsvwbe3
	 jixcBqLEcYxfw==
Date: Sat, 27 Jan 2024 01:03:10 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	masahiroy@kernel.org, nicolas@fjasle.eu, andy.chiu@sifive.com,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 0/2] RISC-V: Fix CONFIG_AS_HAS_OPTION_ARCH with tip of
 tree LLVM
Message-ID: <20240127090310.GF11935@sol.localdomain>
References: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>

On Thu, Jan 25, 2024 at 10:32:10AM -0700, Nathan Chancellor wrote:
> Hi all,
> 
> Eric reported that builds of LLVM with [1] (close to tip of tree) have
> CONFIG_AS_HAS_OPTION_ARCH=n because the test for expected failure on
> invalid input has started succeeding.
> 
> This Kconfig test was added because '.option arch' only causes an
> assembler warning when it is unsupported, rather than a hard error,
> which is what users of as-instr expect when something is unsupported.
> 
> This can be resolved by turning assembler warnings into errors with
> '-Wa,--fatal-warnings' like we do with the compiler with '-Werror',
> which is what the first patch does. The second patch removes the invalid
> test, as the valid test is good enough with fatal warnings.
> 
> I have diffed several configurations for the different architectures
> that use as-instr and I have found no issues.
> 
> I think this could go in through either the kbuild or RISC-V tree with
> sufficient acks but I will let them fight over who takes it :)
> 
> [1]: https://github.com/llvm/llvm-project/commit/3ac9fe69f70a2b3541266daedbaaa7dc9c007a2a
> 
> ---
> Nathan Chancellor (2):
>       kbuild: Add -Wa,--fatal-warnings to as-instr invocation
>       RISC-V: Drop invalid test from CONFIG_AS_HAS_OPTION_ARCH
> 
>  arch/riscv/Kconfig        | 1 -
>  scripts/Kconfig.include   | 2 +-
>  scripts/Makefile.compiler | 2 +-
>  3 files changed, 2 insertions(+), 3 deletions(-)

Looks good,

Tested-by: Eric Biggers <ebiggers@google.com>

Unfortunately another LLVM commit just broke TOOLCHAIN_HAS_VECTOR_CRYPTO, so
I've sent out a patch to fix that too...

But with all the fixes applied it works again.

- Eric

