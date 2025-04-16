Return-Path: <linux-kbuild+bounces-6666-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3CBA90C8E
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 21:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BEF47AFCF1
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 19:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3646A2253A8;
	Wed, 16 Apr 2025 19:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLpXnQw5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F9A209673;
	Wed, 16 Apr 2025 19:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744832832; cv=none; b=keXGom1Bb0LqYZ2JwHCs9DrXNCauWJkKAz9vAzn9hiXWCr1bTr2Nj5+TZR9T2uOJJOdEENkmLseD0EaJHvq93LiJ3sT0av47508rTP+iDpI18jb2IdFgYdgeXGXS5YoRdRtcyaxA/aAJoxWd2KEBY4mZ691KCajtaCZH/v6Z1sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744832832; c=relaxed/simple;
	bh=0PhO42tR4MBFdqcoAgVO0dfRkfAO0bYzQ9epoxhkTl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5vo55jakv3oGq9B+uazvturA4+4llQh7C5NGeIok8zuXgF9Yu+yxkmGHSyUQh9NrT4rGp1KRKTXTIDiU38JhjYgKUbvwZDewQ1Ej0iQNuO/QJb1ZsXnrvWICqDmaa0REXFGtgUq7I6YykfvkM12TFsNh3P9WDVW0zvXG1/f+eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLpXnQw5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B57C4CEE2;
	Wed, 16 Apr 2025 19:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744832831;
	bh=0PhO42tR4MBFdqcoAgVO0dfRkfAO0bYzQ9epoxhkTl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oLpXnQw5WTydD8dgCkBMddqP/yUox0iV1OaMVqsQAEY3dSrmErVVzuHjpU7cl5+5C
	 07UrFlwuF2QJvnZOgPif4jm800A4eDdqIfSpm/TC+TGrruqgWUL8j5P7h78yKa1Bb0
	 a03MF+nu6rzL5ze2svO2CGcV1sPtHJqmv0Io9mMnVhHmBbPxP8f89QMCwLMQBfC4HF
	 dXxS6tW99Ka4+LDRqjQi2WckyJofqEqIKpcqL0NQbABS8TnOcH8M1vp1lonaC2dkbx
	 MAtS/vIxgL6j+bUIW3cI48px4FxxusYxz98zglW7T8Mkt5wkzGJ2R9S8HnyUmFz5X/
	 FzXrUBFfHUuJg==
Date: Wed, 16 Apr 2025 12:47:08 -0700
From: Kees Cook <kees@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, elver@google.com,
	andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, yuzenghui@huawei.com,
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas.schier@linux.dev
Subject: Re: [PATCH 2/4] ubsan: Remove regs from report_ubsan_failure()
Message-ID: <202504161246.AB73A176C@keescook>
References: <20250416180440.231949-1-smostafa@google.com>
 <20250416180440.231949-3-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416180440.231949-3-smostafa@google.com>

On Wed, Apr 16, 2025 at 06:04:32PM +0000, Mostafa Saleh wrote:
> report_ubsan_failure() doesn't use argument regs, and soon it will
> be called from the hypervisor context were regs are not available.
> So, remove the unused argument.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Funny. I wonder why I put that argument in there? If we ever need it
again, we can just make it conditional (and let the hypervisor pass
NULL).

Acked-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

