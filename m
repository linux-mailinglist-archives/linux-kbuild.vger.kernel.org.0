Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A06E3F72BA
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Aug 2021 12:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238949AbhHYKL1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Aug 2021 06:11:27 -0400
Received: from vmi485042.contaboserver.net ([161.97.139.209]:34644 "EHLO
        gentwo.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239874AbhHYKLZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Aug 2021 06:11:25 -0400
X-Greylist: delayed 537 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Aug 2021 06:11:25 EDT
Received: by gentwo.de (Postfix, from userid 1001)
        id E4281B004CA; Wed, 25 Aug 2021 12:01:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by gentwo.de (Postfix) with ESMTP id E2A99B0021C;
        Wed, 25 Aug 2021 12:01:42 +0200 (CEST)
Date:   Wed, 25 Aug 2021 12:01:42 +0200 (CEST)
From:   Christoph Lameter <cl@gentwo.de>
To:     Daniel Micay <danielmicay@gmail.com>
cc:     Christoph Hellwig <hch@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, Linux-MM <linux-mm@kvack.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 0/5] Add __alloc_size() for better bounds checking
In-Reply-To: <CA+DvKQL6pLfK1vRzaOkEWR7DQLgTh=WZTka2L5yuS8Lf_1ZmoA@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2108251158420.317806@gentwo.de>
References: <20210818050841.2226600-1-keescook@chromium.org> <YR4frlpfJQonPuKp@infradead.org> <CA+DvKQL6pLfK1vRzaOkEWR7DQLgTh=WZTka2L5yuS8Lf_1ZmoA@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 19 Aug 2021, Daniel Micay wrote:

> For example, it will know that kmalloc(n) returns either NULL or an
> allocation of size n. A simple sample program with calloc in
> userspace:
>
>     #include <stdlib.h>
>     #include <stdio.h>
>
>     int main(void) {
>         char *p = calloc(64, 1);
>         if (!p) {
>             return 1;
>         }
>         printf("%zu\n", __builtin_object_size(p, 1));
>         return 0;
>     }
>
> It will also detect an out-of-bounds access via the allocation with
> -fsanitize=object-size including with a runtime value as the index.
>
> It's not as useful as it should be yet because __builtin_object_size
> must return a compile-time constant. Clang has a new
> __builtin_dynamic_object_size that's allowed to return a value that's
> not a compile-time constant so it can work for kmalloc(n) where n is a
> runtime value. It might not be quite ready for use yet but it should
> be able to make it a lot more useful. GCC also seems open to adding it
> too.

The other complication with kmalloc etc is that the slab allocators may
decided to allocate more bytes than needed because it does not support
that particular allocation size. Some functions check the allocated true
size and make use of that. See ksize().
