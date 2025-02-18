Return-Path: <linux-kbuild+bounces-5826-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 175F0A3A5F3
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 19:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AB6C176903
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 18:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C6B1F5832;
	Tue, 18 Feb 2025 18:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TWq6yUTM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38E817A30E;
	Tue, 18 Feb 2025 18:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904079; cv=none; b=T028KXO1ujygEmCa/A6T88EjUQ6/STdgaFQMbuzPYO8fk3KBhDrnk9/7kAS1APkXxbSDYSf7r2IiCofzLZzZUclKJHF3r4wrJ9YjJZ+gVzxmJG2joRGevxGjFq/2Eduu5tX9AAtkc348CBuBTcfHYD6TvVzRMpGh2LPNHf2sJj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904079; c=relaxed/simple;
	bh=0n/N4OIMFC/2nMujN0L1S/sXtFEZdrSCzgbpESuMTxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHWW0NORIq3UoL9A1z7hhjp2QffsTYXqt3xbi7EeYXH8mRiAtBF3CVnVxvgDYg6cRvl6nCHDiWvoE63th/iAM7YchOFUeJr+UJxyG6QkSMaJ5+jaqH4DQfKUHRPlmJ01FSSzP1r5a54hPqJupruAe+0D+COc/Nci7zZYn37ioHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TWq6yUTM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61EA7C4CEE2;
	Tue, 18 Feb 2025 18:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739904074;
	bh=0n/N4OIMFC/2nMujN0L1S/sXtFEZdrSCzgbpESuMTxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TWq6yUTMhM30VHPmrJgTSC+OuoF3COyvfzi3NZaH0PjfGH4CO1353g0qz2RXkumYn
	 zJUH48qbksTNskXdIwln6rdqhzYP0E61y+DFL1ZkGC4RFSyUJIe5tmU/WaVCYjFDGc
	 ffbRFU+nnswr1mLyqSK0Ga2/tHzdZKt9W8YGr3/4LHLwGFpyGvYiHYIKKRi0LBnNE4
	 gzWNfPs6gWkmugHdbk152KLobi6gOUEAxC/J/uzcfB6RZIk2cDLCqAMB7MiAIhjAUd
	 raFDDNhQjpCEaF3/EFeYJVEISMtX49jkmIAzStOXksyRdCzQBLkfn9z+GsibXmMWls
	 6hoV0j0X82g+A==
Date: Tue, 18 Feb 2025 11:41:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] kbuild: remove KBUILD_ENABLE_EXTRA_GCC_CHECKS support
Message-ID: <20250218184110.GA1316487@ax162>
References: <20250217113706.1012816-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217113706.1012816-1-masahiroy@kernel.org>

On Mon, Feb 17, 2025 at 08:36:48PM +0900, Masahiro Yamada wrote:
> Commit e27128db6283 ("kbuild: rename KBUILD_ENABLE_EXTRA_GCC_CHECKS to
> KBUILD_EXTRA_WARN") renamed KBUILD_ENABLE_EXTRA_GCC_CHECKS in 2019.
> The migration in downstream code should be complete.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Seems reasonable.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  Makefile | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 96407c1d6be1..3c1b012a156f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -151,9 +151,6 @@ endif
>  
>  export KBUILD_EXTMOD
>  
> -# backward compatibility
> -KBUILD_EXTRA_WARN ?= $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)
> -
>  ifeq ("$(origin W)", "command line")
>    KBUILD_EXTRA_WARN := $(W)
>  endif
> -- 
> 2.43.0
> 

