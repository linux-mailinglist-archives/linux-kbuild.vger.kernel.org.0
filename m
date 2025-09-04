Return-Path: <linux-kbuild+bounces-8720-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FD5B442F6
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 18:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3B541CC07BD
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 16:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F662F3627;
	Thu,  4 Sep 2025 16:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkRDPCwc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4A6260580;
	Thu,  4 Sep 2025 16:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757003837; cv=none; b=PFQPSnLwKuxSms5ZKmP5KAw/QVnCMAV58mlBVh6QOGCkNIeGEMcmjUbL2C+BgT0LtCCGbb9YWWtUS5WKZTdsyVRKGqDd2PP05f5uWzUC6C2BaJCVENQJrjsfjZo9vbb/yMPjU1OeW4EPFook5mIMPCpZ3LE+Y1J29gQPwWMXErc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757003837; c=relaxed/simple;
	bh=ktaFNYGOy663BwK6rfV/ONBV11uoyQrRziv09fSFQ1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=siu2oTl+s7ROMotrWVaIRSYrmztMJPQUXKHDa5tQ3GamggDGHTcTncaaCKbBuh+M5BIC0tW/6manYJcdR5gtutI9wDJjUOFPgTTGPtXeIBSl22EPj/KiM+YtQJ7GFN0cOf0A/19BTBsb6OeJs6HtisUWAx4LAwVvaSezO8/lSoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkRDPCwc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87D8C4CEF0;
	Thu,  4 Sep 2025 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757003834;
	bh=ktaFNYGOy663BwK6rfV/ONBV11uoyQrRziv09fSFQ1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hkRDPCwcgpV8W/82FQ58Hd5lN+OM+10trpdtVo186jo1w+T6Sew0RKJ/4TY/RX2Ip
	 r200ZrHL354DiFKrwms7xBmVqu08JXVvLuE4NErIdKRHDGruat+xbl3SHNKLxHP+Hz
	 2/WSWuM5/y1bZJZUAm39JvLJzGixYRvMVE6a8VVY+F5r9Hi65LJpnWGBwz1ehPZwj6
	 B8r2LYhfLODBKHBqtiyERC74r87xZITyQ8hJ0JE7fK8OpjHuW+RUNRMV3BKI9ySJcD
	 CToGmN2fu60jEhJ6XbgicYPHuEjgzHP2Ww9lFQhmlX4HgTFwgMQkOh4COZI1fTKdBI
	 6xyRidT+lU2Sw==
Date: Thu, 4 Sep 2025 09:37:14 -0700
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	x86@kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 0/9] kcfi: Prepare for GCC support
Message-ID: <202509040933.06AF02E714@keescook>
References: <20250904033217.it.414-kees@kernel.org>
 <20250904070410.GX4067720@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904070410.GX4067720@noisy.programming.kicks-ass.net>

On Thu, Sep 04, 2025 at 09:04:10AM +0200, Peter Zijlstra wrote:
> On Wed, Sep 03, 2025 at 08:46:39PM -0700, Kees Cook wrote:
> 
> > Kees Cook (9):
> >   compiler_types.h: Move __nocfi out of compiler-specific header
> >   x86/traps: Clarify KCFI instruction layout
> >   x86/cfi: Document the "cfi=" bootparam options
> >   x86/cfi: Standardize on common "CFI:" prefix for CFI reports
> >   x86/cfi: Add "debug" option to "cfi=" bootparam
> >   x86/cfi: Remove __noinitretpoline and __noretpoline
> 
> So I can take these first 6 patches (and edit that debug patch to
> un-annoy myself ;-), but I'm thinking this Kconfig stuff:

Sure, yeah. Do you want a v3 for the debug stuff that uses your proposed
helper?

> >   kconfig: Add transitional symbol attribute for migration support
> >   kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
> 
> Should perhaps go through the kbuild tree? A

I had chatted offline with Nathan about this series, and he'd suggested
the kconfig change could go with it's first user (the rename). So if you
don't want to put it in -tip, I can take it in the hardening tree.
(There's no dependencies between these 2 and the first 6.)

> Leaving this:
> 
> >   ARM: traps: Implement KCFI trap handler for ARM32
> 
> Can that go independently through the arm tree, or are there
> dependencies?

I can take this too, assuming ARM folks don't want to snag it. I may,
however, wait on it, just to avoid implementing the kernel support
before the GCC folks are happy with the arm32 KCFI backend and its UDF
encoding, etc.

Thanks for looking at these! :)

-Kees

-- 
Kees Cook

