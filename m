Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D15F1F860
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2019 18:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbfEOQU2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 May 2019 12:20:28 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38157 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbfEOQUY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 12:20:24 -0400
Received: by mail-pf1-f196.google.com with SMTP id b76so226716pfb.5
        for <linux-kbuild@vger.kernel.org>; Wed, 15 May 2019 09:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vxHUVksygZiYkXH7EV0n/tRcr/H+bm78G99yEMzAC34=;
        b=eOjdoTjIr7ZKEcMSweuwLNwpjohCU1Fle2gxgWUpyAalIZ/ql6lUMO77yOY5/vhCIO
         YE1CR84RdwgQG5Dh5j/DQz185eopcu0OlZNuRSKh5fL4+uvczJhXSauFP8KMb/7Fcj3e
         6CKPoR99xDgfW+S+6DPCEgWpjb1VaompxR+d8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vxHUVksygZiYkXH7EV0n/tRcr/H+bm78G99yEMzAC34=;
        b=a3JMc6GhfIrYaF6AZ10m5adtyKXyq9B4aT2UERhbf7rwQjjaHHQeTeobrxOSGA3V/C
         cAT6wYB8SNv291yFQzxPqIHS3EKZKKssCefGhXMn4zRLGL78TUbOp/ktFDxf+nbkfKdy
         vj/og4YUX/zkWG1oL6j+GIKslWRu6XPH+AU5KiQ8+VLY6kXZAVpJG8vEOsA2C3iosIKy
         4v+wD8cRKaFJxCI8nkPE88kdRwDuSwFcFjIlf/r4iXmVMwYfIZBxn2XCLCFrGMCEbjS6
         O/lOJMjiBtmefRewPheq7SOhsEz7/eNguMe3T8cNMgD6AUUYlWgjarBCTMrLTnEyX1C1
         uNgg==
X-Gm-Message-State: APjAAAV++2X5FrszdCmgABNbVEnON7/i1HaPkUddqiOxxbErwpdP1uOV
        rY8ij7xM1fktLyju6k1CqrG83Q==
X-Google-Smtp-Source: APXvYqxwKoY4ccQy0b/mDdBdzxSTzpQZnxktZIFccXEfZLFafGV8L/NnbJ4+g5GgogH5itIlxvlNlQ==
X-Received: by 2002:a62:460a:: with SMTP id t10mr46735334pfa.3.1557937223106;
        Wed, 15 May 2019 09:20:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t26sm3049004pgk.62.2019.05.15.09.20.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2019 09:20:21 -0700 (PDT)
Date:   Wed, 15 May 2019 09:20:20 -0700
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
Message-ID: <201905150913.C23BD99AD@keescook>
References: <20190515073818.22486-1-yamada.masahiro@socionext.com>
 <CAK7LNAQgBKq9JDGtQUD1kgKrfLZ4jOjuLJi7_tpSPLJZsWtmag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQgBKq9JDGtQUD1kgKrfLZ4jOjuLJi7_tpSPLJZsWtmag@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 15, 2019 at 04:53:15PM +0900, Masahiro Yamada wrote:
> On Wed, May 15, 2019 at 4:40 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > In the recent build test of linux-next, Stephen saw a build error
> > caused by a broken .tmp_versions/*.mod file:
> >
> >   https://lkml.org/lkml/2019/5/13/991
> >
> > drivers/net/phy/asix.ko and drivers/net/usb/asix.ko have the same
> > basename, and there is a race in generating .tmp_versions/asix.mod
> >
> > Kbuild has not checked this before, and it occasionally shows up with
> > obscure error message when this kind of race occurs.
> >
> > It is not trivial to catch this potential issue by eyes.
> >
> > Hence, this script.
> >
> > I compile-tested allmodconfig for the latest kernel as of writing,
> > it detected the following:
> >
> > warning: same basename '88pm800.ko' if the following are built as modules:
> >   drivers/regulator/88pm800.ko
> >   drivers/mfd/88pm800.ko
> > warning: same basename 'adv7511.ko' if the following are built as modules:
> >   drivers/gpu/drm/bridge/adv7511/adv7511.ko
> >   drivers/media/i2c/adv7511.ko
> > warning: same basename 'asix.ko' if the following are built as modules:
> >   drivers/net/phy/asix.ko
> >   drivers/net/usb/asix.ko
> > warning: same basename 'coda.ko' if the following are built as modules:
> >   fs/coda/coda.ko
> >   drivers/media/platform/coda/coda.ko
> > warning: same basename 'realtek.ko' if the following are built as modules:
> >   drivers/net/phy/realtek.ko
> >   drivers/net/dsa/realtek.ko
> >
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> 
> > diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
> > new file mode 100755
> > index 000000000000..944e68bd22b0
> > --- /dev/null
> > +++ b/scripts/modules-check.sh
> > @@ -0,0 +1,18 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +# Warn if two or more modules have the same basename
> > +check_same_name_modules()
> > +{
> > +       same_name_modules=$(cat modules.order modules.builtin | \
> > +                               xargs basename -a | sort | uniq -d)

While probably it'll never be a problem, just for robustness, I'd add "--"
to the end basename to terminate argument interpretation:

    xargs basename -a -- | sort | ...

> > +
> > +       for m in $same_name_modules
> > +       do
> > +               echo "warning: same basename '$m' if the following are built as modules:"
> > +               grep --no-filename -e /$m modules.order modules.builtin | \
> > +                                                       sed 's:^kernel/:  :'
> 
> 
> Self nit-picking:
> It might be better to send these messages to stderr instead of stdout.

Yeah, wrapping a ">&2" around the report would be good. With these fixes:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
