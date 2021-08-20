Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3C23F2678
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Aug 2021 07:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232732AbhHTF2G (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Aug 2021 01:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbhHTF2F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Aug 2021 01:28:05 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26A8BC061575
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Aug 2021 22:27:28 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id j10-20020a17090a94ca00b00181f17b7ef7so180864pjw.2
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Aug 2021 22:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SGRbSAfBSvn06RBLUf1ChYkatAx1DB8aY9rwM3r+UEw=;
        b=e8yLPfT1ZSJ15iZJiMw6qxGa0HiNLjixxvbjRpRN6qn/MyzHf3UPtdtI1dJB26alb+
         Qiv4vMyVf+ZBzt5qL2e7P26WvObBL+fntQjp3AuRoh1x7ufZ1AuoO3AP7hJdvmFloS5X
         C2Sk1T60D/qeAxP9SnkCnfuqUHGYhywaprLOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SGRbSAfBSvn06RBLUf1ChYkatAx1DB8aY9rwM3r+UEw=;
        b=djV552Av0IeuvVQ//8GAPuEQr4Wuj5JxotG1L7WBIN+vwhzQrSV4IXLfinijaYhsA9
         I2r71TJxxGlVEnm92kmuHV9yFCWiMA/UvCJhBrIaBuKk49IXgVaNV0SRr0O7FHutz1Im
         buiWaCsGgd0Gv1laCbg7XZWDtl3oGCVsDtXu5O3+uxkK+ZP/pL/clNqShOPaTQqHYgaU
         9VZKIzdL4faFxMoRdapydWxvu4M+tOkMtuDNhYcw/evQaSDkXo+6dbRHNCR9DhBI8RC3
         6IyFk/NFNBBp/qz8QMtQeTvZjS+9mrpl/DgxLxc9cidnp849CcUwqZ7hMXI5CoSI/QJP
         ssmA==
X-Gm-Message-State: AOAM531lej3p6OTRxcVY6fb0spnmiSxSXcu+gfkVMvc9G3kOJ9zrRjPl
        /owikhhN/cjLJ0XXnohgPI/INQ==
X-Google-Smtp-Source: ABdhPJwX1NPLF/0ZDXyifbZDds9efkUT2BZeh4+tFK3WyhH4OD0Y63/3fscyHpJrqhFd0h2f06W4Pw==
X-Received: by 2002:a17:90a:bd08:: with SMTP id y8mr2815251pjr.123.1629437247529;
        Thu, 19 Aug 2021 22:27:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 10sm5639485pjc.41.2021.08.19.22.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 22:27:27 -0700 (PDT)
Date:   Thu, 19 Aug 2021 22:27:26 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
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
        Vlastimil Babka <vbabka@suse.cz>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 6/7] percpu: Add __alloc_size attributes for better
 bounds checking
Message-ID: <202108192221.396DFDC9@keescook>
References: <20210818214021.2476230-1-keescook@chromium.org>
 <20210818214021.2476230-7-keescook@chromium.org>
 <20210819221115.b3a34e280cfe748ad6a76b04@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819221115.b3a34e280cfe748ad6a76b04@linux-foundation.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 19, 2021 at 10:11:15PM -0700, Andrew Morton wrote:
> On Wed, 18 Aug 2021 14:40:20 -0700 Kees Cook <keescook@chromium.org> wrote:
> 
> > As already done in GrapheneOS, add the __alloc_size attribute for
> > appropriate percpu allocator interfaces, to provide additional hinting
> > for better bounds checking, assisting CONFIG_FORTIFY_SOURCE and other
> > compiler optimizations.
> > 
> 
> Caught one, I assume:
> 
> In file included from ./include/linux/string.h:262,
>                  from ./include/linux/bitmap.h:11,
>                  from ./include/linux/cpumask.h:12,
>                  from ./arch/x86/include/asm/cpumask.h:5,
>                  from ./arch/x86/include/asm/msr.h:11,
>                  from ./arch/x86/include/asm/processor.h:22,
>                  from ./arch/x86/include/asm/cpufeature.h:5,
>                  from ./arch/x86/include/asm/thread_info.h:53,
>                  from ./include/linux/thread_info.h:60,
>                  from ./arch/x86/include/asm/preempt.h:7,
>                  from ./include/linux/preempt.h:78,
>                  from ./include/linux/spinlock.h:55,
>                  from ./include/linux/mmzone.h:8,
>                  from ./include/linux/gfp.h:6,
>                  from ./include/linux/slab.h:15,
>                  from drivers/misc/lkdtm/heap.c:7:
> In function 'memset',
>     inlined from 'lkdtm_VMALLOC_LINEAR_OVERFLOW' at drivers/misc/lkdtm/heap.c:27:2:
> ./include/linux/fortify-string.h:172:3: error: call to '__write_overflow' declared with attribute error: detected write beyond size of object passed as 1st parameter
>   172 |   __write_overflow();
>       |   ^~~~~~~~~~~~~~~~~~
> make[3]: *** [drivers/misc/lkdtm/heap.o] Error 1
> make[2]: *** [drivers/misc/lkdtm] Error 2
> make[1]: *** [drivers/misc] Error 2
> make: *** [drivers] Error 2
> 
> I want to get a kernel release out, so I'll hide
> mm-vmalloc-add-__alloc_size-attributes-for-better-bounds-checking.patch
> for now.

In the cover letter[1], I listed the needed fixes that were sent
separately from this series. Quoting here:

> To build without warnings, this series needs a couple small fixes for
> allmodconfig, which I sent separately:
> https://lore.kernel.org/lkml/20210818174855.2307828-5-keescook@chromium.org/
> https://lore.kernel.org/lkml/20210818044252.1533634-1-keescook@chromium.org/
> https://lore.kernel.org/lkml/20210818043912.1466447-1-keescook@chromium.org/

What you hit is the first one, which is already in Greg's tree:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/commit/?h=char-misc-next&id=e6d468d32cd084edd030a8bae76440b17b854b5c

The other two have also been taken:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?h=staging-next&id=cbe34165cc1b7d1110b268ba8b9f30843c941639
https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=a31e5a4158d03595ca4258b94397d4097be0ebe4

-Kees

[1] https://lore.kernel.org/lkml/20210818214021.2476230-1-keescook@chromium.org/

-- 
Kees Cook
