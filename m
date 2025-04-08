Return-Path: <linux-kbuild+bounces-6507-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB5CA7F788
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 10:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D2A11893667
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 08:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD78A263F31;
	Tue,  8 Apr 2025 08:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mTbuCqJe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9FE263F2C;
	Tue,  8 Apr 2025 08:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100173; cv=none; b=L7cZZknYNveORG+iJucD6Uqp2wWzUF+j1JUh4ygad3ouykpiKj4NqpJGt9wwNNQfI4HRYiMx4QY/ziq7oLLDeu4YqVTq+6u7QpGTcd0SgtGL+ak7kHG/fKLcZNfWEEMIt4CsH9ogPU85VclZM+bDwgptEKEcIqSR5HLjOVDXd2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100173; c=relaxed/simple;
	bh=a0cHsypMDGBoj1KQFM5mwYajqEJrx4jAOqxJNpZ+kzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnBDIA0zWGDA2LWw462ZZEkp4tXLgKL20UFew2y92LT1UbhThKLv3sgC9I3by2wlCDjGeioMcTrxF1085IeeHoIGg0Huifr1ALZCSbABWPBdIXqRgKQpWXOQ2Q+nOKfW4pUg5kWyyy/NYXK/BDYLZiLJAw4Jpx/N7ZRioStpaKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mTbuCqJe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1ED2C4CEEB;
	Tue,  8 Apr 2025 08:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744100173;
	bh=a0cHsypMDGBoj1KQFM5mwYajqEJrx4jAOqxJNpZ+kzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTbuCqJetua5Pl89eRSq+KlSTASP0RslqlF95iKaZ1238IoDHob5PfyjcI9b1TjzW
	 oRS9ccNNBVgaFxO6Xn0/xrrYjvwRF67tgr2Q/lVjc52IBDfXbp9/+bS1RZ1DsbfIOr
	 M3XEap2gKGIDF8vSkJU3YvnVVWMMlKpuA6S7jBu1K6Md7TQJ7y6UKAny/rt8JYyxdx
	 IFdTX4ONhmFkxnvg+N5Kx+cNhc4Bjv9jVsoXS/WZuoZfo5uzB+bSpRnInEiXNEiMqo
	 Dq4QZuYjQq/kE4ajtkQ+kbMFU1g5rKcVGLFsuMFtWZLCTz2qJdF2fxoi/fLxxkUgoL
	 zB+LZD52kI6nQ==
Date: Tue, 8 Apr 2025 10:16:04 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Eric Biggers <ebiggers@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	linux-kbuild@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Brian Gerst <brgerst@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 0/4] Make gcc-8.1 and binutils-2.30 the minimum version
Message-ID: <Z_TbRGgRTDvyQyfs@gmail.com>
References: <20250407094116.1339199-1-arnd@kernel.org>
 <20250407164151.GB2536@sol.localdomain>
 <0d087503-88d5-4d66-aa52-161ca6e0df06@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d087503-88d5-4d66-aa52-161ca6e0df06@app.fastmail.com>


* Arnd Bergmann <arnd@arndb.de> wrote:

> On Mon, Apr 7, 2025, at 18:41, Eric Biggers wrote:
> > On Mon, Apr 07, 2025 at 11:41:12AM +0200, Arnd Bergmann wrote:
> >
> > This is intended to supersede the patches from Uros that removed checks for
> > binutils < 2.25, right?  See:
> >
> > * 
> > https://lore.kernel.org/linux-crypto/20250404074135.520812-1-ubizjak@gmail.com/
> > * 
> > https://lore.kernel.org/linux-crypto/20250404074135.520812-2-ubizjak@gmail.com
> > * 
> > https://lore.kernel.org/linux-crypto/20250404074135.520812-3-ubizjak@gmail.com/
> 
> I missed these, but it does sounds we easy to work out, either
> by rebasing my patch or dropping Uros' version.

It's a trivial conflict resolution AFAICS, already done in today's 
-next.

Thanks,

	Ingo

