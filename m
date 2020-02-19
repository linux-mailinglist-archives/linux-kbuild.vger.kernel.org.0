Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 192FD164E94
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Feb 2020 20:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgBSTLb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Feb 2020 14:11:31 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:54557 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgBSTLb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Feb 2020 14:11:31 -0500
Received: by mail-pj1-f67.google.com with SMTP id dw13so466815pjb.4
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Feb 2020 11:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ap2ctb13s1qbCfj4OTZiKRJIdNv9n1BdWeqlAwLw5Qg=;
        b=jcMcqCD/4wwPKW1BHPXI7rg577Xt5FZSRtafy05KYiATgkZDsr7BgHYLd+lGSHb+2C
         AVZ1aC8O25vV/DHzCNwchjAmiG2WZZSFwCt67Fss+0OVrlHba21K+6IYAmYgzxUEROYY
         xwtbemqIexJTa2NGIKygqTcwTw1znjQKZdY4IZ0gvY5dqKodKNQiEpLqmO2PqWCrCPI7
         L8qWqe5AKFU8sS3MtQoI9Bio+svQB7yq+GigZmKlYGHQGbQ2PyYxy+BA7zf+/MDJpvRB
         BLUNm/M8cExRUuK8PLQc7v9m1dAdNezOvibNmKaxQVKVl0l6e/DrLcgOyG/XsKgbabxP
         KLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ap2ctb13s1qbCfj4OTZiKRJIdNv9n1BdWeqlAwLw5Qg=;
        b=p4XKi2LuDKzwIH3IKBXzBe5QX+KN83vEQnmXf5sYVQHG3quHayyKYI0Gd1LYV8OSDc
         uK27/nJx7FF+n0Sum5oCvG0eGglw50tZYzgPMBpt4phDQMq8aXtspGgOd+lnkjU5aJ5a
         afolBZ/EQheIBuNXOue9j3nZuztaqNWC0v5YATUjN02Wt8LVW71utrIMeIJwzGFGlXhQ
         6yjaOx4wNmioZY+5om24WDzfAAkH8LNjxlyJ0VAlVpVfiY8WHDZ4nNenX4ldAZXtmR9Q
         Yru+taZAKG3Dsx1cgXxe9j9X5fISpGroIgl9DgE3jsLsX6odx4j+L8iQEFqKB7QZc/MX
         AJBw==
X-Gm-Message-State: APjAAAU4lFIRyo8ZwTWxl2tuuD9MGlJavZYYvB3VEZOI+qPE4SI8AiMe
        3p1uh4iHz9vZljFkGT2GTOe7Q2oMXsq0l/HJV33aAQ==
X-Google-Smtp-Source: APXvYqztPgBIuE+BF1ZFh+oiIEmClwhAkgolIs71KHBbWVvRtiGt0/phNlarS8Hv9uDQY15pC7dm7FoVZLJyzFQZaQA=
X-Received: by 2002:a17:90a:3745:: with SMTP id u63mr10347452pjb.123.1582139490281;
 Wed, 19 Feb 2020 11:11:30 -0800 (PST)
MIME-Version: 1.0
References: <20200219045423.54190-1-natechancellor@gmail.com>
 <20200219045423.54190-4-natechancellor@gmail.com> <20200219093445.386f1c09@gandalf.local.home>
 <CAKwvOdm-N1iX0SMxGDV5Vf=qS5uHPdH3S-TRs-065BuSOdKt1w@mail.gmail.com> <20200219181619.GV31668@ziepe.ca>
In-Reply-To: <20200219181619.GV31668@ziepe.ca>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 19 Feb 2020 11:11:19 -0800
Message-ID: <CAKwvOd=8vb5eOjiLg96zr25Xsq_Xge_Ym7RsNqKK8g+ZR9KWzA@mail.gmail.com>
Subject: Re: [PATCH 3/6] tracing: Wrap section comparison in
 tracer_alloc_buffers with COMPARE_SECTIONS
To:     Jason Gunthorpe <jgg@ziepe.ca>,
        Nathan Chancellor <natechancellor@gmail.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@redhat.com>,
        Jason Baron <jbaron@akamai.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 19, 2020 at 10:16 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Feb 19, 2020 at 09:44:31AM -0800, Nick Desaulniers wrote:
> > Hey Nathan,
> > Thanks for the series; enabling the warning will help us find more
> > bugs.  Revisiting what the warning is about, I checked on this
> > "referring to symbols defined in linker scripts from C" pattern.  This
> > document [0] (by no means definitive, but I think it has a good idea)
> > says:
> >
> > Linker symbols that represent a data address: In C code, declare the
> > variable as an extern variable. Then, refer to the value of the linker
> > symbol using the & operator. Because the variable is at a valid data
> > address, we know that a data pointer can represent the value.
> > Linker symbols for an arbitrary address: In C code, declare this as an
> > extern symbol. The type does not matter. If you are using GCC
> > extensions, declare it as "extern void".
> >
> > Indeed, it seems that Clang is happier with that pattern:
> > https://godbolt.org/z/sW3t5W
> >
> > Looking at __stop___trace_bprintk_fmt in particular:
> >
> > kernel/trace/trace.h
> > 1923:extern const char *__stop___trace_bprintk_fmt[];
>
> Godbolt says clang is happy if it is written as:
>
>   if (&__stop___trace_bprintk_fmt[0] != &__start___trace_bprintk_fmt[0])
>
> Which is probably the best compromise. The type here is const char
> *[], so it would be a shame to see it go.

If the "address" is never dereferenced, but only used for arithmetic
(in a way that the the pointed to type is irrelevant), does the
pointed to type matter?  I don't feel strongly either way, but we seem
to have found two additional possible solutions for these warnings,
which is my ultimate goal. Nathan, hopefully those are some ideas you
can work with to address the additional cases throughout the kernel?

-- 
Thanks,
~Nick Desaulniers
