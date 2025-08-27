Return-Path: <linux-kbuild+bounces-8624-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4720B376FB
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 03:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51FF43A3BC2
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 01:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8184E190692;
	Wed, 27 Aug 2025 01:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNIp4MzC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2B14A33;
	Wed, 27 Aug 2025 01:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756258490; cv=none; b=EECLdGyNgIk3udQHT6PaWy7sCtc+9wEQs6w6/YR1Iz51JgFWRrjOtC94/BnAewfydoiLlnEv9Ri7rBwmsuklCS1Hr6qwLtDWAUnI5zGgW7HeNRTUTqgwthsz6AdtQ6drfFfulCSk06LdgxZpIcPG75GP5/qaxs94ODz3t5yWwCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756258490; c=relaxed/simple;
	bh=4eiZvo+hL550WY6CZyKaK4fRP2VeqMte3/ZsoSFK2Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEfbsOs1FS8yj/xlGm4jnruqTWDGKnep6QKoqOJKz1MQqRYCI8pPRbewK+YA/z/G7CYjEBq5C/nzu9RWPI3X565+qd3UGebZ/Uua8HL/5aj32uWU7k+IabHYYabyjLe3ytmDf7PwBWea7RjbFhLwqyifzC6T3bSy3/HHDZiLLOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNIp4MzC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78EAC4CEF1;
	Wed, 27 Aug 2025 01:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756258489;
	bh=4eiZvo+hL550WY6CZyKaK4fRP2VeqMte3/ZsoSFK2Bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iNIp4MzCAz/2Su6Q9ie6SJSrrgadQvUrBTeD8Iqgom97Azq/yiTX5YT/3bytvQl+R
	 c77dFs4j5ymA0p96r2A9q2eclhACDC0BeMXTZP3LnGFleYKgQ9mzTP+GLP+5gY/9Ld
	 t7KLAwBt93khS7Q2I4taw+eQH0o+6z/5mLHT/GtxiSd8i5gwIHOrQUTdUKOkadkKml
	 BoJhCES05WcIZSHiAvdbLB6rQmXqn6pV9HA0YzCMKsq74yPYyioPU2x3Lxud9h9HZh
	 77zbyyS0CGOO7salab+iMazbkewswWMxdSjGCMEwRVQAwc5Bm5GbuGBYLRhm1vqbze
	 /uP+OMYTMYmNg==
Date: Tue, 26 Aug 2025 18:34:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@outflux.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
Message-ID: <20250827013444.GA2859318@ax162>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook>
 <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net>

On Mon, Aug 25, 2025 at 03:31:34PM -0400, Kees Cook wrote:
> On August 25, 2025 1:00:22 PM EDT, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> >On Mon, Aug 25, 2025 at 5:35 PM Kees Cook <kees@kernel.org> wrote:
> >>
> >> Yeah, that's a good idea. What the right way to do that?
> >>
> >> config CFI_CLANG
> >>         bool "Use Clang's Control Flow Integrity (CFI)"
> >>         depends on ARCH_SUPPORTS_CFI
> >>         select CFI
> >>
> >> ?
> >
> >I don't recall what is the idiomatic solution for renames, but I
> >remember Linus talking about this topic and about avoiding losing old
> >values if possible (perhaps getting a new question in `oldconfig` is
> >OK as long as the `olddefconfig` respects the old value).
> >
> >I think your suggestion above will still make it appear twice in
> >`menuconfig` -- there may be a way to play with visibility to make it
> >better.
> >
> >A simple possibility I can think of (assuming it works) is having the
> >CFI symbol for the time being introduced just as a `def_bool
> >CFI_CLANG` for a few releases so that people get the new one in their
> >configs.
> 
> Ah, I think this works:
> 
> config CFI_CLANG
>     bool
> 
> config CFI
>     bool "...."
>     default CFI_CLANG
> 
> I will add that for v2.

That does not appear to work for me. I applied

diff --git a/arch/Kconfig b/arch/Kconfig
index c25a45d9aa96..0d3ed03c76c2 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -876,8 +876,12 @@ config ARCH_SUPPORTS_CFI
 config ARCH_USES_CFI_TRAPS
        bool

+config CFI_CLANG
+       bool
+
 config CFI
        bool "Use Kernel Control Flow Integrity (kCFI)"
+       default CFI_CLANG
        depends on ARCH_SUPPORTS_CFI
        depends on $(cc-option,-fsanitize=kcfi)
        help

on top of this series and

  CONFIG_CFI_CLANG=y
  # CONFIG_CFI_ICALL_NORMALIZE_INTEGERS is not set
  # CONFIG_CFI_PERMISSIVE is not set

gets turned into

  # CONFIG_CFI is not set

after olddefconfig. CONFIG_CFI_CLANG has to be user selectable with a
prompt but the only solution I can think of at the moment results in a
duplicate prompt for Clang.

diff --git a/arch/Kconfig b/arch/Kconfig
index c25a45d9aa96..93bf9b41a9de 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -876,8 +876,17 @@ config ARCH_SUPPORTS_CFI
 config ARCH_USES_CFI_TRAPS
        bool

+config CFI_CLANG
+       bool "Use Kernel Control Flow Integrity (kCFI) - Transitional" if CC_IS_CLANG
+       select CFI
+       depends on ARCH_SUPPORTS_CFI
+       depends on $(cc-option,-fsanitize=kcfi)
+       help
+         This is a transitional symbol to CONFIG_CFI, see its help text
+         for more information.
+
 config CFI
-       bool "Use Kernel Control Flow Integrity (kCFI)"
+       bool "Use Kernel Control Flow Integrity (kCFI)" if CC_IS_GCC
        depends on ARCH_SUPPORTS_CFI
        depends on $(cc-option,-fsanitize=kcfi)
        help

Maybe that does not matter for the sake of keeping things working?
Otherwise, we could just keep things as they are with the patch set and
expect people to actually use oldconfig or diff the results of
olddefconfig (which I think is good practice anyways).

Cheers,
Nathan

