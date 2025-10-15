Return-Path: <linux-kbuild+bounces-9152-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8593CBDBE71
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 02:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F9003C5A42
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 00:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102B4194A65;
	Wed, 15 Oct 2025 00:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCOKHgTQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BB917DFE7;
	Wed, 15 Oct 2025 00:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760487566; cv=none; b=AikKAsNxoLf/EuKiwOOW6hc6WpENusO7X3/cWEnrOVU+OTgE6LC2fBVuZHpf/kQh2DJ3WDJVyUGhfaVGXyNuJqYHvUazVqtCJJMOOoIsGcbLlD5yAsj3JEwAP3khOH0alWi6aVpEXa3lD0e9S/b8CAanLEAyS7ZBY6xyuJIIo0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760487566; c=relaxed/simple;
	bh=TdMskMSuLOET5fMzcxW1joo+a/RQRaL7BYkMv9POxOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQu30LNvXLLm4ii2rG7a/J2QMWrwgnvX4CjAyRDJV9FxHgZNRiRQ9zlTgNJCZhfViFKNv5i6QLdizeapl6hBtTN9kktWYr6vILpAw7IqDT251hOzm8wJawBNQi9eGbVrxOiBRElRdzKWF1dpE1PuHwaRif4/8OcMuVX8div7hV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCOKHgTQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4009EC4CEE7;
	Wed, 15 Oct 2025 00:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760487565;
	bh=TdMskMSuLOET5fMzcxW1joo+a/RQRaL7BYkMv9POxOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VCOKHgTQyz5OqtohvgNbdIzjiINb0ww0dsbFUXIsBjbTgHHH2NwSHD3zQPwdKshSG
	 ZsLprc3ZGMUkCXR68VgmghItKdoXwej1sitrFkEtQCwqNfG8rrdoG1dWbyY0ZRk34C
	 cAT1kN6pJs9VI+IHOb1OpAOQ9NlcX6wZIWYGJ/ny1Y1o7whVce1pEHEDuewrrx0mXJ
	 K/3I/UDVNWlHXMcNx32ZZuJ4WXddrzxqGbY/dVhNqR+dNz8BPU72tSIs5t2rtYRtFr
	 veieaNgJm2uK9sFuiCrR+w9yBSTWgKk544R+6WCA2eU7SHihPnRWnOJmLhRiUpf+t6
	 wNtadfndF1IHA==
Date: Tue, 14 Oct 2025 17:19:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: uapi: reuse KBUILD_USERCFLAGS
Message-ID: <20251015001921.GA2263607@ax162>
References: <20251014-kbuild-uapi-usercflags-v1-1-c162f9059c47@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014-kbuild-uapi-usercflags-v1-1-c162f9059c47@linutronix.de>

On Tue, Oct 14, 2025 at 07:55:32AM +0200, Thomas Weiﬂschuh wrote:
> The toplevel Makefile already provides the compiler flags necessary to
> build userspace applications for the target.
> 
> Make use of them instead of duplicating the logic.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---

Seems reasonable to me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

>  usr/include/Makefile | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/usr/include/Makefile b/usr/include/Makefile
> index 61a7dd4fc05f004d785c64c0019ad846c84719d5..d8a508042fed315401ed689e0839af249c4b31c8 100644
> --- a/usr/include/Makefile
> +++ b/usr/include/Makefile
> @@ -6,16 +6,9 @@
>  #
>  # -std=c90 (equivalent to -ansi) catches the violation of those.
>  # We cannot go as far as adding -Wpedantic since it emits too many warnings.
> -UAPI_CFLAGS := -std=c90 -Wall -Werror=implicit-function-declaration
> +UAPI_CFLAGS := -std=c90 -Werror=implicit-function-declaration
>  
> -# In theory, we do not care -m32 or -m64 for header compile tests.
> -# It is here just because CONFIG_CC_CAN_LINK is tested with -m32 or -m64.
> -UAPI_CFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
> -
> -# USERCFLAGS might contain sysroot location for CC.
> -UAPI_CFLAGS += $(USERCFLAGS)
> -
> -override c_flags = $(UAPI_CFLAGS) -Wp,-MMD,$(depfile) -I $(obj) -I $(srctree)/usr/dummy-include
> +override c_flags = $(KBUILD_USERCFLAGS) $(UAPI_CFLAGS) -Wp,-MMD,$(depfile) -I $(obj) -I $(srctree)/usr/dummy-include
>  
>  # The following are excluded for now because they fail to build.
>  #
> 
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251013-kbuild-uapi-usercflags-affb222af087
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 

