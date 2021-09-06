Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B72401E52
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Sep 2021 18:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243918AbhIFQb1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Sep 2021 12:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244143AbhIFQb0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Sep 2021 12:31:26 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A6F4C061757
        for <linux-kbuild@vger.kernel.org>; Mon,  6 Sep 2021 09:30:21 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id f2so12190249ljn.1
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Sep 2021 09:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8IrmItaVABpTCCV1GTBCmSGs8mDxg06CHACTL5Qkb7w=;
        b=R2wRvIZ5fztexmU3w2tyRYRDA1Rg0puldwTR9y4HA3UlQ/qnMC08DRaXlPDdqtri+Q
         fAFEd+j22NAvQfMj3ireP0Bgf1gZNxEMJl31x2rd6p84iAF4Z4IsEEKwIkc2JxJLl4T5
         f6z/63UOWwOUtQoNqw8I23oboEBdueZySRELo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8IrmItaVABpTCCV1GTBCmSGs8mDxg06CHACTL5Qkb7w=;
        b=gZdrxW+hWO/H+8WMIscg7v7lhEV/vMP3OLpRHMSxtVi0tI8MWyXxiAXeFnwJMKh9UA
         52Bxyp5C1U+xAkO9z3GyDw3v+qG63COQMyyK/SFk3c8WPa8Fg/nlrhpJ4wOK/RflKg5Q
         k/6Jy0whmpizIkWH6rK8qt+h35jO+YOrOM1bYKHZCeBkhW10LJ1RUjcMeby2vhUq+/ZT
         9y5nk6436VHzvVAHIyY8Kv4mA3XoeVfXQ2GKwa9eOVuRXWnooa4i18vWOyi8v5dkYCfw
         jKEN72HYj4sKneqTXIpf12eBHOlAua3Uhwaa6DT5O7tKbIc7NYFAkjSMJ89FnvsTdVxY
         /iKA==
X-Gm-Message-State: AOAM530P3R8xAXRT9y+lc4/QPpYzKgcerh5PwLkecWfu+S1BrGljGZiJ
        NoItxGpoBXyQ0no5GLXHvNQHO3ZJopQy91mpFYQ=
X-Google-Smtp-Source: ABdhPJw1UIT2xhW7m4R+lLH3bI+ew2WKTgJIgPhNXP0wD9IfZBq8w6hMM0YdCYrqRQAmCqqWphxOxQ==
X-Received: by 2002:a2e:918e:: with SMTP id f14mr11349404ljg.357.1630945819338;
        Mon, 06 Sep 2021 09:30:19 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id l14sm1081690lji.106.2021.09.06.09.30.18
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 09:30:18 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id n2so4861313lfk.0
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Sep 2021 09:30:18 -0700 (PDT)
X-Received: by 2002:a05:6512:2611:: with SMTP id bt17mr10258695lfb.141.1630945817827;
 Mon, 06 Sep 2021 09:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNAQ0Q6CdXaD-dVGj_e3O3JYs_crpejWKpXHYQJYxyk-1VQ@mail.gmail.com>
 <CAHk-=wgoX0pVqNMMOcrhq=nuOfoZB_3qihyHB3y1S8qo=MDs6w@mail.gmail.com>
 <3b461878-a4a0-2f84-e177-9daf8fe285e7@kernel.org> <878s0c4vng.fsf@oldenburg.str.redhat.com>
 <20210904131911.GP1583@gate.crashing.org> <871r644bd2.fsf@oldenburg.str.redhat.com>
 <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
 <20210904191531.GS1583@gate.crashing.org> <CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com>
 <20210906154642.GV1583@gate.crashing.org>
In-Reply-To: <20210906154642.GV1583@gate.crashing.org>
From:   Linus Torvalds <torvalds@linuxfoundation.org>
Date:   Mon, 6 Sep 2021 09:30:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com>
Message-ID: <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com>
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Florian Weimer <fweimer@redhat.com>,
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

On Mon, Sep 6, 2021 at 8:50 AM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
>
> Yes they are.  It is the single standard way to get the functionality
> you want.

Sorry, but 'standard' is the part that the kernel simply doesn't do.

Just face it. The kernel isn't written with all those standards that
are designed for entirely different things in mind.

> I don't know why you think you can separate that.  Take <stdarg.h> --
> there is no other (portable, standard) way to implement receiving
> variadic arguments.

You clearly haven't actually read the thread.

That was my whole argument.  For the _historical_ situation.

           Linus
