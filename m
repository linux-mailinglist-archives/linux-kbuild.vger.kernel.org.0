Return-Path: <linux-kbuild+bounces-7484-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1E6AD79AF
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 20:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52C7F3B5000
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 18:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AEA52C326E;
	Thu, 12 Jun 2025 18:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1G0aU2n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48E51DACB1;
	Thu, 12 Jun 2025 18:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749752155; cv=none; b=gj18qou7UIRDVuOYHhSGxvFakaMXbk+QWqNozhHxVr2PT0mqFDHItZJ/Q1LFRJgiR9ck+yRwdoWi+mnKIgtHV1uJ52CRGD//Tvkgs9o//hpD0qELLbOmDKP177/Q9t3QDFMCH5vsfFuIuDt0Ot/hppdomidBM3a5swJ+ap76xyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749752155; c=relaxed/simple;
	bh=Wo0j/oCe8NblXIJg3ChGf0+Y+1aw2yH2LxL9ts00KxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdaO5e0nzfKZS5hqfS1sZ/syjImuH99olEqILSe0PUllhuQjwk/E1/j3aY4ra5XQznmljxAuCRmqDvR5cS+MR1p8c+pecLh2PPI1KsubCemWZdbYwEqhRcCcl9JETV+TLLO3v2AdP0tb+15FoZqhRagSH26cUA3ZLdH1Z/oW3I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1G0aU2n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C989DC4CEEA;
	Thu, 12 Jun 2025 18:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749752155;
	bh=Wo0j/oCe8NblXIJg3ChGf0+Y+1aw2yH2LxL9ts00KxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K1G0aU2nJjX+WD8aeEeeuYtFAL1NCPM6gDr89ajLVDS8o3fHbIOfxI4Zf5DuDzmpz
	 LPv0Gsgq5O+XKYgKerXZCcUiYzvffzKgbqC5FELBQi90z6NLElOkzwjQl/9TMIW9nY
	 YTjOyH01416+BXV9DoAyE+Adi7vK9y34Qe9ZoPq0AuUHkVNCd0PIWdo0tuYe8NHCiD
	 Npb0YGiohhYjYvkF5NGTJMf7JqAUCfIOLLbq/ak1nfeHxN4DS9EqH+ZhxStWSr75Hz
	 4alh8EuezMaXDwO1IrDeqZ36hg61UZPoS8hSQA3q+1XkO3HyJ8V2G/D0PA3qMiTCiL
	 eRTG2ssFSByEg==
Date: Thu, 12 Jun 2025 11:15:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Sean Christopherson <seanjc@google.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: move warnings about linux/export.h from W=1 to
 W=2
Message-ID: <20250612181551.GA815757@ax162>
References: <20250612160850.3007038-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612160850.3007038-1-masahiroy@kernel.org>

On Fri, Jun 13, 2025 at 01:08:48AM +0900, Masahiro Yamada wrote:
> This hides excessive warnings, as nobody builds with W=2.
> 
> Fixes: a934a57a42f6 ("scripts/misc-check: check missing #include <linux/export.h> when W=1")
> Fixes: 7d95680d64ac ("scripts/misc-check: check unnecessary #include <linux/export.h> when W=1")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  Makefile           |  3 ---
>  scripts/misc-check | 15 ++++++++++++---
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 35e6e5240c61..69c534982415 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1832,12 +1832,9 @@ rustfmtcheck: rustfmt
>  # Misc
>  # ---------------------------------------------------------------------------
>  
> -# Run misc checks when ${KBUILD_EXTRA_WARN} contains 1
>  PHONY += misc-check
> -ifneq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
>  misc-check:
>  	$(Q)$(srctree)/scripts/misc-check
> -endif
>  
>  all: misc-check
>  
> diff --git a/scripts/misc-check b/scripts/misc-check
> index a74450e799d1..84f08da17b2c 100755
> --- a/scripts/misc-check
> +++ b/scripts/misc-check
> @@ -62,6 +62,15 @@ check_unnecessary_include_linux_export_h () {
>  	xargs -r printf "%s: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present\n" >&2
>  }
>  
> -check_tracked_ignored_files
> -check_missing_include_linux_export_h
> -check_unnecessary_include_linux_export_h
> +case "${KBUILD_EXTRA_WARN}" in
> +*1*)
> +	check_tracked_ignored_files
> +	;;
> +esac
> +
> +case "${KBUILD_EXTRA_WARN}" in
> +*2*)
> +	check_missing_include_linux_export_h
> +	check_unnecessary_include_linux_export_h
> +	;;
> +esac
> -- 
> 2.43.0
> 

