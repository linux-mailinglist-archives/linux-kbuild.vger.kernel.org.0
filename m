Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B772E19B98
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2019 12:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727561AbfEJK1p (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 May 2019 06:27:45 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39513 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727544AbfEJK1p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 06:27:45 -0400
Received: by mail-oi1-f195.google.com with SMTP id v2so729757oie.6
        for <linux-kbuild@vger.kernel.org>; Fri, 10 May 2019 03:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0uHZ1jppAcFBhTR/1pJQr4fDRVmFHkByLDGRo+AFRuU=;
        b=dsrwv0H2Rfrc01YiHmjTjaNBThgH0Ls0D+S54kv0UogNbIoQQubjPK8qT7L0mF33CS
         aYviEu/LNE9drmcPOAdswXb57a7sipQirjIlQ7Ynd6iOEeUmTl+PCZ+GBOOHxMXwo9/H
         j4gtOzrnEtCf/6EINxveE8MFRW5uJt9rldnOcDpx4xbhTJdLV7YP/WUGh+m3XZLAcGc9
         VEH6sMdw5imAeTPV6OEInKN7s7agTjKI9bFZXH+y+qga4ATyjX3DaKij5ONVkcQdV95p
         PteDCGEucmeJdXRwmJxetOEP+cggWxt3r6pDiaF7DdvsmqnhTbIkbLBpggd06dK5/E3N
         9y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0uHZ1jppAcFBhTR/1pJQr4fDRVmFHkByLDGRo+AFRuU=;
        b=OMY7KQ2DtI8zZ+OQbm7jCzRVwvfe/wdPK9KlLDfWzZw+6gVoeKZHUhgxOa6tL8btk+
         8zseEq92mpNcQ88DLzcpfNDBfVRbhX/D1CAQWucQkfDBLb/X36j87J3OK1yKxxygLrlU
         08sD1F/2Ceety5pwjk6dw/RDxT2R8SJ0bceeHAEQdi2/5RL8PoZtNDQFt5ZyEGjsl66u
         EetOh2f+4UTjAJiVtoh7sRwIBmpiB7jJFeMKGPqWD7+wbq8gP2THAX/eI4McnXuA6TA2
         ASxWPGUU0YEHR5VFvbiUoAhRGg9C7JSWt4CcSLWswlno/OlhU54/bKz4e31g9CF1iHd3
         OmRw==
X-Gm-Message-State: APjAAAWjM3gnmwNplJ/hFLS77V5c4lfaMtRMM01m99yhhpRuvSHLgcn1
        PBr5AdiJHmq+xgI63ckb561xZF3riVg/wOMr1kbvNA==
X-Google-Smtp-Source: APXvYqzItdyzdcRLdkdQjbdb1r5m6MPSdjbNOyMVXP3tR2XNB/TjHeBcC5zqpfKlvhj2ObI953CDQuJHYFWf+OOgkMY=
X-Received: by 2002:aca:43d5:: with SMTP id q204mr4737682oia.100.1557484064075;
 Fri, 10 May 2019 03:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-7-brendanhiggins@google.com> <CAK7LNAQ+SRMn8UFjW1dZv_TrL0qjD2v2S=rXgtUpiA-urr1DDA@mail.gmail.com>
In-Reply-To: <CAK7LNAQ+SRMn8UFjW1dZv_TrL0qjD2v2S=rXgtUpiA-urr1DDA@mail.gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Fri, 10 May 2019 03:27:33 -0700
Message-ID: <CAFd5g47BNZ0gRz4SXb37XjyXF_LyNZrSmoqDbzaaCUrTg3O7Yg@mail.gmail.com>
Subject: Re: [PATCH v2 06/17] kbuild: enable building KUnit
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        "Cc: Shuah Khan" <shuah@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kunit-dev@googlegroups.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        linux-um@lists.infradead.org,
        Sasha Levin <Alexander.Levin@microsoft.com>,
        Tim Bird <Tim.Bird@sony.com>,
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
        Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Thu, May 2, 2019 at 8:03 AM Brendan Higgins
> <brendanhiggins@google.com> wrote:
> >
> > Add KUnit to root Kconfig and Makefile allowing it to actually be built.
> >
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>
> You need to make sure
> to not break git-bisect'abililty.
>
>
> With this commit, I see build error.
>
>   CC      kunit/test.o
> kunit/test.c:11:10: fatal error: os.h: No such file or directory
>  #include <os.h>
>           ^~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.build;279: kunit/test.o] Error 1
> make: *** [Makefile;1763: kunit/] Error 2

Nice catch! That header shouldn't even be in there.

Sorry about that. I will have it fixed in the next revision.
