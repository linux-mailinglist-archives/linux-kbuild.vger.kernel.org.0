Return-Path: <linux-kbuild+bounces-9067-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F358DBCAD2C
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Oct 2025 22:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8DA93B1E1D
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Oct 2025 20:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E601B271450;
	Thu,  9 Oct 2025 20:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o8ZnwI4F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69E51632DD;
	Thu,  9 Oct 2025 20:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760042643; cv=none; b=hS3VfURmQo2YaNHLMaeO+UxHrzG3DQnYWkngTyrUYz041skvooqVku/GdRl1wmmXKXKJUYz2Jto6b1SfAkuBnhrVgeIywSso/b53+JtB9b+7YYvJwYAtNdQlqpQrp6WqssyqQ+3lnEDKqZPPlM3DjCZ6mzWVYKZhvkgNkOofjNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760042643; c=relaxed/simple;
	bh=7/U1V566gKFb1vf2ntgi11mlitYm6aRNje2qf/ILaG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oB/xWnmvlqOYvd6PZfhtKjjFwzuoF34G76yWaBnY9KTpnQs6s20+XIfw1GOkeJas/2N11lVqtvfiKTtcUy6WQLquWtWPx/JPIILVhkMZR2engqXM0O2glKW/Cno9QkFb/nKYMGk+TT0Ayg5ChXQOeg0nnwwSuAfltLd+QVAhpcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o8ZnwI4F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9E5C4CEE7;
	Thu,  9 Oct 2025 20:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760042643;
	bh=7/U1V566gKFb1vf2ntgi11mlitYm6aRNje2qf/ILaG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o8ZnwI4FcSI82oYE36no4cgXvY3zMYCJTz1pXXyMZmPwrpHFNn3WInBfZY2qRGAdj
	 O/ZZm8OzBuDG4GN7dIUzk5Wc/fBr+2wiCLKv55znlbIOMKtnKZ+40FrUNd2zq7NvMl
	 3lmL2pY+r+f5o4OTICmeKJ5IPsateFBSUxyh86WBPmKVDx4CJO2BhTXIYkEQG2MAv+
	 xcaqGsNoZjWivGHGOJ09w3r93lDjh6HDNztXqoSvMBgoI/Y8ajrLOwDIQyf91AciX5
	 vx+nDa78L67xtjJsS0lOxKco+yxTk6OUYM2v/U+wHTyqDwK8FI5undZtswitfNG0Ct
	 HUsjXszmSQB+w==
Date: Thu, 9 Oct 2025 21:44:26 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alexey Gladkov <legion@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
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
Message-ID: <aOgQmiPwkbkFTWZr@levanger>
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

Thanks!

Acked-by: Nicolas Schier <nsc@kernel.org>

