Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E40CC3F2657
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Aug 2021 07:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233108AbhHTFL4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Aug 2021 01:11:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:48880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231524AbhHTFLz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Aug 2021 01:11:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC1966054E;
        Fri, 20 Aug 2021 05:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1629436278;
        bh=cc0SAzsXcx00EyeJ0FnbHDyCca6n3ae4I61WSDxYEwA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bvG0F0sKpl38gpuSoBBM0DZ34c97J/dKjpUWMG8mSl3eY714SZ4ZWdp1CQY8YNrA2
         SPU8krSWxILdcGpNCLNNpl3SdCjAgi0zjp2U1rC0n6EVvrIEJaZlb50Q7cdfCLrPAX
         lEVaPGgaOoS19JK0+ItRQJeLSQeMZf5dbV0xOzew=
Date:   Thu, 19 Aug 2021 22:11:15 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
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
        Vlastimil Babka <vbabka@suse.cz>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 6/7] percpu: Add __alloc_size attributes for better
 bounds checking
Message-Id: <20210819221115.b3a34e280cfe748ad6a76b04@linux-foundation.org>
In-Reply-To: <20210818214021.2476230-7-keescook@chromium.org>
References: <20210818214021.2476230-1-keescook@chromium.org>
        <20210818214021.2476230-7-keescook@chromium.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 18 Aug 2021 14:40:20 -0700 Kees Cook <keescook@chromium.org> wrote:

> As already done in GrapheneOS, add the __alloc_size attribute for
> appropriate percpu allocator interfaces, to provide additional hinting
> for better bounds checking, assisting CONFIG_FORTIFY_SOURCE and other
> compiler optimizations.
> 

Caught one, I assume:

In file included from ./include/linux/string.h:262,
                 from ./include/linux/bitmap.h:11,
                 from ./include/linux/cpumask.h:12,
                 from ./arch/x86/include/asm/cpumask.h:5,
                 from ./arch/x86/include/asm/msr.h:11,
                 from ./arch/x86/include/asm/processor.h:22,
                 from ./arch/x86/include/asm/cpufeature.h:5,
                 from ./arch/x86/include/asm/thread_info.h:53,
                 from ./include/linux/thread_info.h:60,
                 from ./arch/x86/include/asm/preempt.h:7,
                 from ./include/linux/preempt.h:78,
                 from ./include/linux/spinlock.h:55,
                 from ./include/linux/mmzone.h:8,
                 from ./include/linux/gfp.h:6,
                 from ./include/linux/slab.h:15,
                 from drivers/misc/lkdtm/heap.c:7:
In function 'memset',
    inlined from 'lkdtm_VMALLOC_LINEAR_OVERFLOW' at drivers/misc/lkdtm/heap.c:27:2:
./include/linux/fortify-string.h:172:3: error: call to '__write_overflow' declared with attribute error: detected write beyond size of object passed as 1st parameter
  172 |   __write_overflow();
      |   ^~~~~~~~~~~~~~~~~~
make[3]: *** [drivers/misc/lkdtm/heap.o] Error 1
make[2]: *** [drivers/misc/lkdtm] Error 2
make[1]: *** [drivers/misc] Error 2
make: *** [drivers] Error 2

I want to get a kernel release out, so I'll hide
mm-vmalloc-add-__alloc_size-attributes-for-better-bounds-checking.patch
for now.

