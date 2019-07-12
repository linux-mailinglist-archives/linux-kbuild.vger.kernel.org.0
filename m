Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8799066359
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jul 2019 03:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729191AbfGLBXg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Jul 2019 21:23:36 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45766 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbfGLBXg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 21:23:36 -0400
Received: by mail-lf1-f67.google.com with SMTP id u10so5294324lfm.12
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Jul 2019 18:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9NuXct5FW62NllFLkWHXtF54PXpuTDXCY6/8Ws75hAk=;
        b=PTaFWFa9tsIcZKGH46sqa/kg0BqnZ09unrqjmMlbQrVI4BYj8E+xBy4K4ZDP4027CV
         GOPy9CKjNtES2ZAgyq964LkeWqrrxHFUISbSTAXkwMQ5J92Kxk5amAw1WuicOlDER9y/
         4exC+/nG5OMJbTivCpXXf2y8w/kgK+BV9Nv40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9NuXct5FW62NllFLkWHXtF54PXpuTDXCY6/8Ws75hAk=;
        b=q8AhW4ytrObMl0lWVfcufZ7rOrzC75bh8qGUeRHuSMttb1XEEWuKnAkRyHbo5fORif
         5EdtKJRaGfGzU3apGLB5BNwrST+xo+44R3hqAl8FuhVXBulhucSVy22S0SoO7PbHQ/HY
         Eg19gnv6zp33+Gw7sbUyscmPwTGlA7nl7+NzDUcUf2G0qD+h/0SpQsAY0fb2XlhuAzPR
         vQomRwJKD48njEspFLxvKBIfC8CDXuYERsp/OKM5pibpVtf0Db7ur49SkDRaJOUfOdmW
         20uxKuNimjR9mKpchqxMyKtNQk/Oid1Wn98daFD6K6Z3U2qgcQlirUfklk3gEzDj1RMY
         8OWA==
X-Gm-Message-State: APjAAAU07FGTrlncC4yQujFFQNAnzkUfb3uA3zX0hazY3j1KwPnuf/6Y
        5lgRqzG5EdinljDrfRhY7roaVbgF2vw=
X-Google-Smtp-Source: APXvYqwbyGsjH5zKa4Tj13cdhxUZ9KUgtFSbSnr+WHif98JwjraOaeUmrZvXOHfV9COUKL1x3rqOTg==
X-Received: by 2002:ac2:43d0:: with SMTP id u16mr3338302lfl.38.1562894613445;
        Thu, 11 Jul 2019 18:23:33 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id m9sm1024857lfo.45.2019.07.11.18.23.30
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 18:23:31 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id p197so5324955lfa.2
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Jul 2019 18:23:30 -0700 (PDT)
X-Received: by 2002:a19:6a01:: with SMTP id u1mr3285742lfu.141.1562894610575;
 Thu, 11 Jul 2019 18:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190712010556.248319-1-briannorris@chromium.org> <CAK7LNARGNVfxexE616cQDs1fK7SzToKwHxO_T69+RShL6QVTCQ@mail.gmail.com>
In-Reply-To: <CAK7LNARGNVfxexE616cQDs1fK7SzToKwHxO_T69+RShL6QVTCQ@mail.gmail.com>
From:   Brian Norris <briannorris@chromium.org>
Date:   Thu, 11 Jul 2019 18:23:19 -0700
X-Gmail-Original-Message-ID: <CA+ASDXNGqYkBjMsjcRKAit+0cd0n7dwxKhezyYCXSh_HjucvQw@mail.gmail.com>
Message-ID: <CA+ASDXNGqYkBjMsjcRKAit+0cd0n7dwxKhezyYCXSh_HjucvQw@mail.gmail.com>
Subject: Re: [RFC PATCH] bug: always show source-tree-relative paths in WARN()/BUG()
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
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

On Thu, Jul 11, 2019 at 6:14 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> BTW, did you see this?
>
> commit a73619a845d5625079cc1b3b820f44c899618388
> Author: Masahiro Yamada <yamada.masahiro@socionext.com>
> Date:   Fri Mar 30 13:15:26 2018 +0900
>
>     kbuild: use -fmacro-prefix-map to make __FILE__ a relative path

Oh, wow, no I did not. If my reading is correct, that's GCC only? I've
been using various combinations of newer (5.2) and older (4.14.y --
didn't have that patch) kernels, older GCC (doesn't have that feature
AFAICT), and newer Clang (doesn't appear to have that feature). So I'm
not totally sure if I ever actually tried a combo that *could* make
use of that. But I may give it another shot.

In the event that this is GCC-specific...I don't suppose I could
convince anybody to expend any effort (e.g., taking a patch like mine)
to solve it for the non-GCC world?

Thanks for the tip,
Brian
