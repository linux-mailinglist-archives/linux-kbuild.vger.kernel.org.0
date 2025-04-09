Return-Path: <linux-kbuild+bounces-6560-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F109A831D7
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 22:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD3D17A5196
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 20:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB88211476;
	Wed,  9 Apr 2025 20:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOnDX4dL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2841D1E1E13;
	Wed,  9 Apr 2025 20:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230154; cv=none; b=nJozpLyQGprHZP0YTCanNGRPx/ilK3LqRuBGaLMD1GiDdIuHkvpF1eioQUprQgKUUFt0T+etMNHDzZI+vxMonx4Gireqryeobuiu9jnqElCqEJqomLfgdkHghGa6vj0R8t6J88TjTwXDcPM+3qLEjIdqXByLOFT7jMVGs3ty0lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230154; c=relaxed/simple;
	bh=OW/xgC8e9ub8XpLbqZUYjYmRTQcN1mckVDqHGAKK35E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WobBbLA4zUabhL2xH3rkmplom3b5z5k5tTfyKzxTefQxcx6Q6DbwK4QMAiv9ohSuwXXxmmD0WAYPXPiRSbfdyCU0XJ1e+++auD3xXfMZCSMoKWM6bXnV+w2w0ezOKh4TaP0ipMaS/W2tWI66ctVuEwW/fwIq+zGsPZr8W0YuSiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOnDX4dL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9ABEC4CEE2;
	Wed,  9 Apr 2025 20:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230154;
	bh=OW/xgC8e9ub8XpLbqZUYjYmRTQcN1mckVDqHGAKK35E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dOnDX4dL4SGLCjmmI5inCI3tky45vog+GW7BluujDFAGcIzuLliJeKM9oA+gETqCj
	 xevYQkZCw4EQXDdGCXJmii80h4myJYR6Zqfo1x3MIRxXWW/Ik8gfQaj2yYvlpNY5/h
	 E7bf+8AmbVtJQPEhzvrbTFwB7oTwhM+AGvnQo1LGeo1gUqY82R89jO2rvNJxeYGAk1
	 KwVRAa/fiyE9akNpveePfCzwQEysT3hEmNJO80bpNxfDCMeYX4tqwjzi84Bv4SUsPC
	 jsnImVEqcdy451PBjJPJF5P4BfsRsbizhnr5ll8bzyVFx/3Jc2PXipTHGYcqP8rUnJ
	 KwfCxpBPV52eQ==
Date: Wed, 9 Apr 2025 13:22:28 -0700
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org,
	kasan-dev@googlegroups.com, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] gcc-plugins: Remove SANCOV plugin
Message-ID: <202504091322.A6EBAC8B@keescook>
References: <20250409160251.work.914-kees@kernel.org>
 <32bb421a-1a9e-40eb-9318-d8ca1a0f407f@app.fastmail.com>
 <202504090919.6DE21CFA7A@keescook>
 <6f7e3436-8ae8-473d-be64-c962366ca5c8@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f7e3436-8ae8-473d-be64-c962366ca5c8@app.fastmail.com>

On Wed, Apr 09, 2025 at 09:28:22PM +0200, Arnd Bergmann wrote:
> On Wed, Apr 9, 2025, at 18:19, Kees Cook wrote:
> > On Wed, Apr 09, 2025 at 06:16:58PM +0200, Arnd Bergmann wrote:
> >> On Wed, Apr 9, 2025, at 18:02, Kees Cook wrote:
> >> 
> >> >  config KCOV
> >> >  	bool "Code coverage for fuzzing"
> >> >  	depends on ARCH_HAS_KCOV
> >> > -	depends on CC_HAS_SANCOV_TRACE_PC || GCC_PLUGINS
> >> > +	depends on CC_HAS_SANCOV_TRACE_PC
> >> 
> >> So this dependency would also disappear. I think either way is fine.
> >> 
> >> The rest of the patch is again identical to my version.
> >
> > Ah! How about you keep the patch as part of your gcc-8.1 clean up, then?
> > That seems more clear, etc.
> 
> Sure, I can probably keep that all in a branch of the asm-generic
> tree, or alternatively send it through the kbuild tree.
> 
> Shall I include the patch to remove the structleak plugin as well?

Sorry, I misread, *stackleak* needs to stay. structleak can go. I'll
carry that.

-- 
Kees Cook

