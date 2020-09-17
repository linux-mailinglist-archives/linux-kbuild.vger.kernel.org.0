Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22C8626D3C1
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Sep 2020 08:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgIQGhX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Sep 2020 02:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgIQGhV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Sep 2020 02:37:21 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B10C061756
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Sep 2020 23:37:20 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id c13so1251695oiy.6
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Sep 2020 23:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DmH7lVb417eXI2VeqeItQgKBp0xKHSxQ9iYZKyDox1E=;
        b=dyKzxUO8iJ6MybLJ52ubrLm+liYaOMZR++Y5xaNiwrDBw/iA3Nut6Yn841d9KubXm4
         Q/Hnp7VOy43qKf+4ZlHubvF2Hdp9iphzEQCUzgi9oCE+cpXws2VNr6dYgd1yt+hcf7RQ
         ovD/bqaoaPuu0pb0BMYefZ2SPU7qCJy0sih2cTdUHk8AAGVDcnMfHgFBt8oqfzwr2Tu/
         39Gb2P8mjacNiJ31cgYTzquiQCF5rabvKIYewuU8dFzVNMdaMOQ4ZY3kN4zf5tdfOPvX
         yop7vE70Lw2Nlbx3pGduzbVq+QT8e+Xb6ko5Nl4aOdowhMgtb+NGMkJvWPP3h+N08sRH
         J4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DmH7lVb417eXI2VeqeItQgKBp0xKHSxQ9iYZKyDox1E=;
        b=HCYexBVQ13c+FjZQ+JivxHp5B1tANlc1eknOiOxHH3jQoYk2Se6sk5jsO70KMgLL8e
         ZNAKx9X3o2YRUYm1Nx8HFD2k1PB9RFrCOehrMlAjxVJInZ6rl2+lJYhPWK/NbpZSDp6f
         4Qfw7PX2yq9iv/UrrYWDfIsedjwFDqP21pYUVYKUiQXSqKksXi/sDtEAHPKNk9GgItzA
         GN8GpaI2gYiIuftze1ZYOPdMJpEmnALXeh/lQS/fVolFTtPwiGkqC9HlkMnmUJoKGBq6
         8j0G6o+Qvj8XQSYxCvZWiaBCC4PNO+MU+wz06S40K3j0KsqUVYvgsViDPBPQ+mv+TSff
         dBQA==
X-Gm-Message-State: AOAM530jtqNg0SM96jHad6x20rQjn4RWUZ72IKMtHb5by/wmDKU2wRUC
        awLneP7Cj9sKsZDSzeP1rSJNUdXtExvvxchWYYumgQ==
X-Google-Smtp-Source: ABdhPJx2jnXpIUmp24nTKDkWxZRLjM1Wslz6+lowH+iNNw8va1V6kY9UCGOGi/uVM7SEkQXpHTIqXCSF8rXYgnPrFO0=
X-Received: by 2002:aca:5158:: with SMTP id f85mr5592894oib.121.1600324639579;
 Wed, 16 Sep 2020 23:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200914172750.852684-1-georgepope@google.com>
 <20200914172750.852684-7-georgepope@google.com> <202009141509.CDDC8C8@keescook>
 <20200915102458.GA1650630@google.com> <CANpmjNOTcS_vvZ1swh1iHYaRbTvGKnPAe4Q2DpR1MGhk_oZDeA@mail.gmail.com>
 <20200915120105.GA2294884@google.com> <CANpmjNPpq7LfTHYesz2wTVw6Pqv0FQ2gc-vmSB6Mdov+XWPZiw@mail.gmail.com>
 <20200916074027.GA2946587@google.com> <CANpmjNMT9-a8qKZSvGWBPAb9x9y1DkrZMSvHGq++_TcEv=7AuA@mail.gmail.com>
 <20200916121401.GA3362356@google.com> <20200916134029.GA1146904@elver.google.com>
In-Reply-To: <20200916134029.GA1146904@elver.google.com>
From:   Marco Elver <elver@google.com>
Date:   Thu, 17 Sep 2020 08:37:07 +0200
Message-ID: <CANpmjNOfgeR0zpL-4AtOt0FL56BFZ_sud-mR3CrYB7OCMg0PaA@mail.gmail.com>
Subject: Re: [PATCH 06/14] Fix CFLAGS for UBSAN_BOUNDS on Clang
To:     George Popescu <georgepope@google.com>
Cc:     Kees Cook <keescook@chromium.org>, maz@kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kvmarm@lists.cs.columbia.edu, LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        james.morse@arm.com, julien.thierry.kdev@gmail.com,
        suzuki.poulose@arm.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        David Brazdil <dbrazdil@google.com>, broonie@kernel.org,
        Fangrui Song <maskray@google.com>,
        Andrew Scull <ascull@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 16 Sep 2020 at 15:40, Marco Elver <elver@google.com> wrote:
> On Wed, Sep 16, 2020 at 12:14PM +0000, George Popescu wrote:
> > On Wed, Sep 16, 2020 at 10:32:40AM +0200, Marco Elver wrote:
> > > On Wed, 16 Sep 2020 at 09:40, George Popescu <georgepope@google.com> wrote:
> > > > On Tue, Sep 15, 2020 at 07:32:28PM +0200, Marco Elver wrote:
> > > > > On Tue, 15 Sep 2020 at 14:01, George Popescu <georgepope@google.com> wrote:
> > > > > > On Tue, Sep 15, 2020 at 01:18:11PM +0200, Marco Elver wrote:
> > > > > > > On Tue, 15 Sep 2020 at 12:25, George Popescu <georgepope@google.com> wrote:
> > > > > > > > On Mon, Sep 14, 2020 at 03:13:14PM -0700, Kees Cook wrote:
> > > > > > > > > On Mon, Sep 14, 2020 at 05:27:42PM +0000, George-Aurelian Popescu wrote:
> > > > > > > > > > From: George Popescu <georgepope@google.com>
> > > > > > > > > >
> > > > > > > > > > When the kernel is compiled with Clang, UBSAN_BOUNDS inserts a brk after
> > > > > > > > > > the handler call, preventing it from printing any information processed
> > > > > > > > > > inside the buffer.
> > > > > > > > > > For Clang -fsanitize=bounds expands to -fsanitize=array-bounds and
> > > > > > > > > > -fsanitize=local-bounds, and the latter adds a brk after the handler
> > > > > > > > > > call
> > > > > > > > >
> > > > > > > > This would mean losing the local-bounds coverage. I tried to  test it without
> > > > > > > > local-bounds and with a locally defined array on the stack and it works fine
> > > > > > > > (the handler is called and the error reported). For me it feels like
> > > > > > > > --array-bounds and --local-bounds are triggered for the same type of
> > > > > > > > undefined_behaviours but they are handling them different.
> > > > > > >
> > > > > > > Does -fno-sanitize-trap=bounds help?
> [...]
> > > Your full config would be good, because it includes compiler version etc.
> > My full config is:
>
> Thanks. Yes, I can reproduce, and the longer I keep digging I start
> wondering why we have local-bounds at all.
>
> It appears that local-bounds finds a tiny subset of the issues that
> KASAN finds:
>
>         http://lists.llvm.org/pipermail/cfe-commits/Week-of-Mon-20131021/091536.html
>         http://llvm.org/viewvc/llvm-project?view=revision&revision=193205
>
> fsanitize=undefined also does not include local-bounds:
>
>         https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html#available-checks
>
> And the reason is that we do want to enable KASAN and UBSAN together;
> but local-bounds is useless overhead if we already have KASAN.
>
> I'm inclined to say that what you propose is reasonable (but the commit
> message needs to be more detailed explaining the relationship with
> KASAN) -- but I have no idea if this is going to break somebody's
> usecase (e.g. find some OOB bugs, but without KASAN -- but then why not
> use KASAN?!)

So, it seems that local-bounds can still catch some rare OOB accesses,
where KASAN fails to catch it because the access might skip over the
redzone.

The other more interesting bit of history is that
-fsanitize=local-bounds used to be -fbounds-checking, and meant for
production use as a hardening feature:
http://lists.llvm.org/pipermail/llvm-dev/2012-May/049972.html

And local-bounds just does not behave like any other sanitizer as a
result, it just traps. The fact that it's enabled via
-fsanitize=local-bounds (or just bounds) but hasn't much changed in
behaviour is a little unfortunate.

I suppose there are 3 options:

1. George implements trap handling somehow. Is this feasible? If not,
why not? Maybe that should also have been explained in the commit
message.

2. Only enable -fsanitize=local-bounds if UBSAN_TRAP was selected, at
least for as long as Clang traps for local-bounds. I think this makes
sense either way, because if we do not expect UBSAN to trap, it really
should not trap!

3. Change the compiler. As always, this will take a while to implement
and then to reach whoever should have that updated compiler.

Preferences?

Thanks,
-- Marco
