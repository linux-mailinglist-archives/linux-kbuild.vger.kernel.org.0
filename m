Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D373010D1
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Jan 2021 00:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbhAVXRN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Jan 2021 18:17:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728521AbhAVTfF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jan 2021 14:35:05 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B5C6C061786
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Jan 2021 11:33:44 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id o20so4515931pfu.0
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Jan 2021 11:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PRHYirbpaVjReacEED4lbaCE3EfoPDnBMgBWDqUdb1M=;
        b=jcbK3Jb+1ldTw8xuHGcbe/WyAd9rzEWhNsbjwzL7GUFNO0kBbs7g9+lznqTJXv5guQ
         ThmJrhp8cBtmrAw3PicbPDCzSDRMsMTXouV2Ed/Soxu0Aianbna8t6Eyn8vx3xOUitbj
         /UrYMZXa4Z2WVDt0h6nszyYChGEcP/Gw8IFgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PRHYirbpaVjReacEED4lbaCE3EfoPDnBMgBWDqUdb1M=;
        b=WS4lRf+cgE9FI2JIDjJ47JvH4QVgXBIp2biahhJgTTDJwav93vAoNgg7A6zTUwPUCM
         p9uGxLg+pcT1kSE1+Pz/5Erp0oXC2n75P3ZXiTy6iWsty+Wq5qp05dc2vJMa0Ww3tS30
         Ny7xcXT5oKobkEwMg+UcrdmGaTd3qIA8sXhZDIUWvrDymeA7xXig6kOE2OMNmdMq2/gA
         zp3glXEKedAPjrHTjhNfOTi2N+u54wZ0JXF05nRyBaiUJk6FeDksnKunI33ir8KSnMHv
         /1C3h50P0/LpGW3QimFjPZFQL49hjASCSgng4n9w8Ogn1gnmuHYWnmikeUodJRq34JlF
         9DEg==
X-Gm-Message-State: AOAM530vvkxkfCIuJNKaVKfDnl30TNMfwgPOQVYmrDzOqtp4UaWQVXip
        EBrDemIZKAZdWRjVtXBrjuSZrg==
X-Google-Smtp-Source: ABdhPJzSZ+w9Sa36H0s07wBdXa3HqO3jCZJZAhirfObi0OICrHS6njgn1JnYamu9MMLKfJqtYJ237g==
X-Received: by 2002:a63:1e1e:: with SMTP id e30mr1322451pge.156.1611344023652;
        Fri, 22 Jan 2021 11:33:43 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 129sm9463735pfw.86.2021.01.22.11.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 11:33:42 -0800 (PST)
Date:   Fri, 22 Jan 2021 11:33:41 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        kernel-hardening@lists.openwall.com,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH kspp-next] kbuild: prevent CC_FLAGS_LTO self-bloating on
 recursive rebuilds
Message-ID: <202101221133.389539337D@keescook>
References: <20210121184544.659998-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121184544.659998-1-alobakin@pm.me>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 21, 2021 at 06:45:55PM +0000, Alexander Lobakin wrote:
> CC_FLAGS_LTO gets initialized only via +=, never with := or =.
> When building with CONFIG_TRIM_UNUSED_KSYMS, Kbuild may perform
> several kernel rebuilds to satisfy symbol dependencies. In this
> case, value of CC_FLAGS_LTO is concatenated each time, which
> triggers a full rebuild.
> Initialize it with := to fix this.
> 
> Fixes: dc5723b02e52 ("kbuild: add support for Clang LTO")
> Signed-off-by: Alexander Lobakin <alobakin@pm.me>

Ah-ha, good catch; thanks!

I'll get this into the tree.

-Kees

> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 668909e7a460..2233951666f7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -895,10 +895,10 @@ endif
>  
>  ifdef CONFIG_LTO_CLANG
>  ifdef CONFIG_LTO_CLANG_THIN
> -CC_FLAGS_LTO	+= -flto=thin -fsplit-lto-unit
> +CC_FLAGS_LTO	:= -flto=thin -fsplit-lto-unit
>  KBUILD_LDFLAGS	+= --thinlto-cache-dir=$(extmod-prefix).thinlto-cache
>  else
> -CC_FLAGS_LTO	+= -flto
> +CC_FLAGS_LTO	:= -flto
>  endif
>  CC_FLAGS_LTO	+= -fvisibility=hidden
>  
> -- 
> 2.30.0
> 
> 

-- 
Kees Cook
