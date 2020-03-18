Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8B118A88C
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2020 23:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgCRWp4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Mar 2020 18:45:56 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35627 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727095AbgCRWpz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Mar 2020 18:45:55 -0400
Received: by mail-pl1-f195.google.com with SMTP id g6so154823plt.2
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Mar 2020 15:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RlVpbAqk1yQthUW1FDAPeEGC6CQLUUbwnQv5Sk9EL1c=;
        b=gYmpZA5SMHDb3Uuue7+1Jqm2yc8BvcNrAIPwTiJW+0oK/k8ci9/9UsGXZU9JqjQbRq
         sPPXxQQHs6zM6T8zDQeZ022gmfva913UpO9T2IJz9kYY23VE3IC2BYsY5apaKj129bdE
         4VPojihUubgeEt3URmVmfYhgSYeCJKSTxi5B0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RlVpbAqk1yQthUW1FDAPeEGC6CQLUUbwnQv5Sk9EL1c=;
        b=a/hz+UcBFRREOI/gXch5kbrLWYDxAEzzfvL7e7lrNVugoOwlLp7iy0AE1Yexq+kcOW
         d4hqnMuIqm3YUlOx45v+Ei/wVOUGzyq2vPoFwD2CU6XKSmUCKSXUCjrsBIrRaZ99BG2C
         dywzvfc7iL2y/TPPyBZPL4fhqRzcwp7KTLcM4hda2f7H+TydpBEYcCnCdVR8Pjr6ihEs
         2wLVkyyXnlW9YR2WU7TmwRmuGRE+MbkuKGLuK7eK5alMSwKUqkTSmdKOBEgAqaE9qv8S
         Se1cf454vkqIqOzsv/VnhEEFgNOPr5BGgnB6yEMt9FUqk06F1Sl2wNVQtIgrsDEL9khf
         /8sg==
X-Gm-Message-State: ANhLgQ22R404RCdv8N3PCoTOf7vtvqUvsKFjDXbJFQogUqioLF+9Axbv
        UFm3bOnmNUTEezqOyNKlCljHRA==
X-Google-Smtp-Source: ADFU+vseJzJ5szglQN189hPrBR0PfveN63RDvDCfTnjOhyzUg0btNT+Ba9IpSElqh09WRn9nAY6l0Q==
X-Received: by 2002:a17:90a:2109:: with SMTP id a9mr520219pje.12.1584571553736;
        Wed, 18 Mar 2020 15:45:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id gn11sm35848pjb.42.2020.03.18.15.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 15:45:52 -0700 (PDT)
Date:   Wed, 18 Mar 2020 15:45:51 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nick Terrell <terrelln@fb.com>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org
Subject: Re: [PATCH v2 2/7] lib: prepare xxhash for preboot environment
Message-ID: <202003181545.B6CBE5FD@keescook>
References: <20200318002303.977158-1-terrelln@fb.com>
 <20200318002303.977158-3-terrelln@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318002303.977158-3-terrelln@fb.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 17, 2020 at 05:22:58PM -0700, Nick Terrell wrote:
> Don't export symbols if PREBOOT is defined.
> 
> This change is necessary to get xxhash to work in a preboot environment,
> which is needed to support zstd-compressed kernels.

Hmm, I thought using this:

#define __DISABLE_EXPORTS

before the #include of the .c files solved this?

-Kees

> 
> Signed-off-by: Nick Terrell <terrelln@fb.com>
> ---
>  lib/xxhash.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/xxhash.c b/lib/xxhash.c
> index aa61e2a3802f..7f1d3cb01729 100644
> --- a/lib/xxhash.c
> +++ b/lib/xxhash.c
> @@ -80,13 +80,11 @@ void xxh32_copy_state(struct xxh32_state *dst, const struct xxh32_state *src)
>  {
>  	memcpy(dst, src, sizeof(*dst));
>  }
> -EXPORT_SYMBOL(xxh32_copy_state);
>  
>  void xxh64_copy_state(struct xxh64_state *dst, const struct xxh64_state *src)
>  {
>  	memcpy(dst, src, sizeof(*dst));
>  }
> -EXPORT_SYMBOL(xxh64_copy_state);
>  
>  /*-***************************
>   * Simple Hash Functions
> @@ -151,7 +149,6 @@ uint32_t xxh32(const void *input, const size_t len, const uint32_t seed)
>  
>  	return h32;
>  }
> -EXPORT_SYMBOL(xxh32);
>  
>  static uint64_t xxh64_round(uint64_t acc, const uint64_t input)
>  {
> @@ -234,7 +231,6 @@ uint64_t xxh64(const void *input, const size_t len, const uint64_t seed)
>  
>  	return h64;
>  }
> -EXPORT_SYMBOL(xxh64);
>  
>  /*-**************************************************
>   * Advanced Hash Functions
> @@ -251,7 +247,6 @@ void xxh32_reset(struct xxh32_state *statePtr, const uint32_t seed)
>  	state.v4 = seed - PRIME32_1;
>  	memcpy(statePtr, &state, sizeof(state));
>  }
> -EXPORT_SYMBOL(xxh32_reset);
>  
>  void xxh64_reset(struct xxh64_state *statePtr, const uint64_t seed)
>  {
> @@ -265,7 +260,6 @@ void xxh64_reset(struct xxh64_state *statePtr, const uint64_t seed)
>  	state.v4 = seed - PRIME64_1;
>  	memcpy(statePtr, &state, sizeof(state));
>  }
> -EXPORT_SYMBOL(xxh64_reset);
>  
>  int xxh32_update(struct xxh32_state *state, const void *input, const size_t len)
>  {
> @@ -334,7 +328,6 @@ int xxh32_update(struct xxh32_state *state, const void *input, const size_t len)
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL(xxh32_update);
>  
>  uint32_t xxh32_digest(const struct xxh32_state *state)
>  {
> @@ -372,7 +365,6 @@ uint32_t xxh32_digest(const struct xxh32_state *state)
>  
>  	return h32;
>  }
> -EXPORT_SYMBOL(xxh32_digest);
>  
>  int xxh64_update(struct xxh64_state *state, const void *input, const size_t len)
>  {
> @@ -439,7 +431,6 @@ int xxh64_update(struct xxh64_state *state, const void *input, const size_t len)
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL(xxh64_update);
>  
>  uint64_t xxh64_digest(const struct xxh64_state *state)
>  {
> @@ -494,7 +485,19 @@ uint64_t xxh64_digest(const struct xxh64_state *state)
>  
>  	return h64;
>  }
> +
> +#ifndef PREBOOT
> +EXPORT_SYMBOL(xxh32_copy_state);
> +EXPORT_SYMBOL(xxh64_copy_state);
> +EXPORT_SYMBOL(xxh32);
> +EXPORT_SYMBOL(xxh64);
> +EXPORT_SYMBOL(xxh32_reset);
> +EXPORT_SYMBOL(xxh64_reset);
> +EXPORT_SYMBOL(xxh32_update);
> +EXPORT_SYMBOL(xxh32_digest);
> +EXPORT_SYMBOL(xxh64_update);
>  EXPORT_SYMBOL(xxh64_digest);
>  
>  MODULE_LICENSE("Dual BSD/GPL");
>  MODULE_DESCRIPTION("xxHash");
> +#endif
> -- 
> 2.25.1
> 

-- 
Kees Cook
