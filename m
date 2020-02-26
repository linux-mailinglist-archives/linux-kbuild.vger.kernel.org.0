Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEBE916FEE8
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Feb 2020 13:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbgBZM0k (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Feb 2020 07:26:40 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37979 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgBZM0k (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 07:26:40 -0500
Received: by mail-wm1-f66.google.com with SMTP id a9so2838492wmj.3;
        Wed, 26 Feb 2020 04:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=V8gMewY634WDFQZep0rl6hNrs2zu+VbqsCL1SpOtlb0=;
        b=IHFSmI4juYhHMRYVx8UOXXzqtfXiwhzFC7fuLYcWeRdzpm1yfNt6Vj1prjQdPvMauM
         4k9EKV+jiOb39j6DdIGSvb5pXlbn1bq8GqT3+LErN1gTmJs8y3yj7OxdMnvvAz571F+e
         wJRAdxNkBN9viXqrDaxGkI412mWjm2FKo5DRI1FN+YjKIt4bYbCrHXQ9XqPIAyzvEXPg
         25O6rdrR7WjAlEAnXZHOVZizS3pRFp8TKDBPWJI4dKKh2xQvpJtOYWAiqahqwUrED96U
         LI15mWGVV6Or8+OUWgTXPnaiXE5JweGr4sygwTpyWhB4IJpzv5z3HtkgqMDIYcVH2U/F
         Ezyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=V8gMewY634WDFQZep0rl6hNrs2zu+VbqsCL1SpOtlb0=;
        b=Sdi5QLS6HhoJz/5akBkwhdjlX6GIDDxrAgplSjPXKdtxAmB+Xp52/dY7U8fKRDUZja
         D6ktpM1oUlxHJuZnBXyG9QxNEnqXGOVlCrBOtLuSTRHfDwA6Hf0ix0JHCZaecLYDR3Y0
         27vsJKQdV14Vr3JZdTa1vRHHe89ZEZzgZ3QWLbmvPuzojUh5DRQemblZufyRJ2LgvKOW
         1UaMG0KKYL7SlHXVB9rzKQ5aYuDZjVNmtjDJyLMNKMFbRH3nNKz52P7tUwN/yoTxy6jM
         z+wAq6oLb8e6CD7SPwbRb0fxmbx5hb1eiytVxRsxRhYEjQ9C9kcpUiaD5LAoz+ruIAej
         RHcQ==
X-Gm-Message-State: APjAAAXDO+R5XDSGCvyHpNxQYNKC/Bgcbd7sFUSOLXwXbjxmMu+a/FvD
        UgWW18HHmdyXMC0Q2EJiw4VVQ7JpOW2YzbkDQdI=
X-Google-Smtp-Source: APXvYqwJSp6y5t6j/YDSKsw2/NttcfYRM0gx0AAnvvsYnMrceEUhwETgdXNNCRvQxdUejjKm2ZwCaS32bGDuwAKf2os=
X-Received: by 2002:a05:600c:2285:: with SMTP id 5mr5218941wmf.64.1582719997984;
 Wed, 26 Feb 2020 04:26:37 -0800 (PST)
MIME-Version: 1.0
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <20200225210250.64366-1-ndesaulniers@google.com> <CAK7LNAQJuF__26R+fEsdfYH1SAJuo3-8grGQAE4htjxzEG-nqw@mail.gmail.com>
In-Reply-To: <CAK7LNAQJuF__26R+fEsdfYH1SAJuo3-8grGQAE4htjxzEG-nqw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 26 Feb 2020 13:29:07 +0100
Message-ID: <CA+icZUWcW3+9QdZcACCXP6Yun__Sm_s4+qM4rALdFf=hGBt3FQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation/llvm: add documentation on building w/ Clang/LLVM
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 26, 2020 at 12:31 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi.
>
>
> On Wed, Feb 26, 2020 at 6:02 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Added to kbuild documentation. Provides more official info on building
> > kernels with Clang and LLVM than our wiki.
> >
> > Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> > Changes V1 -> V2:
> > * s/On going/ongoing/
> > * add Randy's Suggested-by
>
>
> I do not understand this tag update.
>
> As far as I saw the review process,
> I do not think Randy deserves to have Suggested-by
> because he just pointed out a typo (on going -> ongoing) :
> https://patchwork.kernel.org/patch/11401189/#23179575
>
> (or, was there off-line activity I had missed?)
>

Hi Masahiro,

I got some credits from Nick for a review by seeing a typo - not on a
review of the code - and H. Peter Anvin asked why.

I am not sure what is here the correct credit to give.
Depends a "Reviewed-by" and/or "Suggested-by" on a technical review?

My POV: When people take time to look over patches they should get
credits - sort of esteem.

Regards,
- Sedat -

P.S.: Tipp: Use codespell to find typos :-).

[1] https://git.kernel.org/linus/0e2e160033283e20f688d8bad5b89460cc5bfcc4
"x86/asm: Add _ASM_ARG* constants for argument registers to <asm/asm.h>"
