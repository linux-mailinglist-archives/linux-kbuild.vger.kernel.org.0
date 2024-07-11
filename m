Return-Path: <linux-kbuild+bounces-2473-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6ED92F0C7
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2024 23:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32E90B223BC
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2024 21:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E5819F471;
	Thu, 11 Jul 2024 21:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAx7V/K/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4A619F469;
	Thu, 11 Jul 2024 21:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720732420; cv=none; b=rcNYRlqdxkHFBH4s76JvQAHpNUmQn5X20KE5dbXW0ailr53HaHMTvaOTl6VJJrSE1JENdpQSsr3bcv7h66LlqpDHFsN6zDXkrfCZ2J8h6fWHd294h9f9FuiT5NBecbCSr8DY6xil6jAlxyPqjH6DojWcuiDa4t2fQjX5uqlhKy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720732420; c=relaxed/simple;
	bh=Ws6Is+XY+GPsWr4+glUXgcS3bKlK71FHCFwR8f4r89U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMLAtHX0uoDGNnRbNKXXyKDdlyjuI0GeKBt4k3Y/fQFWU0BJl8UjwHwLqpCco1V+jnDxIZiAzGvQzp+Ql52LgnO8u1SqTnsiPYuCrm2ZK7GjKjdOZjU6VOexnXwTotq6U3brB4LM4Wr2aNflP1bGZfXisgyPIpM2MsnrN+s5RgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAx7V/K/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2AEC4AF09;
	Thu, 11 Jul 2024 21:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720732419;
	bh=Ws6Is+XY+GPsWr4+glUXgcS3bKlK71FHCFwR8f4r89U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WAx7V/K/j/9156Ne/5x5y9FPwJtZSEakKH6VRNKFfpgHXuzDYtyxU1AGKkoUpEK2i
	 3dlt7OurTzXDFO5XrEAvsOBWe0xH0JMr8O0ID1z+bWPE0lAnqKmH0rX4vhAW7VtmHs
	 3H7V6wtb5rJfN28GwkC1Gh+hEXpSCHK/FdyeMeZznB3Un2VNuPV4sjIMQNDjddlrXZ
	 tnUfwemlsTXCRR3ATBKanZlto3yOKHPTAfE6lkyhOaukPl0ZU7eI0dQ0+G/pdyFC7C
	 Y87RaprGkZdHH68VUsgRa55D+01cmJ160DwcIEc8Sw/aY6BcJqcH7isrzBzRliUHFS
	 vWqJ+bV7+PD6g==
Date: Thu, 11 Jul 2024 14:13:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: masahiroy@kernel.org, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: rpm-pkg: avoid the warnings with dtb's listed
 twice
Message-ID: <20240711211337.GA1816765@thelio-3990X>
References: <20240711164935.1369686-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711164935.1369686-1-jtornosm@redhat.com>

On Thu, Jul 11, 2024 at 06:49:19PM +0200, Jose Ignacio Tornos Martinez wrote:
> After 8d1001f7bdd0 (kbuild: rpm-pkg: fix build error with CONFIG_MODULES=n),
> the following warning "warning: File listed twice: *.dtb" is appearing for
> every dtb file that is included.
> The reason is that the commented commit already adds the folder
> /lib/modules/%{KERNELRELEASE} in kernel.list file so the folder
> /lib/modules/%{KERNELRELEASE}/dtb is no longer necessary, just remove it.
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>

Guess I'm not looking back in my build logs...

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/package/kernel.spec | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index 4b7df76076c4..74355ff0e106 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -83,7 +83,6 @@ ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEA
>  	done
>  
>  	if [ -d "%{buildroot}/lib/modules/%{KERNELRELEASE}/dtb" ];then
> -		echo "/lib/modules/%{KERNELRELEASE}/dtb"
>  		find "%{buildroot}/lib/modules/%{KERNELRELEASE}/dtb" -printf "%%%ghost /boot/dtb-%{KERNELRELEASE}/%%P\n"
>  	fi
>  
> -- 
> 2.45.2
> 

