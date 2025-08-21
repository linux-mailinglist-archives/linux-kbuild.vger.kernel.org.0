Return-Path: <linux-kbuild+bounces-8560-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA25EB3007A
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Aug 2025 18:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B2FE17FA5B
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Aug 2025 16:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400962E5416;
	Thu, 21 Aug 2025 16:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCDsHAdE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C21927814A;
	Thu, 21 Aug 2025 16:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755794917; cv=none; b=J7JD9QiDITADNv89lDEgkp41ei1F4dSq/kxlQ3LEaqInSOMnaN/cs3PAeUHbJG6A7pyHsTl4V4F7V4+k80oyW6T84yBLgHkjCYFBhPyfqgc3Em8CcD/zypUVd7Td8kdvQKWiyyFv4YUI5AS5sQSVy3i2Ebdv3zfjxA+4yCXj0lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755794917; c=relaxed/simple;
	bh=livIxDrnwdmQcTTAy2HG7jouCBIKKNVPDKxdcemhdwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQbIBA3aLB1xjR3h3KhAEAK6PDc0fpPTE+xSV+nVScFdiUUfGLPq7ZZ9JqgHEJ3Rru2xYPdeREZv93AfCSHNKRtnWPO6HgOS+oxG2ICQhsGck77SlwsYMg4fGkIlwNgdu59O0DSgaiwo0JP0vzmTiFruh2RE50wXhvXm89uAOAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCDsHAdE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184DFC4CEEB;
	Thu, 21 Aug 2025 16:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755794916;
	bh=livIxDrnwdmQcTTAy2HG7jouCBIKKNVPDKxdcemhdwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DCDsHAdEx/SdTwK0v3GMeU3YBCpVikRawO7a8lMYA29Kp1qWtU48tXwhlkiBtonqL
	 1iiTr/moUv9nNSA/w0327gSnTGxjSqLpd+hW4gLnhrHB7XGCE2sHKBQiXkLaoaaNFX
	 Ll7xkh7RYBV/NN3KVPZm+xiu4gDOKYTnYpsDjuVRcG8QJKFgTqMLcuTJcm2B2ef79E
	 O85B6bWNPmHaYR0rgYHyAUEFVZK5pI67Eed6OKUHiSZrMDLQAmYmCjocmIM2Jf5CxL
	 knFmiSpojfbys3k7Ou8MYWMhQeNtPrX/twgNp6UDWWDZVBc8qMD/AvrQnSZxe0Y8Lj
	 NQEiRPd9+VLoA==
Date: Thu, 21 Aug 2025 18:48:21 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 01/10] kbuild: Bump minimum version of LLVM for building
 the kernel to 15.0.0
Message-ID: <aKdN1VFGJ1pNvC5z@levanger>
References: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
 <20250818-bump-min-llvm-ver-15-v1-1-c8b1d0f955e0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-bump-min-llvm-ver-15-v1-1-c8b1d0f955e0@kernel.org>

On Mon, Aug 18, 2025 at 11:57:17AM -0700, Nathan Chancellor wrote:
> s390 and x86 have required LLVM 15 since
> 
>   30d17fac6aae ("scripts/min-tool-version.sh: raise minimum clang version to 15.0.0 for s390")
>   7861640aac52 ("x86/build: Raise the minimum LLVM version to 15.0.0")
> 
> respectively but most other architectures allow LLVM 13.0.1 or newer. In
> accordance with the recent minimum supported version of GCC bump that
> happened in
> 
>   118c40b7b503 ("kbuild: require gcc-8 and binutils-2.30")
> 
> do the same for LLVM to 15.0.0.
> 
> Of the supported releases of Arch Linux, Debian, Fedora, and OpenSUSE
> surveyed in evaluating this bump, this only leaves behind Debian
> Bookworm (14.0.6) and Ubuntu Jammy (14.0.0). Debian Trixie has 19.1.7
> and Ubuntu Noble has 18.1.3 (so there are viable upgrade paths) or users
> can use apt.llvm.org, which provides even newer packages for those
> distributions.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: linux-kbuild@vger.kernel.org
> ---
>  Documentation/process/changes.rst | 2 +-
>  scripts/min-tool-version.sh       | 6 ++----
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 

Acked-by: Nicolas Schier <nsc@kernel.org>

