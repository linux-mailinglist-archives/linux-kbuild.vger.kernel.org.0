Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 757CE402130
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Sep 2021 23:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240071AbhIFVxo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Sep 2021 17:53:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51271 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236600AbhIFVxk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Sep 2021 17:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630965154;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:in-reply-to:in-reply-to:  references:references;
        bh=RiQRlnc+QePT23Ng+AhQWm6c9mQGSn/3BlHMqrjDwFk=;
        b=V+BMQ+YFRC4FvvKa7eQXRMc4eRbWEB6oAXSm51F4umw737ULw+oLIiwWZQZ0wrjk7zubZk
        qHfyCLbmW6h3jHUpYlxuzJf6leJgBvjHkVembeMUqdPJOiPeZCbcg+mNrMLx4zvxLtmXXD
        9wTsJuEnRqnKQhJFeRKQUGfqwCFxn44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-ElLduOG-PemaJUlHEYPt9Q-1; Mon, 06 Sep 2021 17:52:31 -0400
X-MC-Unique: ElLduOG-PemaJUlHEYPt9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0995A80196C;
        Mon,  6 Sep 2021 21:52:30 +0000 (UTC)
Received: from tucnak.zalov.cz (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A295F5D9CA;
        Mon,  6 Sep 2021 21:52:28 +0000 (UTC)
Received: from tucnak.zalov.cz (localhost [127.0.0.1])
        by tucnak.zalov.cz (8.16.1/8.16.1) with ESMTPS id 186LqIvf393816
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Mon, 6 Sep 2021 23:52:18 +0200
Received: (from jakub@localhost)
        by tucnak.zalov.cz (8.16.1/8.16.1/Submit) id 186LqIUA393220;
        Mon, 6 Sep 2021 23:52:18 +0200
Date:   Mon, 6 Sep 2021 23:52:18 +0200
From:   Jakub Jelinek <jakub@redhat.com>
To:     Linus Torvalds <torvalds@linuxfoundation.org>
Cc:     Segher Boessenkool <segher@kernel.crashing.org>,
        Florian Weimer <fweimer@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
Message-ID: <20210906215218.GA920497@tucnak>
Reply-To: Jakub Jelinek <jakub@redhat.com>
References: <20210904191531.GS1583@gate.crashing.org>
 <CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com>
 <20210906154642.GV1583@gate.crashing.org>
 <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com>
 <20210906172701.GX1583@gate.crashing.org>
 <CAHk-=wh0MBVfA89WLWnCiSnJ2a=hSAoSxfG-jyf7JJeBDPK3ew@mail.gmail.com>
 <87lf49wodu.fsf@oldenburg.str.redhat.com>
 <20210906194808.GY1583@gate.crashing.org>
 <20210906201432.GZ920497@tucnak>
 <CAHk-=wi80NGPppGmBpc5zuGRAsv4_7qsDu7ehW515J2FJoezAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi80NGPppGmBpc5zuGRAsv4_7qsDu7ehW515J2FJoezAQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 06, 2021 at 02:08:58PM -0700, Linus Torvalds wrote:
> > the only guaranteed APIs are
> > those provided by the headers (x86intrin.h/*mmintrin.h etc. on x86,
> > arm_{neon,sve}.h etc. on arm*, ...)
> 
> You guys realize we don't use those, do you?

The x86intrin.h/*mmintrin.h on x86 indeed not, arm_neon.h is used in the
kernel:
arch/arm64/include/asm/neon-intrinsics.h:#include <arm_neon.h>
arch/arm64/lib/xor-neon.c:#include <asm/neon-intrinsics.h>
The arm intrinsics headers are similar to the x86 ones in that the only
supported APIs are the ones provided by the headers, the underlying builtins
can change.

> That "immintrin.h" file, for example, is simply not usable for the
> kernel. I just checked.
> 
> Why? Because it ends up doing exactly all those things that MUST NOT
> be done for the kernel.
> 
>    In file included from
> /usr/lib/gcc/x86_64-redhat-linux/11/include/xmmintrin.h:34,
>                     from
> /usr/lib/gcc/x86_64-redhat-linux/11/include/immintrin.h:31,
>                     from t.c:1:
>    /usr/lib/gcc/x86_64-redhat-linux/11/include/mm_malloc.h:27:10:
> fatal error: stdlib.h: No such file or directory
>       27 | #include <stdlib.h>
>          |          ^~~~~~~~~~
> 
> Oops.

It is actually not that bad, stdlib.h is indeed included there because of 2
intrinsics out of more than 5000 and when one doesn't need those, just
#define _MM_MALLOC_H_INCLUDED
#include <x86intrin.h>
will get rid of the stdlib.h include and those 2 APIs that wouldn't be
usable in the kernel anyway.  There is a stddef.h include too and that's it
(I must say I don't see the reason for that include though).

Other compiler provided headers (not talking about C++ now) also have no
or very limited includes, including stddef.h, stdarg.h, stdatomic.h, etc.
The only exceptions are tgmath.h which isn't usable without libc
math.h/complex.h, in some cases stdint.h and limits.h which are in some
configurations provided both by the C library and the compiler and include
each other in that case (but e.g. stdint.h has an alternate version that
only uses compiler provided builtin macros) and openacc.h.

Sure, the glibc headers are a different thing.

	Jakub

