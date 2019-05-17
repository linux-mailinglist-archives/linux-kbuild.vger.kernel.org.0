Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96DEB21646
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 11:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbfEQJ1x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 05:27:53 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42476 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727984AbfEQJ1x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 05:27:53 -0400
Received: by mail-lf1-f65.google.com with SMTP id y13so4811611lfh.9;
        Fri, 17 May 2019 02:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OFE1ZoeQKcw6uUZSWRVQMV466jgT2gduffrESVPh5GA=;
        b=Y2BHJ+PvUFT0308yUm6Egg79bIJm/6C6ll08cNjuuzDWQLzsWGHhgOBKmx6wAIilgC
         DxCDR5yt1pyPc11X/O3cPt0xegyW38hYSi05efGBWi8kuBhpuTRbG/Ceg8Ac9A8ZXrG8
         ZPadXzk5WE97Q9IqWQS3dsvR2XhFatL+5k9jcw/h9yHroCpmehtxEqFExPJ6xJ1adSeQ
         rwQfd+dtzXOa0kw/uFs0r23Tfu0eqPP4K/6FiT9SaNdaUjT4xYw2rN9fuxfZ5mdVNK/3
         4Yh8NHDIAeUtZA15rmquYhfVQr5cPxPPW64lbZ1Jqm8w5IBJ+mP9u5zx+jqnqji9yxO6
         Ow/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OFE1ZoeQKcw6uUZSWRVQMV466jgT2gduffrESVPh5GA=;
        b=nW0nUNfVJL9uu28+rt/MNfnYYCUHmJTnAwKDro5rTANp2MY9dXGJYucS6qwha6YhWr
         ZKg5DeTHQEUH5ephBLVPflolVNNWzOmcDW+dgXlHr9YWWCL/PIBNlVXiGnFQfYK7bepM
         /i9oWyckOPjI2mRVf74Afl0pFg9I9AUcgLRF5PrC89V8QyYAQLtyULWRPOAa+ZIcjIqC
         Emj3elYjAm27mHFQ+v+//NuomtCvfWksIl7SPxPb8bJZGfnUOBqAlIx7My00r4RgUx1N
         iRj42QyljnGW6NLre4cr1Ss8rZ81bUMSIJWbuOzTuFukuWPiaUzslVzRkCW5mnVdWzhT
         Sd3g==
X-Gm-Message-State: APjAAAWlZyfbuSNV1NTeeTopbdPC4+YFFQCoJJVbcmpmAqmDPxOsBJlV
        ikMC1e6sq/sAnK78gTdWoyNrNeJt/65kMzN+daU=
X-Google-Smtp-Source: APXvYqwVaFLfVJGzEWNA/bihj3MEL3KDOC5eSfhNJJdJVvM8+NnSoqM2q1DWNZ6kK+ft5uSJ4IidpZJm1PUwdrJUyt8=
X-Received: by 2002:a19:7516:: with SMTP id y22mr6401252lfe.26.1558085271855;
 Fri, 17 May 2019 02:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com>
 <CABWYdi1zhTTaN-GSgH0DnPfz7p=SRw0wts5QVYYVtfvoiS0qnQ@mail.gmail.com>
 <CANiq72=fsL5m2_e+bNovFCHy3=YVf53EKGtGE_sWvsAD=ONHuQ@mail.gmail.com>
 <20190516225013.nvhwqi5tfwtby6qb@treble> <CABWYdi29E++jBw8boFZAiDZA7iT5NiJhnNmiHb-Rvd9+97hSVA@mail.gmail.com>
 <20190517050931.GB32367@kroah.com> <20190517073813.GB2589@hirez.programming.kicks-ass.net>
 <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com>
 <20190517085126.GA3249@kroah.com> <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
 <20190517092302.GA5235@kroah.com>
In-Reply-To: <20190517092302.GA5235@kroah.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 17 May 2019 11:27:41 +0200
Message-ID: <CANiq72=HpvQx1t+W3YwY-6Rdw1F6UJbVkAzJFdE61H668B8s2g@mail.gmail.com>
Subject: Re: Linux 4.19 and GCC 9
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ivan Babrou <ivan@cloudflare.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 17, 2019 at 11:23 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, May 17, 2019 at 11:01:45AM +0200, Miguel Ojeda wrote:
>
> > a6e60d84989f ("include/linux/module.h: copy __init/__exit attrs to
> > init/cleanup_module")
>
> That patch I applied now.

Note that this one requires the second one (c0d9782f5b6d).

Cheers,
Miguel
