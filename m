Return-Path: <linux-kbuild+bounces-8727-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 920AEB446D6
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 22:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54B9C5415D9
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 20:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B3226E717;
	Thu,  4 Sep 2025 20:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Wdrg70sz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF39215F5C;
	Thu,  4 Sep 2025 20:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757016112; cv=none; b=tvy41QhKdMrlQBTo2is+IzAUAi71NVzGa1G1QvyZCTlcBZ2AAAdDzx0UTR0XI3GC2vnvxWRGFO/5Qn+5FhfdBEuPIG22xy/d7fk5PhmOWIUvoCo0ZuRDqL3EHSmQg4oiQyIlMHuGrZN5vyKZT7EBw0R10Eb9rEaMUJrK7rzxMIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757016112; c=relaxed/simple;
	bh=giDG6yLbZbChEwyrNi7daCsisorV/2wtCDx2g6t/AQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dS4dLiqnh1H/odsLa6dRDAXReZ1a8Tnx7Ecs4OjHaejjMRdaWf3+QdMXko/CWi9AMWOPpzz8OG6XT7/5EGslPNKJWxNATBAn5r0Y4R1OCc999G98vd8b+bNywQumjQpVCsCrloCAVlmMFYhzl3AEg5lrPnBn/CtJZQZWD65H0Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Wdrg70sz; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HwRnJdXLUnbJzEliJ8F7yWyHZeWeHGJT0waJGQRe0iU=; b=Wdrg70szvN/Jf+5SKMdlqaYhhw
	7wWW7bSsYxodvgACuWp5HYjdBWfyuJ1ud6jBYmz+eZo9rPDD5PW/trO/gw+IViNTpZpf2MhGS34vm
	Q094atAW/NFnksVkTTUhS1uUUa/DW81zkQNOjwiNSwNqmVEBabodf/RzW+XJaJSoWzjekPp09SD+4
	LOkJnffbEPz0fYXukeH2U4soT0qjZYu53RF7UlA8COJDghYxoJsqpdiKmP8azk+TtE+kTH8uiED1p
	XQhvYFDVIHRyKaHgFC2vsbXb7ptjqwRwxF8Nbkb2cvQiqHRbxU/XhxzCkG37SQPfn8M9IUb8eVmEJ
	cT+kcimw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuG9H-00000004PgU-3yfk;
	Thu, 04 Sep 2025 20:01:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B8E2D300220; Thu, 04 Sep 2025 22:01:34 +0200 (CEST)
Date: Thu, 4 Sep 2025 22:01:34 +0200
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
Message-ID: <20250904200134.GA4067720@noisy.programming.kicks-ass.net>
References: <20250904033217.it.414-kees@kernel.org>
 <20250904070410.GX4067720@noisy.programming.kicks-ass.net>
 <202509040933.06AF02E714@keescook>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509040933.06AF02E714@keescook>

On Thu, Sep 04, 2025 at 09:37:14AM -0700, Kees Cook wrote:
> On Thu, Sep 04, 2025 at 09:04:10AM +0200, Peter Zijlstra wrote:
> > On Wed, Sep 03, 2025 at 08:46:39PM -0700, Kees Cook wrote:
> > 
> > > Kees Cook (9):
> > >   compiler_types.h: Move __nocfi out of compiler-specific header
> > >   x86/traps: Clarify KCFI instruction layout
> > >   x86/cfi: Document the "cfi=" bootparam options
> > >   x86/cfi: Standardize on common "CFI:" prefix for CFI reports
> > >   x86/cfi: Add "debug" option to "cfi=" bootparam
> > >   x86/cfi: Remove __noinitretpoline and __noretpoline
> > 
> > So I can take these first 6 patches (and edit that debug patch to
> > un-annoy myself ;-), but I'm thinking this Kconfig stuff:
> 
> Sure, yeah. Do you want a v3 for the debug stuff that uses your proposed
> helper?

Nah, already done :-) I just pushed out these 6 and my UDB hackery to
queue.git/x86/core. If the robots don't complain, I'll stuff it into tip
in a few days.

> > >   kconfig: Add transitional symbol attribute for migration support
> > >   kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
> > 
> > Should perhaps go through the kbuild tree? A
> 
> I had chatted offline with Nathan about this series, and he'd suggested
> the kconfig change could go with it's first user (the rename). So if you
> don't want to put it in -tip, I can take it in the hardening tree.
> (There's no dependencies between these 2 and the first 6.)

So I suppose I can carry them, just to keep the lot together, but then I
need an ack from someone that actually knows this Kconfig language stuff
:-)

You taking them through the hardening tree also works for em.

