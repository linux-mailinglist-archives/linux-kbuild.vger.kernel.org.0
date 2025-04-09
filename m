Return-Path: <linux-kbuild+bounces-6551-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4656CA82C53
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 18:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B52803BFD05
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 16:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E8C268C77;
	Wed,  9 Apr 2025 16:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTLMojkk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C38266568;
	Wed,  9 Apr 2025 16:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744215601; cv=none; b=liZsAsn4Uxa67WHRNPBmDDBrVGDn+nVQWv7wn2R2Sa3vc45g0hDDgnFF087kp7vHBpgOCJApBJs01SupCB3VrT2MD6dLthOKIUzvUwVYqX/fRMxVZ1E+JS+x6qWZhve6iWuZS5hMUGnvxKuKpjhpoezuDxZGtkJ4D8Yxnt0q53w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744215601; c=relaxed/simple;
	bh=K9Fh4c1ptFxtu8YB5uU351deS5benh9uQbou+nvpZL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4ip/WRmD8pRBQNCVyqzVmAdZ7cYoxFgHuBQvFovNy0tXPHlKpS/hWecz+5k+2D7iH+o5IdmTRsmE15yCNeY30zG8Ujc9k0Gx7itfK45gY+ueCGlrUEdq1pmImLl2J/Mey8pOrjYVDJ/0LJKDIRZ8cr8RQ1VGBK5EP0D2+cB41Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTLMojkk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708EDC4CEE2;
	Wed,  9 Apr 2025 16:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744215600;
	bh=K9Fh4c1ptFxtu8YB5uU351deS5benh9uQbou+nvpZL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hTLMojkkY9qbJ01p7tUhNlkGWC/6IajFrfjhIpsfZGB6ihtlgZ04yi50br+tvURKH
	 5lW2NIDdHWKhu7LAyTI2ub5LFluyvwTy2LmxfxCwSwLz9BNDeOQEd3wYCM7HnpeLFk
	 hZP9uIHipg8b/L/KschjLiPN2T3DE0Uo2+46bRhwXbA+dujnys6cD6AfXisqRtbHhg
	 X7msTqx0aaGwOCiWVWeLERHN+QEakG0W3kOuLI9bFO72icJU01cc5Ru3sX8YmpkwVG
	 VDBMJZn6981OiTJnkEa1Q2ausHsjq60+lO+mJTHN9AUeGjGGxrZyIKqKG8TDXrLLca
	 6BWKH/WG7laOg==
Date: Wed, 9 Apr 2025 09:19:57 -0700
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
Message-ID: <202504090919.6DE21CFA7A@keescook>
References: <20250409160251.work.914-kees@kernel.org>
 <32bb421a-1a9e-40eb-9318-d8ca1a0f407f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32bb421a-1a9e-40eb-9318-d8ca1a0f407f@app.fastmail.com>

On Wed, Apr 09, 2025 at 06:16:58PM +0200, Arnd Bergmann wrote:
> On Wed, Apr 9, 2025, at 18:02, Kees Cook wrote:
> > There are very few users of this plugin[1], and since it's features
> > are available in GCC 6 and later (and Clang), users can update their
> > compilers if they need support on newer kernels.
> >
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Link: 
> > https://lore.kernel.org/all/08393aa3-05a3-4e3f-8004-f374a3ec4b7e@app.fastmail.com/ 
> > [1]
> > Signed-off-by: Kees Cook <kees@kernel.org>
> >
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 1af972a92d06..e7347419ffc5 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -2135,15 +2135,13 @@ config ARCH_HAS_KCOV
> >  config CC_HAS_SANCOV_TRACE_PC
> >  	def_bool $(cc-option,-fsanitize-coverage=trace-pc)
> > 
> 
> My version removed CC_HAS_SANCOV_TRACE_PC as well, as I planned
> to have this on top of my patch to require gcc-8.1 as the
> minimum version.
> 
> >  config KCOV
> >  	bool "Code coverage for fuzzing"
> >  	depends on ARCH_HAS_KCOV
> > -	depends on CC_HAS_SANCOV_TRACE_PC || GCC_PLUGINS
> > +	depends on CC_HAS_SANCOV_TRACE_PC
> 
> So this dependency would also disappear. I think either way is fine.
> 
> The rest of the patch is again identical to my version.

Ah! How about you keep the patch as part of your gcc-8.1 clean up, then?
That seems more clear, etc.

-Kees

-- 
Kees Cook

