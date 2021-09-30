Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDA441E227
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Sep 2021 21:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344172AbhI3TXz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Sep 2021 15:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343832AbhI3TXz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Sep 2021 15:23:55 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AFFFC06176A
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 12:22:12 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id f15so6768556qtv.9
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 12:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A/tuWyi96ya0DlbzWNr34/HVx+HP3Iol741vjN64iIc=;
        b=AnkZHp5Jxa0Wk/NFWfm8jROZ4vvwpLiSaBjXqAL2Oj1rT8lPI5/T+3P56rGO8gKyxc
         kvInbIhXASrI/xTvh9/fbw4QmCGU0MaFulfd4JkXMuFWPqLvO4VCU+udtyP9m4y21FSZ
         Rw2TC2kmSA+ecaVyQDNVXPE9k049LXNX+T1MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A/tuWyi96ya0DlbzWNr34/HVx+HP3Iol741vjN64iIc=;
        b=QjWCrSiCfW5lfDR6Fsj7GJ8U4G/rijTowUHAHNxu7EK4P2/mQhwvHIyf83JbV860BU
         KzsLCu8Zw0uZVJpko7PM51IGJ1fpAD7vGhdknSSKXVHOG3Yd71fZc0WnJNBIzlbJ3b0Z
         viBc/Uh520umoEn2qBBiSF8+og1zbsH1L7TFFstipM3FVlHqnlh8L48+FeRwp/gY74ST
         +6IVzjuXxuwncZvitDRdNNXwG7S9Q3Nk3MCRafZhLvbI96gRJsUSwiXbrW8ZWlESCLfo
         raTz2MupSDkqueiRjx7fOUSLB0UuKe9m2Bn+8ZYtzsBUz5qAF1pxARkGBOs5ANhNKZUn
         QrFg==
X-Gm-Message-State: AOAM530x0R8Gf4GbXW7t3Yf+ibupt3PPKHlg+welLdXTvmRBSYWzIDVh
        7igDE8AVIVyA7ZN3JkIhyKnwn7Od6AW0Z6rNBF0qRA==
X-Google-Smtp-Source: ABdhPJxJw9NOE+4sYLYwSXZW1wIgp8Fr2yvM5tOgUuMt++tcPCBQPGyBPdWLTJb4BqiUEnUe0uPUQw==
X-Received: by 2002:ac8:5345:: with SMTP id d5mr8398642qto.94.1633029730943;
        Thu, 30 Sep 2021 12:22:10 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id k19sm2053841qko.115.2021.09.30.12.22.10
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 12:22:10 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id i84so15572001ybc.12
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 12:22:10 -0700 (PDT)
X-Received: by 2002:a25:6b11:: with SMTP id g17mr1212374ybc.251.1633029729737;
 Thu, 30 Sep 2021 12:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210929225850.3889950-1-ndesaulniers@google.com>
 <CAHk-=wh0BNEDz+uOdJWG8iW=n0PeOEjZpHyuSN2g0pKSCj+6iQ@mail.gmail.com>
 <CAKwvOdn-Z1q99zZW4GQ2aNnVMQ_JYuczrResTG7tvcfv0WLJ-w@mail.gmail.com> <CAHk-=wip2uVAaRtPNFF4+C2ZmkUZ+rs2-676syUR_kJ9+8hFNA@mail.gmail.com>
In-Reply-To: <CAHk-=wip2uVAaRtPNFF4+C2ZmkUZ+rs2-676syUR_kJ9+8hFNA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 30 Sep 2021 12:21:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wix+P0EtxFSEhmubWNZ++Qg1fj46e32uEKo+mzPu0jPAA@mail.gmail.com>
Message-ID: <CAHk-=wix+P0EtxFSEhmubWNZ++Qg1fj46e32uEKo+mzPu0jPAA@mail.gmail.com>
Subject: Re: [PATCH] modpost: add allow list for llvm IPSCCP
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 30, 2021 at 11:54 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Hmm. That's just a "bitmap_weight()", and that function in turn is
> __always_inline.
>
> And the *reason* it is __always_inline is that it really wants to act
> as a macro, and look at the second argument and do special things if
> it is a small constant value.

Looking around, it's not the only one. A lot of the bitmap functions
do that, but it looks like we're missing a few __always_inline cases.

I wonder if we should have a macro to generate those "do X or Y
depending on small_const_nbits()" - and have it generate
__always_inline functions.

Of course, some of those functions have more complex "check at build
time" cases, like that bitmap_clear/set() thing that has a special
case for when it just turns into "memset()"

We have a lot of these kinds of situations where we have a "generic"
function that specializes itself based on arguments. And yes, they are
often recursive, so that you need more than one level of inlining to
actually determine what the arguments are.

I don't know if we might have some way to mark these (and detect the
cases where they don't get inlined and we lose the vasy basic
optimizations).

It's kind of similar to the _Generic() thing that does different
things based on static types, it's just that it does it based on
argument ranges.

          Linus
