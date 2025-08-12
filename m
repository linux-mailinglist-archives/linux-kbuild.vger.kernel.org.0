Return-Path: <linux-kbuild+bounces-8417-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 779B1B23C64
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 01:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B03C51A25A45
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 23:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2D52D3EDB;
	Tue, 12 Aug 2025 23:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4BJGMDr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8E32D0C87;
	Tue, 12 Aug 2025 23:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755042303; cv=none; b=RY3fau67BaIYw+8ZStdnJTGrhCDt68bAYOKPMJ8LpKmhXw62r4w9Nhw+QlD6LfqWwHtrSamhfKlUAEIYh4iUDH9WyFzHZenHQIzGY5bh9f/F67eSLTFAZJaen3sQWWXDc9b/y5gl8o2rSMc45TWH6cQI/VYKd9RtBI/Rvy8DvX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755042303; c=relaxed/simple;
	bh=1JWPt22WJ66pn8lC6kKWbemewM3XSFp+u7LBfqUk/V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VG7ANZirG76Ja7A4edYxQ7khC4Pvt9Z73xewa25lPEBnUIY2WrmoH2lIu7fqy2y+6ebwaDFxxBiNLPMHYKBUJiVtaTFGCOMLV2Emq0n3/9EHNci+oKinjyzXJ+2Be6PwyfB5THgwwzazVuGh6L4V1nm7IsHx5PghehHdE8vyokc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4BJGMDr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C1CC4CEF0;
	Tue, 12 Aug 2025 23:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755042302;
	bh=1JWPt22WJ66pn8lC6kKWbemewM3XSFp+u7LBfqUk/V8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d4BJGMDrD9bEdVSdCvmQAdYg616GYLEYGtQ9KHDhUo2hl01qWs59IRPRr6McNzpsh
	 PxBz7AbpaugiYAE8wMbo8ZX5OnZUq8Uu77uYrCELD2jCnSf8ClNV0EP/Rfr97StI4x
	 OeTsLkRuGEi5i9jXsIbH1c5pSy/GwhZaHudz0en6L3Eob9dGVFVEJnXP1gpuLM0Oqy
	 LGSI6A+QfblXUy6R57l+J/InJ3bnTzksscnJEQ6OLEjXQd05k6+BdYWdtB5OcTEWhT
	 QKGEvXEW2vyH/0Y1OmQMZBGY5UNWCiGPe1U0RHZ3MuozrFtDlbMaj4hpubKtg4LEhT
	 AvdTYEZmgYfJg==
Date: Tue, 12 Aug 2025 16:44:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] kbuild: uapi: various fixes
Message-ID: <20250812234458.GA52733@ax162>
References: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de>

Hi Thomas,

On Tue, Aug 12, 2025 at 07:33:03AM +0200, Thomas Weiﬂschuh wrote:
> Various fixes and promotion of warnings to real errors.
> 
> I didn't add Fixes: tags as digging up the original changes would be
> cumbersome as the code moved a lot over the years.
> Backporting this doesn't make sense anyways.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
> Thomas Weiﬂschuh (6):
>       kbuild: uapi: rerun header tests when headers_check.pl changes
>       kbuild: uapi: only update hdrtest output on success
>       kbuild: uapi: fail header test on compiler warnings
>       kbuild: uapi: upgrade warning on asm/types.h inclusion to error
>       kbuild: uapi: upgrade check_sizetypes() warning to error
>       kbuild: uapi: upgrade check_declarations() warning to error

This series seems reasonable. I did a build of usr/ on arm64 and x86_64
allmodconfig, which showed no issues. I will give Nicolas a few days to
comment, after which I will apply these to the Kbuild tree so we can
start soak testing in -next.

Cheers,
Nathan

