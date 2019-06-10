Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 386F03B7FB
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Jun 2019 17:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389835AbfFJPE4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Jun 2019 11:04:56 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44065 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389368AbfFJPE4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Jun 2019 11:04:56 -0400
Received: by mail-lf1-f65.google.com with SMTP id r15so6875257lfm.11;
        Mon, 10 Jun 2019 08:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JlGKclY/bHvJDeSRZXa+M2saWzmI4Gp/wAz0wTgws2w=;
        b=NhfeEdpiincXSqU7FtldKqketoZf30UquGvzS6kxSQdA4NdSNMuQMjFZCI7zprrq9n
         tdrH//tHgqASjIuQmcjL4Zs7JRTkKGLgyftJOoju/Q2NIqDNntuBwzQFRQq/P2GK1OXW
         D4kMHiO0wXGoF1WNI4XLlCGLoI1tlblW1G6tlzFqgpIxrDnLCX5Pohf1t/GYjcc+SkRj
         2RW02M15MxLf2Nbt1LScwn3atbTWbzq27/pCMeQ1GEpsZqbXJ8v1tFl5yW5R2EDtRNSH
         Y3+aYI5n03uFtrmykJzVYtKjGbn4dNRuWbp9HHCzpApFX+TpmLVl2QcG3Q/S5ru24a15
         04Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JlGKclY/bHvJDeSRZXa+M2saWzmI4Gp/wAz0wTgws2w=;
        b=G3yi9SyFnKUQ1Bp9ktcmQQGlGCtWMR9OOeQnjiG8Nnn8jdBQLtOxq+BW1tskEwlqj4
         lrG2W7+jmj5gPcrSEbUFjpzmyy0zpn7B6ABLjwYCSt6mCmaM9J4x1dAJPsLeJ2LmaYTG
         H+w0Kcc17aWJLNXljg3UIGXlwou3DY+3aWjw3oRQTqGvUbrELKWVzT1nqPHQzBife93V
         EVzVVsuMCqekbFJsKBhLY2HR4+8tIsODuThWucsAmzITWFS2wgjJBEv67azXyBM6F32J
         Y/Nt/U5DoyntomzCdNGCXWpgUXQ8H0xdf1pDhlNDLfBCmOWn/+q89CVKxtDLldKgffAM
         XqIw==
X-Gm-Message-State: APjAAAXVX3fsnW68WkbO4qOdF0WFSnDgFcfVabPktTDHHXCLdzdGlwQ7
        TKHOdYKjriIbIFzeNyAAOUch5CFwefz/O3EdoBo=
X-Google-Smtp-Source: APXvYqyI13FJbeAILiPcIRmZTbdQFmXeaIUoLLMbMnYGK6WIzeQwFknFTGYM7gn3KAyYoHR3RAwJJIoEnbXB+9V4eEk=
X-Received: by 2002:a19:491d:: with SMTP id w29mr18544344lfa.149.1560179094278;
 Mon, 10 Jun 2019 08:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190517085126.GA3249@kroah.com> <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
 <20190517152200.GI8945@kernel.org> <CABWYdi2Xsp4AUhV1GwphTd4-nN2zCZMmg5y7WheNc67KrdVBfw@mail.gmail.com>
 <4FE2D490-F379-4CAE-9784-9BF81B7FE258@kernel.org> <CABWYdi2XXPYuavF0p=JOEY999M4z3_rk-8xsi3N=do=d7k09ig@mail.gmail.com>
 <20190610074510.GA24746@kroah.com> <CALrw=nEp=hUUaKtuU3Q1c_zKO3zYC3uP_s_Dyz_zhkxW7K+4mQ@mail.gmail.com>
 <20190610142145.GC5937@kroah.com> <CANiq72kxyKV1z+dGmMtuq=gUWOYS=Y0EsNFqLKoFXWx6+n=J1g@mail.gmail.com>
 <20190610144858.GA1481@kroah.com>
In-Reply-To: <20190610144858.GA1481@kroah.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 10 Jun 2019 17:04:43 +0200
Message-ID: <CANiq72maZcuMXQoSDPhY=+4UKUFPwbQLuGsqcoPX-feCerbBtw@mail.gmail.com>
Subject: Re: Linux 4.19 and GCC 9
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Ignat Korchagin <ignat@cloudflare.com>,
        Ivan Babrou <ivan@cloudflare.com>,
        Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Ingo Molnar <mingo@redhat.com>,
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

On Mon, Jun 10, 2019 at 4:49 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 10, 2019 at 04:42:27PM +0200, Miguel Ojeda wrote:
> > I think Josh Poimboeuf added support for a few related things in GCC 8
> > (e.g. 13810435b9a7 ("objtool: Support GCC 8's cold subfunctions")).
>
> That commit is already in all stable releases, so does there need to be
> a gcc 9 specific one?

Ah, you are right. Hm... I recall discussing this at some point when
cleaning up for GCC 9, let me take a look...

> > I typically compile a bare-bones GCC for those things, it is quite quick.
>
> Pointers to how to do that is appreciated.  It's been years since I had
> to build gcc "from scratch".

We crossed emails -- I copy it here on-list in case someone else wants it :-)

mkdir ${BUILD_PATH} \
    && cd ${BUILD_PATH} \
    && ${REPO_PATH}/configure \
        --enable-languages=c,c++ \
        --disable-multilib \
        --disable-bootstrap \
        --disable-nls \
        --prefix=${INSTALL_PATH} \
    && time make \
    && time make install

The key thing is disabling bootstrap to have a single-pass compilation
-- that speeds up things a lot (although, of course, you get less
testing). I would guess you can also disable c++ for the kernel for
even a faster build. You can also use -j, but even without it it does
not really take long (1 hour? -- way less than LLVM anyway). The
installed size nowadays is about 1 GiB.

To get the actual code, I use the git mirror in github for speed
(although it is not that big anyway):

  git clone https://github.com/gcc-mirror/gcc

The tags you want to use look like:

  gcc-9_1_0-release

Also, the first time you run this, you may need some extra dependencies:

  libgmp-dev (maybe named gmp-devel)
  libmpfr-dev (mpfr-devel)
  libmpc-dev (libmpc-devel)

Unless your distro is quite old, I think they should simply work (a
few years ago I had to compile those manually, but nowadays I don't
seem to need them anymore).

Cheers,
Miguel
