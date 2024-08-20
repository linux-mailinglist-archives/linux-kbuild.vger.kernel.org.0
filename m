Return-Path: <linux-kbuild+bounces-3129-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F59959003
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 23:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D240FB2196A
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 21:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A301C4624;
	Tue, 20 Aug 2024 21:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ntjmWcX/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E35014B097;
	Tue, 20 Aug 2024 21:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724190957; cv=none; b=FbQYFxq3SMI70X6KMrL4+6SMI4NyYTm+AkiM0f3BZljekuTYJ5lKUQP7rqLDdMZzMG/Q9Cm9GfpifFr6SpUWK1PkvYqHOt9Q4rVBrT0n+eD2VOCddi50nKkpqFUy58rkVEKi2XQGwlOiLeOk7t/p9B7L4T9q0v3xAhNytWv3la0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724190957; c=relaxed/simple;
	bh=e4jEwACfR4RmVBcPlf/bwbLa0l+qu6FhgvbqbwhMsac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6jz5CFGEtU49n8famCtSat3Fy0R83CJaaV1wDbqIu5AkTx0kQHRlRKzgTyeECXb5gcR7MD4dPg8rhHr3RLWgkVzjtLslEZOr9OtpC2wPhsQqzplhM6HbH5vwDDZXuqNBp+y/hcIL630wnN14/DEyBV2mT/c5UdtJCjyNCAGhbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ntjmWcX/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC477C4AF09;
	Tue, 20 Aug 2024 21:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724190957;
	bh=e4jEwACfR4RmVBcPlf/bwbLa0l+qu6FhgvbqbwhMsac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ntjmWcX/4q0xzoSsIrAF2AcwmY3Af0LHWx2anga1Te/8B9Q8MCctopFJmvAdcLHEn
	 v03JPFlRzUpBUS5d6De4fJ53ZyAoZNcFKhqfZtxS7uiqKWhZQYdREIdNjQJzYrZK11
	 2BviiKHdkWLsD646I2AsXFPuvTMsdc3BUK8t10SjDVBAmt/Vx8BbsqyC5qKWE05Vnn
	 raI9H5fTlrFcga9e9Y1JUOlCp4s4ueHb1pmcxv+j61SUqM9gSuW7C7DS7x5llyJ306
	 qzZBXKdJH5CK8DkoWGYXG/7r3FFev03hVwKQDCaD/5x+UOFQWhk0VDbk0jvnQLB2UZ
	 T+RvIhd8qSE/Q==
Date: Tue, 20 Aug 2024 14:55:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] kbuild: remove *.symversions left-over
Message-ID: <20240820215555.GB2335251@thelio-3990X>
References: <20240818083806.90631-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818083806.90631-1-masahiroy@kernel.org>

On Sun, Aug 18, 2024 at 05:37:29PM +0900, Masahiro Yamada wrote:
> Commit 5ce2176b81f7 ("genksyms: adjust the output format to modpost")
> stopped generating *.symversions files.
> 
> Remove the left-over from the .gitignore file and the 'clean' rule.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  .gitignore | 1 -
>  Makefile   | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/.gitignore b/.gitignore
> index 7902adf4f7f1..ac8c667c0df6 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -46,7 +46,6 @@
>  *.so.dbg
>  *.su
>  *.symtypes
> -*.symversions
>  *.tab.[ch]
>  *.tar
>  *.xz
> diff --git a/Makefile b/Makefile
> index 0a364e34f50b..c8d651a30397 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1946,7 +1946,7 @@ clean: $(clean-dirs)
>  		-o -name '*.c.[012]*.*' \
>  		-o -name '*.ll' \
>  		-o -name '*.gcno' \
> -		-o -name '*.*.symversions' \) -type f -print \
> +		\) -type f -print \
>  		-o -name '.tmp_*' -print \
>  		| xargs rm -rf
>  
> -- 
> 2.43.0
> 

