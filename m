Return-Path: <linux-kbuild+bounces-8577-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1BAB34600
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 17:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7C465E6223
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 15:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B305C2FDC3B;
	Mon, 25 Aug 2025 15:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdmBXcku"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839A32FE052;
	Mon, 25 Aug 2025 15:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756136115; cv=none; b=GVbe0m2c1XWXTlxfgH++vb9B8z/lwqcjv8dsk7XG46ZqbmWpqcq/jinJCAErXoiDyrx3ZbhWagEHtXqFY9R9UVzC+miY9JOJpKPRM6PvWvyU4AlYVNcqcrn9fPb5+7LTAGBMmQLvHj0jYsiIpHRlUVhpdJBwfAw1WuYCCTF7shg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756136115; c=relaxed/simple;
	bh=DJjOmkVujeC5JzsbUheOOz5HCUqqi0gOpXXCgeiknkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=haInm8TzmXxqJ93+PFSzsovFoStt3oOngecXBH1fmUxFRO7qeEpvAiOaZm2IBRgKU18hMi+s4YvQy5dl/8KZjcwl1PZ7rJ/suLpw18i7Lgx8ocg+wcP4Jn/12Gh+khU+KysyK6kiJYk3mLbFD56WdsbK0xi5guF12s14b1KTJJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdmBXcku; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011FEC4CEED;
	Mon, 25 Aug 2025 15:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756136115;
	bh=DJjOmkVujeC5JzsbUheOOz5HCUqqi0gOpXXCgeiknkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kdmBXckubJWHEXmKqcoBXuKEg4sUWopFtgGS8CKU6AYg17qDR9d4sAIFF7YZcTjLg
	 +9bpRB9qMnzrlApo2L4kU8KTtH6EcgOtoChsicI3YfkBfzj3bTXYtQTAvsmdef+4mu
	 jZFOTgnbrqRUuqb+wMsUj7pzNS7gmcdr2KHeo+Bb2Z79HW6SoBTsAHksQkkMSxZeIr
	 m0yNkjx2elCNQ9F5SA2nuLkJmL+4yl9P4s5D64UAf2gU1/uH3I2g1zdoE5ZeomcWI5
	 35NMHJFivKJtXYbojPIzbyphYxV4aWgHrEIdOtDPkaX0ujVfi3lGMMVyaYnorRZOvv
	 ETPnUGlCWOgNg==
Date: Mon, 25 Aug 2025 08:35:14 -0700
From: Kees Cook <kees@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@outflux.net>,
	Sami Tolvanen <samitolvanen@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
Message-ID: <202508250834.E2456B9@keescook>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>

On Mon, Aug 25, 2025 at 05:01:13PM +0200, Miguel Ojeda wrote:
> On Mon, Aug 25, 2025 at 4:28 PM Kees Cook <kees@kernel.org> wrote:
> >
> > -config CFI_CLANG
> > -       bool "Use Clang's Control Flow Integrity (CFI)"
> > -       depends on ARCH_SUPPORTS_CFI_CLANG
> > +config CFI
> > +       bool "Use Kernel Control Flow Integrity (kCFI)"
> > +       depends on ARCH_SUPPORTS_CFI
> >         depends on $(cc-option,-fsanitize=kcfi)
> >         help
> 
> Do we need to do something to make the transition smoother, i.e.
> keeping the old one for a while to avoid a new question etc.?

Yeah, that's a good idea. What the right way to do that?

config CFI_CLANG
	bool "Use Clang's Control Flow Integrity (CFI)"
	depends on ARCH_SUPPORTS_CFI
	select CFI

?

-- 
Kees Cook

