Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31F533F0F8D
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 02:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234744AbhHSAni (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 20:43:38 -0400
Received: from mail-qv1-f49.google.com ([209.85.219.49]:38781 "EHLO
        mail-qv1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234523AbhHSAnh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 20:43:37 -0400
Received: by mail-qv1-f49.google.com with SMTP id bl13so2759795qvb.5;
        Wed, 18 Aug 2021 17:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WUckR6/rEyG6hoZXTxRWHk9iw1OsAucy5gKY4D8oDS4=;
        b=mbLSyTIAKSlwe7r/tkKetZFBXt5infeLFXZ9WN4lQ1B6d+n9gJ760sTf4MgG1Hvjp+
         DoQJBD7LMRWZCziqrTMTx6yiuPp2iE6g66kxUEeRiaxK9EK90oucRyXwAGPS0dLQGEfl
         AnBntlEOIjnN70WqJW7PEWhIKW+/AUOWrkDrEjQS25Wo9eEVy9LKrif/98bWaR3fj6l4
         wz+Y54c1EP2s92SpW67TZkM4JrM2fV8B8SVp+J5RV+ZKA+Qpim0yyXy4mRj+pb8z7eTZ
         0n4dxUUbc9dwnNMcZ9BuqK8+/qaOBCD5Nfg55AxG7ZQyBb/CIjnsqvaBTXNSCxJIdev/
         J/6A==
X-Gm-Message-State: AOAM531NpHCyK5G+dZyNB5aQPHpA+J3qCEYLr9ZtG1dzrJbVxcSomGaB
        fJ579pUAt9RdUDn1Mc6stOA=
X-Google-Smtp-Source: ABdhPJw2WHDOBNbPG85sjVtvZQqxQoF7wFWwdSLM/WNkMnAF4dVw1u1fqgrrm+X/5nVgJcE1FJnGbA==
X-Received: by 2002:a05:6214:902:: with SMTP id dj2mr11985796qvb.62.1629333782032;
        Wed, 18 Aug 2021 17:43:02 -0700 (PDT)
Received: from fedora (pool-173-68-57-129.nycmny.fios.verizon.net. [173.68.57.129])
        by smtp.gmail.com with ESMTPSA id d8sm758453qtr.0.2021.08.18.17.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 17:43:01 -0700 (PDT)
Date:   Wed, 18 Aug 2021 20:42:59 -0400
From:   Dennis Zhou <dennis@kernel.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Daniel Micay <danielmicay@gmail.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>, linux-mm@kvack.org,
        Joe Perches <joe@perches.com>, Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 6/7] percpu: Add __alloc_size attributes for better
 bounds checking
Message-ID: <YR2pE9V1P0xmBWUo@fedora>
References: <20210818214021.2476230-1-keescook@chromium.org>
 <20210818214021.2476230-7-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818214021.2476230-7-keescook@chromium.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello,

On Wed, Aug 18, 2021 at 02:40:20PM -0700, Kees Cook wrote:
> As already done in GrapheneOS, add the __alloc_size attribute for
> appropriate percpu allocator interfaces, to provide additional hinting
> for better bounds checking, assisting CONFIG_FORTIFY_SOURCE and other
> compiler optimizations.

Can you elaborate a little bit for me how this works for percpu? In any
case that's not uniprocessor, any modification is done through address
accessors and not on the returned percpu pointer. Is the metadata kept
by gcc/clang able to transpire the percpu pointer accessors?

Thanks,
Dennis

> 
> Co-developed-by: Daniel Micay <danielmicay@gmail.com>
> Signed-off-by: Daniel Micay <danielmicay@gmail.com>
> Cc: Dennis Zhou <dennis@kernel.org>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Christoph Lameter <cl@linux.com>
> Cc: linux-mm@kvack.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/linux/percpu.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/percpu.h b/include/linux/percpu.h
> index 5e76af742c80..119f41815b32 100644
> --- a/include/linux/percpu.h
> +++ b/include/linux/percpu.h
> @@ -123,6 +123,7 @@ extern int __init pcpu_page_first_chunk(size_t reserved_size,
>  				pcpu_fc_populate_pte_fn_t populate_pte_fn);
>  #endif
>  
> +__alloc_size(1)
>  extern void __percpu *__alloc_reserved_percpu(size_t size, size_t align);
>  extern bool __is_kernel_percpu_address(unsigned long addr, unsigned long *can_addr);
>  extern bool is_kernel_percpu_address(unsigned long addr);
> @@ -131,7 +132,9 @@ extern bool is_kernel_percpu_address(unsigned long addr);
>  extern void __init setup_per_cpu_areas(void);
>  #endif
>  
> +__alloc_size(1)
>  extern void __percpu *__alloc_percpu_gfp(size_t size, size_t align, gfp_t gfp);
> +__alloc_size(1)
>  extern void __percpu *__alloc_percpu(size_t size, size_t align);
>  extern void free_percpu(void __percpu *__pdata);
>  extern phys_addr_t per_cpu_ptr_to_phys(void *addr);
> -- 
> 2.30.2
> 
