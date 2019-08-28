Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 909DCA0E13
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2019 01:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbfH1XK2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 19:10:28 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42085 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbfH1XK1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 19:10:27 -0400
Received: by mail-pf1-f193.google.com with SMTP id i30so722786pfk.9
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2019 16:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=maM1ojqJifdUsFgge/qaHK4HvmJyTKAP1bwPNUVbauM=;
        b=CoqP6ZBWZexG4zx4P3Z0hyz5luNndnAM9uwV0BKqUA7PZ1es/9ehQ7pkOC9Go+IshW
         CigSOg+kriQ5Od71j4CaX4//YV5Trlou/0hEy2fiGNxK/QKo4DlXklacQ9Wc9IKHmQLo
         iA4i9I2koJCvIKWDBl2pTSEoab7WXzlePtTi0yZgaDYzB7TOPcqVfgAGkHk+qUlYJeB+
         tIndUZw5HTHZma1oGCrm/PTQJ/b/Oc/5My+no7ip+eyrFw2nfYU5oZ4HpIad6l91XmU0
         zl68nkzBTHHSAG03NR0a/jxI3amFj5IuUlAIHsq968yH+jkypJcMExGZ9j4Z7P1AfaJR
         oXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=maM1ojqJifdUsFgge/qaHK4HvmJyTKAP1bwPNUVbauM=;
        b=hKpwaH2hk0vHjaK99+99vjGNQDGuXOFBSk35XCUMolw6SLDAeoAlz51uSnPcM6cuJr
         M6tzSdVc3O19jcUgDupbrBFngXV240/IrUcjqiTHYUn0D9nZVywaV5CFI0cmUhYcchok
         xCdoKiVzV0bJiHoU9dynxAemGVLW8exRuHjBPkGhN+uKvVIWuSKT7GgZrbTEPTCykC1H
         pVa8yXppfmqoddfNaOkEbKUPZEWXnBBBEtvO/QfJ2n9nQi7b25r22awMddYESzeWsxsn
         9vfdTW1IwTSX8lfZFjWmrgHJWNjPJb3IAiOyv9q1d0PwVFvI4J8waRlKFzRjgpW5AdCS
         WyUQ==
X-Gm-Message-State: APjAAAUBmEDKMZUll47E1eB7b1hi4WpuFEOOex5vKEmIEI9ZsRuZCxoD
        xiwLIzMUbAN2zgF9qNxSRstmx9kVvNhG+wpVIrWisQ==
X-Google-Smtp-Source: APXvYqyBkUur1MD0ri9FpGE1y6Y892AFfQGNxC+0LHOa79X9Ax6KxItGnMgIgKpd0mOuC+JL/NR1NTiffQxnEHd21V4=
X-Received: by 2002:aa7:984a:: with SMTP id n10mr7703356pfq.3.1567033826824;
 Wed, 28 Aug 2019 16:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190827103621.1073-1-yamada.masahiro@socionext.com>
 <20190827192811.GA24626@archlinux-threadripper> <CAKwvOd=7Jf13PDC9Q1FMhZUJQsq7Ggn=wRz5xpRY0YrU6tP9Kw@mail.gmail.com>
 <20190827213447.GA26954@archlinux-threadripper> <CAKwvOd=pQm7ytZSJeRzXoWwzouDADOYkO8S_+zSPtXOAO3Jc5g@mail.gmail.com>
 <CAK7LNARduZNvwQ2AJbP3NNDojM+1AACx=wRqdRz+DRSCuVMK2w@mail.gmail.com>
In-Reply-To: <CAK7LNARduZNvwQ2AJbP3NNDojM+1AACx=wRqdRz+DRSCuVMK2w@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 28 Aug 2019 16:10:15 -0700
Message-ID: <CAKwvOdkOo-6aS=Tu_QkArHK=rhK34Qe+SKJtY4sM-7YupAsCNA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: enable unused-function warnings for W= build
 with Clang
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 27, 2019 at 7:58 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> On Wed, Aug 28, 2019 at 6:56 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> > Masahiro, does your patch correctly make -Wunused-function work for
> > clang at W=1?  It looks like -Wunused gets added to warning-1, but
> > then -Wno-unused-function gets added to KBUILD_CFLAGS after `warning`
> > does.  Will that work correctly?  I'd imagine that at W=1,
> > KBUILD_CFLAGS for clang will look like:
> > ... -Wunused -Wno-unused-function ...
> > which is probably not what we want?
>
> Hmm?
>
> -Wunused is added only when W=1.
>
> -Wno-unused-function is added only when W= was not passed.
>
> They do not happen at the same time.

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
