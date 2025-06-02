Return-Path: <linux-kbuild+bounces-7357-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D26DAACBD0A
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Jun 2025 00:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EDB318905D1
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 22:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B8424EF7F;
	Mon,  2 Jun 2025 22:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mha5jPnh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B61779E1;
	Mon,  2 Jun 2025 22:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748901988; cv=none; b=PsU52fLWMflNVVyLzTOLWUDvSHUSlkFkebV9PBQuu4spHMn50dzxjyWhMwm6tPHLuSciSVH1l/XJi4XCRLzQ8AnN8/KAb5AvDED2+tlIPYM5RS172MtdSzOKs2eLGL4oN9lfVZsAmWHb1ojCH2ArQ4nh/clGIA16CGsfxMQW3bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748901988; c=relaxed/simple;
	bh=YY9h1SUh3KdUSroM6ZHBeTaQBaecLwcnb9EcRLChcLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DX/SEmyfKA+R5o0PX8NJgmpS+LCm1w4Loq3r2mNS3udYBkP+u88mFHmgWWJqspaGZVX4BRl0KDA8OCCQ4S3njMePMA5MyaDuduyzAIoN/vNuTLpsCXSKBLq/FGKUjuKSk0J8iGYcWFv5DrnsXFeVI+XSCyJtk8Q77JsBAq2AZu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mha5jPnh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40E0C4CEEB;
	Mon,  2 Jun 2025 22:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748901988;
	bh=YY9h1SUh3KdUSroM6ZHBeTaQBaecLwcnb9EcRLChcLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mha5jPnhrvWKfdFXSdADl157MGSJuVIHYlkqilc4st5E0q+eSyrva5ilrS19tOMgt
	 q2opmLsDyJkMVoXY0TbpjY/QFfkja7a93ga+PNvAYg0O5WT4Lpz0eYvb5avLoLW9wT
	 v6YqevQhl2ynS1OJrT1AgMVQdZCTL93eIHb91+DcD622n4hXX8TdsBN9+FwykJ0ivo
	 Ckkntgn3J5khX8znOxQiplwwfeqE+1haqb2hkeOjXog5KXPkPFL0iYR6LDIHXnFrKt
	 gDKdAqW+oG7sItNj9/XyPoGJIvAE57NbM4VSnclXv9Ym9iBvIbEO4yxBdOIkkCURCv
	 pcUzUG6LpAL1g==
Date: Mon, 2 Jun 2025 15:06:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas.schier@linux.dev>
Subject: Re: [PATCH v2 1/4] kbuild: move W=1 check for scripts/misc-check to
 top-level Makefile
Message-ID: <20250602220624.GB924363@ax162>
References: <20250601133230.4085512-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250601133230.4085512-1-masahiroy@kernel.org>

On Sun, Jun 01, 2025 at 10:31:27PM +0900, Masahiro Yamada wrote:
> This script is executed only when ${KBUILD_EXTRA_WARN} contains 1.
> Move this check to the top-level Makefile to allow more checks to be
> easily added to this script.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> (no changes since v1)
> 
>  Makefile           | 3 +++
>  scripts/misc-check | 9 +--------
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 61f4e7662192..7a52be3a4b80 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1824,9 +1824,12 @@ rustfmtcheck: rustfmt
>  # Misc
>  # ---------------------------------------------------------------------------
>  
> +# Run misc checks when ${KBUILD_EXTRA_WARN} contains 1
>  PHONY += misc-check
> +ifneq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
>  misc-check:
>  	$(Q)$(srctree)/scripts/misc-check
> +endif
>  
>  all: misc-check
>  
> diff --git a/scripts/misc-check b/scripts/misc-check
> index d40d5484e0c5..f37b2f6931cc 100755
> --- a/scripts/misc-check
> +++ b/scripts/misc-check
> @@ -3,15 +3,8 @@
>  
>  set -e
>  
> -# Detect files that are tracked but ignored by git. This is checked only when
> -# ${KBUILD_EXTRA_WARN} contains 1, git is installed, and the source tree is
> -# tracked by git.
> +# Detect files that are tracked but ignored by git.
>  check_tracked_ignored_files () {
> -	case "${KBUILD_EXTRA_WARN}" in
> -	*1*) ;;
> -	*) return;;
> -	esac
> -
>  	git -C ${srctree:-.} ls-files -i -c --exclude-per-directory=.gitignore 2>/dev/null |
>  		sed 's/$/: warning: ignored by one of the .gitignore files/' >&2
>  }
> -- 
> 2.43.0
> 

