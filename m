Return-Path: <linux-kbuild+bounces-8654-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA44BB3B099
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Aug 2025 03:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A25607B85B1
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Aug 2025 01:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304391990D9;
	Fri, 29 Aug 2025 01:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfKb6ou7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1922282F1;
	Fri, 29 Aug 2025 01:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756432167; cv=none; b=hV1gQ9HtNyvR73QVi5uRcRZt2BLNUuWrfx2Fj8cJ+wXv5pjiJ9xteKeuTM8sc26khAW14rhUNsTlOBLhHpemaQH7NAjmw3yS05iAepo4XQraryCifNFftXrOJ+PDRGHjJnwqm92kswa6BeabytgCHi/WsKSwCyUuFQMTfMLgxl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756432167; c=relaxed/simple;
	bh=LnE97d/OL0MjX+YtgvWFnzZ3rGxg8lbiIKWtR2dnmu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UltWcEXaiYZiKsM/g7/bouWfzO/3dHDszHlCLXs8wMAzmWE9So/jM9yPBrRlWTXwxhZq+1PFgdoQ3ngGrVsIKWs6yNAN1IVNu934Uon2umsrFOEMkIXp7h6aWOlqi02EOdofSF7sGMBuXs0pVloxix8rThS292kZlry/0PwdRqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfKb6ou7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780CAC4CEEB;
	Fri, 29 Aug 2025 01:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756432166;
	bh=LnE97d/OL0MjX+YtgvWFnzZ3rGxg8lbiIKWtR2dnmu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfKb6ou7eLhltTeAmy5adRU6ZYG5j08nh6go592Gbcbr1P0UlEzUCAzDjIgy2eAIk
	 Q787xvixvGptbR1lhkWGF5Lnbiic0wqz4WXljmJQFKdma+i3KkWA+AaRCZre4h24vO
	 W6At4FWUuQH7m7eqXtD/8J51iu7jjUnFtxsH0U9kjq3MXSpLnx4UOwTwHWwsMO4ofk
	 11Qa7EZE1yp0Li8IVYIX3x6QoIgabURoYVT2Vut/4rlJX2vJVo48h5ZyTDBvpiXSrV
	 oGk/n02YrmDWDiXUZcrGecTkYdWCLgBnuYOOityAIMmy8zRjyITGkJvRfleXYq2wbI
	 HSav784NLGyBA==
Date: Thu, 28 Aug 2025 18:49:26 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@outflux.net>,
	Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 3/5] x86/cfi: Add option for cfi=debug bootparam
Message-ID: <202508281848.A6EE3E4BA@keescook>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-3-kees@kernel.org>
 <20250827195753.GB3572128@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827195753.GB3572128@ax162>

On Wed, Aug 27, 2025 at 12:57:53PM -0700, Nathan Chancellor wrote:
> On Mon, Aug 25, 2025 at 07:25:50AM -0700, Kees Cook wrote:
> > From: Kees Cook <kees@outflux.net>
> > 
> > Add "debug" option for "cfi=" bootparam to get details on early CFI
> > initialization steps. Standardize CFI pr_info() lines to use "CFI:"
> > prefix. Standardize "CFI: Using ..." to always report which CFI mode is
> > being used, regardless of CONFIG_FINEIBT. Document all the "cfi=" options.
> > 
> > Signed-off-by: Kees Cook <kees@outflux.net>
> 
> I am not sure if the x86 maintainers are "patch count adverse" but it
> feels like this would be a little easier to review as four separate
> patches. Every sentence in the commit message is basically its own
> change.
> 
> 1. The initial documentation for cfi= and its current values.
> 2. Standardization of pr_info() calls to use "CFI:"
> 3. Adding "CFI: Using" to __apply_fineibt()
> 4. Adding cfi=debug
> 
> Patch four would become much simpler to understand, especially with
> Peter's suggested change.

Yeah, that's entirely fair. :) I will split this up.

-- 
Kees Cook

