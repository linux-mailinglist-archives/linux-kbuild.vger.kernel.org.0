Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C05F3F7AAA
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Aug 2021 18:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241145AbhHYQeu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Aug 2021 12:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239700AbhHYQeu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Aug 2021 12:34:50 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77219C0613CF
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 09:34:04 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id 2so205947pfo.8
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 09:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6gejzDovBE5iuyuLz1hruEggadPtmSQG8HRcS9hcb10=;
        b=GbxNR4ElwFyWcJgWo+tCWcZLf00B+Z2Vmtk9ZQCzbpZRuGR+62kJB5UXPUdLfMZ7qe
         8I3BkoiVwC3G1+hadZLEeX/h0WjlD4pX70B8Z13Njs5KI3H4x7xDKgl5zdPDNCkJkAHZ
         dsDLLSPuCR7BNJ1zf42UHS2YUuTtZLC3fG3ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6gejzDovBE5iuyuLz1hruEggadPtmSQG8HRcS9hcb10=;
        b=jkTJJB7jDPJ3lG+4tBZnWSut94pdY2AZHTEi4OKywmHVp6zsAhWAkEOKRN+v/eVKt0
         /Uf5UqC7cPsyIeK9TVCqhO6juqXdZL5+Enc3Qn+1b6BwR/bLWtwLorWTBRMgQ03Op2kN
         QdiXf31CchJ/eIFlBCrwj5dYL8YYNrFQIFRYN7riAF/Z49PijIkkKHUKlyhmWJXejMCY
         yrWfilAL8Z9NshfYje608usoCQzuKAD6dW9Q3+x8+k4IYAeGQWWzw6O6+6YF0TJIik2D
         /ndQg4amxTrnsAme87Z6WwxNKm+7Nj+kFmzylwpAgqDVbt2QIAyyI/ncJC/a4ucqSxtD
         Tenw==
X-Gm-Message-State: AOAM533b8UlMTEdggu+W7hxtKRGCH6THeV9HrGiua4orl5xCYZk81sZg
        va3oqdFgMWeKHMVRzMatswULXg==
X-Google-Smtp-Source: ABdhPJx0d2gtu/6AIisV6tawjy+0JIqWnbbfAIMeMMyluAgBJFE83MjdsKdasSqsPWqClwNX5kV2Xg==
X-Received: by 2002:a63:705:: with SMTP id 5mr8798958pgh.265.1629909243823;
        Wed, 25 Aug 2021 09:34:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h20sm278384pfn.173.2021.08.25.09.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 09:34:03 -0700 (PDT)
Date:   Wed, 25 Aug 2021 09:34:01 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Christoph Lameter <cl@gentwo.de>
Cc:     Daniel Micay <danielmicay@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
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
Message-ID: <202108250930.EED99F6@keescook>
References: <20210818050841.2226600-1-keescook@chromium.org>
 <YR4frlpfJQonPuKp@infradead.org>
 <CA+DvKQL6pLfK1vRzaOkEWR7DQLgTh=WZTka2L5yuS8Lf_1ZmoA@mail.gmail.com>
 <alpine.DEB.2.22.394.2108251158420.317806@gentwo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2108251158420.317806@gentwo.de>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 25, 2021 at 12:01:42PM +0200, Christoph Lameter wrote:
> On Thu, 19 Aug 2021, Daniel Micay wrote:
> 
> > For example, it will know that kmalloc(n) returns either NULL or an
> > allocation of size n. A simple sample program with calloc in
> > userspace:
> >
> >     #include <stdlib.h>
> >     #include <stdio.h>
> >
> >     int main(void) {
> >         char *p = calloc(64, 1);
> >         if (!p) {
> >             return 1;
> >         }
> >         printf("%zu\n", __builtin_object_size(p, 1));
> >         return 0;
> >     }
> >
> > It will also detect an out-of-bounds access via the allocation with
> > -fsanitize=object-size including with a runtime value as the index.
> >
> > It's not as useful as it should be yet because __builtin_object_size
> > must return a compile-time constant. Clang has a new
> > __builtin_dynamic_object_size that's allowed to return a value that's
> > not a compile-time constant so it can work for kmalloc(n) where n is a
> > runtime value. It might not be quite ready for use yet but it should
> > be able to make it a lot more useful. GCC also seems open to adding it
> > too.
> 
> The other complication with kmalloc etc is that the slab allocators may
> decided to allocate more bytes than needed because it does not support
> that particular allocation size. Some functions check the allocated true
> size and make use of that. See ksize().

Yup, this is known. For the current iteration, this doesn't pose a
problem since the compile-time checking has very limited scope.

-- 
Kees Cook
