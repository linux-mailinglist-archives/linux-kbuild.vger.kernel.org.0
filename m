Return-Path: <linux-kbuild+bounces-1222-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC661879DEC
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Mar 2024 22:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66C10281DBE
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Mar 2024 21:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9053C14374F;
	Tue, 12 Mar 2024 21:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DcMXjwU6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3C8143737
	for <linux-kbuild@vger.kernel.org>; Tue, 12 Mar 2024 21:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710280429; cv=none; b=dJoEJra9t0fwcRPTtaN0XGfXzm1YqPyizsX6K3En762/zKMoMurW2+921679dYNXbxO4r2W9lRnW//RFhSciL2NsIX3fxvSgrhvte1r6Tz7ZkdNOYVszsjahGSqaC4TbrdlQxQgLfX6zwUnfBXD6S5s8eWFjWn3aVVt585BNJyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710280429; c=relaxed/simple;
	bh=G/4hgM5wTxTmcKRjygTzdn2/ODwGo/XzRcupSuCiDhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6/xnVuHiJZHGaNHpPCH9DQMjL+YF9k2mUnAHFs1IM2TIJBvghFqi8JIMwW1yjvDO65Eks0SYx9rdSEPm4YE86yRtvfU75DSdi3g8+HeXYgfPeRlqJD8yAWk+GsFRzjZQkdrcyzA5OsjobYQ3Hs0Wtp9zElQhEpK+Ps/EWOnXrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DcMXjwU6; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e6ac58fceaso895674b3a.1
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Mar 2024 14:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710280427; x=1710885227; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WRdVUDa2pta5KTvFc1TATmL7fgNoVWU4s2HJtfq2h88=;
        b=DcMXjwU6D7ZrXjjXKE4tykgbSaRw0TFieADBO1R/PU2HXROSSmvjPox8tWcagM2njS
         UQ0ULslyDc2QlWNuhArc2JqJISt31OdL0q7odDIDghiq4/qqFYNPD+QIzVQSf6MfkSBJ
         ErRA3azwkH4JAnvq8ZcMaXI00exrsBAVTO1kU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710280427; x=1710885227;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WRdVUDa2pta5KTvFc1TATmL7fgNoVWU4s2HJtfq2h88=;
        b=u3P4ZXq24kPhVRXD7salU6SmP1gpxi2KAJHXOrCuBFTGekzsRBCqsRwnRxynuntwJ4
         bR/lgJoBcH8dtPLytymcqo7KAUxEh+XCV59xWLvPFq6OXGtwrktflLxpXmhwcnffJcRN
         Q1+p6TzIEpCq7Zru0902x9kiR/XFqjnzk89tHWq8jAr1U7s18DR4MqbrTB3vs4Jsdpfh
         pIOYkpeuA2zV3ivKrrIJaZd17MnbemKT2q3UAv9WdlsRz/UC7opzr48fiHG6u3Ze4wyV
         SuE89xFYld4aNmk5ZXmBXG0hVyIVqRMaXTlb0HymZrAO2mnci4/ge6Nx46CTOME4TxI2
         VUwA==
X-Forwarded-Encrypted: i=1; AJvYcCXUu7zRyhSN4XWOsjZFT5TAtMa9TfPE/VTJN67PT1Ay7NblpcXeYlQRyUbOCs8cuHCGRAGVCdN8CSAEh96NYxnI2gYdhJ/cVJQ98MU8
X-Gm-Message-State: AOJu0YyPHyNWniSc1T4GCi8Cp8hUM3k09o5XsHvMB2/5KeH+6+EZjq4k
	bsdQL7jIguBG4FaIBo6Ss/0CNNizVuO3ldhdeWcrPfhxwdPzTgqgbfr4PNcla1ZKP7N8zNi4ajQ
	=
X-Google-Smtp-Source: AGHT+IFqNTbSHg5S7yBJU7eqizCMy2N+F3f//0dRar/vDWfMpE1iigmGI34L3PlR68X94oFiT6tW4A==
X-Received: by 2002:a05:6a00:4fcb:b0:6e6:afa3:7b32 with SMTP id le11-20020a056a004fcb00b006e6afa37b32mr843588pfb.6.1710280427387;
        Tue, 12 Mar 2024 14:53:47 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id v21-20020aa78095000000b006e694719fa0sm4235092pff.147.2024.03.12.14.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 14:53:46 -0700 (PDT)
Date: Tue, 12 Mar 2024 14:53:46 -0700
From: Kees Cook <keescook@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] gcc-plugins: disable plugins when gmp.h is
 unavailable
Message-ID: <202403121452.701C91AF6E@keescook>
References: <20240312-gcc-plugins-gmp-v1-0-c5e082437b9e@linutronix.de>
 <20240312-gcc-plugins-gmp-v1-2-c5e082437b9e@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240312-gcc-plugins-gmp-v1-2-c5e082437b9e@linutronix.de>

On Tue, Mar 12, 2024 at 04:03:30PM +0100, Thomas Weiﬂschuh wrote:
> The header gmp.h is meant to be picked up from the host system.
> 
> When it is unavailable the plugin build fails:
> 
> In file included from ../crosstools/gcc-13.2.0-nolibc/i386-linux/bin/../lib/gcc/i386-linux/13.2.0/plugin/include/gcc-plugin.h:28,
>                  from ../scripts/gcc-plugins/gcc-common.h:7,
>                  from ../scripts/gcc-plugins/stackleak_plugin.c:30:
> ../crosstools/gcc-13.2.0-nolibc/i386-linux/bin/../lib/gcc/i386-linux/13.2.0/plugin/include/system.h:703:10: fatal error: gmp.h: No such file or directory
>   703 | #include <gmp.h>
>       |          ^~~~~~~
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  scripts/gcc-plugins/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
> index e383cda05367..a664fb5cdde5 100644
> --- a/scripts/gcc-plugins/Kconfig
> +++ b/scripts/gcc-plugins/Kconfig
> @@ -10,6 +10,7 @@ menuconfig GCC_PLUGINS
>  	depends on HAVE_GCC_PLUGINS
>  	depends on CC_IS_GCC
>  	depends on $(success,test -e $(shell,$(CC) -print-file-name=plugin)/include/plugin-version.h)
> +	depends on $(host-cc-option,-include gmp.h)

Why does the prior depends not fail? That's where plugin detection is
happening.

-- 
Kees Cook

