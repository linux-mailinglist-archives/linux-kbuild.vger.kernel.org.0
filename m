Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB99231D091
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Feb 2021 19:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbhBPS60 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Feb 2021 13:58:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:48720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229912AbhBPS6Y (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Feb 2021 13:58:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42BAE64E63;
        Tue, 16 Feb 2021 18:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613501864;
        bh=fQCpRy6FRw7Kuf/nVL+Bd46P6wxQZh0qlizFp9H8uPE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LXJgjlQz29m0qnfugE32SxZPNrw5zHQKPtBVVoLJtGaTqFkxitNOHgnclHfufUHOr
         5QMssJaWNwCiQUs20mltKCKZeyIMUOK70v+mhEykEx+MZCRvz4cOFvwWRPrjTcOhgX
         PJTyyYzZ5RMkm/fD3bsganSF/kl+s7yrd3XXUVwht8xSwszSMs7V6EA2H/3cdttYUl
         JSSJmxt/qc+8UeuLuaEi0ENCcY6AHPn44rTX5kRH4/RCTWWYgE+7vdWYREnftN2GhP
         dI6nFl3UfyR+ivXH1XVR9AJQ/MfXUNFOyt8Zekk4Sx/tFh3Nmj3P+aQWUZlh+YYCRt
         uXL4k99SDo6bA==
Date:   Tue, 16 Feb 2021 11:57:42 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        David Laight <david.laight@aculab.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: remove ld-version macro
Message-ID: <20210216185742.GA64801@24bbad8f3778>
References: <20210216031004.552417-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210216031004.552417-1-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 16, 2021 at 12:10:03PM +0900, Masahiro Yamada wrote:
> There is no direct user of ld-version; you can use CONFIG_LD_VERSION
> if needed.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/Kbuild.include | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 08e011175b4c..509e0856d653 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -141,13 +141,9 @@ cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || e
>  # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
>  ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
>  
> -# ld-version
> -# Note this is mainly for HJ Lu's 3 number binutil versions
> -ld-version = $(shell $(LD) --version | $(srctree)/scripts/ld-version.sh)
> -
>  # ld-ifversion
>  # Usage:  $(call ld-ifversion, -ge, 22252, y)
> -ld-ifversion = $(shell [ $(ld-version) $(1) $(2) ] && echo $(3) || echo $(4))
> +ld-ifversion = $(shell [ $(CONFIG_LD_VERSION)0 $(1) $(2)0 ] && echo $(3) || echo $(4))
>  
>  ######
>  
> -- 
> 2.27.0
> 
