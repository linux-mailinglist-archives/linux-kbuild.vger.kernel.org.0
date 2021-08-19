Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C053F11D4
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 05:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236523AbhHSDh3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 23:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236516AbhHSDh2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 23:37:28 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF58C0613CF
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 20:36:52 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id gz13-20020a17090b0ecdb0290178c0e0ce8bso6424255pjb.1
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 20:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OWG8gSW9FTH/AgnNjiR6jP10S4rh/ZtmSM7TNejSBro=;
        b=bf7AXXLxLTv0CmXBn58RWmQBZ9LcpPYWlDQy1fNAeZxT8k+tgPLMbTJRZoV7+TJLqA
         D0YMfmBS5GGXVxU0KTGqEuvI+CEu5kNnqcVLDWTAvxbYGPt9ZraQM+QErigXfLpgJBNu
         W9zs3o59Wfdjd+g/h9ljZvX4U1YJVbddLGkoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OWG8gSW9FTH/AgnNjiR6jP10S4rh/ZtmSM7TNejSBro=;
        b=kMoAXZmj+uEWIq6dKz7fQTyEuyRu+QW8cL7vtxEn0eybii0r8n7DfjzwtZ3XEDUJi9
         BJWipQDvz15E+ErJWMO/YHswhiq/OA5g3mNRx7tPzxnAp/IS8jVzHB3tOwjjroiPQT24
         RmDmjz/qrzFgKvQwy3vIfgA1M8GTXajWeOFqJprez4W2QKjNhZ3PSq45wrdu5bdD5Wpx
         enr4oQE3+bJO9u2vm9E9d2zkQPeOZ+FtMbkFBvin2DQR5iwvR5gr1KYIzI99QBV2Zhtq
         nEF5ch6F9dj5jAkUc9wVIaq+tMwc1BfrDN7jNwxmDMqd2WGB5qB1Cm0VEjRajVdY0qZy
         o3Qg==
X-Gm-Message-State: AOAM532wBSPT3fOmx+F+MLvYTxc+Ma3bYbpbga/RO/7R6bX+M0AmI3nf
        aixMeinYY3Zq91lJJ+o05R5wAg==
X-Google-Smtp-Source: ABdhPJyhy0+a4fDGJXB6BO9R+BMhAU0XGAPV4/WUygffKCQlZpUdChD3xai7iJvGVEwQjN9BPChIEg==
X-Received: by 2002:a17:902:b593:b0:12d:7aa5:de2d with SMTP id a19-20020a170902b59300b0012d7aa5de2dmr10093375pls.31.1629344212131;
        Wed, 18 Aug 2021 20:36:52 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y12sm1476515pgl.65.2021.08.18.20.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 20:36:51 -0700 (PDT)
Date:   Wed, 18 Aug 2021 20:36:50 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Dennis Zhou <dennis@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Daniel Micay <danielmicay@gmail.com>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
        linux-mm@kvack.org, Joe Perches <joe@perches.com>,
        Miguel Ojeda <ojeda@kernel.org>,
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
Message-ID: <202108182018.6DA03EA818@keescook>
References: <20210818214021.2476230-1-keescook@chromium.org>
 <20210818214021.2476230-7-keescook@chromium.org>
 <YR2pE9V1P0xmBWUo@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YR2pE9V1P0xmBWUo@fedora>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 18, 2021 at 08:42:59PM -0400, Dennis Zhou wrote:
> On Wed, Aug 18, 2021 at 02:40:20PM -0700, Kees Cook wrote:
> > As already done in GrapheneOS, add the __alloc_size attribute for
> > appropriate percpu allocator interfaces, to provide additional hinting
> > for better bounds checking, assisting CONFIG_FORTIFY_SOURCE and other
> > compiler optimizations.
> 
> Can you elaborate a little bit for me how this works for percpu? In any
> case that's not uniprocessor, any modification is done through address
> accessors and not on the returned percpu pointer. Is the metadata kept
> by gcc/clang able to transpire the percpu pointer accessors?

That's an excellent point. :P I haven't tested it through the accessors,
but I guess it's possible that this is only useful for UP, and even
then, only where the access is very close to the "allocation", maybe
like:

char __percpu *test_buf;

	char *buf;
	test_var = __alloc_percpu(16, __alignof__(char));
	buf = per_cpu_ptr(test_buf, get_cpu());
	...
	buf[20] = '!';

-Kees

> 
> Thanks,
> Dennis
> 
> > 
> > Co-developed-by: Daniel Micay <danielmicay@gmail.com>
> > Signed-off-by: Daniel Micay <danielmicay@gmail.com>
> > Cc: Dennis Zhou <dennis@kernel.org>
> > Cc: Tejun Heo <tj@kernel.org>
> > Cc: Christoph Lameter <cl@linux.com>
> > Cc: linux-mm@kvack.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  include/linux/percpu.h | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/include/linux/percpu.h b/include/linux/percpu.h
> > index 5e76af742c80..119f41815b32 100644
> > --- a/include/linux/percpu.h
> > +++ b/include/linux/percpu.h
> > @@ -123,6 +123,7 @@ extern int __init pcpu_page_first_chunk(size_t reserved_size,
> >  				pcpu_fc_populate_pte_fn_t populate_pte_fn);
> >  #endif
> >  
> > +__alloc_size(1)
> >  extern void __percpu *__alloc_reserved_percpu(size_t size, size_t align);
> >  extern bool __is_kernel_percpu_address(unsigned long addr, unsigned long *can_addr);
> >  extern bool is_kernel_percpu_address(unsigned long addr);
> > @@ -131,7 +132,9 @@ extern bool is_kernel_percpu_address(unsigned long addr);
> >  extern void __init setup_per_cpu_areas(void);
> >  #endif
> >  
> > +__alloc_size(1)
> >  extern void __percpu *__alloc_percpu_gfp(size_t size, size_t align, gfp_t gfp);
> > +__alloc_size(1)
> >  extern void __percpu *__alloc_percpu(size_t size, size_t align);
> >  extern void free_percpu(void __percpu *__pdata);
> >  extern phys_addr_t per_cpu_ptr_to_phys(void *addr);
> > -- 
> > 2.30.2
> > 

-- 
Kees Cook
