Return-Path: <linux-kbuild+bounces-6580-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B620AA862D3
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Apr 2025 18:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 342487A935D
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Apr 2025 16:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8746C2144DB;
	Fri, 11 Apr 2025 16:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lM3n2Loz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5912367DD;
	Fri, 11 Apr 2025 16:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744387355; cv=none; b=RgmVBgDBXS1TfymWffyP+CkivmA4TD4ATOSQ3S+qE0ORnNOw2enHxH1hp5syJPolH0Z0Qj5idJhj7ovnkg504woZLt/qRuTd0WRNrhDklC5BlQ4pOPM15gqflVvfRKfam7P6UKC/ytctuwACPH54F0nRa9l1zL/k6WX/xYoxB2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744387355; c=relaxed/simple;
	bh=vAL2HWsYZdwCmYgBhqkDTW705E6nfjbHy8zZUtbDK1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOwPm9J796+vnm3bEluS6c5tXgftlMQ/352H/MEDAZkSZxYgxxFW3xiAcWgUhnme5ZEf9AyvA6X3d/WNbGi8iHqVTf8XDjGq6rYViXTLKIXjV/CB/u0MsCiZm9yivMJkoLOVC4rAv/1JfZXnE3HEw1CffQWWLprhA32WCPl28Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lM3n2Loz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660A0C4CEE2;
	Fri, 11 Apr 2025 16:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744387354;
	bh=vAL2HWsYZdwCmYgBhqkDTW705E6nfjbHy8zZUtbDK1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lM3n2Loz/+36sq/6Lei4iAuRvu0gIZAxvFRJtwZJkrecobf/bxMztsQO8Ec0gJN/f
	 fXLjuuIGuhEKNlEDySUgAFXjabeqc/IU7+VSGmwoOungmellXHntYqTXYbyWHYqW5R
	 nPTTpV656C2vLz6f0jvUeU6hmU23lQqoEwlpFaf4W0hxSA0f2n12r/4oYKMyVz841q
	 DQloyDbE7vemgtETopzA47uMliPINAXLBoy/olrdvyxgU7Pd9lVlDefKAoo81dVMzU
	 8orDcHPaYgZPwO2Pzul9QKFGqTIjHhhv0N96eMQ1RSesLVcCCaGOeRgic6Rzpk29vL
	 Cx6nXHbilX9OA==
Date: Fri, 11 Apr 2025 17:02:26 +0100
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Brian Gerst <brgerst@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 4/4] arm64: drop binutils version checks
Message-ID: <20250411160225.GA5675@willie-the-truck>
References: <20250407094116.1339199-1-arnd@kernel.org>
 <20250407094116.1339199-5-arnd@kernel.org>
 <20250408084642.GA1768@willie-the-truck>
 <f79695b7-f0c0-442f-963d-6ecae246ebf5@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f79695b7-f0c0-442f-963d-6ecae246ebf5@app.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Apr 08, 2025 at 03:10:57PM +0200, Arnd Bergmann wrote:
> On Tue, Apr 8, 2025, at 10:46, Will Deacon wrote:
> > Hi Arnd,
> >
> > On Mon, Apr 07, 2025 at 11:41:16AM +0200, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >> 
> >> Now that gcc-8 and binutils-2.30 are the minimum versions, a lot of
> >> the individual feature checks can go away for simplification.
> >> 
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >> ---
> >>  arch/arm64/Kconfig              | 37 ++-------------------------------
> >>  arch/arm64/Makefile             | 21 ++-----------------
> >>  arch/arm64/include/asm/rwonce.h |  4 ----
> >>  arch/arm64/kvm/Kconfig          |  1 -
> >>  arch/arm64/lib/xor-neon.c       |  2 +-
> >>  5 files changed, 5 insertions(+), 60 deletions(-)
> >
> > Since some of these checks are dynamic (i.e. they try passing various
> > options to the tools to see if they barf), have you checked that the
> > minimum supported version of clang implements them all?
> 
> I did some randconfig build testing with clang-13/lld-13, since that
> is the oldest supported version, and checked that the options are
> all supported. I'm pretty sure it's been there for a long time before
> that already.

Thanks (especially to Mark!) for checking.

Will

