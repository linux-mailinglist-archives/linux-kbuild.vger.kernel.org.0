Return-Path: <linux-kbuild+bounces-8580-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFC5B346D6
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 18:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A667F1B22AF2
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 16:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073932F3633;
	Mon, 25 Aug 2025 16:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfFYvZXM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97B71E89C;
	Mon, 25 Aug 2025 16:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756138605; cv=none; b=oF0Q2GVRfBgGZJ98EySkM04HUKi6WyHC1/4Q3pg2gT5IlbFkTZzz3g0y1vyiazXenrRVovLCOC/Z4BoDhKBy4qJsg2iIFXIVvrDSaa0oYDs4OBB+4BntsTYrFI1dH8LTsNvzPuEScNdfOzoXWtiVE+ejKqwJIhGsbteHvOmVQz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756138605; c=relaxed/simple;
	bh=9C0JTroVYJnMkJclSuilfgsfM6RmsoK/moXeHS/dRAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=toPfLBLMhEMRNahJ1LUutbw6FGgKrSSubRVTOZGIB5FguKfEa1U3fxnRr1mcg73Y+yLkflxktapXgxwVJt4jkwj8o6xxOOZeywJytyDiRvJSuEqq+9d0wTmxKY0Y7qcv94oFngBOWnl+cH8D0Wfra8WB0S1CXKtQcmWTCSZ5sfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfFYvZXM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6A4C4CEED;
	Mon, 25 Aug 2025 16:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756138605;
	bh=9C0JTroVYJnMkJclSuilfgsfM6RmsoK/moXeHS/dRAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfFYvZXMBbgRSX0K3rOpSm2H32pNwz0EEz0H4S8bd5+3uFOutsnu/gA4+ctEHS7ur
	 VtzlPW/aRP0P5S9aTe+JhuI3FChzXIEqbC+aN2veGXaOG1WRIWV4Psi+l4ONt+ohTF
	 RyjzwfR0rTyuppZ+FJ3jNBUbzMZaGKzzoFEBXFRp23llVJvWbp47wn+tZBjZQGeoWB
	 tb71D1+B7nImbFFmi9AowNEy8a6DHnwM8VKGxCarOVIkIRzF9fk369PfmrjngRV5/s
	 NiocBqHCJ5uUXBhjX8UU+eppr7zFxbil46Apb7ckJhm0LZaf7z5J34/iQwh6ScYl9O
	 CfcB+v7OD/pyg==
Date: Mon, 25 Aug 2025 09:16:45 -0700
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 3/5] x86/cfi: Add option for cfi=debug bootparam
Message-ID: <202508250916.6424C531F@keescook>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-3-kees@kernel.org>
 <20250825155923.GY3245006@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825155923.GY3245006@noisy.programming.kicks-ass.net>

On Mon, Aug 25, 2025 at 05:59:23PM +0200, Peter Zijlstra wrote:
> On Mon, Aug 25, 2025 at 07:25:50AM -0700, Kees Cook wrote:
> 
> 
> > +	if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> 
> You could just make that cfi_debug and add:
> 
> 	if (builtin)
> 		cfi_debug = false;
> 
> at the very end of __apply_fineibt().

Oh sneaky! Yeah. Will do.

-- 
Kees Cook

