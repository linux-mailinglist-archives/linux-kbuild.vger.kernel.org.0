Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2561F41EF38
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 16:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbhJAORk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 10:17:40 -0400
Received: from mail-qv1-f50.google.com ([209.85.219.50]:45973 "EHLO
        mail-qv1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231702AbhJAORk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 10:17:40 -0400
Received: by mail-qv1-f50.google.com with SMTP id x9so5605799qvn.12;
        Fri, 01 Oct 2021 07:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QVjZB2U1LiPX5N7VS+BV6iC3aFCiEGYAbe9Pf/bwPeM=;
        b=vqwf25kVpnYE2kXFeCVs/rZtjFrAGuR6P0EWW9wmS4EC0zSp2qn7MsxhZ23MKrNFWX
         Rvh8g7JiW83mBhr67VxJ6H6WTolCu0wpYNPJFCeViEjkvSPyxAA0WdsonrAg9UlsI8+h
         gVpPt53Kv9ERiMNLW9pH1f+yz2uArQPi8gysMIJ02LcpsH+CdPcHmsvd9XZJAQYdrZln
         vsoA+rWOAw1OkysNg3G+xFClPoK24uRagfEfAd5gjK6Wv6CA2UHi01VRYdcmagcrPUEP
         laRRX1e9bgc2WL2ru9XQUC/wqD+pxW+RafeKF38VjlS8zXl0PwsSGjhsMnf93mh96CSm
         FKXw==
X-Gm-Message-State: AOAM531aZLa6xF+1NvmuJiODLkbJB39/aI/L9Gn50v2I5OyApuSgIoLx
        IcUVFUQP4KtrziX4SLlQ5Fw=
X-Google-Smtp-Source: ABdhPJyIkUYORyiz2OEQ8u3gomA3D95woMcD+5WRTPssKn45MNYSYCELeiB1FGLm40MPn35a8Jk15Q==
X-Received: by 2002:ad4:5bad:: with SMTP id 13mr9283552qvq.52.1633097755709;
        Fri, 01 Oct 2021 07:15:55 -0700 (PDT)
Received: from fedora (pool-173-68-57-129.nycmny.fios.verizon.net. [173.68.57.129])
        by smtp.gmail.com with ESMTPSA id y27sm126180qkj.64.2021.10.01.07.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 07:15:55 -0700 (PDT)
Date:   Fri, 1 Oct 2021 10:15:52 -0400
From:   Dennis Zhou <dennis@kernel.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Andy Whitcroft <apw@canonical.com>,
        David Rientjes <rientjes@google.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Joe Perches <joe@perches.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Pekka Enberg <penberg@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Micay <danielmicay@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 8/8] percpu: Add __alloc_size attributes for better
 bounds checking
Message-ID: <YVcYGOIT8eUUiPcc@fedora>
References: <20210930222704.2631604-1-keescook@chromium.org>
 <20210930222704.2631604-9-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930222704.2631604-9-keescook@chromium.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello,

On Thu, Sep 30, 2021 at 03:27:04PM -0700, Kees Cook wrote:
> As already done in GrapheneOS, add the __alloc_size attribute for
> appropriate percpu allocator interfaces, to provide additional hinting for
> better bounds checking, assisting CONFIG_FORTIFY_SOURCE and other compiler
> optimizations.
> 
> Note that due to the implementation of the percpu API, this is unlikely
> to ever actually provide compile-time checking beyond very simple non-SMP
> builds. But, since they are technically allocators, mark them as such.
> 
> Cc: Dennis Zhou <dennis@kernel.org>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Christoph Lameter <cl@linux.com>
> Cc: Andy Whitcroft <apw@canonical.com>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
> Cc: Joe Perches <joe@perches.com>
> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Pekka Enberg <penberg@kernel.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Co-developed-by: Daniel Micay <danielmicay@gmail.com>
> Signed-off-by: Daniel Micay <danielmicay@gmail.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Thanks for updating the commit log.

Acked-by: Dennis Zhou <dennis@kernel.org>

Thanks,
Dennis

> ---
>  include/linux/percpu.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/percpu.h b/include/linux/percpu.h
> index 5e76af742c80..98a9371133f8 100644
> --- a/include/linux/percpu.h
> +++ b/include/linux/percpu.h
> @@ -123,7 +123,7 @@ extern int __init pcpu_page_first_chunk(size_t reserved_size,
>  				pcpu_fc_populate_pte_fn_t populate_pte_fn);
>  #endif
>  
> -extern void __percpu *__alloc_reserved_percpu(size_t size, size_t align);
> +extern void __percpu *__alloc_reserved_percpu(size_t size, size_t align) __alloc_size(1);
>  extern bool __is_kernel_percpu_address(unsigned long addr, unsigned long *can_addr);
>  extern bool is_kernel_percpu_address(unsigned long addr);
>  
> @@ -131,8 +131,8 @@ extern bool is_kernel_percpu_address(unsigned long addr);
>  extern void __init setup_per_cpu_areas(void);
>  #endif
>  
> -extern void __percpu *__alloc_percpu_gfp(size_t size, size_t align, gfp_t gfp);
> -extern void __percpu *__alloc_percpu(size_t size, size_t align);
> +extern void __percpu *__alloc_percpu_gfp(size_t size, size_t align, gfp_t gfp) __alloc_size(1);
> +extern void __percpu *__alloc_percpu(size_t size, size_t align) __alloc_size(1);
>  extern void free_percpu(void __percpu *__pdata);
>  extern phys_addr_t per_cpu_ptr_to_phys(void *addr);
>  
> -- 
> 2.30.2
> 
