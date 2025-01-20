Return-Path: <linux-kbuild+bounces-5511-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 684BEA172D4
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Jan 2025 19:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ACCA3A9E36
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Jan 2025 18:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62D91EF090;
	Mon, 20 Jan 2025 18:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SINNzR8L"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049181EBFE4;
	Mon, 20 Jan 2025 18:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737399055; cv=none; b=gZDG6mtIm23Tm+ISGaRIEn77orCnm9wprzthzeZKKapQd5cYX3hTw8hedViZOuUDudcjApRhx30XNFn6XTRem+CcDzq9hWSggvKMwPvTgDJG1KUrJencMKAZsCsfU+wLkYb+qK0NDfVGjPgdTc5rP+nIkyLx7FWmizgSYCmvrOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737399055; c=relaxed/simple;
	bh=1LjazYuRUzTTL6TH0dMeavPl6AaRBkk/AEs/q+gcrHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyvRidopSBM/BKjaftEV+PkPIpd/X0sz6k5Vhs+ZAH8laZolx60oLteuApkBQYbothPfPC/JSZMrjSQI6PEQFpc/1gV3E4GjxfTG3NMnM9kMme2IawqNu/Lt+JMI57/9OMjkMQdEvaZeOCflQ8TgRmy+WSma+DkUAawktckjgAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SINNzR8L; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4368a293339so55504745e9.3;
        Mon, 20 Jan 2025 10:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737399052; x=1738003852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5s6hUIeErL+Xv6cwxHROPonhsXj8JdiXdzGRRfqakOI=;
        b=SINNzR8L9nq87bwO3BvUMaMxcH2/bWEXH9gZbYEm1OKN4sMb5md/QGepDEr9hw5BH/
         pX85t6fcxkchyOdQfysCjZ3pMNwnKWKvgX79kls9GL1UTt2/LiKWv1QEK+cnba9TVEM2
         1zYI0lQvd6flLUd98d3NMBbR4JrTEIzVl4FVGXBbrtzl9odWGPNebz3KDh3Z6zwY2L69
         hSWq++RZnm0xmLbBKaTNKPcO06jRxDLjhcjNMC4lb60qM7GcdckRK4gU+k9+bB6/Jp0Z
         gGWAtWrK2G+bN58h3wPkR1cA74TVjZQXudIrSR2MZgnd5M/GMzQ9ktYJVPdo9YRTtt7r
         4kFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737399052; x=1738003852;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5s6hUIeErL+Xv6cwxHROPonhsXj8JdiXdzGRRfqakOI=;
        b=R5AGwrr7YDQFHIVPR71qBlLsxHQGyRIsCsuznEaDdVmK7uTQdYk87LLiE7E4f7qh75
         5kfveQS/QD/VeHksyFh0Dx9WTTG2PtOe2DxYCEa1vAq7Oqh2F59EgnFBmpn9NAZQpcZQ
         J7cNMx9E65lqpYqXvQk/kMyuoo23x5fn6Z8Nm4vOFOmGO8v0E7ruzVdMVeqqQI8AgUr0
         emVbXMRry8hPH88AGsAZAyi8o8hiOby7/CMW0QGmuvxsa+6OrR+tEFtVRNsYEmLyIbqP
         u17pVhMNPQ7yEVq6hCvON5WqiTutielB1KFjtxjUpr0cH92yCOUMTrDthSaf0Gpz1qWt
         J2VA==
X-Forwarded-Encrypted: i=1; AJvYcCXoQ82NmPooLXaobCYRoA1rMX4RU09ilLCKw6s8xxscoSYrWuAgS5xb+SIuaoA5Z6g5YVFQtTLT5gSNWZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrxeXp0uwm1Mh8tOzNSRggOWaTwuXqnI7WgRxzyJtvQpqh+26M
	aKBVPhqs4TZqovm2l/WZPPysil1RR0ATRPlzUi8w5SAWu06ilIlQ
X-Gm-Gg: ASbGncsauitnV0f56rXHsJF3NOSu1PT+tG02rKdUufiUsOVbgvObWMZcBf+btNf8fBP
	F5SyQpH2LdRZCXo49kP+74Ql37k5pJ7NRhsuLXiYVniPy2vOJQoVm37rH4B7K2ELKPov1Pz2hfZ
	3m60D1KsQuDj3lw8NTnWmC0InPtOXGwotGP3VJMFWb0bjO86WamoccGX5fs7u9D9mmOQiIJJU0O
	JfBnJ+rJEUZ6T/MLlVu4iltldG23HQq9+3Zt5VH35BBDlH6ngDHU5MCPlDj7xRLp1a1ak3XkQo=
X-Google-Smtp-Source: AGHT+IHP1fzUncGkN76C25GRR995kRXbvZP3Oo/pP9ezWFZnCz1O4tY5FVZulKrJlLssDI9URjLG5w==
X-Received: by 2002:a05:600c:5027:b0:435:294:f1c8 with SMTP id 5b1f17b1804b1-4389143164dmr115655485e9.28.1737399051897;
        Mon, 20 Jan 2025 10:50:51 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c749956fsm212865735e9.4.2025.01.20.10.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 10:50:51 -0800 (PST)
Date: Mon, 20 Jan 2025 19:50:41 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: fix memory leak in sym_warn_unmet_dep()
Message-ID: <20250120185041.GA870489@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20250120081039.29006-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120081039.29006-1-masahiroy@kernel.org>

Hi Masahiro,

> The string allocated in sym_warn_unmet_dep() is never freed, leading
> to a memory leak when an unmet dependency is detected.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

+1

I looked at other str_new() uses, but all looks to be using str_free()
(or return a pointer, which is freed by the caller).

Kind regards,
Petr

> Fixes: f8f69dc0b4e0 ("kconfig: make unmet dependency warnings readable")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

>  scripts/kconfig/symbol.c | 1 +
>  1 file changed, 1 insertion(+)

> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 89b84bf8e21f..1521cdf62fce 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -389,6 +389,7 @@ static void sym_warn_unmet_dep(const struct symbol *sym)

>  	fputs(str_get(&gs), stderr);
>  	sym_warnings++;
> +	str_free(&gs);
>  }

>  bool sym_dep_errors(void)

