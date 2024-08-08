Return-Path: <linux-kbuild+bounces-2909-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 623C394C408
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2024 20:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0F1C1F2625C
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2024 18:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86999146A83;
	Thu,  8 Aug 2024 18:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WPNaWY2r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9F533F7;
	Thu,  8 Aug 2024 18:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723140094; cv=none; b=S9vZPCRNu4zT3zeo8BMCQON+xWodQiXVN+G8wNR+m0v18eCUeiH9vGVkxAcAqhOfm+AXjOMvOAgMlqVemg0Bq0LESGYQjqO81rx3IyTinn+RP4VYpVKzKzSHy05udgR9H3jvY5GZf5PxkdQiiplIjBaxYTYQPTNMDud00rq3wNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723140094; c=relaxed/simple;
	bh=/bwcVorn5wFQNYETzQE+54MvAhdIvZ1gVYmgP9MhQbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5tgi0Sqit5tZBBo6MJgB+/FIAaR0Ok4lsImo+PE8dOFjItMNwc086Xc7pxBbG9fsr+d1R2vvx6DATScLrTtEw2gZEDc8+LKP3c3FPfWJclfAfMFfn31ftrbrEa9/IRYUd1j3B8/06aOt96JKy5WHfHJ4347KSu2ZZmn8FJkP9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WPNaWY2r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD831C32782;
	Thu,  8 Aug 2024 18:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723140093;
	bh=/bwcVorn5wFQNYETzQE+54MvAhdIvZ1gVYmgP9MhQbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WPNaWY2ruEXk/tDSsOsHJgksGgbKrjClRsXJpEXuXRnlzWGvd0lI1/ipq33En8uzp
	 8W/SS7uWZrHdOlBVdqVFtJqB+K0wjo/1aczQL8dJtO9ogQ8BBAp8QurcRt+va8h+CA
	 CLjBc2T6MZMFSaZ4BNZkACKvdUYuk3fEsGUtlm4ZCYFwr+UimrxBloNQuYbz0xD/+0
	 kjuDIHtizYaR6htqWY1iU/xrYuTOxa3DPmxqbfFzqG1vm1WT7MLh2nDlwPDkegWJgJ
	 zsnCwo0QDgPemUV3K7flqkbS02tAImCVQ9hVxoP0RIdryvueSeBAAhF22VfT5yiNiq
	 K0/g8TsZwbvIg==
Date: Thu, 8 Aug 2024 11:01:33 -0700
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/remove-stale-files: clean up stale
 lib/test_fortify.log
Message-ID: <202408081101.93071829AA@keescook>
References: <20240808144328.807649-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808144328.807649-1-masahiroy@kernel.org>

On Thu, Aug 08, 2024 at 11:42:36PM +0900, Masahiro Yamada wrote:
> Commit 6eeccc5361e8 ("fortify: refactor test_fortify Makefile to fix some
> build problems") moved test_fortify.log from lib/ to lib/test_fortify/.
> 
> If lib/test_fortify.log from previous builds remains, Git will show it as
> an untracked file. Let's clean it up.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> Kees,
> Please apply this to your tree.

Ah, thanks! I didn't know about this script.

> Or, if you can modify your branch, please squash this to 6eeccc5361e8

Yes; I've squashed it now.

-Kees

> 
>  scripts/remove-stale-files | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
> index f38d26b78c2a..8fc55a749ccc 100755
> --- a/scripts/remove-stale-files
> +++ b/scripts/remove-stale-files
> @@ -21,3 +21,5 @@ set -e
>  # then will be really dead and removed from the code base entirely.
>  
>  rm -f *.spec
> +
> +rm -f lib/test_fortify.log
> -- 
> 2.43.0
> 

-- 
Kees Cook

