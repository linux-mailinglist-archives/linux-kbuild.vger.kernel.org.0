Return-Path: <linux-kbuild+bounces-8732-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B983B44AF5
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 02:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84EC1A04865
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 00:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6E018A6B0;
	Fri,  5 Sep 2025 00:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZWTvAgE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE907483;
	Fri,  5 Sep 2025 00:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757032828; cv=none; b=IPMrcF3Kq1T3Xi4TSpIRNe4VcctS4Y4xfpiy3vwvuolVD3tpR1hXPDngZw3C3xbZJwX448/PnJrmafP5rMJrKHsG8brOFLE9l5lzYcLG4FDa7gK+b3kpyLuTLtUwSzcSFtK98f+rR8RrujqnYOrqGCjd3t59AjDtIfz6lkpBjIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757032828; c=relaxed/simple;
	bh=+3l6yKvd05iXLIoZppQn0j3GKV53Ox+OtDsfhcT6nGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/he+7VGyi2Jf1NbQKpibKtISILmZ/ZU0lDVuHaok6azlXnT3R4G6r6VDKGlaae2zNSULKt+/DKT4/RqIn7lIYIbagq7Vlf/d6zOh8v3M2dJNUADTVxDfSHzz2fFgrqgBqdwEWuAM1dK0jEHKkmBR/MihfGmoSZVNNu6jhZ3vK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZWTvAgE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE906C4CEF0;
	Fri,  5 Sep 2025 00:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757032828;
	bh=+3l6yKvd05iXLIoZppQn0j3GKV53Ox+OtDsfhcT6nGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AZWTvAgErao4FY1wz0MbUvxDtg+9XB/QGFLfYldri5vx/62b42/96v25vaisgnxZm
	 nqUNmT3vaOelJ/72zzlaIV2Lt83k2hMV+5Aft6kpYvdD5Z75hA0kqEvqRWylPMwYZq
	 SFMVdTSHt98dG4sK44fE8HvMSZ2+itk3+Z7hy55mfL3vUNhWgCxEpDhz0SIpCKjA+C
	 DSiUFPRSxsVZHeYPBNpGPXzlIZp+EGLKQG4wWGmd+I4L5gDqUU6EKiV2a8+1AYjDgd
	 07mlrSfsqMHrfMBzAxO0ohHS741YkFhdE++oW4hkLjP/GpE5D5JSz5ktXnStrE2BSC
	 u3KoM5aksrdJg==
Date: Thu, 4 Sep 2025 17:40:27 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
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
Subject: Re: [PATCH v2 4/9] x86/cfi: Standardize on common "CFI:" prefix for
 CFI reports
Message-ID: <202509041740.1A8F3A8@keescook>
References: <20250904033217.it.414-kees@kernel.org>
 <20250904034656.3670313-4-kees@kernel.org>
 <20250904184004.GC2110053@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904184004.GC2110053@ax162>

On Thu, Sep 04, 2025 at 11:40:04AM -0700, Nathan Chancellor wrote:
> On Wed, Sep 03, 2025 at 08:46:43PM -0700, Kees Cook wrote:
> > Use a regular "CFI:" prefix for CFI reports during alternatives setup,
> > including reporting when nothing has happened (i.e. CONFIG_FINEIBT=n).
> > 
> > Signed-off-by: Kees Cook <kees@kernel.org>
> > ---
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> Obviously minor but I had pointed out on v1 that there appears to be
> some inconsistency within the diff around capitalization, "ignoring" vs.
> "Ignoring".

Oops! Sorry, I've fixed that locally now.

-- 
Kees Cook

