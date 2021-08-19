Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17FA3F1B61
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 16:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240442AbhHSONX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Aug 2021 10:13:23 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]:33571 "EHLO
        mail-qk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240373AbhHSONX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Aug 2021 10:13:23 -0400
Received: by mail-qk1-f182.google.com with SMTP id t66so7346886qkb.0;
        Thu, 19 Aug 2021 07:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EzeHLB2s0wcZiu9diV61Z7RrK3vSIEBc9fmeT4t3UBc=;
        b=R9p9tZBjPTXp9XZckZZp0gdeRj3GoykEKGdUExpQiH+mEeRXtShYv9iE5DbIXwH+G2
         BB9Vfa/tneT8aXgrkXNnanw8u24bSfgEF6awuxL5tnLi/ED4+8sXwd3qFJuEpcVfD5ei
         Rr6VpUxKw7COZkjGg8TYM++dMjI3Sh9K5s0eLRJVtMe1cre+vRhPGN+f08TiIYJTSZzi
         Zch6/x3AkA9PY2CGE+sqMF/COIsmxmAm13PJGaDuwPytDaIn0LrZeuurHkE3PWYo7Lgp
         OqeI4En8Bym/ch6Tql1BY3zIm78hVbBySXHL21RIcAvMVI8946R+pnHWP3J0AgzNxV0Z
         zPEg==
X-Gm-Message-State: AOAM531zb+Ba63f43dvgaX8aYiKoNSHo1fSWhSdkoEh+dQDcP09HvA0w
        CssHL5ToUKWkMiSJ0XBeRo0=
X-Google-Smtp-Source: ABdhPJx03Rfdorqy4YL7QnGDhK6uhe8TF8BGaMVnjZ226XylC+fBlkNt+7F0yaylI5+T/WZxIDUjYQ==
X-Received: by 2002:a05:620a:4008:: with SMTP id h8mr3863126qko.211.1629382366433;
        Thu, 19 Aug 2021 07:12:46 -0700 (PDT)
Received: from fedora (pool-173-68-57-129.nycmny.fios.verizon.net. [173.68.57.129])
        by smtp.gmail.com with ESMTPSA id q14sm1518663qkl.44.2021.08.19.07.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 07:12:45 -0700 (PDT)
Date:   Thu, 19 Aug 2021 10:12:43 -0400
From:   Dennis Zhou <dennis@kernel.org>
To:     Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Dennis Zhou <dennis@kernel.org>, linux-kernel@vger.kernel.org,
        Daniel Micay <danielmicay@gmail.com>,
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
        Vlastimil Babka <vbabka@suse.cz>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 6/7] percpu: Add __alloc_size attributes for better
 bounds checking
Message-ID: <YR5m25qD8ul5N+mc@fedora>
References: <20210818214021.2476230-1-keescook@chromium.org>
 <20210818214021.2476230-7-keescook@chromium.org>
 <YR2pE9V1P0xmBWUo@fedora>
 <202108182018.6DA03EA818@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202108182018.6DA03EA818@keescook>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 18, 2021 at 08:36:50PM -0700, Kees Cook wrote:
> On Wed, Aug 18, 2021 at 08:42:59PM -0400, Dennis Zhou wrote:
> > On Wed, Aug 18, 2021 at 02:40:20PM -0700, Kees Cook wrote:
> > > As already done in GrapheneOS, add the __alloc_size attribute for
> > > appropriate percpu allocator interfaces, to provide additional hinting
> > > for better bounds checking, assisting CONFIG_FORTIFY_SOURCE and other
> > > compiler optimizations.
> > 
> > Can you elaborate a little bit for me how this works for percpu? In any
> > case that's not uniprocessor, any modification is done through address
> > accessors and not on the returned percpu pointer. Is the metadata kept
> > by gcc/clang able to transpire the percpu pointer accessors?
> 
> That's an excellent point. :P I haven't tested it through the accessors,
> but I guess it's possible that this is only useful for UP, and even
> then, only where the access is very close to the "allocation", maybe
> like:
> 

I see that this is already pulled by Andrew, but I think it would be
good to modify the commit log to add a short bit about this limitation.
Otherwise, the commit reads as if it's doing way more than it is.

Thanks,
Dennis

> char __percpu *test_buf;
> 
> 	char *buf;
> 	test_var = __alloc_percpu(16, __alignof__(char));
> 	buf = per_cpu_ptr(test_buf, get_cpu());
> 	...
> 	buf[20] = '!';
> 
> -Kees
> 
> > 
> > Thanks,
> > Dennis
> > 
> > > 
> > > Co-developed-by: Daniel Micay <danielmicay@gmail.com>
> > > Signed-off-by: Daniel Micay <danielmicay@gmail.com>
> > > Cc: Dennis Zhou <dennis@kernel.org>
> > > Cc: Tejun Heo <tj@kernel.org>
> > > Cc: Christoph Lameter <cl@linux.com>
> > > Cc: linux-mm@kvack.org
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > ---
> > >  include/linux/percpu.h | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/include/linux/percpu.h b/include/linux/percpu.h
> > > index 5e76af742c80..119f41815b32 100644
> > > --- a/include/linux/percpu.h
> > > +++ b/include/linux/percpu.h
> > > @@ -123,6 +123,7 @@ extern int __init pcpu_page_first_chunk(size_t reserved_size,
> > >  				pcpu_fc_populate_pte_fn_t populate_pte_fn);
> > >  #endif
> > >  
> > > +__alloc_size(1)
> > >  extern void __percpu *__alloc_reserved_percpu(size_t size, size_t align);
> > >  extern bool __is_kernel_percpu_address(unsigned long addr, unsigned long *can_addr);
> > >  extern bool is_kernel_percpu_address(unsigned long addr);
> > > @@ -131,7 +132,9 @@ extern bool is_kernel_percpu_address(unsigned long addr);
> > >  extern void __init setup_per_cpu_areas(void);
> > >  #endif
> > >  
> > > +__alloc_size(1)
> > >  extern void __percpu *__alloc_percpu_gfp(size_t size, size_t align, gfp_t gfp);
> > > +__alloc_size(1)
> > >  extern void __percpu *__alloc_percpu(size_t size, size_t align);
> > >  extern void free_percpu(void __percpu *__pdata);
> > >  extern phys_addr_t per_cpu_ptr_to_phys(void *addr);
> > > -- 
> > > 2.30.2
> > > 
> 
> -- 
> Kees Cook
