Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B303705B0
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 May 2021 07:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbhEAFF3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 May 2021 01:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbhEAFF3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 May 2021 01:05:29 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77B9C06174A
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Apr 2021 22:04:39 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id 10so561902pfl.1
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Apr 2021 22:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g8mpY3Hs0ZJhptBq1Eu24Ddxb18K6PiBevmMq99HlXc=;
        b=JigJo42aBnzFploY+s2bxqEowDTR/Ncbd2sDFLZ8DgWCdihO+mY57MnjF7Y91jzXkC
         arjNfpzyac6exDthb82uJ3N7shkh8TSuY3YaePUw/dj2KvVi2HKHPQhKM/eWtTpDbFtq
         JRI/iceqSjTEbYV6UAYkEHAA1DSWU1Re2jvgf6QCz7YRDilINvrXI4vewKjsuezmvZR6
         g6EnygkBs9QdRVuLBleDKVLPBNZWs/fISdY9b92TWOxtGwTOktkfaUfln8BIXSP3V/vV
         vJ6rqHq4Xm72vfh0u/d8XnAqQqdJ3avpm2SpphWBylXr+VvLvY2xh3H2alZ9zjUF1ngg
         D6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g8mpY3Hs0ZJhptBq1Eu24Ddxb18K6PiBevmMq99HlXc=;
        b=CLR96a5JtGkc3lQSTPjDLnbprXtNgq1w580m6RMnmUr2qfK6OQzotsMlvoQ4LAupgq
         m2DGMY4Qtc/Y/Rs2oG7T8B8Pbddeeza3EtSjj3NcbTaVId8ZlVeFzGskmbzhN/o/XUFj
         LrUXMmibU80fu8VbGfR4VX98hYE59ApqiQy1RZ1NJA4g3k9egIGNeG2CJnM2oyH+41EN
         Yhxs7M4Mr5fWlWk2UWFXvvd1uYrF2vBk6+/xAXKYiQBR/6Drkb9m6Qf3bR3Rmm9HpK3t
         WI3yPtGVqSSpvppupNzzAriZo6KfdnefQ2fO9pjm5mctDG9lLMALGcdeayPSnv4E/b2j
         xXDw==
X-Gm-Message-State: AOAM532ueF93T6Oyqcw8MfFGVB+KKSs81NSFIU2B81fIOXsmypckVdpm
        1t5anwyR9zUKjpTpahpPe0beI4VnPAdHlZmPUNA=
X-Google-Smtp-Source: ABdhPJwhyUuYCIrocIt/Pkc6mpG/lflJGLgUNBIX5KKhmq/reT430B5sirnEPjLeOLXk4Q3Ew6bkp2h+juZJFXB3OPU=
X-Received: by 2002:a63:130f:: with SMTP id i15mr7752769pgl.151.1619845479293;
 Fri, 30 Apr 2021 22:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAGRSmLsJmR_NFcovYSP-gK52qDASP4csbaOjx2Sfk9HvhHvAfQ@mail.gmail.com>
 <CAGRSmLtsWvPhbmEkLNWC8FAtkvXBWSBRunAKNYUCRah2m+y2sQ@mail.gmail.com> <CAK7LNASoK0yhDdeoj1GPELTQ_sz3h=aVdTPUNj-4m6Zacj1fvw@mail.gmail.com>
In-Reply-To: <CAK7LNASoK0yhDdeoj1GPELTQ_sz3h=aVdTPUNj-4m6Zacj1fvw@mail.gmail.com>
From:   "David F." <df7729@gmail.com>
Date:   Fri, 30 Apr 2021 22:04:28 -0700
Message-ID: <CAGRSmLtY0WejKxNJ3xggPivmYhTK6tQ7LSfEZHtAaJQCQHdeTw@mail.gmail.com>
Subject: Re: 5.10 build issue creating library for driver support.
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The old 5.4 patch fixed the problem I had then which was linking with
a library, this one is that it won't *create* the library.

"No rule to make target '/path/to/sourcefile.o', needed by '/path/to/lib.a' Stop

With 5.10 you get the above problem with 5.4 without the patch you can
still create it, just can't link with it, with the patch it works
perfectly.  So it's new in 5.10.

Thanks!!

On Sun, Apr 25, 2021 at 10:31 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sat, Apr 24, 2021 at 10:26 PM David F. <df7729@gmail.com> wrote:
> >
> > Hello,
> >
> > I moved to 5.10 from 5.4 now I have build problem:
> >
> > "No rule to make target '/path/to/sourcefile.o', needed by '/path/to/lib.a' Stop
> >
> > The build will build a small library file of shared driver support
> > routines, but it doesn't appear the build will support a library
> > anymore?  Is there a patch for that?
> >
> > There was a patch that fix a prior problem of linking to a lib.a file:
> >
> > Subject: Moving from 4.x to 5.4.22 breaks custom module build.
> >
> > Is there a fix for this new issue?
> >
> > Thanks.
>
>
> I think you asked the same question before,
> and you found a patch.
>
> https://patchwork.kernel.org/project/linux-kbuild/patch/20200106032324.3147-1-masahiroy@kernel.org/#23088533
> Doesn't this solve your problem?
>
> --
> Best Regards
> Masahiro Yamada
