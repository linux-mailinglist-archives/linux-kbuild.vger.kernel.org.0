Return-Path: <linux-kbuild+bounces-8733-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 078D1B44AFA
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 02:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E82DA5A6093
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 00:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0722219F40A;
	Fri,  5 Sep 2025 00:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chm1kixw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D2719E975;
	Fri,  5 Sep 2025 00:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757032921; cv=none; b=gkfE8Wo7Unu25W7winrkOLFY2JWnfi7ahpwiq0htx2VRYzJTnYWkrjJHieF0nuyJ/P1v50NQ5VzHnZNOL9M+FEoR2B8G24and2DqFojjMi4MZMKKAZInayiB60mUPlVYp3Hj8V9cvpcdz3K1R1pXA7ED6H6EdvYESCHyilzMzbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757032921; c=relaxed/simple;
	bh=6Wt+nRtf6qZqi5LeG5qpb9AIL6REC47JvD6eLsZ0+9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBTbAd0QQreafKJAkPLXr/F/vwtZ1cXBe802tJOdHyzPbJ1UaCWQ2sO8pC+1PoKdPVJ9nSXYGwhWww6HSa2wEZOKeQB2BBDOpf0n0en2C/gD4yTo3XTJjzqPSznY9tYRO0Wutyx8MoZHqvFv16vEoj0xANFg0zAnEeDHqHcaGhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chm1kixw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48560C4CEF0;
	Fri,  5 Sep 2025 00:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757032921;
	bh=6Wt+nRtf6qZqi5LeG5qpb9AIL6REC47JvD6eLsZ0+9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=chm1kixwtf/FHR3gPWrpopBZ4GxiW/dC4OhBkmJLaYl/ifsxPHyAmNHN3bHMFAaBJ
	 b4GvcyPmi4YZfMAmZ4xbMZZxMSSzRuch0jp/uIW/fOTs1+OokjX3dLpO7VpXpwQwWD
	 dXrcjTAqkweyzZ8aZVYk7qfW+ZBMgk0iptEnjOuVQqQkPgygNxqA4RTJdeiY0NfwRl
	 yK9sgYcJLN6VvEkQhGGcgxwAUoj9o8GeuIBrf5iYytPs51n2donasZGVTxUEW85lSw
	 54CBDOvXFswiq8HajAxWm1MCYIq+IaYt/WOGqtdMNi3NdYNVlG4u4zIEygTeEG+sKp
	 8w0rsGAEMhTCw==
Date: Thu, 4 Sep 2025 17:42:00 -0700
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
Message-ID: <202509041740.1007FFEA@keescook>
References: <20250904033217.it.414-kees@kernel.org>
 <20250904070410.GX4067720@noisy.programming.kicks-ass.net>
 <202509040933.06AF02E714@keescook>
 <20250904200134.GA4067720@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904200134.GA4067720@noisy.programming.kicks-ass.net>

On Thu, Sep 04, 2025 at 10:01:34PM +0200, Peter Zijlstra wrote:
> Nah, already done :-) I just pushed out these 6 and my UDB hackery to
> queue.git/x86/core. If the robots don't complain, I'll stuff it into tip
> in a few days.

Okay, thanks!

> So I suppose I can carry them, just to keep the lot together, but then I
> need an ack from someone that actually knows this Kconfig language stuff
> :-)
> 
> You taking them through the hardening tree also works for em.

Assuming Nathan (and Vegard? or other folks from the other thread?) are
okay with the kconfig changes, I'll take it via hardening.

Wheee

-- 
Kees Cook

