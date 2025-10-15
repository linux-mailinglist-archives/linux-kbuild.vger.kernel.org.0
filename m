Return-Path: <linux-kbuild+bounces-9184-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D681BE0FF1
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Oct 2025 01:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B929E548654
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 23:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AD7316194;
	Wed, 15 Oct 2025 23:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsWeRbEW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7443115B5;
	Wed, 15 Oct 2025 23:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760569637; cv=none; b=P5a+ofXcVB+oc9ca6uLvzy/gyf4gVjpU8NauCC7+L9YkHnXmknCtFd2KOnfXYjvipP6rSrXeLIp6fpeQHlxOHOw92UnTCYvavxN2rlSdir3maPaeudr4irZlzjS7wI/3UrVqGmyfSnBqO3LxxMGnZ97hqZlV8kt65+JObVyK65A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760569637; c=relaxed/simple;
	bh=JAnOLWTWDq62vK406Qv1mw07MklzrcXhxgqE2FkO1Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqjESVkOY7bh7RLIpE+We0Z7NAm5TWfBhOYRbrie/VkTVFf3G3ssKTiZrsNkbV1WuFMf9FLFrJ4xLxO4BjJfw/jRSj/xWeTFgSKp0sJG8qf7+oBFtOWwvY7iWVPDI9J3G6YiAKCMUWff0IDmsVVPuUDu5Ap8IqwVOKMtPhcS+jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsWeRbEW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBCEC4CEF8;
	Wed, 15 Oct 2025 23:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760569637;
	bh=JAnOLWTWDq62vK406Qv1mw07MklzrcXhxgqE2FkO1Ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YsWeRbEW5qJZjdaMYpi0ew87rdt5TmprwpnkWblwFgtacPB/90JTnPsF3DAHe994i
	 0MuBoiOgWCJvozny66IKrfNSM3kHdB+Ql4IALT5OVKodWJL9xz1h0EuJTaU+p/E9EO
	 KsERr0RHm/WPZ6RcluGgE5K48+qeJ58+mSB/Y4HMiCJ6sciE1EZIoaX0hOS+FEdE8J
	 OCQhB8X77riHlcA+c71auEacJy9QPQPsIaagU364ve+10r6AsoH+w+ouO9eWz3CvkV
	 ik/mCBAw2P/VnEno7ZOUpYvw5nTwXhm8jrlLtB6kypv5EFpd3bs9oYjIiz8gwBvuJn
	 kR3qW+Wcxt47w==
Date: Wed, 15 Oct 2025 16:07:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: mike.malyshev@gmail.com
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: Use objtree for module signing key path
Message-ID: <20251015230712.GA3943617@ax162>
References: <20251015163452.3754286-1-mike.malyshev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015163452.3754286-1-mike.malyshev@gmail.com>

On Wed, Oct 15, 2025 at 04:34:52PM +0000, mike.malyshev@gmail.com wrote:
> From: Mikhail Malyshev <mike.malyshev@gmail.com>
> 
> When building out-of-tree modules with CONFIG_MODULE_SIG_FORCE=y,
> module signing fails because the private key path uses $(srctree)
> while the public key path uses $(objtree). Since signing keys are
> generated in the build directory during kernel compilation, both
> paths should use $(objtree) for consistency.
> 
> This causes SSL errors like:
>   SSL error:02001002:system library:fopen:No such file or directory
>   sign-file: /kernel-src/certs/signing_key.pem
> 
> The issue occurs because:
> - sig-key uses: $(srctree)/certs/signing_key.pem (source tree)
> - cmd_sign uses: $(objtree)/certs/signing_key.x509 (build tree)
> 
> But both keys are generated in $(objtree) during the build.
> 
> This complements commit 25ff08aa43e37 ("kbuild: Fix signing issue for
> external modules") which fixed the scripts path and public key path,
> but missed the private key path inconsistency.
> 
> Fixes out-of-tree module signing for configurations with separate
> source and build directories (e.g., O=/kernel-out).
> 
> Signed-off-by: Mikhail Malyshev <mike.malyshev@gmail.com>

Seems reasonable to me but I have not tested to verify.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/Makefile.modinst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index 1628198f3e830..9ba45e5b32b18 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -100,7 +100,7 @@ endif
>  # Don't stop modules_install even if we can't sign external modules.
>  #
>  ifeq ($(filter pkcs11:%, $(CONFIG_MODULE_SIG_KEY)),)
> -sig-key := $(if $(wildcard $(CONFIG_MODULE_SIG_KEY)),,$(srctree)/)$(CONFIG_MODULE_SIG_KEY)
> +sig-key := $(if $(wildcard $(CONFIG_MODULE_SIG_KEY)),,$(objtree)/)$(CONFIG_MODULE_SIG_KEY)
>  else
>  sig-key := $(CONFIG_MODULE_SIG_KEY)
>  endif
> -- 
> 2.43.0
> 

