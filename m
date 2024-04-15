Return-Path: <linux-kbuild+bounces-1573-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F08E8A5772
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Apr 2024 18:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD0E9288637
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Apr 2024 16:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5812C7F7C1;
	Mon, 15 Apr 2024 16:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kAETQ/9N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5D87FBA4
	for <linux-kbuild@vger.kernel.org>; Mon, 15 Apr 2024 16:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713197732; cv=none; b=In5+B1CjZXD4oU2/49PouGakNreYWCIn9rza5+65eKatMKD+h66EF6ABcGW7Lr5s4mp8NckGqj1x5iX77pZlP8GdnxYY/TXWo2KLVIvfGUyQCwGmki/DuNCROXasKeo6Uz/hYcY98DaViaWpYopriejSBfkWZZi4R8F0V5xk4Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713197732; c=relaxed/simple;
	bh=WzSpkbGGMe3CYE9+K1mdRBK4GHComNIeDDJxAv2hM+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Snnkn9JllKrzcW2VLLB11BqNBLq9a1KTmelTypqchqJE++FWsMDjhdU+M5t8xqe5aRs8PrnQRD2kiPQGc3Nf6kV0N2ipZDXdVH69b7Vxpl9WyG+YjQPFuHC8zQDPNFjOMHYKdXFImTL95NKwAqGBUrGvjPujKw2G5zIVMP/svcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kAETQ/9N; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6ecec796323so3592766b3a.3
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Apr 2024 09:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713197730; x=1713802530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N/OTM/TNgZYaTdlG3WL6hW/czPcQZOPIAEnHQ1yVQtQ=;
        b=kAETQ/9NeyXIjHKMiqWjLUEowKO8rJXvv2lz1YE3cgH4kkOjREOz91LHzzFTuXkV5a
         Vu9VHgf5ynTz1Ut83OeltVsDFzmzQRSzZf2oTrSVAqeKI6ifAHcCwfarkhQIRKns8dU9
         4vhA6zDROi41d02zoPyVDqpals00KzoP8E8v8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713197730; x=1713802530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/OTM/TNgZYaTdlG3WL6hW/czPcQZOPIAEnHQ1yVQtQ=;
        b=J7YrBgx7M9Eyb/Bv1yC3MTEdpPHF6fK4FgKCLlakZRwzTuT4ziHl0zjb3LDSNLZ6iZ
         QMP9ykFXI/pOxJE8sbBbeCqUruQHAX1wwYySXLmnMw4b4oMhxlHoGwHkan7XAd2uZROa
         eJX2mW/GoPIPv3McqAwXGTdkzbXU5x1UwDDNeEYlc2gTOYqZ4ZhE5Y0qrhNGJYaZbtwp
         cMTXq3jhev4tzAXP5GZWqrocdAg4qdrjBzhg4rKWyxRBI4J8k2Nk7DGzQQaG0ynFb9I6
         ZkSe3wY0ro2/6/bendXdGlmjRqSWcQGh8Jj6Bzc2iOrrn5VEIJWgGs+sbeHnuj67St5y
         DWGA==
X-Forwarded-Encrypted: i=1; AJvYcCWKq7F/JdzaJHrTMZIsNClAEZKMSHBpTtbPPuI70ATc7eXjmQVsy7SkxH65b20NQKxJew02Nxk/6m9zK24uWxQca6NFfyEOHm9U8KaF
X-Gm-Message-State: AOJu0YxNe2729erVXQrPhB00fIWWxU9qRydVEnuLFHLUQqYaliI5ahZg
	GBI3ANuwN8a0Cs+rWHvt8ocr4MvcBe9s3SnW9eNKDELBKqqC1vxJKAfi4gyYyQ==
X-Google-Smtp-Source: AGHT+IHNdY14933r3YscKRCbg0k9s+7qJOQMPfInMl+5wKcyeT6dy7Ze5rmmrLIF9aIlECD8W6yGTQ==
X-Received: by 2002:a17:903:2310:b0:1e4:2879:3a38 with SMTP id d16-20020a170903231000b001e428793a38mr12867624plh.47.1713197730312;
        Mon, 15 Apr 2024 09:15:30 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id z13-20020a170903408d00b001e4464902bcsm8132662plc.60.2024.04.15.09.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 09:15:29 -0700 (PDT)
Date: Mon, 15 Apr 2024 09:15:29 -0700
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] [v3] kbuild: enable -Wstringop-truncation globally
Message-ID: <202404150915.AAC34D61@keescook>
References: <20240415122037.1983124-1-arnd@kernel.org>
 <20240415122037.1983124-7-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415122037.1983124-7-arnd@kernel.org>

On Mon, Apr 15, 2024 at 02:20:37PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The remaining warnings of this type have been addressed, so it can
> now be enabled by default, rather than only for W=1.

Yeah, I know Gustavo had been working on these too. Yay!

Reviewed-by: Kees Cook <keescook@chromium.org>

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v3: no changes
> v2: no changes
> ---
>  scripts/Makefile.extrawarn | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 1d13cecc7cc7..17c511ddf48a 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -108,7 +108,6 @@ else
>  KBUILD_CFLAGS += $(call cc-disable-warning, format-overflow-non-kprintf)
>  KBUILD_CFLAGS += $(call cc-disable-warning, format-truncation-non-kprintf)
>  endif
> -KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
>  
>  KBUILD_CFLAGS += -Wno-override-init # alias for -Wno-initializer-overrides in clang
>  
> -- 
> 2.39.2
> 

-- 
Kees Cook

