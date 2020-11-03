Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC432A5A04
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Nov 2020 23:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730219AbgKCWVe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Nov 2020 17:21:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730270AbgKCWVe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Nov 2020 17:21:34 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777B1C061A47
        for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2020 14:21:34 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id 72so8861460pfv.7
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Nov 2020 14:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t/8gNKrqVbgeWIKJqFS6oCAzempsVueUa9v+XEgt+p4=;
        b=csXlt7v0/moo9v9ILRwAZYxMof8y+D7baLlBSkK8Jlm/0wJFuTqmB+9NxNWDoE6sJ2
         yjtUqFnz1TmMTPiOg9/+a9VOS3+9XslH30wI2lAgW8gzYPZdZr7cFFaMaXudtzRiHcnQ
         dFMQywooaQM8HFoZ5S3igHBkVvbAnQrH3GeS66/OwLyHMXfNsDeCLD1hrhFdm1+UD/w/
         LlIsLuf/9iMgGqpLiZd3mDGwJ3l93NYpBLm4GLAiG8anGeoh6o2+9nEpxeBl4qfsD/qL
         8u7cxodm26r3wp/jBnzR5rgm9l6+mUU20Vy2JIZs83UfAc/DxXj3QnXNCbQ9JZGafuff
         m5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/8gNKrqVbgeWIKJqFS6oCAzempsVueUa9v+XEgt+p4=;
        b=PZqxzpfRGBw0qVzdVGa+8/pYugizEMeA1qReCystTxlPyzNjjgBEUG5lcJbNGlTlTv
         NLHY2p3C9UJhYe2HIpA6gbVPZOhz9POXtrFIgDYm/pnXadAv9Br+7N0Vcgc4lfzQfI3H
         Eqm+biLifl2Ch9fBrBBJjCfMg6W5+HU4Rcb1qGHXYbByZq2KLmXmknU86tROQCF6waPj
         byzYcy0wi0lO5ekX2Z7tvJBNPfGJlR2pEXFdcbYgb37b7L80FGrnIyH0WpwZzp27uEcG
         8eOZd/g/9tYB13Wce75gheZac7tQIatmhNukHjYE1ZkSMSm8mYSj0bNe66CWC6uG90Zy
         LzyA==
X-Gm-Message-State: AOAM5301l4+nDBwNQ7kYgDI2DLDgRQCtT8/UXBinODmdVcTgRulOreS6
        kWLyWQyMCsR8zu79Qmt2epGuOD4i6MyoXDDtSj6FVnxnTa0=
X-Google-Smtp-Source: ABdhPJzLhpQ56mQUjlg+DLC4s5L3h3/ev//e6DmikL2Vi/E+7ZV+hr0SGrtPFodUMt/haOC+BYhJbRFxcdR3kEPHCag=
X-Received: by 2002:a17:90b:110b:: with SMTP id gi11mr1311215pjb.25.1604442093720;
 Tue, 03 Nov 2020 14:21:33 -0800 (PST)
MIME-Version: 1.0
References: <20201022012106.1875129-1-ndesaulniers@google.com>
 <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com> <20201102081810.GB3788@tucnak>
In-Reply-To: <20201102081810.GB3788@tucnak>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 3 Nov 2020 14:21:22 -0800
Message-ID: <CAKwvOd=ez9nXCdQu6QRbNk5tfUAsSj9RLhopZtNE4RhDupg7+w@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: implement support for DWARF5
To:     Jakub Jelinek <jakub@redhat.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-toolchains@vger.kernel.org,
        Alistair Delva <adelva@google.com>,
        Nick Clifton <nickc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 2, 2020 at 12:18 AM Jakub Jelinek <jakub@redhat.com> wrote:
>
> On Mon, Nov 02, 2020 at 11:20:41AM +0900, Masahiro Yamada wrote:
> > > --- /dev/null
> > > +++ b/scripts/test_dwarf5_support.sh
> > > @@ -0,0 +1,4 @@
> > > +#!/bin/sh
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +set -eu
> > > +echo ".file 0 \"asdf\"" | $* -Wa,-gdwarf-5 -c -x assembler -o /dev/null -
> >
> >
> >
> > Please tell me how this script detects the dwarf-5 capability.
> >
> >
> > This script fails for GCC 10.
>
> One thing is GCC DWARF-5 support, that is whether the compiler
> will support -gdwarf-5 flag, and that support should be there from
> GCC 7 onwards.

I should improve my Kconfig check; I don't actually have a test for
-gdwarf-5 for the compiler.  In godbolt, it looks like -gdwarf-5
produces an error from GCC up until GCC 5.1.  Does (5.1 < GCC < 7) not
produce DWARF5?  Maybe there's a more specific test you had in mind?

>
> Another separate thing is whether the assembler does support
> the -gdwarf-5 option (i.e. if you can compile assembler files
> with -Wa,-gdwarf-5) for GNU as I think that is binutils 35.1,
> i.e. very new); but only if you want to pass the -Wa,-gdwarf-5
> only when compiling *.s and *.S files.  That option is about whether
> the assembler will emit DWARF5 or DWARF2 .debug_line.
> It is fine to compile C sources with -gdwarf-5 and use DWARF2
> .debug_line for assembler files if as doesn't support it.
>
> Yet another thing is if you can pass -Wa,-gdwarf-5 even when
> compiling C files.  There are several bugs in that category that have been
> fixed only in the last few days on binutils trunk, I'd suggest
> just not to bother, GCC 11 will have proper test for fixed assembler
> and will pass -gdwarf-5 to as when compiling even C sources with -gdwarf-5.

Do you have links?  I would prefer to do feature detection rather than
version detection when possible.  If the bug is so severe that we
think we should scuttle support for old versions, I'm ok with that,
but I want to be able to link to hard proof in a commit message so
that in 6 months when I forget why we made a certain decision, we have
historical record in the commit message/git blame.
-- 
Thanks,
~Nick Desaulniers
