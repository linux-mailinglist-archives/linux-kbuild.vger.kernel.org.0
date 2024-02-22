Return-Path: <linux-kbuild+bounces-1033-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A60F85EFBC
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Feb 2024 04:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 667B41C2127B
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Feb 2024 03:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FF21400A;
	Thu, 22 Feb 2024 03:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nHxwYSsW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DF228EF
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Feb 2024 03:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708571887; cv=none; b=siXB2TQkSE0gbhe9E31cbg32Axz05pxo4YhkuiReRTwpVYNcIg0geLdreYeu4U1CdurEwth2cVKAuPeTWjoLbvtQeM0MSNuWYBIJ/VmdK0KNQwoAgvThPfZPC8JvOhsYzeXs7hezNCs4aL3PN51cAq6CKToLx7RBOgoR7+6a+Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708571887; c=relaxed/simple;
	bh=ut2MQZOrqW8b0JO5evMbU/RELMHsuGLLv4B+MctT77A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkzIoElZTYmZdNvdMFmn5fl0uUwuc1SWYWyD6T4ksNI3L+ifQvlASjhxpFUSmENR1VW0eGu5UPF8EDm9qXsCELqxHa3OOZkmhRTbgpGvsuxCeNR8oAnalCPEdsSpFTgtIPdpQ6d6U9ka1GBnkwIvjLVYcLp7nzBkbzPnCV/KC0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nHxwYSsW; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c0d59a219dso4563036b6e.0
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Feb 2024 19:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708571885; x=1709176685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TOJkSuhWivZJymWAMGzD3PY6qOFwlgiao1u3KjRQcJ4=;
        b=nHxwYSsWjsmmrhO+rvpZykPpCW+B/u5OqRRJE8QfY7A5aAWfWFU735wIRnUcc6xhHm
         gAYFKn7L+beebHhAy0y36kde7Lh6ZvO3FumzKNj39o2IOGXXNfCwl35Q4dCgYI1zv45l
         za740SeEKeQQuWvm+2zm38UM3mhcrOsoRpXu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708571885; x=1709176685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOJkSuhWivZJymWAMGzD3PY6qOFwlgiao1u3KjRQcJ4=;
        b=lttlvg7O3eZkaHrMF0xwm1ydZ3OJbuy9jVDQmD8mcYzGwdFKTa4d+oeEfDr8qWMYGe
         mEljpRA3cVxDFxtEyzW49r0TOdckI3ttiJspm/O5tnRGFMAebG+ogSwdMmb56JBYuy0r
         BqajClp7pc1PliLKO8QMOF3ZSwRTsVFYSML1HYBmknkteosZr5J4tVALeam7lY2ExlL5
         pcR2HcVwLAccp82keMkxRd6bJc5ausp4eHTDgT3itruuQ6O+BOhGP9KynTPONNv+9mu7
         V3Z/qqyYc2j3LM3ialtlpkO56DsM0XhmW/jqka8fqRxU8T6Zu+yxZ/iLxR34+9yOvQ+3
         TXRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJFzbhfag/H6Mzdgh4sVzKnljU705tY9LtcFTRy1sowIdqpfx7a7crp1cz0Y2H4FVYvvlJ3EtpzY9ztvVt2+TjNB1xU/tu1D/Kudzx
X-Gm-Message-State: AOJu0YwgWjuMM/esC7alVJS2qm1izsiksDUjHm7f46K8fNXobtYUDKaJ
	LyQ1N1iVZDqt1EeJ97TKdaGJd3p59Ggpw39U6zfUHO5ypfW80NzbMkrOquD6aUAnDm+7ADbl8Qi
	Fag==
X-Google-Smtp-Source: AGHT+IGTMpsL/5XtthAE7430SoPB33wlJCVuiERPjUrN4eGkK2pC/FKYBLUB64cCqoQX26AfYHp6nw==
X-Received: by 2002:a05:6808:e85:b0:3c0:33b5:d1b0 with SMTP id k5-20020a0568080e8500b003c033b5d1b0mr22625106oil.10.1708571884942;
        Wed, 21 Feb 2024 19:18:04 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:480:9ded:eece:6cb3])
        by smtp.gmail.com with ESMTPSA id d24-20020aa78158000000b006e146124ae7sm9696211pfn.186.2024.02.21.19.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 19:18:04 -0800 (PST)
Date: Thu, 22 Feb 2024 12:18:01 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: add some Kconfig env variables to make help
Message-ID: <20240222031801.GG11472@google.com>
References: <20240222031226.493692-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222031226.493692-1-senozhatsky@chromium.org>

On (24/02/22 12:12), Sergey Senozhatsky wrote:
> Add a new section "Configuration environment variables" to
> `make help` output in order to make it easier for people to
> discover KCONFIG_WERRROR, etc.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  scripts/kconfig/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index ea1bf3b3dbde..109e28fd6209 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -158,6 +158,10 @@ help:
>  		if help=$$(grep -m1 '^# Help: ' $(f)); then \
>  			printf '  %-25s - %s\n' '$(notdir $(f))' "$${help#*: }"; \
>  		fi;)
> +	@echo  ''
> +	@echo  'Configuration environment variables:'
> +	@echo  '  KCONFIG_WERROR                 - Turn some Kconfig warnings into error conditions'
> +	@echo  '  KCONFIG_WARN_UNKNOWN_SYMBOLS   - Make Kconfing warn about all unrecognized config symbols'

													^^ Kconfig   fat fingers

>  
>  # ===========================================================================
>  # object files used by all kconfig flavours
> -- 
> 2.44.0.rc0.258.g7320e95886-goog
> 

