Return-Path: <linux-kbuild+bounces-4238-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3C49AB76C
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 22:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F848286A87
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 20:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011E01CB309;
	Tue, 22 Oct 2024 20:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JRYCyTFu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAA813AA2B;
	Tue, 22 Oct 2024 20:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729627656; cv=none; b=O7C+7387e03Hl1ozgX18boAAP9b2OzntPWxpuwDiqketvRQyPSiI/Y9zC4XH3Sa0XpmyerdCWdMUftk1W5XaxACh6eZrJi4kL0VPshQORTLnYFZOhD0v3vBjXaDkIO7/ntHaEOKuhMWi/Cj3cYmMc1yylAcdVVFQTMvm156xgqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729627656; c=relaxed/simple;
	bh=T3DHimKmpsKoSmhKu4UEZK4eEpaItJ47XZY5s4OGPZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYKplwBWk107kMyJpzCkfZ4dwcx7a+wgYV3ztHRKKELD0HQh0/1+/S5IPYng49scJ9bVhpQI4Fn71hRizUWgiClmVm7NDAAbb6DaEk/5K5Kuh8JmOc8YI6AI4/YgRQdW5GOCmrnD3e5Xntga5kcJDEKP2ffrI8bADUbbr/PZ3v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JRYCyTFu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C785C4CEC3;
	Tue, 22 Oct 2024 20:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729627656;
	bh=T3DHimKmpsKoSmhKu4UEZK4eEpaItJ47XZY5s4OGPZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JRYCyTFuT3NNEWf1hE3Survm4qXTQ8rOEQUXw2dYqH+PagDr5rBevoO4v1fP1MAdC
	 9I50CVCkttZfIMsplQwhIjWVZST5wyho1oPs4NgWzHMlkehxsm4+MnB63l6IfwUZis
	 xELWYvdGYQRszgVXkECDQt3EYCK5q7bAwJyXcl866DF9wpid9IgXR0ExEsRAqqeUAN
	 Xo8UIO4rneHE20cAZzmtmF8p9b2nGzQFyx7Hv5x/LGPxAfiLHo24HEjU+5iTdimteO
	 zRt5UcpibQRbekmIeIFOq2crwtfu1n8yQIbW+E1iKz2pVeI8TsW47Fq+0yEV007LO/
	 nrZX23LRm5dbw==
Date: Tue, 22 Oct 2024 13:07:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Koakuma <koachan@protonmail.com>, Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de,
	Nicolas Schier <nicolas@fjasle.eu>, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 0/2] sparc/build: Rework CFLAGS for clang compatibility
Message-ID: <20241022200732.GA487584@thelio-3990X>
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com>
 <20241021201657.GA898643@thelio-3990X>
 <CAK7LNASTkUTK8JZCzySNh3BVKxauusVKRhjnchy6iZz4qLbq8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASTkUTK8JZCzySNh3BVKxauusVKRhjnchy6iZz4qLbq8w@mail.gmail.com>

On Wed, Oct 23, 2024 at 04:10:01AM +0900, Masahiro Yamada wrote:
> I applied this patch set, but I still observe a build error.
...
> masahiro@zoe:~/workspace/linux-kbuild(kbuild)$ make
> LLVM=~/tools/llvm-latest/bin/  ARCH=sparc sparc64_defconfig all
...
> clang: error: unsupported argument '--undeclared-regs' to option '-Wa,'

Koakuma might know more than I do but I did not test either the
integrated assembler or the rest of the LLVM tools; I only tested clang
for CC. As far as I am aware, that has been where most of the effort in
llvm-project has been going and I think there are probably other fixes
that will be needed for the other tools. The command I tested was:

  $ make -skj"$(nproc)" \
         ARCH=sparc64 \
         CC=clang \
         CROSS_COMPILE=sparc64-linux-gnu- \
         LLVM_IAS=0 \
         mrproper defconfig all

I see this as more of a stepping stone series to make testing those
other components easier as time goes on, hence why I did not really
consider user facing documentation either like you brought up in the
other thread.

Cheers,
Nathan

