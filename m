Return-Path: <linux-kbuild+bounces-9571-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D36F0C4E99D
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 15:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3805518892BD
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 14:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456332F8BEE;
	Tue, 11 Nov 2025 14:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyqMiDtL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C18226E14C;
	Tue, 11 Nov 2025 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762872529; cv=none; b=MptL8xTXOxn1oWOgiyIsPNk/sNYJ5Ey5gyVvj4b5YGtFA4S9EATGZsgIe53mwttp2k+I0L7sS1sbdUzl1LThblSytZfVvIVrHNUjsp/Xjzc13yEmXH56GqHWlIbovq4lp9rw8+HHke5EtnHU5Y3PvYMkXmiEt/xzctMeXBBv28Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762872529; c=relaxed/simple;
	bh=meqgWx70cSyb1oEZ8r90RVAGKaR5A0M0JKCio8jOwHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjdgq3x3Lg+0X35cvRQBcpD5iHryFKmlgW5ausR5Pl1EmScJIKwUA7o+ih/Wwxl+BHfpgD7L29EjlkgWplYM6h8TLyEnCjolPYHhUCGYBZxYpPdXeK9UODp2skqZ4VKqyvVYgvYG4i2VrRa8/Qc5BzMJNMPjQKiPCqg2KVuj+Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyqMiDtL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2FBC4CEF7;
	Tue, 11 Nov 2025 14:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762872527;
	bh=meqgWx70cSyb1oEZ8r90RVAGKaR5A0M0JKCio8jOwHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cyqMiDtLpQmYV/y1vJ85/H3ZFvA6hfmBPzhjLCftTmEkjrUsmvHjLi5sAK4B876p1
	 3I05twr8DqibBokUJUyvAB2ShnYqJubfO/6Ulw9oXcieaL6h4w1in1L0pVnShCzI0/
	 yqJlwsiUobmH2u/yUPU4YvykTyATiB6oom2KxwEeAKbJN3UBu+1JhqI5qYZ/qyUw1R
	 rl36p4atnHq2DjgxvaYu654x+yNYjwvNY4sjBoRISCxE427P52ED2o3/lyhEHH6wCL
	 xOQJn7A/XwOB4cqp2lWjW6X0J09iSWhvDcA3vvhJLN7Rmkc9dVHH1K72JTTn3xKMnK
	 w2pr6WtDJSsYw==
Date: Tue, 11 Nov 2025 15:33:33 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: install-extmod-build: Properly fix CC
 expansion when ccache is used
Message-ID: <aRNJPcFefMojmhfu@derry.ads.avm.de>
References: <20251111-kbuild-install-extmod-build-fix-cc-expand-third-try-v2-1-15ba1b37e71a@linaro.org>
 <aRM0DmrBq-neaNYw@derry.ads.avm.de>
 <4qwfibqgwhigh4g7ic75ueeyy7py4hgjdg22cyuyvxod7x7vjf@nd4t2em2uaqp>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4qwfibqgwhigh4g7ic75ueeyy7py4hgjdg22cyuyvxod7x7vjf@nd4t2em2uaqp>

On Tue, Nov 11, 2025 at 04:28:06PM +0200, Abel Vesa wrote:
> On 25-11-11 14:03:10, Nicolas Schier wrote:
> > On Tue, Nov 11, 2025 at 08:43:51AM +0200, Abel Vesa wrote:
> > > Currently, when cross-compiling and ccache is used, the expanding of CC
> > > turns out to be without any quotes, leading to the following error:
> > > 
> > > make[4]: *** No rule to make target 'aarch64-linux-gnu-gcc'.  Stop.
> > > make[3]: *** [Makefile:2164: run-command] Error 2
> > > 
> > > And it makes sense, because after expansion it ends up like this:
> > > 
> > > make run-command KBUILD_RUN_COMMAND=+$(MAKE) \
> > > HOSTCC=ccache aarch64-linux-gnu-gcc VPATH= srcroot=. $(build)= ...
> > > 
> > > So add another set of double quotes to surround whatever CC expands to
> > > to make sure the aarch64-linux-gnu-gcc isn't expanded to something that
> > > looks like an entirely separate target.
> > > 
> > > Fixes: 140332b6ed72 ("kbuild: fix linux-headers package build when $(CC) cannot link userspace")
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > > Changes in v2:
> > > - Moved the new double quotes inside of single ones, to be able
> > >   to drop the escape, like Nathan suggested.
> > > - Re-worded the commit message according to the above change.
> > > - Link to v1: https://lore.kernel.org/r/20251110-kbuild-install-extmod-build-fix-cc-expand-third-try-v1-1-5c0ddb1c67a8@linaro.org
> > > ---
> > >  scripts/package/install-extmod-build | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > 
> > Just as a note: the fix is only required for build rpm packages.
> 
> .. or pacman packages. Easy way to reproduce:
> 
> make ARCH=arm64 CROSS_COMPILE="aarch64-linux-gnu-" CC="ccache aarch64-linux-gnu-gcc" pacman-pkg

ah sure.  Thanks!


-- 
Nicolas

