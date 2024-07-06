Return-Path: <linux-kbuild+bounces-2415-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4272929602
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jul 2024 01:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EC56B20FCD
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2024 23:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B373BB59;
	Sat,  6 Jul 2024 23:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0y64v8g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DDC23741;
	Sat,  6 Jul 2024 23:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720310329; cv=none; b=Rfr4g9zIujUU7DhwNXNQVceIotwXP3nw8xKsJSGdnz8OqnxfAOcLsiCI0QKH9w1QBNEngQlOD+H9rnWKxZbsTFsWeHoQzWzC41geg/kGJPaGUSyL7zApT7ruiZtpGlKvll67lsLwKLBXXL+zji//EbFDpmxGSQtapJXqg6RfUUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720310329; c=relaxed/simple;
	bh=3gXY4RaDXfSDJ/T0Fskl+SnEZA6CW6SIx8dnJ1/QYus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyITUbdPULCbRklxtA+9BYS37MjRJbSZyKRCr35Iif2SyctMlTTeGL8kXhM5WyXApnW1lXU0LxtCeA0VRPbf4WDHKQEN/T2tAPwfF88mKJnMd9uOQI6ZuanlEib/1ARF2ImhzGONQU5ePUPuMpPpYSztg1cackv47xNQKXdxdRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0y64v8g; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a77c1658c68so276441766b.0;
        Sat, 06 Jul 2024 16:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720310326; x=1720915126; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gmu0FswKPKJI/YS6A3R8TBAb2DYYgL4iHEccLZ36x/k=;
        b=I0y64v8g+GpW7bKjO970xZ5KrHspksbh1Hbmld34h6Jiwk20N2jIUenOujhIe3cZbq
         0k9hSa9c5SVH7TLCTZwivGfoKfbrJsEtqqzjbsA4Fx3Z0CaZmf2nZaa9p3IBFWUip+1O
         mxdFtCPFWDOJjC6WHfsj9yppHiEd70Qvpx4i7CGwIgZY/Y+K7pJHl/cbuVrdO94x5Rye
         dm9y2YeSTE2qyyB1pIjqyTJdR/O7933bD8wy+HE5WdQbgYZF9ul5ukeOPE28SBU81sl3
         4p6V9m6a+b0BaTL1cZiMFsYYC/UuDdRZaWw46gGQwMw47IpuLEeVLPmbST3B6dMwnMp6
         /yNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720310326; x=1720915126;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gmu0FswKPKJI/YS6A3R8TBAb2DYYgL4iHEccLZ36x/k=;
        b=PQuiSzDn55l4agJA2DqOsjJDq5QJuR5WNt+CJfUg1/YEIf8EkRP4Cu+kLCXkeygp3b
         sSTYW+JsJD3OGsYcSg4ARLe/TBJnsOip1XG2HOF6CuuCFImXA+VwP6VxEblb3A4f7fCU
         cqkdReS+Gj64TmjFxL43pKNu3fob75/z3TClHl/5SlGyieReKnuFq+vvlMeVPx2xIvOe
         aN3J7rk7cX7SOaGRDNIf7XfNYNFLXUdkbXD3dtT260ijC030Y79ut9rTALysP/yNIjuI
         0Bw7nPa3+9muiE4rH1joOQW2iUXXQHBwQI/h5eqKAyodl0y5z0K8PA8P7xPNs70BWnxG
         fJ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIQmT0evw1dodyk8fThK+UH+f7yvC7pKjhzmEe2NSVVOctO5BmifF3Zf8pVRcSRGkFRd7wY0kr7HxGR7dkWXlVR8/Vb+Jn5p96+u+8
X-Gm-Message-State: AOJu0YwASld57/LuwZXor/UGhVaKZqNbkIcsDXaxRbIlvQvKaRYnsfH+
	KzLu/dlbQiytH2Hra5ZHpQDTDmJpQDowB2dhVSNGEa+ASKm320CCm/9Pa+/6LIY=
X-Google-Smtp-Source: AGHT+IHzIhY5X32vHCH2UJ96WqxWKgTYM/Ot7xLcjOHAAUI9XhIhDCJPs3VP4NWSwwTV50IEO37+iQ==
X-Received: by 2002:a17:907:971b:b0:a77:da14:8403 with SMTP id a640c23a62f3a-a77da1485d0mr316626366b.2.1720310325590;
        Sat, 06 Jul 2024 16:58:45 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77dcac1344sm131911066b.202.2024.07.06.16.58.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Jul 2024 16:58:44 -0700 (PDT)
Date: Sat, 6 Jul 2024 23:58:44 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wei Yang <richard.weiyang@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/2] init: remove unused __MEMINIT* macros
Message-ID: <20240706235844.fi4l5ptmv56u4kts@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20240706160511.2331061-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706160511.2331061-1-masahiroy@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)

On Sun, Jul 07, 2024 at 01:05:05AM +0900, Masahiro Yamada wrote:
>These macros are not used anywhere.
>
>Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

>---
>
> include/linux/init.h | 4 ----
> 1 file changed, 4 deletions(-)
>
>diff --git a/include/linux/init.h b/include/linux/init.h
>index 58cef4c2e59a..b2e9dfff8691 100644
>--- a/include/linux/init.h
>+++ b/include/linux/init.h
>@@ -99,10 +99,6 @@
> #define __INITRODATA	.section	".init.rodata","a",%progbits
> #define __FINITDATA	.previous
> 
>-#define __MEMINIT        .section	".meminit.text", "ax"
>-#define __MEMINITDATA    .section	".meminit.data", "aw"
>-#define __MEMINITRODATA  .section	".meminit.rodata", "a"
>-
> /* silence warnings when references are OK */
> #define __REF            .section       ".ref.text", "ax"
> #define __REFDATA        .section       ".ref.data", "aw"
>-- 
>2.43.0

-- 
Wei Yang
Help you, Help me

