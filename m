Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D84347DD9
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Mar 2021 17:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236413AbhCXQjA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Mar 2021 12:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236408AbhCXQi6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Mar 2021 12:38:58 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1382C061763
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Mar 2021 09:38:57 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id l4so11679567vsc.7
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Mar 2021 09:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wNHiEG33VxCvMonOriWGNjj3ArhqwshcClwSjyhBeSM=;
        b=aIdOLKogREItDPzd5A+jRjsMTc+xmHWs2f8DXYi4nKG1WB6O5apxTb0kST6RgOkHem
         ghgvEZWjF8nRr4dbvSOuwWbwjFPuV/vbaRD3Z7CGoVZawIxEFV5mJsE5ZtJNXdRjxRPM
         /pgQmlNT52f7FhktYcLYtuo6wxnQ3p+E5JGCLX8DI9PAwVPuYWrmoFrgkcQEOH3bWko1
         yeUR3ZGC2yXuGY5z4MB6db/ziAwUVV0vGN+TjSPkoDw6IcyU8wT+LKtbwhYggLzRtOkn
         QaW82SDYSI17mjm1c8GXof1fEQ8QDILZ6717zNSQ+sv7WNZgh0LtIzkVfeFDKEGTQ5cn
         qx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wNHiEG33VxCvMonOriWGNjj3ArhqwshcClwSjyhBeSM=;
        b=cmU2SydxZI/QAm96NDsgp0ZOrMaz9OddpkXiIi0W5DsUOCey+fF7eiT1Cp5u0keYX2
         RZf/CnY10oYw8iPCkAZHmxXKe0L8qBp5c3laNos+NVbrvYuJhn/JHaZ7+qTT62CcQWB7
         kOPn5yMMKGNovD5dtnjg8mjbHIlk5Jc3NmCQANvrREmUXFnWuvIUpG9epRSUB2F8zsNj
         6ehgDqdJkQBy9nBfmM59zYFi23m1UuLj09xv7O4TqP9I2X3vASQRfG6dbOAInrhj9aNs
         ckOajvvzgrGBlGFYl1NDLxjmI7DwZPieXYFtGiOi41pj7nNjtN0AYmG4PVyfFV67tLzk
         pC/w==
X-Gm-Message-State: AOAM533bt8sLIi2hFXu1p/SEUtMA17Jx9FH7r9ppxOpuSTMjUS6hX5hG
        ic45uI+mqKA1XM39U2CG8hTVwExJ/ZpHvVScqSEowg==
X-Google-Smtp-Source: ABdhPJyWiP2FO1YBFJh/0mu3kCEijgEQEuiJ4RCJ6qBqZ4V3CaaQ9VqbbV+Q52zSjlticSrKlbcWuV02zo+EVO7D8+4=
X-Received: by 2002:a67:2803:: with SMTP id o3mr2580346vso.36.1616603936571;
 Wed, 24 Mar 2021 09:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210323203946.2159693-1-samitolvanen@google.com>
 <20210323203946.2159693-3-samitolvanen@google.com> <92afcbea-1415-2df1-5e78-4e9a7a4d364b@rasmusvillemoes.dk>
In-Reply-To: <92afcbea-1415-2df1-5e78-4e9a7a4d364b@rasmusvillemoes.dk>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Wed, 24 Mar 2021 09:38:45 -0700
Message-ID: <CABCJKudTZang_aUCnO63MFUc5mud3DKpHUgRFB-e04L__j_XHA@mail.gmail.com>
Subject: Re: [PATCH v3 02/17] cfi: add __cficanonical
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Peter Zijlstra <peterz@infradead.org>,
        bpf <bpf@vger.kernel.org>, linux-hardening@vger.kernel.org,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        PCI <linux-pci@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 24, 2021 at 8:31 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> On 23/03/2021 21.39, Sami Tolvanen wrote:
> > With CONFIG_CFI_CLANG, the compiler replaces a function address taken
> > in C code with the address of a local jump table entry, which passes
> > runtime indirect call checks. However, the compiler won't replace
> > addresses taken in assembly code, which will result in a CFI failure
> > if we later jump to such an address in instrumented C code. The code
> > generated for the non-canonical jump table looks this:
> >
> >   <noncanonical.cfi_jt>: /* In C, &noncanonical points here */
> >       jmp noncanonical
> >   ...
> >   <noncanonical>:        /* function body */
> >       ...
> >
> > This change adds the __cficanonical attribute, which tells the
> > compiler to use a canonical jump table for the function instead. This
> > means the compiler will rename the actual function to <function>.cfi
> > and points the original symbol to the jump table entry instead:
> >
> >   <canonical>:           /* jump table entry */
> >       jmp canonical.cfi
> >   ...
> >   <canonical.cfi>:       /* function body */
> >       ...
> >
> > As a result, the address taken in assembly, or other non-instrumented
> > code always points to the jump table and therefore, can be used for
> > indirect calls in instrumented code without tripping CFI checks.
>
> Random ramblings, I'm trying to understand how this CFI stuff works.
>
> First, patch 1 and 2 explain the pros and cons of canonical vs
> non-canonical jump tables, in either case, there's problems with stuff
> implemented in assembly. But I don't understand why those pros and cons
> then end up with using the non-canonical jump tables by default. IIUC,
> with canonical jump tables, function pointer equality would keep working
> for functions implemented in C, because &func would always refer to the
> same stub "function" that lives in the same object file as func.cfi,
> whereas with the non-canonical version, each TU (or maybe DSO) that
> takes the address of func ends up with its own func.cfi_jt.

Correct.

> There are of course lots of direct calls of assembly functions, but
> I don't think we take the address of such functions very often. So why
> can't we instead equip the declarations of those with a
> __cfi_noncanonical attribute?

Clang doesn't support these attributes in function declarations,
unfortunately. If it did, that would certainly help, until someone
wants to compare addresses of assembly functions, in which case we
would again have a problem.

Another way to work around the issue with canonical CFI would be to
add C wrappers for all address-taken assembly functions, but that's
not quite ideal either. I think most indirect calls to assembly
functions happen in the crypto code, which would have required so many
changes that we decided to default to non-canonical CFI instead. This
resulted in far fewer kernel changes despite the cross-module function
address equality issue.

Sami
