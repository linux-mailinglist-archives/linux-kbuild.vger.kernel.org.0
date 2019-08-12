Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE0BD8A883
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2019 22:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbfHLUli (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Aug 2019 16:41:38 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38540 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726498AbfHLUli (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 16:41:38 -0400
Received: by mail-pg1-f196.google.com with SMTP id z14so12841451pga.5
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Aug 2019 13:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MJnh/DbbwUp2ykhuWtKroei6fTXCscBWC620YMU78kw=;
        b=vB8BBLTcHyR/6MmManbwUwxuFJIulQIi8ssstEWavyxVjDjZTqCdDV4k+GvQznx2Gu
         BYrmoSxq/p6EpObadBuog/qnQED0Er2g3FPY/R5mmU2+6prANR/EPeaPhjZJhguiIiRP
         laVlnix+3k3ldsZoV0C1xagsklVYtYidBM9aE1xGrFVcLjBbwRpW6HahGY9+Avp/kWLm
         T5NAN/tqvOLG0auDu2paiIhDdkHD9xVBreQFe50Qz3Fk4VEdJTBMNP4enXfrvN3t06qW
         EUgtNhbhUYFQV5XLv75AMMsdUTUbhRhJq5GaejhlsHjGOrbIRPayAm9bBTghIOMPNAZO
         gGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MJnh/DbbwUp2ykhuWtKroei6fTXCscBWC620YMU78kw=;
        b=ArolXoTalkUqSHGKUQDJrCa5kHSDTXGIOBG2twsq3qE/SXKJDL6Za+/SYKbp9LVhwX
         asD2e/qAbxGaSwkXCVcS4cgr6bh7VX8qeN7oXE4tq3XbsO+jN3KAoMJ5b19dFK6hWO3m
         EXgtIp+tqxTxdmKi432fwsFeGKxPa+hVZ0pObkjqvqSFsrmKuNqGYxuejsA5gUZtdz/Z
         Tyc+J8YCWXRLHIciy4/KToEf9rOLUxewiF2HPhrbnwP6E+Pr4l8WUkCEwEZW2tWfQEP0
         baOC39cjEBMnBBoGWxKxm/fKN8kjJYfjgIvkasiIN+bKAQGUoLpHUFutbnH1EzwD8giY
         ydeg==
X-Gm-Message-State: APjAAAXmeY+PHWkI5uehxbbDBigTOVbNW0pqn02y/M+jf32pAJZhO0S+
        FtYLuVKdp5Pg5hHqXFNrDXmhlunTgeshBYDpvrxUAQ==
X-Google-Smtp-Source: APXvYqzmkY3rA1NydAKLLowsftOVMQA6KoE5ccWG/aJPzsMG71zwm21zQ2Wdnhb2Togz1F6UwE1Me36C6jQdnlOZ3bs=
X-Received: by 2002:a63:b919:: with SMTP id z25mr31379684pge.201.1565642496668;
 Mon, 12 Aug 2019 13:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190716175021.9CA412173C@mail.kernel.org> <20190719000834.GA3228@google.com>
 <20190722200347.261D3218C9@mail.kernel.org> <CAFd5g45hdCxEavSxirr0un_uLzo5Z-J4gHRA06qjzcQrTzmjVg@mail.gmail.com>
 <20190722235411.06C1320840@mail.kernel.org> <20190724073125.xyzfywctrcvg6fmh@pathway.suse.cz>
 <CAFd5g47v3Mr4GEGOjqyYy9Jwwm+ow7ypbu9j88rxEN06QCzdxQ@mail.gmail.com>
 <20190726083148.d4gf57w2nt5k7t6n@pathway.suse.cz> <CAFd5g46iAhDZ5C_chi7oYLVOkwcoj6+0nw+kPWuXhqWwWKd9jA@mail.gmail.com>
 <CAFd5g473iFfvBnJs2pcwuJYgY+DpgD6RLzyDFL1otUuScgKUag@mail.gmail.com>
 <20190801211447.6D3D7206A2@mail.kernel.org> <CAFd5g47tk8x5iet=xfPVO6MphD3SsLtYQLrCi5O2h0bvdXwHtA@mail.gmail.com>
In-Reply-To: <CAFd5g47tk8x5iet=xfPVO6MphD3SsLtYQLrCi5O2h0bvdXwHtA@mail.gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 12 Aug 2019 13:41:24 -0700
Message-ID: <CAFd5g44bovSiiqGCip1Q4zBOUauXMcryxnPs8miOa0-QrPW61Q@mail.gmail.com>
Subject: Re: [PATCH v9 04/18] kunit: test: add kunit_stream a std::stream like logger
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Petr Mladek <pmladek@suse.com>, Jeff Dike <jdike@addtoit.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Daniel Vetter <daniel@ffwll.ch>,
        Amir Goldstein <amir73il@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Kees Cook <keescook@google.com>,
        David Rientjes <rientjes@google.com>,
        kunit-dev@googlegroups.com,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Joel Stanley <joel@jms.id.au>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Rob Herring <robh@kernel.org>, shuah <shuah@kernel.org>,
        wfg@linux.intel.com, Greg KH <gregkh@linuxfoundation.org>,
        Julia Lawall <julia.lawall@lip6.fr>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-um@lists.infradead.org,
        Sasha Levin <Alexander.Levin@microsoft.com>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Richard Weinberger <richard@nod.at>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Knut Omang <knut.omang@oracle.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Timothy Bird <Tim.Bird@sony.com>,
        John Ogness <john.ogness@linutronix.de>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 1, 2019 at 2:43 PM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> On Thu, Aug 1, 2019 at 2:14 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Brendan Higgins (2019-08-01 11:59:57)
> > > On Thu, Aug 1, 2019 at 11:55 AM Brendan Higgins
> > > <brendanhiggins@google.com> wrote:
> > > >
> > > > On Fri, Jul 26, 2019 at 1:31 AM Petr Mladek <pmladek@suse.com> wrote:
> > > >
> > > > > To be honest I do not fully understand KUnit design. I am not
> > > > > completely sure how the tested code is isolated from the running
> > > > > system. Namely, I do not know if the tested code shares
> > > > > the same locks with the system running the test.
> > > >
> > > > No worries, I don't expect printk to be the hang up in those cases. It
> > > > sounds like KUnit has a long way to evolve before printk is going to
> > > > be a limitation.
> > >
> > > So Stephen, what do you think?
> > >
> > > Do you want me to go forward with the new kunit_assert API wrapping
> > > the string_stream as I have it now? Would you prefer to punt this to a
> > > later patch? Or would you prefer something else?
> > >
> >
> > I like the struct based approach. If anything, it can be adjusted to
> > make the code throw some records into a spinlock later on and delay the
> > formatting of the assertion if need be.
>
> That's a fair point.
>
> > Can you resend with that
> > approach? I don't think I'll have any more comments after that.

I sent a new revision, v12, that incorporates the kunit_assert stuff.

Let me know what you think!
