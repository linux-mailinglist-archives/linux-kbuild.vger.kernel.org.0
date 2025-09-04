Return-Path: <linux-kbuild+bounces-8713-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09029B43348
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 09:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE6AE3A2FC8
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 07:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C85287504;
	Thu,  4 Sep 2025 07:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IteBtjsd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31208286430;
	Thu,  4 Sep 2025 07:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756969458; cv=none; b=O47PfU+ke0UkeOmYoEtpD4YWOfKZP5ptQJ3DCHrN4xht6e3a7xkbWBlrmySsZCLZTrL9BYzy+ElUM9L9AJKAAaCZMi4kQxEecAoREfYGeaAFgdUXTnbyHf/kEUrPlV6PDVxOT69/7jlCSc8nBr7Tlwsdff1BnHI42NJx408q04M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756969458; c=relaxed/simple;
	bh=ml3RfzjZZoN0n8xd0iYomIvyBUmOngtEkbLSoEbPCws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPVBZNuUnBdSOvRF5u224SECxMTLcUl9irgVyX+Ei/ASNaKKB4UET/73uqADyJlLTnV8Vc9wFRbjvp6nSRP7053ao9yrwPgOB8dTYOaDR+t8rFbuWSwTXw9zf8C0AtMoiDOO38699tL7Wwztij8ZRVU9ObUQVVdxP8oMnf6BeGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IteBtjsd; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M/3H362ZqzDMF6P12e3Tww4DK9Jo6Vxhu+wfYy+W3Aw=; b=IteBtjsdCqf/NNkwVs98V72txm
	X2dxVpk7yeyfhAe6TcfgmX/coExBsMMH0B4plQ9d52jz2ip3Yi1bmD9WEflJJH+vivbdEKhk6fSHJ
	jJGKsG37c75uykk591oTp9bnSDl8ybXLHUzNNopFngN1DOzGq+AWKourId73hhnCjcKrAs8QpjUvU
	o9jIjXNtwJEBuFNblNhIUPwFjdT4hGh1ERCx7aYekVwL6pGcTBYjSi5bnhn638Y6nmadkTMKjXLVG
	7mqy/DSrntQYdnutGj0/tHqAkX4xp7kP95zC9UhAIXEOSDMacIfo4B7NxGNR3a4Ze1Eq3jRL3ww9v
	r0ZDw3lA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu40w-0000000EXWv-0FTE;
	Thu, 04 Sep 2025 07:04:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 429CF3002BF; Thu, 04 Sep 2025 09:04:10 +0200 (CEST)
Date: Thu, 4 Sep 2025 09:04:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <kees@kernel.org>
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
Message-ID: <20250904070410.GX4067720@noisy.programming.kicks-ass.net>
References: <20250904033217.it.414-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904033217.it.414-kees@kernel.org>

On Wed, Sep 03, 2025 at 08:46:39PM -0700, Kees Cook wrote:

> Kees Cook (9):
>   compiler_types.h: Move __nocfi out of compiler-specific header
>   x86/traps: Clarify KCFI instruction layout
>   x86/cfi: Document the "cfi=" bootparam options
>   x86/cfi: Standardize on common "CFI:" prefix for CFI reports
>   x86/cfi: Add "debug" option to "cfi=" bootparam
>   x86/cfi: Remove __noinitretpoline and __noretpoline

So I can take these first 6 patches (and edit that debug patch to
un-annoy myself ;-), but I'm thinking this Kconfig stuff:

>   kconfig: Add transitional symbol attribute for migration support
>   kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI

Should perhaps go through the kbuild tree? A

Leaving this:

>   ARM: traps: Implement KCFI trap handler for ARM32

Can that go independently through the arm tree, or are there
dependencies?

