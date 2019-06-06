Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5A3B381DE
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2019 01:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbfFFXkM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 Jun 2019 19:40:12 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37174 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfFFXkM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Jun 2019 19:40:12 -0400
Received: by mail-pl1-f193.google.com with SMTP id bh12so68608plb.4
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Jun 2019 16:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zupcycHQhyZT5TPbzZH69TXNfK4PGS1TsnXYmh2heXA=;
        b=OK7y4D8OareDzwfMyIRJGXrsJrkBCTjHx+5e2R1/XnVCdlMIeUq2ylw1JdESiMjw4U
         vQuzE8d1AM5MapxQeB4XiUvJKPY9nfGTyJlfyEYbAf0cX6CGSM1fTIOoHvwvr8N89Fwz
         oKuJdZJ1czJp/0Awj+h8sAVxQNfO0Iyaa+Nu8ToGeJcB6izf81oFHFtnMGT2gOAc+zLf
         YhEPKHZQLHD8ZPVr6sOBalOoiKDdbP2er0moAg9N8sP/yQTvr/fJRlLyZxbUTLfxT+Nd
         SMQAWURCIlVmkk6htR9ZFo+Zq8eXp8j1EypQH3Tr8EqXWAx/dtpgQkohFh5HoSD/8mmt
         3vlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zupcycHQhyZT5TPbzZH69TXNfK4PGS1TsnXYmh2heXA=;
        b=XLy5qWBi2mZCY887m1WtmGAfBCpmgI29H56DTwXq23zoQgLNy+0rzU3niWykRASoTP
         Lnd7KS2tUl0nxOlBHXTtmSNBsQreiOoT0eh1HZ6uZcaiM/G/o8HMrbmy1x/L82F36DfC
         3JEGq5J+vCFd5v1GKK0MIWKvvq5fcRfZZK7TTSBAj//41ha747xg5ufCmcFgHBztJoNE
         NRvpaulUe3demVA35LmIVtOivuO5+2KmkB0JmQOCEMAcqckE2f9/j4wnt1Fm4p8TYREL
         UCH6nZOoRCOKlOcjHYtHT5OpQe2blm6f9z2xfw6sONX0OMbChXyVTIjf0DBD8gzis9UB
         qN0g==
X-Gm-Message-State: APjAAAWkJMpe+8/KX9txQ9IW8GDfaXYNUk8mcW87QI7ZoylL7ktmyBmX
        B/vlWLAU26sxkUkdpHnt9mPtbxCAm5I/1uXtUjrl6w==
X-Google-Smtp-Source: APXvYqyX9NzgOKOBEhL3bfMOXwnl+YK9bQ96sRpsB/N0jk6CGTHPGokJOh/8Hytm71BtKVBSpMQIrhxbRxSBg/ZYe+8=
X-Received: by 2002:a17:902:b944:: with SMTP id h4mr50886675pls.179.1559864411389;
 Thu, 06 Jun 2019 16:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190606203003.112040-1-rrangel@chromium.org> <20190606205406.GA120512@google.com>
In-Reply-To: <20190606205406.GA120512@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 6 Jun 2019 16:40:00 -0700
Message-ID: <CAKwvOd=RCL3hpHBVukomrRiXKhvJHMxe3HSrtd0MRcCe1B3ZGw@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: Add option to generate a Compilation Database
To:     Tom Roeder <tmroeder@google.com>
Cc:     Raul E Rangel <rrangel@chromium.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Matthias Kaehlcke <mka@chromium.org>, zwisler@chromium.org,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Petr Mladek <pmladek@suse.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Changbin Du <changbin.du@intel.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Matthew Wilcox <willy@infradead.org>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 6, 2019 at 1:54 PM Tom Roeder <tmroeder@google.com> wrote:
>
> On Thu, Jun 06, 2019 at 02:30:03PM -0600, Raul E Rangel wrote:
> > Clang tooling requires a compilation database to figure out the build
> > options for each file. This enables tools like clang-tidy and
> > clang-check.
> >
> > See https://clang.llvm.org/docs/HowToSetupToolingForLLVM.html for more
> > information.

I'm also super happy to see this!
https://nickdesaulniers.github.io/blog/2017/05/31/running-clang-tidy-on-the-linux-kernel/
I don't know enough about GNU Make/Kbuild to answer the questions, but
hopefully Masahiro can help there.

> I'm glad to see someone adding this to the Makefile directly. I added
> scripts/gen_compile_commands.py in b302046 (in Dec 2018) when I was

Heh, cool.  I had a script that basically did this; we recently
dropped it from the Android trees when doing an audit of out of tree
patches.

> working on using clang-check to look for bugs in KVM. That script

I'm very interested in this work; my summer intern is looking into
static analyses of the Linux kernel.  Can you maybe reach out to me
off thread to tell me more about what you found (or didn't)?

> > Normally cmake is used to generate the compilation database, but the
> > linux kernel uses make. Another option is using
> > [BEAR](https://github.com/rizsotto/Bear) which instruments
> > exec to find clang invocations and generate the database that way.

It's probably possible to get this to work w/ GCC if the additional
dependency of bear exists on the host's system (and may reduce the
number of implementations).  Downside is the additional host
dependency.

Sounds like it may also be possible to just run
scripts/gen_compile_commands.py at build time if this config is
enabled?

Maybe a comparison of the output of Tom's script and your patch might
reveal if one approach is incomplete?
-- 
Thanks,
~Nick Desaulniers
