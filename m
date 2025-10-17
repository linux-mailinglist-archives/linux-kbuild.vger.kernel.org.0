Return-Path: <linux-kbuild+bounces-9211-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADDFBEBCD8
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Oct 2025 23:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C718C4EDC66
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Oct 2025 21:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4CBD3328E9;
	Fri, 17 Oct 2025 21:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koYhk4mI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A883321C5
	for <linux-kbuild@vger.kernel.org>; Fri, 17 Oct 2025 21:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760736138; cv=none; b=W4tOpwwJaVs/7k7m5mQ/Ss7ScFV7IBhgP6td0vcCSdlyUIUiBcfuk6DX/DK8o3uFa/DVGhBhByLCDOgPoUuz+Fj+o/L+DL6tec6uOgfHA9XuHCnZDmni4aeKKYOQWnYh/VoyAoOy/mwG1iusZm2aVmIJFE/hSnl7x98NlUbVUn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760736138; c=relaxed/simple;
	bh=HoEP1Fg23nSGKfXjNqcc3C13oddgZHCEpMphot5vvSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icgwqy3Oil8am/9hyZ/zx3bVrq+1gldSTMSD//9a1H4qee6tPrScheOWFWiIbwm3XQKwRmTO320DepPWA0MRponhmmEuzZELhZmtNdzpzn+l3QEZgh3OPj22JPvTWPV56n6JwUx02qT9kNwOQwWwQm76YekCZjNxLkk6IFZnetI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koYhk4mI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A504C4CEE7;
	Fri, 17 Oct 2025 21:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760736138;
	bh=HoEP1Fg23nSGKfXjNqcc3C13oddgZHCEpMphot5vvSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=koYhk4mIPjAu1rHClD4Ratr7U5K6QN0hiv6lvPbgoaleaAkhfQk+2Lcyah7TuGwEX
	 +i6lcQaMhijShp5BdJBLx7JHkjKA6BMoWZWB9CkG54lxBAzFT2CPfOC5cCi3MJaT+5
	 yXcUlZbVh3y8CdwPJR9ce2W/UfsnxgoZJN0gk8k3QgK6FwlOIl+RyYloxWB6pOW59j
	 usZm3Remkm751NuHllekTIpT34P6LKmZAFYyMVssS+d9H+rhTF4eckoLB7k6eCE8Jy
	 UVYXkvtkcJkO6rlqW/huFx3lIAtLfXrqEick4Vl2R3vEprbguEhULvejK9EiFvSe84
	 nYx1mV/9xHo0Q==
Date: Fri, 17 Oct 2025 22:22:14 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Pat Somaru <patso@likewhatevs.io>
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts: Add check-build-warnings.pl for tracking kernel
 build warnings
Message-ID: <20251017212214.GA2776486@ax162>
References: <20251017170354.2660704-1-patso@likewhatevs.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017170354.2660704-1-patso@likewhatevs.io>

Hi Pat,

On Fri, Oct 17, 2025 at 01:03:54PM -0400, Pat Somaru wrote:
> Add scripts/check-build-warnings.pl to automate the guidance in
> Documentation/process/maintainer-netdev.rst regarding new-warning-free
> code submissions. The netdev maintainers require that patches do not
> introduce new compiler warnings, and this script provides an
> automated/fool-proof way to do this with paste-into-commit-msg friendly
> output. This is not so much for netdev (which has it's own out-of-tree
> automation for this) but for folks who want to apply that bar to their
> contributions elsewhere and to have an easy way to communicate that with
> reviewers.
> 
> This script builds the kernel with specified targets and warning levels,
> saving warnings as baselines that can be checked against later builds to
> detect newly introduced warnings. This allows developers to easily
> verify their changes don't add new warnings before submitting patches.
> 
> Key features:
> - Automatic baseline creation and comparison per-target and
>   per-warning-level
> - Warning files stored alongside build artifacts (like .cmd files)
> - CONFIG_WERROR automatically disabled to capture warnings without build
>   failure
> - Support for W=1, W=2, W=3 extra warning levels
> - Clean by default to ensure all warnings are captured (not just changed
>   files)
> - Optional --no-clean for faster iterative development
> 
> Usage examples:
>   # Save initial baseline for a driver
>   scripts/check-build-warnings.pl --save-baseline drivers/net/ethernet/intel/
> 
>   # Check for new warnings after making changes
>   scripts/check-build-warnings.pl --check drivers/net/ethernet/intel/
> 
>   # Use stricter W=1 warnings (separate baseline)
>   scripts/check-build-warnings.pl --save-baseline --warn=1 drivers/net/

I don't know Perl so I cannot really review this but I do not see why
developers cannot just use 'make -s' and/or W=e (to set -Werror) to make
sure their code is warning free? I guess it could be helpful if there
are a lot of additional existing warnings in the code being modified but
those should be fixed, not just ignored.

Cheers,
Nathan

