Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B214402117
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Sep 2021 23:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236804AbhIFV0H (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Sep 2021 17:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236768AbhIFV0F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Sep 2021 17:26:05 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3945AC061575
        for <linux-kbuild@vger.kernel.org>; Mon,  6 Sep 2021 14:25:00 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id s12so13280395ljg.0
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Sep 2021 14:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bOYkPNs6kBoQRrkZjo5EV/GM+dOfmzNF/MWgTdiF+c0=;
        b=MkdrdbxR65lqXV6wJ76/tFuL8QFam88AtYhA62tPAFEBbcHMyPy2haH+G7bq4zt8uf
         REzVQUd74s4JolJRn/LNNZongzDJAYYklBtf0kLdPjPBrHUnv5eSWvqP1WD0VeTKi9ce
         6WQQIA8wPCjNjMPZ7rtqv0bOQhEIJWtKwcdxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bOYkPNs6kBoQRrkZjo5EV/GM+dOfmzNF/MWgTdiF+c0=;
        b=IhK8hKZxv8NQYaPmf7Mv2BZYg2u+9l7GmKb7rN5++3sVX6xyE1MubO1gxbpioMdqu2
         /D4LhxdorYa5oYTypau6lv79mWp51g/vd+tuV9GJxqeYrpso96xRxGc37iW5L66P7nex
         AHASNSwY8n2IM/XeWB75mjYpCWGTPfkvTAGkDjAtGTspcO5cqftaAIXYR6+wVK4R03Yr
         ILJm1sjpnG/S8tZUte5NpKlQNIDQwMUqNOt66u2I2ieNOoMA3sXs0OwyLEs0uQr1JtAh
         d2lIvzXzlEWa4efvLxu4c48CQI7YGhZZza/H1DxJVVtzno0sZY/6GaA5UctPBohFxvLc
         RHlQ==
X-Gm-Message-State: AOAM530Z/Hrw2ZMiQ2oXtl9yUzvHK+UcrJoswReczWMls50qCiByRmw5
        MH8JfOMd7pJ+1Vc0SDVTNWaUPjU6Al/lxG7o
X-Google-Smtp-Source: ABdhPJxxDVP2e0HZvpFWIOhaLRSeWsFGPVz8bUTVcHFCI05OtCRjmJsrBBeA7MEZd3DT1ZviuSvNaw==
X-Received: by 2002:a2e:7303:: with SMTP id o3mr11805222ljc.273.1630963498362;
        Mon, 06 Sep 2021 14:24:58 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id k20sm1204144ljc.2.2021.09.06.14.24.55
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 14:24:56 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id w4so13179719ljh.13
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Sep 2021 14:24:55 -0700 (PDT)
X-Received: by 2002:a2e:b53a:: with SMTP id z26mr11643568ljm.95.1630963495713;
 Mon, 06 Sep 2021 14:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <871r644bd2.fsf@oldenburg.str.redhat.com> <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
 <20210904191531.GS1583@gate.crashing.org> <CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com>
 <20210906154642.GV1583@gate.crashing.org> <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com>
 <20210906172701.GX1583@gate.crashing.org> <CAHk-=wh0MBVfA89WLWnCiSnJ2a=hSAoSxfG-jyf7JJeBDPK3ew@mail.gmail.com>
 <87lf49wodu.fsf@oldenburg.str.redhat.com> <20210906194808.GY1583@gate.crashing.org>
 <20210906201432.GZ920497@tucnak> <CAHk-=wi80NGPppGmBpc5zuGRAsv4_7qsDu7ehW515J2FJoezAQ@mail.gmail.com>
In-Reply-To: <CAHk-=wi80NGPppGmBpc5zuGRAsv4_7qsDu7ehW515J2FJoezAQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linuxfoundation.org>
Date:   Mon, 6 Sep 2021 14:24:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wikLP4KbTUUY_OKL6doyztjqFNKu_Q713vcrkjthc4S0g@mail.gmail.com>
Message-ID: <CAHk-=wikLP4KbTUUY_OKL6doyztjqFNKu_Q713vcrkjthc4S0g@mail.gmail.com>
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
To:     Jakub Jelinek <jakub@redhat.com>
Cc:     Segher Boessenkool <segher@kernel.crashing.org>,
        Florian Weimer <fweimer@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 6, 2021 at 2:08 PM Linus Torvalds
<torvalds@linuxfoundation.org> wrote:
>
> And you think that we're making it harder for compiler people, but
> that's not at all the case.
>
> You really don't want to deal with us saying "you can't do that" when
> you do something that is

That got cut short when I went off to adding the examples of errors
that happen for those intrinsics headers.

But it was supposed to be "when you do something that is not valid in
the kernel".

There are some *very* core header files that the kernel cannot include
from outside. That "stdlib.h" thing already came up in the errors I
quoted.

But I think you'll find that you guys want to include things like
<errno.h> too, and you'll probably add others (<types.h>? things like
that) simply because they always work fine in user space, and you'd
not even notice.

Header file include chains get messy very quickly, and very easily.

I'm pretty sure you guys don't really want to deal with the pain that
is crazy kernel people that have their very bare environment.

So you may *think* you want the kernel to use your header files
"because compiler portability". Instead, you should be very thankful
that we don't, and that you don't have to deal with our mess any more
than you already do.

          Linus
