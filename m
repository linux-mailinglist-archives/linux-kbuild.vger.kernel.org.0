Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D82DAB9AD7
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Sep 2019 01:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407212AbfITXov (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Sep 2019 19:44:51 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33917 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407214AbfITXou (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Sep 2019 19:44:50 -0400
Received: by mail-pl1-f194.google.com with SMTP id d3so3930538plr.1
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Sep 2019 16:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lqDIHj9lZasR/zDtsnve221vNIVF3/3BuxETCeMHCc4=;
        b=XSaBvr71r6CXxRkl47+im5CtQOOiRKY/iuu1X/oF7O0195aBtQdo4E6H31j2DRdwMB
         s+h2SbgX6KwCSKPN/vksW+oTjyn/PocXCe2Kbp7D50FyleyNJKKiDms9wE4+010NuDGz
         Tq75Lq2/Of0H+EgT6rh/B7HmjzNMrYZDTILOvyQjFxsnvmyOoLNZmh4oqM1yuhhFP8pe
         sRZaN6hX2UO3lPWFmdzLQbJnBe69O1mU2qIHiv3K3roTU3fxgbwZK3OKCga8hxSzWAhk
         hBJHVhNvM+mzWFILJB/Im3xuyQ/V1FTP6vSQ4wkxN1OHoJdGyrC0V7kg/MssknjtxoVt
         FgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lqDIHj9lZasR/zDtsnve221vNIVF3/3BuxETCeMHCc4=;
        b=CWmrD+qD3OkAkQ64Z9OhMTBCMvmn2H6GjfgAwWkg1vHfvY2lxUD33trnLTgs7eaDom
         dLZed3whrFdiHfTjkfUApGHW/4ecAbCDxB4/dkLYz/JBO8h+oJ3cAVlUFo9WqC0DQt42
         TmZwMWw4PP0B6eiCzZdfX+5yp03KNLPs+PwPSDFn0HKPmUIKrVIQsoZdoDZwp/yjT1nW
         zYrurB7+B6ICK+XVHSHJ262dMkpWoR4XfYeT2AAJ68AhMt9o1EpVostl2ijOS+WXmBy2
         kHthF08XtJ9v9sdKlHpBi9fyw6ZElikvZhKOr3ep4ZJEj37HcBXzYwAA3qrHnst0kp2v
         BEvQ==
X-Gm-Message-State: APjAAAX54VvkcXt2t1RQXkAHkCAeQ6NTjdSOQbHI4ni0k1+icxUep4Yw
        WJF8NPMVDR5FQykqHYtMUwd6u++iST5YDd/C12RVWw==
X-Google-Smtp-Source: APXvYqyNiRlbO6R3uG9HEH5vDFWKxf6oFNbwaLwTM4FngoMH0rrK0KW2vni8a9ARb9jmWGlDeibYyIhP8RN53cwInWk=
X-Received: by 2002:a17:902:ff0e:: with SMTP id f14mr19947847plj.325.1569023089386;
 Fri, 20 Sep 2019 16:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190920231923.141900-1-brendanhiggins@google.com>
 <20190920231923.141900-7-brendanhiggins@google.com> <20190920233600.48BBA20644@mail.kernel.org>
In-Reply-To: <20190920233600.48BBA20644@mail.kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Fri, 20 Sep 2019 16:44:38 -0700
Message-ID: <CAFd5g46pndA_gOD9i8M5e5fb8x4mSL9mcgMDujN7XufeFs8bmQ@mail.gmail.com>
Subject: Re: [PATCH v16 06/19] lib: enable building KUnit in lib/
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Kees Cook <keescook@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Rob Herring <robh@kernel.org>, shuah <shuah@kernel.org>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        devicetree <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kunit-dev@googlegroups.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        linux-um@lists.infradead.org,
        Sasha Levin <Alexander.Levin@microsoft.com>,
        "Bird, Timothy" <Tim.Bird@sony.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Lawall <julia.lawall@lip6.fr>,
        Kevin Hilman <khilman@baylibre.com>,
        Knut Omang <knut.omang@oracle.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Petr Mladek <pmladek@suse.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Richard Weinberger <richard@nod.at>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 20, 2019 at 4:36 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Brendan Higgins (2019-09-20 16:19:10)
> > KUnit is a new unit testing framework for the kernel and when used is
> > built into the kernel as a part of it. Add KUnit to the lib Kconfig and
> > Makefile to allow it to be actually built.
> >
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > Cc: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: Kees Cook <keescook@chromium.org>
> > ---
> >  lib/Kconfig.debug | 2 ++
> >  lib/Makefile      | 2 ++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 5960e2980a8a..5870fbe11e9b 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -2144,4 +2144,6 @@ config IO_STRICT_DEVMEM
> >
> >  source "arch/$(SRCARCH)/Kconfig.debug"
> >
> > +source "lib/kunit/Kconfig"
> > +
>
> Perhaps this should go by the "Runtime Testing" part? Before or after.

Yeah, that probably makes sense.

> >  endmenu # Kernel hacking
