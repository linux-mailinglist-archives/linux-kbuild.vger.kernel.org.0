Return-Path: <linux-kbuild+bounces-9071-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD1FBCBE51
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 09:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B9164EC557
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 07:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15638239E9E;
	Fri, 10 Oct 2025 07:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FK2FjZwU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FE81D6193;
	Fri, 10 Oct 2025 07:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760080751; cv=none; b=KP9TdzGtJNcZlyeDqVl9rdHYlPYju2MvTg9AUAZ2xCZZm2x7Am3PCW2VZpFJOqcbvfb+LbTJEuAc4GB1TyHxuGZ4I0WD+vNRi+Xp2GnJv2NRK+QgcaI+LSKpUH2Fkj1XeYvf1dm0ZeBicLsWmZ99mQcbgqH83uOuUM8h1Xgp4NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760080751; c=relaxed/simple;
	bh=w3vHy6Avbo99VMJhAgCj54/k6LJnsXN5d71As9vJDDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1AXDPJOSRX2iQIVdLlOtXR+Rz1xZm4fxbvvYn9mWjTVFAAnqPSBocPN36nVz3e69FRCiusGUm9qFWw/WKY+tSbQdfSfPRzbyASCeGbxEUr7ZuIqTZM+DCGa23hXoFOX//htTmpe+XpHXVGjqrWSEdf8ofcCG4e+5Sy7F7P3F0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FK2FjZwU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206F9C4CEF1;
	Fri, 10 Oct 2025 07:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760080748;
	bh=w3vHy6Avbo99VMJhAgCj54/k6LJnsXN5d71As9vJDDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FK2FjZwUUOiHzXe5q/OBThaV+TpuMZkhaigQwQXhV0xUJGaUKWLeybTOZStC5r3Fq
	 yI0iLW+nM1ExkqeA8RYnlRiUU7s2Y01TXFGqMFMqZdtWb04PADnXcTgOju2yVkszfk
	 kH1iJY5d5eCKXwNeLCR3rp/7lp7mfe03GQBnHc6zXh9JTzhHiAFG/MiOLxaEleTwgM
	 Ao/AYezyDNfrUVVSqiBptnJ2hMzZsZbb123eTiO7q32f+7NoO0/wo3kFHI23w7qhVq
	 Qk0xDWV5St0s4ioje9eZuDxGC8cohyu3tT1avXhqJOwVbNARYNgbDOFdJlQjaKXs9l
	 UhsaTTFMhhsVw==
Date: Fri, 10 Oct 2025 09:19:01 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCH 0/3] kbuild: Fixes for fallout from recent
 modules.builtin.modinfo series
Message-ID: <aOizZcGLEH9edZQ0@example.org>
References: <20251008-kbuild-fix-modinfo-regressions-v1-0-9fc776c5887c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-kbuild-fix-modinfo-regressions-v1-0-9fc776c5887c@kernel.org>

On Wed, Oct 08, 2025 at 03:46:43PM -0700, Nathan Chancellor wrote:
> Hi all,
> 
> This is a series to address some problems that were exposed by the
> recent modules.builtin.modinfo series that landed in commit c7d3dd9163e6
> ("Merge patch series "Add generated modalias to
> modules.builtin.modinfo"").
> 
> The third patch is not directly related to the aforementioned series, as
> the warning it fixes happens prior to the series but commit 8d18ef04f940
> ("s390: vmlinux.lds.S: Reorder sections") from the series creates
> conflicts in this area, so I included it here.
> 
> I plan to send at least the first two patches to Linus by Saturday for
> -rc1 but I will take the third with an Ack.
> 
> ---
> Nathan Chancellor (3):
>       kbuild: Restore pattern to avoid stripping .rela.dyn from vmlinux
>       kbuild: Add '.rel.*' strip pattern for vmlinux
>       s390/vmlinux.lds.S: Move .vmlinux.info to end of allocatable sections
> 
>  arch/s390/kernel/vmlinux.lds.S | 44 +++++++++++++++++++++---------------------
>  scripts/Makefile.vmlinux       |  5 ++++-
>  2 files changed, 26 insertions(+), 23 deletions(-)
> ---
> base-commit: 38492c5743f8b7213ca86f0cd72ea625af35d5ef
> change-id: 20251008-kbuild-fix-modinfo-regressions-95e3fd151dec
> 
> Best regards,
> --  
> Nathan Chancellor <nathan@kernel.org>
> 

Acked-by: Alexey Gladkov <legion@kernel.org>

-- 
Rgrds, legion


