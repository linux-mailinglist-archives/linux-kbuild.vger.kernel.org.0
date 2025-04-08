Return-Path: <linux-kbuild+bounces-6514-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF09A7F863
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 10:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1ADA16CC87
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 08:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50F6264627;
	Tue,  8 Apr 2025 08:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzcOI0qF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A90263C7D;
	Tue,  8 Apr 2025 08:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102011; cv=none; b=O1kjBTAoc6/RrJ/v8ahGpBNmRF5Tr4emTr+T8aXY6NWvls64qxIcu58kKH5GgTWTDI9afczwEDR/7BTqOEWPVPm78I/3FTV672yO4qlRHYYRMqBTiCsCnd8wxs0LECkWGYD09CNMfyno41CAD1//iP4f2v5WZMQFI9w/a1F2OOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102011; c=relaxed/simple;
	bh=ReDfcUfMOpsNbvyyw5CHCguPoy2XwOLWpjwrd1QNJZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCrvmAZGtb5QeyIIJinYJATWTq78RahhNs88ISMQuKCBeL+BhCHeaYDsL3gZbrtgJot2QO6GVg71wU5Xbf9WufphmAY4eAzy/ntiSEP8KpllZV8rJS6cRwwhg2odIq3SUv/++HU9i3pGT+cIAEAkzA+C1okC8jk3T7cWscEVnJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XzcOI0qF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4147C4CEEA;
	Tue,  8 Apr 2025 08:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744102010;
	bh=ReDfcUfMOpsNbvyyw5CHCguPoy2XwOLWpjwrd1QNJZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XzcOI0qFCRIiNeziun3omyXC4XT2tra1CSZRP4RLHcpwmJc5k0zr7FiBaeKTQpnZc
	 tMww2dQje85Jt9gIZ84V6ZvLGWpmBBMzNeCpKYyAWMKlURarbsdTUT8aBy2gJ/hnmi
	 Dzc2Z1ArI6iXAySInGqzXVrXwbQDm5R0UQmARlDe2uT4Z1UFRvbhoczk/q80qKRNtV
	 JOhScnrfGkF30ICvX8sMhocw6O2xoPbrZJ7ypocmjF83eS96ls/1jkOx9dOv4UDLuo
	 rOvGzaC6LpvUSGHgiOa8/uOvomLisuh+fRm87M9PD/TuMAkcvce3kxajWn35ChCnXX
	 2EMLXS+kq3xYg==
Date: Tue, 8 Apr 2025 09:46:43 +0100
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
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
Message-ID: <20250408084642.GA1768@willie-the-truck>
References: <20250407094116.1339199-1-arnd@kernel.org>
 <20250407094116.1339199-5-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407094116.1339199-5-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Arnd,

On Mon, Apr 07, 2025 at 11:41:16AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Now that gcc-8 and binutils-2.30 are the minimum versions, a lot of
> the individual feature checks can go away for simplification.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/Kconfig              | 37 ++-------------------------------
>  arch/arm64/Makefile             | 21 ++-----------------
>  arch/arm64/include/asm/rwonce.h |  4 ----
>  arch/arm64/kvm/Kconfig          |  1 -
>  arch/arm64/lib/xor-neon.c       |  2 +-
>  5 files changed, 5 insertions(+), 60 deletions(-)

Since some of these checks are dynamic (i.e. they try passing various
options to the tools to see if they barf), have you checked that the
minimum supported version of clang implements them all?

Will

