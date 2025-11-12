Return-Path: <linux-kbuild+bounces-9608-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B2234C54B8D
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Nov 2025 23:38:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E98404E06BE
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Nov 2025 22:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE142E0418;
	Wed, 12 Nov 2025 22:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dg2ZvQ33"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A99A207A32;
	Wed, 12 Nov 2025 22:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762986971; cv=none; b=dnhLxSkJuPAHDMIE+ATQQu39HFVt3Diwrz78iu6eosMGP0A75sAICRvCwKky6WCuTrELJMjcuJ7h84qHtd6obMjZxdU739eKdTm1ailmm2gNKxt4r//7SJuK89VE+X/zj61ts/ORjZD4HeOwUvoc7dBqN4tvDmIsYS0Q8fksLsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762986971; c=relaxed/simple;
	bh=yXEQhJI5RG5Lw1JvKiR1Xn/2DUyeNjm4Myc9inc1lOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oocU+rW9DUnaTNlcXSILpw9aS/vITxeDcTOgGkFNGUR/a0LJHfvn0aZagVtNLvIa2hg80CYXcJFCL4w/QmJvxSUbgGmxAFP3P+DAwAhJGe5bK0K5ZV5jVNlbrk44k5rNJEEKaQC5vHnOjx4tu9p87RLy7a7bGPj+iK69BkNerZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dg2ZvQ33; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8929DC4CEF8;
	Wed, 12 Nov 2025 22:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762986971;
	bh=yXEQhJI5RG5Lw1JvKiR1Xn/2DUyeNjm4Myc9inc1lOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dg2ZvQ33MI6Vp6i08ZAtWav4wnAJNuXnm+dLxR8h2Vry9ng6pF5C9Z7lBkd1ctakn
	 tcRQNrpicX8mS5h3YPhLGotqMM62XSPNlHC5SAoo4ceLwZGH9jGrntpKm+qzVjhm+h
	 pQqyXKwvCyNP1sJNHS8ishnwk6uPa/oCKPCnecuqbBeRKPYQwNyCxcfPkI/66Yqx7N
	 auZ2kvT1MpJy1PYVfks4naupVtRSNIr+PonwPeeyTGH4eYNGdxZx5+YZ9yL13D55ix
	 H3/XRMeUXsWxbLm+osCGf9gYia8tBvIMTmIl5jhJu88JtkajU1m8fpQ3sqPiO1lnAZ
	 UPdo3VWbwMwgQ==
Date: Wed, 12 Nov 2025 15:36:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: WangYuli <wangyuli@aosc.io>
Cc: kees@kernel.org, nicolas@fjasle.eu, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	WangYuli <wangyl5933@chinaunicom.cn>
Subject: Re: [PATCH] fortify: Ignore intermediate *.tmp files
Message-ID: <20251112223606.GA3268585@ax162>
References: <20251112114725.287349-1-wangyuli@aosc.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112114725.287349-1-wangyuli@aosc.io>

On Wed, Nov 12, 2025 at 07:47:25PM +0800, WangYuli wrote:
> From: WangYuli <wangyl5933@chinaunicom.cn>
> 
> The test_fortify.sh script generates logs of build-time warnings
> for string and memory functions. To ensure the final log file is
> updated atomically, the script first writes its output to a temporary
> file with a .log.tmp extension. Upon successful completion, this
> temporary file is renamed to the final .log file.
> 
> If the build process is interrupted before this rename operation,
> these *.log.tmp intermediate files will be left in the directory,
> creating a risk of them being accidentally added to the git repository.

Shouldn't the cleanup trap in lib/test_fortify/test_fortify.sh be enough
to avoid leaving behind .log.tmp? Or does that only work for clean
exits? Would adding INT to the trap avoid the problem?

> To prevent this from happening, add *.tmp to the .gitignore file to
> explicitly ignore these temporary files.
> 
> Signed-off-by: WangYuli <wangyl5933@chinaunicom.cn>
> Signed-off-by: WangYuli <wangyuli@aosc.io>

Regardless, this seems fine in the meantime.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  lib/test_fortify/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/test_fortify/.gitignore b/lib/test_fortify/.gitignore
> index c1ba37d14b50..8056bc75b442 100644
> --- a/lib/test_fortify/.gitignore
> +++ b/lib/test_fortify/.gitignore
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  /*.log
> +/*.tmp
> -- 
> 2.51.0
> 

