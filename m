Return-Path: <linux-kbuild+bounces-3288-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAE2964D5F
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2024 20:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE3FF1C22023
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2024 18:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17EB14D2B9;
	Thu, 29 Aug 2024 18:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4+wmVBr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7588145336;
	Thu, 29 Aug 2024 18:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724954468; cv=none; b=k6xDrqyndQZ6olHUCnhbTVVBHIcmurzVaUN/ZBBDEB3YiN9QPDfqqmN+fWK2nbkWTBe83eOtcOn+OTSamXktDw2Fj7C/JUhT3CKNaNRLqSTwUyaYb0EZaUwN+k3cLylbZCcu3+wUWcUDKKxgaftDeJLrxKkbUIKiT2NuLEYn3Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724954468; c=relaxed/simple;
	bh=d2GOpT6OMKJ/Oj3vKxU6VN6pquEKM0vzQW/XKRZkd4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+q2OYoznRiRoQsZTI0Nwv8FMvGcCmEdjF0sRXCqZb0JgrAomN00YO8Q1JEz3xvWbwk/3ahyFDZpevmoduyfWJ73cwB6/wQUoDEx7QNqmrZfHrpFVuMGkWYv96gY24JTMBNWxf1s4Hm90BqmwTKTGlBNq9n2toFwMChoucCu3Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4+wmVBr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958ECC4CEC1;
	Thu, 29 Aug 2024 18:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724954468;
	bh=d2GOpT6OMKJ/Oj3vKxU6VN6pquEKM0vzQW/XKRZkd4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i4+wmVBrle7vqJdzXMooUcfkJl+1vyBTotgq7AO7u16MftFV7e/2lPJ325AME5Kvr
	 Q6irO/l48TiZhCrEdN5kZT+GaFD+by5FPKQqTVhkndvyfvjncfe1JSi7FvL81C6fe2
	 1fmEnFovDkkPxhzreGNlp4+Ccq7jSGlVM9FFOSBrTE8sood3SXq2wN/Z3CXmWl5FiA
	 QWT7+vP5GpQOJe5+kbteZtwTHVEZXGkaJr4LWJkaRBiBwer9gpjr4su7iidOaVNjgB
	 DmTil1vujDN0vz1WybEvkb289k/SZTCvzoYR2gWvmH5ishTZ/YzvApogKxsKFvFU7P
	 kuoZh5PquriSQ==
Date: Thu, 29 Aug 2024 11:01:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tony Battersby <tonyb@cybernetics.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kbuild@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kbuild: remove recent dependency on "truncate" program
Message-ID: <20240829180106.GA3382912@thelio-3990X>
References: <d65e598f-4d3e-4092-bc39-16b636181708@cybernetics.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d65e598f-4d3e-4092-bc39-16b636181708@cybernetics.com>

On Thu, Aug 29, 2024 at 09:51:25AM -0400, Tony Battersby wrote:
> Remove the recently-added dependency on the truncate program for
> building the kernel.  truncate is not available when building the kernel
> under Yocto.  It could be added, but it would be better just to avoid
> the unnecessary dependency.
> 
> Fixes: 1472464c6248 ("kbuild: avoid scripts/kallsyms parsing /dev/null")
> Signed-off-by: Tony Battersby <tonyb@cybernetics.com>

Seems reasonable to me and appears to generate an identical result for
me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/link-vmlinux.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 070a319140e8..c27b4e969f20 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -215,7 +215,7 @@ kallsymso=
>  strip_debug=
>  
>  if is_enabled CONFIG_KALLSYMS; then
> -	truncate -s0 .tmp_vmlinux.kallsyms0.syms
> +	true > .tmp_vmlinux.kallsyms0.syms
>  	kallsyms .tmp_vmlinux.kallsyms0.syms .tmp_vmlinux0.kallsyms
>  fi
>  
> 
> base-commit: 3e9bff3bbe1355805de919f688bef4baefbfd436
> -- 
> 2.25.1
> 

