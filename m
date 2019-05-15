Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6181FA18
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2019 20:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbfEOSi3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 May 2019 14:38:29 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37491 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbfEOSi3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 14:38:29 -0400
Received: by mail-pf1-f194.google.com with SMTP id g3so415494pfi.4
        for <linux-kbuild@vger.kernel.org>; Wed, 15 May 2019 11:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EjtI0jB6q0on8T68O7ooSG3HJ/G6aXVuh7Fa8bUtB3c=;
        b=ddtr6DU1QjLaiimdHvjnm5OyLPSkWpepiD03f53/1yEoCpWWVeGz/iO+mseYcXP/0O
         3rvOy0GL8UzZ93ASbLEqgNb0DgWjjJCKufFzgqhqDCCnw59UFOltLi7VTMwa0aCCWQIq
         cX43LNEflo4mYTocYshtFVRRly1IwJ4xLGuMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EjtI0jB6q0on8T68O7ooSG3HJ/G6aXVuh7Fa8bUtB3c=;
        b=j+NoAHXyhh3CGrBFOgLrHIiHL6wmM07c1mEkXVVyCT125cBJhT6mF38zOc+JGTNje4
         QmwKh4TEKrlNbwpL1FXnfseGUsCfDiI2be+ilagdSMzBsgOf6RoTNiSUd+ew4s4N7FId
         ZugTb03pOp0AP7QTmmjeC/uQMRH0yF4sWUqJJstZdySwQvxGHfVelfTG6v8iQVhwFgUw
         2s0249uEiFOCNT1lmYzeSoPKVQfXu7Z0DoXowWn0dYQYRk1YjIW+Evr+HtG+cOMY15+Z
         owO6eTod1jpNeIAYw6aj30ri82hZkl9ARp42ptK56gxT+5ongrpJCgVHHtXNTP1U/1K0
         kazw==
X-Gm-Message-State: APjAAAVrgxELB3v+jlrzq2ricT4341wus3935WXgyX80PIEwhZ1vuUcZ
        MxxYLuMpxnpVqCfvfk85OOHjAg==
X-Google-Smtp-Source: APXvYqyfZajspCc+MoqfqS4jkc9YOLiR0rXd0nQy8a8u/vchdAbnxT1lHXCHdIq1M/MzfUHuvHElrw==
X-Received: by 2002:a62:4c5:: with SMTP id 188mr49579806pfe.29.1557945508686;
        Wed, 15 May 2019 11:38:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c127sm5764398pfb.107.2019.05.15.11.38.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2019 11:38:27 -0700 (PDT)
Date:   Wed, 15 May 2019 11:38:26 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] kbuild: check uniqueness of basename of modules
Message-ID: <201905151131.EBB45E5@keescook>
References: <20190515073818.22486-1-yamada.masahiro@socionext.com>
 <CAK7LNAQgBKq9JDGtQUD1kgKrfLZ4jOjuLJi7_tpSPLJZsWtmag@mail.gmail.com>
 <201905150913.C23BD99AD@keescook>
 <CAK7LNARezpQgcK9O9K3ZFeebMVNroWStno_brvSLadsKXVfm-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARezpQgcK9O9K3ZFeebMVNroWStno_brvSLadsKXVfm-Q@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 16, 2019 at 02:55:02AM +0900, Masahiro Yamada wrote:
> 
> On Thu, May 16, 2019 at 1:20 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Wed, May 15, 2019 at 04:53:15PM +0900, Masahiro Yamada wrote:
> > > On Wed, May 15, 2019 at 4:40 PM Masahiro Yamada
> > > <yamada.masahiro@socionext.com> wrote:
> > > >
> > > > [...]
> > > > diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
> > > > new file mode 100755
> > > > index 000000000000..944e68bd22b0
> > > > --- /dev/null
> > > > +++ b/scripts/modules-check.sh
> > > > @@ -0,0 +1,18 @@
> > > > +#!/bin/sh
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +# Warn if two or more modules have the same basename
> > > > +check_same_name_modules()
> > > > +{
> > > > +       same_name_modules=$(cat modules.order modules.builtin | \
> > > > +                               xargs basename -a | sort | uniq -d)
> >
> > While probably it'll never be a problem, just for robustness, I'd add "--"
> > to the end basename to terminate argument interpretation:
> >
> >     xargs basename -a -- | sort | ...
> 
> 
> Sorry for my ignorance, but could you
> teach me the effect of "--" ?
> 
> 
> I sometimes use "--" as a separator
> when there is ambiguity in arguments
> for example, "git log <revision> -- <path>"
> 
> 
> In this case, what is intended by "--"?

It means "end of arguments" so that whatever xargs passes into the
program aren't interpretted as an argument. In this case, if there was
a module path somehow ever named --weird/build/path/foo.o, xargs would
launch basename as:

	basename -a --weird/build/path/foo.o

and basename would fail since it didn't recognize the argument. Having
"--" will stop argument parsing:

	basename -a -- --weird/build/path/foo.o

This is just a robustness suggestion that I always recommend for xargs
piping, since this can turn into a security flaw (though not here) when
an argument may have behavioral side-effects. So, it's just a thing that
always jumps out at me, though in this particular case I don't think
we could ever see it cause a problem, but better to always write these
xargs patterns as safely as possible.

-- 
Kees Cook
