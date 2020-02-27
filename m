Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29D0B170FB2
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2020 05:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgB0Eio (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Feb 2020 23:38:44 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37777 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728221AbgB0Eio (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 23:38:44 -0500
Received: by mail-oi1-f193.google.com with SMTP id q84so2025187oic.4;
        Wed, 26 Feb 2020 20:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ByzwXjxxAjc7Zga7QIoH1Dg/JplDufewPb/z1LrV5Dk=;
        b=kdLDp3x1MIQtmih87WTkMiiMAbRpaovl8h89fbI87FYlWtGHlNSrClwC+2JubV/CXt
         FZC3mMO7khvELquq9q1Xjri3l4atSrKdVSSH0vLq8UKqEPHpwOzXVUiyq3+JNMAA8WEy
         pZZRo4es2IoL9UcvsQ1JFwIuph7aiOludae903qIlaZMJQNrZ2Ywlcy0wRimD6Um+vzU
         nYMmupk37n5RH18CupKLJiLwlpFpui0lHn/9jSWqYY78CdOWwsPSazaeyi8hP/XsLRGM
         OxwvQ83eQLfpTUY0cE5L5FHVQ+U8CSM8D+oZ58btk1SPCYFQJq7NP338I0jFoOeTZa4C
         Clog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ByzwXjxxAjc7Zga7QIoH1Dg/JplDufewPb/z1LrV5Dk=;
        b=iBT/Jq7Afua1HlC/E2BhIdjA1YwlYnr3s6yymaT+P7HTmRWTHGtjOSSSNxkEmy7PIp
         Ba1MOnpGq9Dbaa6u0QJ7bIHrzZzgDmNaPfs8dW2Hri/M9vHk1bwpJAshc6febR75fkUF
         7J81YD5Yxrz/5/I4V1z+Wpv8dEPLv6qhsa8bb9JgEwPa20IiZjp16IM/NNqQ66ZAYNb9
         UG+xgW4ux2L9EEhrZYBLDeREQJ4pjBbQQl0jG68XknXnl0lwHh/IAgSN8XQbS3zIwnPe
         9s7G9DFE4q3bAJbaSJcSQP+xbx8UygkvRGUciThRSh6RpRw8aaN5uft2nBD6+kIcIO6E
         Gftw==
X-Gm-Message-State: APjAAAXKMET6pPWWOn9eHN/fk3YcTsWpa1vAPTSg9nrz8wIpeXnLKZuF
        rcS7SlqwUzF2HXsG+7XzNEKDW+6w
X-Google-Smtp-Source: APXvYqxiBCcYOuupKnBfUUvrtLrDYRgnMgguiQOMiiK+c6TGX7tTNFpcXJyd1Oq3jTgVO2kbYmNtIw==
X-Received: by 2002:aca:c3c2:: with SMTP id t185mr1990201oif.26.1582778323474;
        Wed, 26 Feb 2020 20:38:43 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id n25sm1592674oic.6.2020.02.26.20.38.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 20:38:42 -0800 (PST)
Date:   Wed, 26 Feb 2020 21:38:41 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/
 Clang/LLVM
Message-ID: <20200227043841.GA55684@ubuntu-m2-xlarge-x86>
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <CAK7LNASNsOmyqFWYtJHB4UcHAed5C_isWvMJ4MKHu0O=yUy=8w@mail.gmail.com>
 <CAKwvOd=mPg79CrYnDm8=z0iJpKL0FHm9J5qZF0_A6BFXBv8Dow@mail.gmail.com>
 <CAK7LNAQ83rLAm1GcvrgJbinyAVPpM_SoxfO7RdOAfmXyg2tBdQ@mail.gmail.com>
 <CA+icZUWSQkYD2MzEY_8U1NMY8LO5NzD0CCuZ8+cH+dBndJm=yQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUWSQkYD2MzEY_8U1NMY8LO5NzD0CCuZ8+cH+dBndJm=yQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 26, 2020 at 01:33:13PM +0100, Sedat Dilek wrote:
> On Wed, Feb 26, 2020 at 1:01 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Wed, Feb 26, 2020 at 5:52 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > On Mon, Feb 24, 2020 at 4:34 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > >
> > > > On Tue, Feb 25, 2020 at 2:41 AM Nick Desaulniers
> > > > <ndesaulniers@google.com> wrote:
> > > > >
> > > > > Added to kbuild documentation. Provides more official info on building
> > > > > kernels with Clang and LLVM than our wiki.
> > > > >
> > > > > Suggested-by: Kees Cook <keescook@chromium.org>
> > > > > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > > > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > > > ---
> > > >
> > > >
> > > > Perhaps, is it better to explicitly add it to MAINTAINERS?
> > > >
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -4118,6 +4118,7 @@ W:        https://clangbuiltlinux.github.io/
> > > >  B:     https://github.com/ClangBuiltLinux/linux/issues
> > > >  C:     irc://chat.freenode.net/clangbuiltlinux
> > > >  S:     Supported
> > > > +F:     Documentation/kbuild/llvm.rst
> > > >  K:     \b(?i:clang|llvm)\b
> > >
> > > I'm happy to leave it to the maintainers of Documentation/.  Otherwise
> > > we have a file for which there is no MAINTAINER, which seems
> > > ambiguous.
> >
> > It is common that MAINTAINERS lists per-file (per-driver) maintainers.
> > It does not necessarily mean a person who picks up patches.
> >
> > scripts/get_maintainer.pl lists maintainers that
> > match any F:, N:, K: patterns.
> > So, both Doc and Kbuild maintainers/ML will still be listed.
> >
> > Having said that, it is up to you. Either is fine with me.
> > Another pattern 'K: \b(?i:clang|llvm)\b'  covers this file anyway.
> >
> >
> > (BTW, I am also happy to see your name as the maintainer of this entry.)
> >
> 
> +1 (Please drop the BTW - This was suggested in the brainstorming
> session on the ClangBuiltLinux Meetup in Zurich).
> 
> I suggest to add Nathan and Kees if they are willing to be responsible
> for the maintainer job.
> 
> - Sedat -

I would not mind having my name added under this MAINTAINERS entry but I
definitely think that is a conversation for a different thread.

Cheers,
Nathan
