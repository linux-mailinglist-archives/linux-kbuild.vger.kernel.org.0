Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 174672096E3
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jun 2020 01:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388412AbgFXXGC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 19:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388145AbgFXXGC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 19:06:02 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB710C061796
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 16:06:01 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id j4so1815881plk.3
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 16:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=shst53ZJE1d+vIhz2clceIGi2VB/auhmYdgL62EAsJA=;
        b=v4eMG/3rTtJikwtUeVEWC+d0Ch65aCTzn2lI4XytauNvCzrEjxfgA6aO+yV6VxXBx3
         mb6CDo0wNoFZ1v4nkYj+/6EWy37Ni5nLIOMzCNLEZ2dadozowAf9iZnCoXAn7+HLcyE9
         RoOT6e38CrOgiSMwqrLKdO8N7M+/LB2H0MPGEArcqToIp05l+M0z0UH0D4sz1uNsTgmt
         9mmpfTiacr3PdC/F4zU2Yb9SYNEeuuG0ifqnJKaNC2BdOBDaQw26XwaMnJ0wHebahY7x
         fvvlvTbNep+cdAWoA5BqhP7JrVtoCYLEUqHK25wchmImEauPU24++/TQpkcZFXvICfaj
         +O3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=shst53ZJE1d+vIhz2clceIGi2VB/auhmYdgL62EAsJA=;
        b=hP2V6DV9/buvm0dIqN7L6JvykrshYT+QaV8QQMIHKdlhqWziLvH9F751AZSXuQdViG
         DBLOUq4ryGRhhHB5ysi6kC2J7ZjQmMuh2lyxsOs9+7bkk2qCOS7fISg023Ggvuk9BpOH
         eN6CZsVZLK4rYaAebTmriqzIeoGRoyWFOnjGas716NRUzVqWa+eRUgpo3J5JIP42x25Z
         FYUe0CNWxHZ5udk3vpjxIpWKoYVOwmupdrpUQWbQtsNR0UeKRyZTgtagd43SHJoZiwIu
         PQgaGGgo9T0zGJ8DHuyBn+dtGNbUVpaBaPKhRtXy36bJSnmxxzjxQNP7EhzIYV9nQNfq
         DyCA==
X-Gm-Message-State: AOAM532yy1nt8JMtKJ2uPcXVAGVMP+uM75rY3y0lTUXYS9ufcBbLNdBp
        33wCaIVT86IZnSu6NbcwbQTyUFJ17SDtFvNUis2sbQ==
X-Google-Smtp-Source: ABdhPJxZs7Ep0+V5E2sSAX0aVY+ZMKk8PTjnuF9HO3m5vxhQOU6AbFmmPJG+dflauBb0xhpYFgB/b9UTwA/KqW822v8=
X-Received: by 2002:a17:902:fe8b:: with SMTP id x11mr30115455plm.179.1593039960944;
 Wed, 24 Jun 2020 16:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200624203200.78870-18-samitolvanen@google.com> <CAKwvOdnEbCfYZ9o=OF51oswyqDvN4iP-9syWUDhxfueq4q0xcw@mail.gmail.com>
 <20200624215231.GC120457@google.com>
In-Reply-To: <20200624215231.GC120457@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 24 Jun 2020 16:05:48 -0700
Message-ID: <CAKwvOdnWfhU7n0VfoydC7epJPrj+ASZzyNRpBCNuvT_5E+=FcQ@mail.gmail.com>
Subject: Re: [PATCH 17/22] arm64: vdso: disable LTO
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 24, 2020 at 2:52 PM Sami Tolvanen <samitolvanen@google.com> wrote:
>
> On Wed, Jun 24, 2020 at 01:58:57PM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> > On Wed, Jun 24, 2020 at 1:33 PM Sami Tolvanen <samitolvanen@google.com> wrote:
> > >
> > > Filter out CC_FLAGS_LTO for the vDSO.
> >
> > Just curious about this patch (and the following one for x86's vdso),
> > do you happen to recall specifically what the issues with the vdso's
> > are?
>
> I recall the compiler optimizing away functions at some point, but as
> LTO is not really needed in the vDSO, it's just easiest to disable it
> there.

Sounds fishy; with extern linkage then I would think it's not safe to
eliminate functions.  Probably unnecessary for the initial
implementation, and something we can follow up on, but always good to
have an answer to the inevitable question "why?" in the commit
message.
-- 
Thanks,
~Nick Desaulniers
