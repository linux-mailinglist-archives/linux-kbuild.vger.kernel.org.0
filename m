Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB97F24E084
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Aug 2020 21:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgHUTPH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 15:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726243AbgHUTPC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 15:15:02 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A4FC061573;
        Fri, 21 Aug 2020 12:15:02 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id x69so2342043qkb.1;
        Fri, 21 Aug 2020 12:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0sLKvJx3aFnV8gtyaecG7WJ6uhDEbkAGQLVXZ3qP928=;
        b=Xah160YCM0xzn9UUnKwjd0claCM16C/euOHhTTE9ub37R9WxWzmf/MF1E4NIHpdfdQ
         koPkrqtlc4zIsZwVMU5ndHSLC6pPRXvHIYdmMPriU4OUVg/x0Pqx/mw9q1w2h+Q4o8/K
         kChmgNYiy9C4UScQOFMZn2aTcKJUObYHdXIIEfCFkgKoS+qL14kmcnbXkWldyzpn+L4t
         vFnIkshF7iA/UYigdg0+v9a11nVsTYGPBfRB67k6GGLvvXRhHmIQ8C4u4Qivvk6dlu0d
         rKVJ9aGesIrp7nm1pH35rfXmpnbfp6hdOSJ+n0zizmtUcA7EkdBaOUUpSjJ1dcuR6swG
         7rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=0sLKvJx3aFnV8gtyaecG7WJ6uhDEbkAGQLVXZ3qP928=;
        b=jGRnWhTgZYzf855ueLsWxjRU909w+jKG9DbbtoUwwaAbzCjrFZMK9IstCvSsAP3/Bq
         wPXA4m23F5gpZ0DMc8nmxKDIh+RunuAVDogaqZj3kmhRWSHaMGJnhbs4A8OZD6Om2GLO
         eZtyOVx3GhTcpD4YG5AC0Q5x1yCgIbNxI8L2B9CqBqBCWhmbbpmSKw2m+xxrBXa0IyC7
         LEuBNe+MSAe5umJK8N5eVoiH41YSLnEFSzxJhfxUQ8Z+o3jG8vfpxW/Yw1GFyzS7E8GI
         mCX6175wUR+pM0idefLa0v/sKILnP8pDv2klE+gXz+ezKviOImyAqvcXunCZaSBoVuFw
         WrSA==
X-Gm-Message-State: AOAM530b9V9z79IvnETlgKARp3CzoOlxdHMy8H4PhDNRUgGkW4xyFwTJ
        sz2EPOvYdkVqxfZJUsNgGSQ=
X-Google-Smtp-Source: ABdhPJz8iysSUxGCA55UQ5iXlD4Gs/QH7SLXCNC+V5QN/wcnVdmjYLu5nATOqx54Mm7/5VktdlOJiQ==
X-Received: by 2002:a37:9e48:: with SMTP id h69mr4206764qke.249.1598037301820;
        Fri, 21 Aug 2020 12:15:01 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id y46sm2945634qth.78.2020.08.21.12.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 12:15:01 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Fri, 21 Aug 2020 15:14:58 -0400
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        =?utf-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Joe Perches <joe@perches.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Daniel Axtens <dja@axtens.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Yury Norov <yury.norov@gmail.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Marco Elver <elver@google.com>,
        Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
Message-ID: <20200821191458.GA1475504@rani.riverdale.lan>
References: <20200818202407.GA3143683@rani.riverdale.lan>
 <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
 <20200818214146.GA3196105@rani.riverdale.lan>
 <df6c1da4-b910-ecb8-0de2-6156dd651be6@rasmusvillemoes.dk>
 <20200820175617.GA604994@rani.riverdale.lan>
 <CAHk-=whn91ar+EbcBXQb9UXad00Q5WjU-TCB6UBzVba682a4ew@mail.gmail.com>
 <20200821172935.GA1411923@rani.riverdale.lan>
 <CAHk-=wi8vdb+wo-DACDpSijYfAbCs135YcnnAbRhGJcU+A=-+Q@mail.gmail.com>
 <CAHk-=whjVCTjZG0Y88WhJruLdbxF=7q3mmFThD+N5WK0P5giSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=whjVCTjZG0Y88WhJruLdbxF=7q3mmFThD+N5WK0P5giSw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 21, 2020 at 11:02:08AM -0700, Linus Torvalds wrote:
> On Fri, Aug 21, 2020 at 10:54 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Fri, Aug 21, 2020 at 10:29 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> > >
> > > This is why I'm saying clang's no-builtin-foo option is useful for
> > > embedded: it doesn't prevent the programmer using __builtin_foo(), it
> > > prevents the _compiler_ using __builtin_foo() on its own.
> >
> > And that's fine. But it's apparently not what gcc does.
> 
> Oh, testing it seems to say that that is exactly what gcc does too. I
> must have misunderstood some comment in this thread to mean otherwise.
> 
>                 Linus

How are you testing it?

https://godbolt.org/z/eahdGn
