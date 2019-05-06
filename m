Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9821476F
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 May 2019 11:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfEFJSO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 May 2019 05:18:14 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41613 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbfEFJSO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 May 2019 05:18:14 -0400
Received: by mail-ot1-f66.google.com with SMTP id g8so10816427otl.8
        for <linux-kbuild@vger.kernel.org>; Mon, 06 May 2019 02:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EuMXXHqqPef2GwgL+nQvKY3dmYnxYLGClh5z++gsDCE=;
        b=sqUiKiFkHuS/zMcsXJp/YVQ9Xvsj9z1z6Qymcl2DruVbxk25BEUbeggocvbWAnhm5w
         zafVtoeptdhmkmQVySQB3JwkXQHS6fLm2/wWTVMXU2RAbc2imQQv9+YkBVvD6ic2JuMI
         1ikTcpdlA9VrSJ94GFL5FOP0BgugrA521QHxv3MHfGRZERmqFxPksbw8JgkSiOXb5kCz
         NhICHik7i/u7iBVQPDnR6rVT2h+P/BC3GpK/7XThzUVtCWPANcl0bPo/9Evg9oejZRXN
         F/kwBaILmSEdHFapwIeGtAxrGfQ7g/4sN7rpo+FU+AipihP/fGSchFlx5sCt7F6gjQZJ
         akeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EuMXXHqqPef2GwgL+nQvKY3dmYnxYLGClh5z++gsDCE=;
        b=n2bOPgn2PVuu5bpIHAfNhEjBP5+Z8Jl1yTPoyWVS6NWZM02Efg9PheAvMANeDKxqXT
         p5m+JUav6mfEfkM9qsJC8aLXu10wgqX0kbPBJdLeEagMHRM57fHgB3CYWhGrTEwIttp9
         /b8c+Ca1/+wJmNreuL3SYrzIIdoH1Q/K+02DEIii4Ixl2OAUbwphhw6EU1XL0gL9EbBZ
         xPkAgaoWvhHhYoI3WAt9tfQs7a5xL2ipiyY4l6ls9Q1niqV2bCdRDuE5/+cQnZH7bgBL
         qZVi15gB3rKSlt3p701H7td1nIX6W5D6gLZQ29bbGX1Iq+VKNHfhro3am4A+uDHciTbu
         5QmA==
X-Gm-Message-State: APjAAAXcSg0dNjAwkPa+x4vwl8juDRcWKJs6wgkFeSApuXthbzkNNSWT
        jjOEbDXunO3xMje8KDSnml5kcaWzfVq6yiDT9CYkLQ==
X-Google-Smtp-Source: APXvYqwJ3xWdH/Lcmkx6YRG/BMIY9WxqPyKwUn5ZqoX3PeD8nyMheiZI5T1OFI6UXxsrrwGRwMbiUWxrFpDFumPm0yg=
X-Received: by 2002:a9d:71de:: with SMTP id z30mr15637896otj.113.1557134293178;
 Mon, 06 May 2019 02:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-16-brendanhiggins@google.com> <68f88e1c-d40f-9dad-7296-ab2b2303c575@kernel.org>
In-Reply-To: <68f88e1c-d40f-9dad-7296-ab2b2303c575@kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 6 May 2019 02:18:01 -0700
Message-ID: <CAFd5g456XwQV2+iy=0K7AwBc5wbQDRL2DAJgMEsJBLtFdZ5erQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/17] MAINTAINERS: add entry for KUnit the unit
 testing framework
To:     shuah <shuah@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        linux-um@lists.infradead.org,
        Sasha Levin <Alexander.Levin@microsoft.com>,
        "Bird, Timothy" <Tim.Bird@sony.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Lawall <julia.lawall@lip6.fr>,
        Kevin Hilman <khilman@baylibre.com>,
        Knut Omang <knut.omang@oracle.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Petr Mladek <pmladek@suse.com>,
        Richard Weinberger <richard@nod.at>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com,
        Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 3, 2019 at 7:38 AM shuah <shuah@kernel.org> wrote:
>
> On 5/1/19 5:01 PM, Brendan Higgins wrote:
> > Add myself as maintainer of KUnit, the Linux kernel's unit testing
> > framework.
> >
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
> >   MAINTAINERS | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5c38f21aee787..c78ae95c56b80 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8448,6 +8448,16 @@ S:     Maintained
> >   F:  tools/testing/selftests/
> >   F:  Documentation/dev-tools/kselftest*
> >
> > +KERNEL UNIT TESTING FRAMEWORK (KUnit)
> > +M:   Brendan Higgins <brendanhiggins@google.com>
> > +L:   kunit-dev@googlegroups.com
> > +W:   https://google.github.io/kunit-docs/third_party/kernel/docs/
> > +S:   Maintained
> > +F:   Documentation/kunit/
> > +F:   include/kunit/
> > +F:   kunit/
> > +F:   tools/testing/kunit/
> > +
>
> Please add kselftest mailing list to this entry, based on our
> conversation on taking these patches through kselftest tree.

Will do.

Thanks!
