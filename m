Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87893D8D4C
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2019 12:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390332AbfJPKHE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Oct 2019 06:07:04 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36856 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388503AbfJPKHE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Oct 2019 06:07:04 -0400
Received: by mail-oi1-f195.google.com with SMTP id k20so19526843oih.3
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Oct 2019 03:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qMLDRlP6KAQbJ6EBR+tTwOR/BZha8QBB781yjh9f+vI=;
        b=IzhRqtVYSIrQOWk8qCQYn4/rTOnHC2BhU7+kR7WbjbeLrfwEgkriTH0i/iiLXUxE6w
         9TY1zEHAxm9LWqj9U9FKFNFpJPksG+o5jpTnwf0AH9L9qx4EjTfEmYZspBAwyoYTq58y
         2XoJim6PnzA8V5rkbEZ+1gHJd/d8E1TT3mVou1qLNPGV59Oh4Lp8AGHQC6TqedqA1I80
         mFPnDoRcUI6zhCDUTpoHxhcuDdKJAMAQgwv1O9N/6gP1uqvOtZZc24tKklN7heCOtCLw
         AGLWDPjGICR0HouGNZzMf7ZxOX6YjI/TIY2ddPvOeO7bcqUGL2vcWzGzn9/wEQ98UyfN
         oZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qMLDRlP6KAQbJ6EBR+tTwOR/BZha8QBB781yjh9f+vI=;
        b=Bho3CpEmSk8wGHkoKiGeuMaOYiMew+HKeodFz0UGaWWjVdK0JoHqKJQH9AQjldM4Sb
         eF2hzuqX5MeQSjW+fGt/8l8XIcvpx/2jEUPVzcB8o2YepLgM8AVUBbZSMgsbZ/YAv4ua
         rUEHNBQ7gYD3YQaYxJ9S7xCHuymGd2sJn6/zyqE1V/m2hvETmeCytd5hyWg9fhBClcXh
         TKOa6JIDAQCpdclz6xNCc5cz9z+9uQBzwRMVvB4cmBkq5sbLrnk/yT8l8hpoGYBI55Ax
         AyGyJ5GUle8PVsDE+flrm7Hwdhi/3Pv1kliJNH2xZtYvkBvF6BiUez0j0jhKZP4N5TD/
         xgtg==
X-Gm-Message-State: APjAAAVFmfafAKjGp6qYnWnvo3ASBAD1/+gvgBMhjsx1mBtlwx2rFSBn
        raVMk9yLZLWeXZP1YfRg5j2FunCoax7daCa38YF3yw==
X-Google-Smtp-Source: APXvYqxWEIV0fVIrxNzDqgv+Do5nMi6aRtYEMsJW2Y12BL+F4CpGAX7l1gYylp2IQRBYF8VTmXy4feTlqfHWT/7/2sQ=
X-Received: by 2002:aca:f492:: with SMTP id s140mr2789533oih.83.1571220422532;
 Wed, 16 Oct 2019 03:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191016083959.186860-1-elver@google.com> <20191016083959.186860-2-elver@google.com>
 <20191016094234.GB2701514@tardis>
In-Reply-To: <20191016094234.GB2701514@tardis>
From:   Marco Elver <elver@google.com>
Date:   Wed, 16 Oct 2019 12:06:51 +0200
Message-ID: <CANpmjNOxmQDKin=9Cyi+ERVQ-ehH79AaPjRvJNfFfmgOjJAogA@mail.gmail.com>
Subject: Re: [PATCH 1/8] kcsan: Add Kernel Concurrency Sanitizer infrastructure
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     LKMM Maintainers -- Akira Yokosawa <akiyks@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Alexander Potapenko <glider@google.com>,
        Andrea Parri <parri.andrea@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andy Lutomirski <luto@kernel.org>, ard.biesheuvel@linaro.org,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
        Daniel Axtens <dja@axtens.net>,
        Daniel Lustig <dlustig@nvidia.com>,
        dave.hansen@linux.intel.com, dhowells@redhat.com,
        Dmitry Vyukov <dvyukov@google.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Joel Fernandes <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Luc Maranget <luc.maranget@inria.fr>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 16 Oct 2019 at 11:42, Boqun Feng <boqun.feng@gmail.com> wrote:
>
> Hi Marco,
>
> On Wed, Oct 16, 2019 at 10:39:52AM +0200, Marco Elver wrote:
> [...]
> > --- /dev/null
> > +++ b/kernel/kcsan/kcsan.c
> > @@ -0,0 +1,81 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/*
> > + * The Kernel Concurrency Sanitizer (KCSAN) infrastructure. For more info please
> > + * see Documentation/dev-tools/kcsan.rst.
> > + */
> > +
> > +#include <linux/export.h>
> > +
> > +#include "kcsan.h"
> > +
> > +/*
> > + * Concurrency Sanitizer uses the same instrumentation as Thread Sanitizer.
>
> Is there any documentation on the instrumentation? Like a complete list
> for all instrumentation functions plus a description of where the
> compiler will use those functions. Yes, the names of the below functions
> are straightforward, but an accurate doc on the instrumentation will
> cerntainly help people review KCSAN.

As far as I'm aware neither GCC nor Clang have documentation on the
emitted instrumentation that we could reference (other than look into
the compiler passes).

However it is as straightforward as it seems: the compiler emits
instrumentation calls for all loads and stores that the compiler
generates; inline asm is not instrumented. I will add a comment to
that effect for v2.

Thanks,
-- Marco

> Regards,
> Boqun
>
> > + */
> > +
> > +#define DEFINE_TSAN_READ_WRITE(size)                                           \
> > +     void __tsan_read##size(void *ptr)                                      \
> > +     {                                                                      \
> > +             __kcsan_check_access(ptr, size, false);                        \
> > +     }                                                                      \
> > +     EXPORT_SYMBOL(__tsan_read##size);                                      \
> > +     void __tsan_write##size(void *ptr)                                     \
> > +     {                                                                      \
> > +             __kcsan_check_access(ptr, size, true);                         \
> > +     }                                                                      \
> > +     EXPORT_SYMBOL(__tsan_write##size)
> > +
> > +DEFINE_TSAN_READ_WRITE(1);
> > +DEFINE_TSAN_READ_WRITE(2);
> > +DEFINE_TSAN_READ_WRITE(4);
> > +DEFINE_TSAN_READ_WRITE(8);
> > +DEFINE_TSAN_READ_WRITE(16);
> > +
> > +/*
> > + * Not all supported compiler versions distinguish aligned/unaligned accesses,
> > + * but e.g. recent versions of Clang do.
> > + */
> > +#define DEFINE_TSAN_UNALIGNED_READ_WRITE(size)                                 \
> > +     void __tsan_unaligned_read##size(void *ptr)                            \
> > +     {                                                                      \
> > +             __kcsan_check_access(ptr, size, false);                        \
> > +     }                                                                      \
> > +     EXPORT_SYMBOL(__tsan_unaligned_read##size);                            \
> > +     void __tsan_unaligned_write##size(void *ptr)                           \
> > +     {                                                                      \
> > +             __kcsan_check_access(ptr, size, true);                         \
> > +     }                                                                      \
> > +     EXPORT_SYMBOL(__tsan_unaligned_write##size)
> > +
> > +DEFINE_TSAN_UNALIGNED_READ_WRITE(2);
> > +DEFINE_TSAN_UNALIGNED_READ_WRITE(4);
> > +DEFINE_TSAN_UNALIGNED_READ_WRITE(8);
> > +DEFINE_TSAN_UNALIGNED_READ_WRITE(16);
> > +
> > +void __tsan_read_range(void *ptr, size_t size)
> > +{
> > +     __kcsan_check_access(ptr, size, false);
> > +}
> > +EXPORT_SYMBOL(__tsan_read_range);
> > +
> > +void __tsan_write_range(void *ptr, size_t size)
> > +{
> > +     __kcsan_check_access(ptr, size, true);
> > +}
> > +EXPORT_SYMBOL(__tsan_write_range);
> > +
> > +/*
> > + * The below are not required KCSAN, but can still be emitted by the compiler.
> > + */
> > +void __tsan_func_entry(void *call_pc)
> > +{
> > +}
> > +EXPORT_SYMBOL(__tsan_func_entry);
> > +void __tsan_func_exit(void)
> > +{
> > +}
> > +EXPORT_SYMBOL(__tsan_func_exit);
> > +void __tsan_init(void)
> > +{
> > +}
> > +EXPORT_SYMBOL(__tsan_init);
> [...]
