Return-Path: <linux-kbuild+bounces-10342-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF22CE013E
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Dec 2025 19:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F26B3027E30
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Dec 2025 18:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7959322256F;
	Sat, 27 Dec 2025 18:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OxUycCyx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA8931196C;
	Sat, 27 Dec 2025 18:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766861753; cv=none; b=F/beCcuRezoBPjvuQXSAOp3qnArUFDy2oyNI2OTGZYHgiHQqy6YK7i/2zzD0c+d1GvIb6NmGxrGg2isSxQfMA98/ecxr7DAdryHk7x+fuI+RtegPHUzxkSwUpHD0VnvvBi8LV2V+NKQMkv28yK2bsZ+Vh8kjSlaTH/CEYRahJZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766861753; c=relaxed/simple;
	bh=o/hMbqPgTmr0yM7nuRMHH+Eu7AePSEDwarGVz2CGMAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJlWjD3p5tb92dLCyAJwT6XO0P0s8Y5jG7CCdwaRTNvgKe6L3ALptopw4HFEqDUsYAh+iGedW60CJ6DEQb30MJ82FMaF9XBwNn54YADvR7ee8m2nUe7NyvYnlcjPlzOeP6e9+Fv8a3MI+vhSsGYJV8hWr/EFDIImsLOdSssj0dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OxUycCyx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FEDC4CEF1;
	Sat, 27 Dec 2025 18:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766861752;
	bh=o/hMbqPgTmr0yM7nuRMHH+Eu7AePSEDwarGVz2CGMAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OxUycCyxxYmfDyKQaMmVOJKlc5RBNOA4bw8Ure8dHvRsxr1Soc2O2Qgq+qs+xTLrI
	 SJyhJAmD4TWUjg/ZuNPEUYWQBLmQocmldCjL85tgyWk7nK91rR0GMy0M4IQ5IjqCyz
	 tG5yRRGBh2OrqCpqexLjV7956kaQQZ6J7BqHZRb+OX+uJsTTLUKitTZKYMztKm0jda
	 nQABhO/dj8a7Btam36GqWEHnEWTOY83ZZTvcEMUoussO4hZEdAlbDdh82k3N6JkTQM
	 HXYukMoOa7luUnvqSx/DQnWDZg4qtzgSHZ40HjmXz/huH1UIg5MfCnDwPwGC9ZTl1q
	 fUCA7sOEwss4A==
Date: Sat, 27 Dec 2025 17:36:23 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Tom Rini <trini@konsulko.com>, Alice Ryhl <aliceryhl@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Oleh Zadorozhnyi <lesorubshayan@gmail.com>,
	Petr Mladek <pmladek@suse.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 4/6] kbuild: Support a MAKE_FIT_FLAGS environment
 variable
Message-ID: <aVALB4hBkHlTelXA@levanger>
Mail-Followup-To: Simon Glass <sjg@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Tom Rini <trini@konsulko.com>, Alice Ryhl <aliceryhl@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Oleh Zadorozhnyi <lesorubshayan@gmail.com>,
	Petr Mladek <pmladek@suse.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20251227142200.2241198-1-sjg@chromium.org>
 <20251227142200.2241198-5-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227142200.2241198-5-sjg@chromium.org>

On Sat, Dec 27, 2025 at 07:21:48AM -0700, Simon Glass wrote:
> In some cases it is useful to be able to pass additional flags to the
> make_fit.py script. For example, since ramdisks are typically large,
> passing -E to use external data can be helpful.
> 
> Add a new MAKE_FIT_FLAGS variable for this.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> (no changes since v7)
> 
> Changes in v7:
> - Add a new patch with the MAKE_FIT_FLAGS change
> 
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

