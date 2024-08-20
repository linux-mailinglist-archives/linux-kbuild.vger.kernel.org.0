Return-Path: <linux-kbuild+bounces-3121-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE557958DAE
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 19:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AA1728216C
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 17:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9A4192B66;
	Tue, 20 Aug 2024 17:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rv99k3kz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60BF482FF;
	Tue, 20 Aug 2024 17:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724176669; cv=none; b=BVQSkTjNLfG9QforR8BRo6n9T0iQVSPJqNVWQQ7jnRD5iCYVNvmsLtmutEgrd0jBhzR5GBmsHhkvrAD2VxNGz80YBlFs2lw7wicYnDsFJ26IPVa4NmHIgUvA0rvj/5TOIx7SY3KacOTM8t/j+5xP2ET7gd1M3G+hyrokpu0lZ54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724176669; c=relaxed/simple;
	bh=/snmJz0/53y57+k2K0s7WgCOZoqAqvhpoUcgRgDZwuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtYA/rCXxspiDJQxG98S8vpQaiW1bl30x5qC0Y7cSvPMbSV5MdG/hBdDoSShSDfoejIvvkaLgntKjfvz97H4kkmeGhbV/q7WXJM2bfWizJWpP/Sc7XlwxuAjmUWryq2rQ68uKSj1Y32N7ZEDCcP+Dgsc51/ClRppqXzIeC5VSgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rv99k3kz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC507C4AF10;
	Tue, 20 Aug 2024 17:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724176669;
	bh=/snmJz0/53y57+k2K0s7WgCOZoqAqvhpoUcgRgDZwuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rv99k3kzvTnrVzoXtNLwDl+o+N3KTPkBhR0YnAilKuJZ5gVDtRWBZfbn9NoSL4dPH
	 5+puw0LKOaoAb4n3WhF+W5Z+XHSsqGgwmkfiCO5v8juEJcCzifgp/959wvbN1SD+WS
	 3/IjsUMcCyvp4yY1W8RBfWE1hfOilZpZr21QC8IEySzYHNulBzJQWvuVCTbh4gmcBu
	 FRLwX/m13mCCEjVAIpc6u5DPyURzlnxdRfKsdQlAsRkbSI2oB45vG33lOOSBAEzBxc
	 vhsvYi0ir0x85FXWktV1yKqKdLiURBoEU2D2bdlYoDymW7qUJ4i6OxuCnIXwdNMxVm
	 troSv+cB28B6A==
Date: Tue, 20 Aug 2024 10:57:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: David Lechner <dlechner@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/get_abi.pl: more strict matching of [XYZ]
Message-ID: <20240820175747.GA1741066@thelio-3990X>
References: <20240820-scripts-fix-get_abi-xyz-v1-1-6f6aea9b638b@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820-scripts-fix-get_abi-xyz-v1-1-6f6aea9b638b@baylibre.com>

Hi David,

On Tue, Aug 20, 2024 at 11:40:18AM -0500, David Lechner wrote:
> When using `scripts/get_abi.pl undefined --search-string=iio` to try to
> find undocumented ABI's in the IIO subsystem, no matches were found.
> 
> This was due to the fact that we have documented a directory naming
> pattern:
> 
> 	What: /sys/bus/iio/devices/iio:deviceX
> 
> which gets translated to the regex
> 
> 	/sys/.*/iio\:device.*
> 
> which matches everything under every iio:device directory, causing any
> attributes below this directory to incorrectly be filtered out as
> already documented.
> 
> This patch makes the matching more strict by changing the replacement
> for [XYZ] from .* to [^/]* so that we don't match the directory
> separator. This way documenting directories won't filter out everything
> contained in the directory as already being documented.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
> get_maintainers.pl didn't pick up any matches for this patch, so I guess
> this would go through the kbuild tree? (Since MAINTAINERS says:
> "KERNEL BUILD + files below scripts/ (unless maintained elsewhere)")

I don't have any comments on the patch itself since I am unfamiliar with
this script and its purpose but looking at the git history, it seems
like Greg has merged the vast majority of the patches to this script in
the past:

$ git log --format='%cn' --no-merges scripts/get_abi.pl | sort | uniq -c
     53 Greg Kroah-Hartman
      9 Jonathan Corbet
      1 Masahiro Yamada

So adding him to take a look.

> ---
>  scripts/get_abi.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
> index de1c0354b50c..f65158694852 100755
> --- a/scripts/get_abi.pl
> +++ b/scripts/get_abi.pl
> @@ -867,7 +867,7 @@ sub undefined_symbols {
>  			$what =~ s/\{[^\}]+\}/.*/g;
>  			$what =~ s/\[[^\]]+\]/.*/g;
>  
> -			$what =~ s/[XYZ]/.*/g;
> +			$what =~ s/[XYZ]/[^\/]*/g;
>  
>  			# Recover [0-9] type of patterns
>  			$what =~ s/\xf4/[/g;
> 
> ---
> base-commit: 521b1e7f4cf0b05a47995b103596978224b380a8
> change-id: 20240820-scripts-fix-get_abi-xyz-0ab0b9b62719
> 
> Best regards,
> -- 
> David Lechner <dlechner@baylibre.com>
> 

