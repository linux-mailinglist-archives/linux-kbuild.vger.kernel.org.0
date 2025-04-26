Return-Path: <linux-kbuild+bounces-6748-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B16E0A9D80C
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 08:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C31D1BC301E
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 06:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E3A1AB530;
	Sat, 26 Apr 2025 06:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Euyr66pp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030B38634E;
	Sat, 26 Apr 2025 06:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745647229; cv=none; b=hk07crfVVmQgeo/xHHjrM6HYK5zPmXVO0hjcNc0WPcThelTSyFWAo6Okfb9LWpkb+ZEjzVdwhKSOnShtG6WanN0VgZ04d7sLHxX+HdsYedSYiWwOvKS7hJ2XURRM8Hg5GhmGc8+kg37asnEDZIYf0ULEQMA76MRatj62ZJqGy6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745647229; c=relaxed/simple;
	bh=Z/+2vB1WW7lMcA4V70Fgu5ztt4rDzP7C0iUZ5Iv8O+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7jEj58+z4N8HfwslfsRiIYDYkzRNsVniCVREad21wxZxCZB9sBqjqcZFjO1ZVJLq9FejuPeeGiRSL6GfopHwxt0on59xY+7rXI9s4ZMU1LirAtRTqQzN8vgDz3CNoFgGGsqEgqmcThFcQXSk8/yt0/cr44JqEiBH0ITu8Cg0pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Euyr66pp; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39ee651e419so1661859f8f.3;
        Fri, 25 Apr 2025 23:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745647226; x=1746252026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wR+dRgzhuKqqYs5EvURqtTJ4vi/drJO0Egc4UPl7VlU=;
        b=Euyr66ppyiobhJR0en5/H8EF53QLU00ZT8eWC6g6tR7m9CHgfGRA+zZQ4n48tZvSfm
         R/p/O+wTqnM1hQC2+J6WWdp5EbZl3hHr2M4hobTYsHHG3BrwOg/IQSC6NqKGh0Jip7gu
         cftRDOaB5irGRglD2tMry1kNYmyeTwx5jeUfeXmY6MnzSZyRZN6QDVwSAIdfhECCsskD
         Fl78kibXUV9uil9jQwoi6DtvPe1jkPfI4kIB9bNfCKy6gZFZO5RVY6kpuzxVGND2p2t0
         zl+s+yqxJCxVLcu/xU0yCVSb/tRh/CPSn2zXepALGYjv1aHV5fLQN/UZ5ZDoijV0DbT8
         4Hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745647226; x=1746252026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wR+dRgzhuKqqYs5EvURqtTJ4vi/drJO0Egc4UPl7VlU=;
        b=aZmfIK4fTeboCSKSlxB/GFherE/2HyX9KrVMrz2zlI6RV5aIA2XHJtL40Krkkykqtd
         uQJeC8AnAoyUt5tkHDGj7RWI5a483qdDwqV4drmUM3JnMdEnqFdt/MfTUrJ//AyNKI0x
         he6AoMSbkWhuBZ9ZPTUh5EJ2UCgr3TLAU2SoGS71lWQ8yfWGo1+OdRWwUEArnOEncLKf
         Yqd5WYDrMtqPoaXUWTRwihQSHCF4TeqAhiGDRClhMzFrXD08317VTrkW1c0rE6PkF/xm
         y7wfcTRZxwwYr1BjacrHahvCsy/1/QaQTmRmysMBgrUe1Kvuf5WM7vezeeZ9Iq5s7RNh
         Rnrg==
X-Forwarded-Encrypted: i=1; AJvYcCUHfnPuHrROUMKI7rsEy32n+GGMh976Pjmzv0Ht9LRGaxygQaMa3CGhiLnX7/k0F1P5f4J5ZRsV3L+twnBrj6U=@vger.kernel.org, AJvYcCWMaLdoIKi2XBYp+s2e71L2pnC8OHTntZprSnGhYH6he4LUdaZx03rI2vf2Kr4NSuFpjsiGNxk1JpkxaTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL6U1uLbZyWR47dzv5U0t66GzLjvyvZ1y7LvURVMPEZOO1mdD4
	jUDeBiIcqBrOu5FUmsYyb9DusyfgYTvx7UQRYlNuGsyrM1ZZIFZl
X-Gm-Gg: ASbGncsU2rlMsX8D805AjIFSVr1aURN3fsyDYbvJ28ABWm6y8vhhSjBwGXTuDVODoZ3
	ErbzMBCAX510Vbca5z7nyh08NB+pfFljaEh1w/nStaAlUSUxPFBl/F5/imCN6Sz7uk4WaYCMtkj
	lp3tkJLg7qEkW0XolvEoKy0yiG3WFDqqZzeCHj0NkEdY5ajlzeeG6q/5VAw/khrS17z8fhbobA4
	dfphsCFOddPuKtHLGjd/N41q52+K8RNRZKQ2dniBD5snqscICXkPn4ZpYDpk+yREgoIeU/eCF10
	xAuhP1CaicNdLDJqoxXWnnCSsqQVxfbL+cMOurI1+ncJcxMfkVtSy4tlpvvkC92vsmaPFa0dpxg
	4rpCu
X-Google-Smtp-Source: AGHT+IFRvPCxnGOT/k515W2EtRstexsEZG5a16LVfMOI+x3Q5eU4BJjaj9cX1CCmZkTIsPkyZ7PFBA==
X-Received: by 2002:a5d:64a6:0:b0:38d:cf33:31d6 with SMTP id ffacd0b85a97d-3a074e10426mr3467980f8f.3.1745647225935;
        Fri, 25 Apr 2025 23:00:25 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbf030sm4358676f8f.46.2025.04.25.23.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 23:00:25 -0700 (PDT)
Date: Sat, 26 Apr 2025 07:00:24 +0100
From: Stafford Horne <shorne@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	linux-openrisc@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] usr/include: openrisc: don't HDRTEST bpf_perf_event.h
Message-ID: <aAx2eAa2yyjabL2L@antec>
References: <20250426030815.1310875-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426030815.1310875-1-rdunlap@infradead.org>

Hi Randy,

On Fri, Apr 25, 2025 at 08:08:15PM -0700, Randy Dunlap wrote:
> Since openrisc does not support PERF_EVENTS, omit the HDRTEST of
> bpf_perf_event.h for arch/openrisc/.
>
> Fixes a build error:
> usr/include/linux/bpf_perf_event.h:14:28: error: field 'regs' has incomplete type

This looks ok to me, but do you have any pointer of how to reproduce this?

-Stafford

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: linux-openrisc@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> ---
>  usr/include/Makefile |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> --- linux-next-20250424.orig/usr/include/Makefile
> +++ linux-next-20250424/usr/include/Makefile
> @@ -59,6 +59,10 @@ ifeq ($(SRCARCH),arc)
>  no-header-test += linux/bpf_perf_event.h
>  endif
>  
> +ifeq ($(SRCARCH),openrisc)
> +no-header-test += linux/bpf_perf_event.h
> +endif
> +
>  ifeq ($(SRCARCH),powerpc)
>  no-header-test += linux/bpf_perf_event.h
>  endif

