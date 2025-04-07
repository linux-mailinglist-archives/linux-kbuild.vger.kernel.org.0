Return-Path: <linux-kbuild+bounces-6495-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0499EA7EC01
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 21:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4564E3BAB86
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 19:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5FB8218AC7;
	Mon,  7 Apr 2025 18:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qhr8f8gZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ECF1EE032;
	Mon,  7 Apr 2025 18:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744050624; cv=none; b=UQhEXxx4fMnk0gMEGfYvwFSoj0cRAB0U4rARMEoPe6qnFkybsAa9IL80h9pFxn4POqPWlG33ZchZ+G8zFHHViv83pWWd7Lql1SIAUV7NlO7TC8EGlrLOOv7qUJHkSzEC8KtS8yl4I2mrqrGPM4tVj7wA5omDzt6QHG0dtgirCL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744050624; c=relaxed/simple;
	bh=FQMfGLh5C6n7JuybfDzu2iuG/1Pw/ID6KqOpxvzKSf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozC/uJIQ9M1dTTg8Q5PLahdXS6hJYHO6L7B5P7J/IqGQz0/t7dYIGtRo5XSGLbv1NYzHlTjnTl6rjGNLLyb/3jA69btfziE79n1Yx3UXB06nwj3olPMecCQqJ5/WaWigVl6wb2lm7w6jaBd6sqqbdeeqfTEexB00wgkLkAV7tmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qhr8f8gZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8DFC4CEDD;
	Mon,  7 Apr 2025 18:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744050624;
	bh=FQMfGLh5C6n7JuybfDzu2iuG/1Pw/ID6KqOpxvzKSf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qhr8f8gZiL0WRr46kStn2vSZUbAYQXAuO0aN9Q++95HNF7FaI8kzwZSbly1LsBypL
	 /MdsuXsMr+wp2Pjy8kXUAqkw5XZqGFteMbwpbvxr8Daj+eDx63tVuOgCzLkrgoFW9K
	 O7yUUZJSQ/RJHzcpPP4yliEQTYEVcmEjK2mx+nDQU2+Ab1HJ1pR9RlUjD3m2o1j2b6
	 iyU4WfBchLKbUk4sjkdCjSDahIan+K2xDP3sK0Lg34NFdEt8wEiBpS6EN36kmySjRl
	 5NvqLJyvpIJbfe3cCeJIcv2Smi4XWmBXtRP5YBIa5HO7wjSWuG2hkFAnzHl2/Cz0Pf
	 4LgmFHUyS9Mjg==
Date: Mon, 7 Apr 2025 20:30:15 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, "H. Peter Anvin" <hpa@zytor.com>,
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
Message-ID: <Z_QZt8mPEf-dlvcZ@gmail.com>
References: <20250407094116.1339199-1-arnd@kernel.org>
 <20250407164151.GB2536@sol.localdomain>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407164151.GB2536@sol.localdomain>


* Eric Biggers <ebiggers@kernel.org> wrote:

> On Mon, Apr 07, 2025 at 11:41:12AM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > x86 already requires gcc-8.1 since linux-6.15-rc1, which led me to
> > actually go through all  version checks and make this is the minimum
> > for all architectures.
> > 
> > Most of the actual resulting changes are actually for raising the
> > binutils version, which eliminates version checks on x86 and arm64.
> > 
> > Arnd Bergmann (4):
> >   kbuild: require gcc-8 and binutils-2.30
> >   raid6: skip avx512 checks
> >   x86: remove checks for binutils-2.30 and earlier
> >   arm64: drop binutils version checks
> 
> This is intended to supersede the patches from Uros that removed checks for
> binutils < 2.25, right?  See:
> 
> * https://lore.kernel.org/linux-crypto/20250404074135.520812-1-ubizjak@gmail.com/
> * https://lore.kernel.org/linux-crypto/20250404074135.520812-2-ubizjak@gmail.com
> * https://lore.kernel.org/linux-crypto/20250404074135.520812-3-ubizjak@gmail.com/

Yeah, so these commits (now pending in the x86 tree) should nicely 
complement each other, there shouldn't be much friction other than:

  a72d55dc3bd6 x86/idle: Remove CONFIG_AS_TPAUSE

... which will have a conflict in arch/x86/Kconfig.assembler but is 
straightforward to resolve.

> If we can indeed bump up the requirement to 2.30, that would be great.

Agreed.

Thanks,

	Ingo

