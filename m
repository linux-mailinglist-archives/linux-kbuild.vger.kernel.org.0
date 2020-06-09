Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8871F4257
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2020 19:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729674AbgFIRbz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jun 2020 13:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726848AbgFIRbz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jun 2020 13:31:55 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2B0C05BD1E
        for <linux-kbuild@vger.kernel.org>; Tue,  9 Jun 2020 10:31:54 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id w7so17042544edt.1
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jun 2020 10:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xP0JniTecvDjkcV1aE7EUK93HEEtf4BmlIZKQtaGaTc=;
        b=hMQGbA5Xux9MwZc21tzrvHYW990yZ1WxsigSsIk7lISoJMM+toSDHY1vTxPbpMokbQ
         fH//UKrD/EjtrSH42WMZvPf2YEKK9g7kBVGg0wCyTCzwI9gQO5X2KJV82cT/UAzrrByB
         Tjnn/iqwRrfcJb7/mtFJ9Y1iRqaUkZoeOkKWt5YYcrAfcpKAbM+1ZalLSP4q6QkFiV33
         sX4kV6dXnWt9GMGxBoV/AaYaxoEouhsm20NgRbk1XhIGmWsRlE+gASBBkTnWlneoXiXy
         NGseegpxXU8GE1BQG1oXLdwGXuvhYpZVIaH0qQ3ZRC1Mg6zyLBDvc1T9dUrYCKxP+ovn
         5hgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xP0JniTecvDjkcV1aE7EUK93HEEtf4BmlIZKQtaGaTc=;
        b=sZjp1ql1b5tEbgryuIIVsNsQPhVtDLUeeM3DtHp5AF8tm9DNiAh1xIZjy8f+AmWhGx
         ZKuahp96jUy7HXZKDQ7xwAZSMb4IQOEF/g5uoK3kCZzsqlXZ+YPGHOENdS3g7wyESuyx
         yx84Hhkk/LLPidSw71CgzGy9khSGQe3rSlVYH4foTit17PIkFVgc+vklXHaoGiglpdW4
         OEtOk8pKQ8NI1lMPZ6xwkr1VtRMcszIFZZGihOWoSD9DZW2sz8IUgLLwh1sAm6lir60N
         ZCW2MLObsySJaL4NYx4+YFSkFBrpL3mtQg+44UkRjRvrfEGXmR9h9Q4w8yl+IsTDyUux
         tGnw==
X-Gm-Message-State: AOAM5304oSmdxYzqtGRgCw7xc67W8yyGzXTVCsxR8FuCqwR2EiZwb/go
        Rnugr5PvLncQhrIrTWYarOyrWnCsaenpwuBcmisuHLfL13w=
X-Google-Smtp-Source: ABdhPJwC15sjs76ZcJk5sJt6a811hBCQ/R3+8raKgj23BQuqrHmFeME1k+/4rLpTcnWYkRmYiBP4+rAlXZcNWJJFKsA=
X-Received: by 2002:a05:6402:1592:: with SMTP id c18mr29394349edv.40.1591723912783;
 Tue, 09 Jun 2020 10:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <288d045f9429fc4cfd9ffb244e1be2f8@talpidae.net>
 <CAK7LNARx2dcjedkN8cBq0veh6H1cVG6yyGq=Vf6xr2Bd_aHuRA@mail.gmail.com>
 <3cd1a050fe692425352745672295033c@talpidae.net> <CAD=FV=WPW_o4ExmNUHe=2mYHLheKMfGTemW8CCiN4iQ7X3fAYw@mail.gmail.com>
In-Reply-To: <CAD=FV=WPW_o4ExmNUHe=2mYHLheKMfGTemW8CCiN4iQ7X3fAYw@mail.gmail.com>
From:   Guenter Roeck <groeck@google.com>
Date:   Tue, 9 Jun 2020 10:31:41 -0700
Message-ID: <CABXOdTdH7eRaMwn0A9Ej=Z-+qTVzO6bsrh3c6-0JtTsWgM=zbQ@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: install modules.builtin even if CONFIG_MODULES=n
To:     Doug Anderson <dianders@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 9, 2020 at 9:38 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Jun 3, 2020 at 9:33 AM Jonas Zeiger <jonas.zeiger@talpidae.net> wrote:
> >
> > Many applications check for available kernel features via:
> >
> >   - /proc/modules (loaded modules, present if CONFIG_MODULES=y)
> >   - $(MODLIB)/modules.builtin (builtin modules)
> >
> > They fail to detect features if the kernel was built with
> > CONFIG_MODULES=n
> > and modules.builtin isn't installed.
> >
> > Therefore, add the target "_builtin_inst_" and make "install" and
> > "modules_install" depend on it.
> >
> > Tests results:
> >
> >   - make install: kernel image is copied as before, modules.builtin
> > copied
> >   - make modules_install: (CONFIG_MODULES=n) nothing is copied, exit 1
> >
> > Signed-off-by: Jonas Zeiger <jonas.zeiger@talpidae.net>
> > ---
> >   Makefile | 14 +++++++++++---
> >   1 file changed, 11 insertions(+), 3 deletions(-)
>
> Note that this change broke builds in the Chrome OS build system
> because we require modules to be installed to a certain path and we
> weren't passing "INSTALL_MOD_PATH" when we called "make install".
>
> We can certainly fix our build system (I have a patch at
> https://crrev.com/c/2237511 for it), but I do wonder if others will
> hit the same issue.  Others might not have such a nice sandboxing
> system so they might unknowingly try to install files to the build
> computer's modules directory instead of their target.
>

I am more concerned with people getting errors such as

mkdir: cannot create directory '/lib/modules/5.7.0+/': Permission denied

when running "make install", with no documentation or explanation that
or why INSTALL_MOD_PATH is now mandatory for non-root installations.
Even for root installations, it seems odd that "make install" now
installs module files; after all, this is what "make modules_install"
is for.

I can understand the use case for CONFIG_MODULES=n, but the impact and
changed behavior on systems with CONFIG_MODULES=y is quite unexpected.

Guenter
