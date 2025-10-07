Return-Path: <linux-kbuild+bounces-9030-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BDDBC0533
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 08:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 604513BF3AA
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 06:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7155C21FF5F;
	Tue,  7 Oct 2025 06:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cuuQ3wrW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="93Vuw/zn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A240D1D554;
	Tue,  7 Oct 2025 06:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759818431; cv=none; b=Dd4Fyp5rRTSf64DG5pMrk71hnGNSyL53pN2itKmQnH0vuy8qX+OXyv4rOArWhXo0jurR7Y9tCZ/u2gcR8SPGTC2gSlZZDLb9AAPpvDaLv00g2+s/dR2POTyXfXFTD0ytxcWbC88V/lpMJhPVEBDjx5nI+uLJqEohFgQu2UC9YkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759818431; c=relaxed/simple;
	bh=XL1Cs4AAE/HmT27dr4RXgC0rElpDYULkiJoTnWWa8/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfeKjXQlESDC03Y/22x6mmkgSpbLYhOyFDFV+5Ixjj8ERpUtJVR8XTr9toxKq+koUU06jocWh5YwetbcgUlPsRj597/RneS+2lAvISEK0CKHoU3ATdywCyqYGDTyYP8Q68vV4UXN7MBcxcv8VdNExN8BWRtOkQvJuNq3X+VuHZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cuuQ3wrW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=93Vuw/zn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 7 Oct 2025 08:27:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1759818424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vbR8Lfe3xUkiLuOoon0tPiQgDnxi9ZrKiQVBz2GlyjA=;
	b=cuuQ3wrWAr1WsWEb1ZWdR4plpO/Dn2RL+Xbro5KbVxIDz7CjXOiV5r6R6IZEmdNKdg+dqs
	F5m8XxPlONaG11oEYGJX5ytQn25xNDSjGOg6+5yurrP+M7a8R4MbKX1sEWrJ/c6Bx2hqo6
	F2lWxf2+hBVU/vdR+X3wdsAnMQTxYZGaWNi9gaF3qaQTOHmqoF0seC5j4Uex1PNpOqZ60R
	+dX5alqB16vszW4rxdV/A87oaIpPVQWQt+PZUcOTP5JdtIuSoGuIyKsrcp0pcmxUxfZDGy
	/VGbf8HDZGeKYPv5U9xjuGzAdvn4B2RDwIywARd3LATjfPH5auWy7c015zwmlQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1759818424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vbR8Lfe3xUkiLuOoon0tPiQgDnxi9ZrKiQVBz2GlyjA=;
	b=93Vuw/znRzh0QA6dxFClgvl5Lvy3U73zxVEt+kOBfwm4nFxhk4FSlYqbYT2xbvTfM46yf2
	uoQU9WrIhf3Mf4Bg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, 
	Askar Safin <safinaskar@gmail.com>, Sam James <sam@gentoo.org>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/Makefile.extrawarn: Respect CONFIG_WERROR / W=e
 for hostprogs
Message-ID: <20251007082506-3379be47-af3b-44bb-a1f3-4026d2a282a6@linutronix.de>
References: <20251006-kbuild-hostprogs-werror-fix-v1-1-23cf1ffced5c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251006-kbuild-hostprogs-werror-fix-v1-1-23cf1ffced5c@kernel.org>

On Mon, Oct 06, 2025 at 02:39:56PM -0700, Nathan Chancellor wrote:
> Commit 27758d8c2583 ("kbuild: enable -Werror for hostprogs")
> unconditionally enabled -Werror for the compiler, assembler, and linker
> when building the host programs, as the build footprint of the host
> programs is small (thus risk of build failures from warnings are low)
> and that stage of the build may not have Kconfig values (thus
> CONFIG_WERROR could not be used as a precondition).
> 
> While turning warnings into errors unconditionally happens in a few
> places within the kernel, it can be disruptive to people who may be
> building with newer compilers, such as while doing a bisect. While it is
> possible to avoid this behavior by passing HOSTCFLAGS=-w or
> HOSTCFLAGS=-Wno-error, it may not be the most intuitive for regular
> users not intimately familiar with Kbuild.
> 
> Avoid being disruptive to the entire build by depending on the explicit
> opt-in of CONFIG_WERROR or W=e to enable -Werror and the like while
> building the host programs. While this means there is a small portion of
> the build that does not have -Werror enabled (namely scripts/kconfig/*
> and scripts/basic/fixdep), it is better than not having it altogether.
> 
> Fixes: 27758d8c2583 ("kbuild: enable -Werror for hostprogs")
> Link: https://lore.kernel.org/20251005011100.1035272-1-safinaskar@gmail.com/

Reported-by: Askar Safin <safinaskar@gmail.com>
Closes: https://lore.kernel.org/20251005011100.1035272-1-safinaskar@gmail.com/

> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>


Thanks and sorry for the trouble!

> ---
>  scripts/Makefile.extrawarn | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 1434cb6208cb..6af392f9cd02 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -223,9 +223,11 @@ KBUILD_USERCFLAGS	+= -Werror
>  KBUILD_USERLDFLAGS	+= -Wl,--fatal-warnings
>  KBUILD_RUSTFLAGS	+= -Dwarnings
>  
> -endif
> -
> -# Hostprog flags are used during build bootstrapping and can not rely on CONFIG_ symbols.
> +# While hostprog flags are used during build bootstrapping (thus should not
> +# depend on CONFIG_ symbols), -Werror is disruptive and should be opted into.
> +# Only apply -Werror to hostprogs built after the initial Kconfig stage.
>  KBUILD_HOSTCFLAGS	+= -Werror
>  KBUILD_HOSTLDFLAGS	+= -Wl,--fatal-warnings
>  KBUILD_HOSTRUSTFLAGS	+= -Dwarnings
> +
> +endif
> 
> ---
> base-commit: 2ea77fca84f07849aa995271271340d262d0c2e9
> change-id: 20251006-kbuild-hostprogs-werror-fix-be6a3e123dfc
> 
> Best regards,
> --  
> Nathan Chancellor <nathan@kernel.org>
> 

