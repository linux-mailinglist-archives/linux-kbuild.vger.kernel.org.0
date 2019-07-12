Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 968C166379
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jul 2019 03:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728853AbfGLBuC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Jul 2019 21:50:02 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:64039 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbfGLBuC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 21:50:02 -0400
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x6C1ntc4011030;
        Fri, 12 Jul 2019 10:49:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x6C1ntc4011030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562896196;
        bh=UqIjBkSfDb7t0Pa41cTBLGihL/zO0QROm2fafaKHDNU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DDRFsUzW/FiD24HPs+jHu5Bi/EKdDsgZRtxiPrWYXTA/3mPJR02kR6Hy4rfZEHuk4
         qvxNPWehXgIcjTVRXoXezGnP8oMNzcUtrK1R+L+NUle34E3/6PuAbQb0o8Sk+DfTtF
         Ql7Zz0K3NyI31hFTXnQjNhBqcgpC0ygMQmMSgwyAw8Wu9QEF9W2D7YNuCjT8EXMWZY
         /y2W/oMVyEeUnJJLoc6pB74gDeXr3xiuHnWJO/y7RUtsXyp6Ny6i3l8/5N5xwdqON0
         rSjdfFQ0PpEuUrUwDHdYthh6CtNVnSZGqLxg29YwNSiuY2uYkpLvpNKNlG1SnusZSg
         aALQBRtpaACTw==
X-Nifty-SrcIP: [209.85.222.41]
Received: by mail-ua1-f41.google.com with SMTP id j8so3375398uan.6;
        Thu, 11 Jul 2019 18:49:55 -0700 (PDT)
X-Gm-Message-State: APjAAAUAH8hkNLa9lFkiOx+JMLdZ8oX0oyTxbMLS3p0HWhfhxNiCjnXs
        LK5obM/dn5Dh2KMTU9P34mDF+Q4sX8yh08RH/uk=
X-Google-Smtp-Source: APXvYqzlydwB3gvvdA2lFPvhYp8V78j/y+++pFKcTD76YsRnM+JZbqCkUMFDsfvqSxGFW/eSSrak/E0XHSk37MO7KZk=
X-Received: by 2002:ab0:5ea6:: with SMTP id y38mr7296356uag.40.1562896194749;
 Thu, 11 Jul 2019 18:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190712010556.248319-1-briannorris@chromium.org>
 <CAK7LNARGNVfxexE616cQDs1fK7SzToKwHxO_T69+RShL6QVTCQ@mail.gmail.com> <CA+ASDXNGqYkBjMsjcRKAit+0cd0n7dwxKhezyYCXSh_HjucvQw@mail.gmail.com>
In-Reply-To: <CA+ASDXNGqYkBjMsjcRKAit+0cd0n7dwxKhezyYCXSh_HjucvQw@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 12 Jul 2019 10:49:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNARJ=aAf-iG7RVDp=bs7DTScJ1GBpEpkqtKDFDJYHEekUA@mail.gmail.com>
Message-ID: <CAK7LNARJ=aAf-iG7RVDp=bs7DTScJ1GBpEpkqtKDFDJYHEekUA@mail.gmail.com>
Subject: Re: [RFC PATCH] bug: always show source-tree-relative paths in WARN()/BUG()
To:     Brian Norris <briannorris@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jason Baron <jbaron@akamai.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Kees Cook <keescook@chromium.org>,
        Borislav Petkov <bp@suse.de>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 12, 2019 at 10:23 AM Brian Norris <briannorris@chromium.org> wrote:
>
> On Thu, Jul 11, 2019 at 6:14 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> > BTW, did you see this?
> >
> > commit a73619a845d5625079cc1b3b820f44c899618388
> > Author: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Date:   Fri Mar 30 13:15:26 2018 +0900
> >
> >     kbuild: use -fmacro-prefix-map to make __FILE__ a relative path
>
> Oh, wow, no I did not. If my reading is correct, that's GCC only? I've
> been using various combinations of newer (5.2) and older (4.14.y --
> didn't have that patch) kernels, older GCC (doesn't have that feature
> AFAICT), and newer Clang (doesn't appear to have that feature). So I'm
> not totally sure if I ever actually tried a combo that *could* make
> use of that. But I may give it another shot.
>
> In the event that this is GCC-specific...I don't suppose I could
> convince anybody to expend any effort (e.g., taking a patch like mine)
> to solve it for the non-GCC world?
>
> Thanks for the tip,
> Brian


GCC 8 added this flag.
So, it will be eventually all solved in the GCC world.

Clang has not supported it yet...


Trimming absolute path at run-time
is no help for reducing the kernel image.

Turning __FILE__ into a relative path at compile-time is better.


I hope Clang people will consider to support it.
I guess implementing this feature should not be so hard.


-- 
Best Regards
Masahiro Yamada
