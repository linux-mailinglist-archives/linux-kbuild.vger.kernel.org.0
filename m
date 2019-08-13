Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BEC48B17A
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 09:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfHMHxm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 03:53:42 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33756 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbfHMHxl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 03:53:41 -0400
Received: by mail-pg1-f194.google.com with SMTP id n190so10018924pgn.0
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2019 00:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1w6tEv+UsY5F/hdJoPjOc+8EZA8fHnLVH5Ee68+K+14=;
        b=nVz7SRzwhp+sIStWQOhdw7+eMounsWwWY4b9W+H2splMtvxXWG/v8uX0oyrPhi9Pc/
         DbYNbNpkCoegNiTUpPMiXg34BXPrPJrAjoIA7DyPnMkZHZfSastxpDXvu6zpEH76cIXz
         2ipKiw0wJIDxWMLZyrA5y40OVaB5InZkV31euGDTlfUD9NGVPd2AdaFiZI2HUpl+1Z71
         eZE6OVlRYXpa7v0Ieb0+s2HPAU8hcA299XGRboiSsBb0Wz4QiBbaFXHTBKHp4dwxoDYm
         Lyn/gNUB2QMFaYgVWF7lBw/U70QsznbaxSpwZOVQK35ds3v4ks7lmHH71KHdUCsOoz7q
         RS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1w6tEv+UsY5F/hdJoPjOc+8EZA8fHnLVH5Ee68+K+14=;
        b=uUt/6ekDenEt1syt5I+/AIfNyBeUN+KmZlzTVumLtVCxlClbATZ7oPexgeefBnXzuL
         mghOKK85hVKErPJFs5XjIox+ZixYGREp10GTVoB88wv14kcDbJRgtbacxAGNdLtQyfeO
         S8opjZRoU8wQTFgpCuDbEUA5bzknHAbjoB4EyVFK3TN+WK5OJNJAbu2zC5LLAcmFhU8k
         jzMC8KKVZ7/kcDeqeqK51h11Q5D/3T445v6JXNMU/gqc0HbQkGTvO+8mD302sh1iZ/3l
         lxtF+2629X8wr3Vtv5Tckkzd1Q625RBdmgXc+Tx+qe/CVbT3/o8hiVCyAOWWxd0fmbK1
         pGAg==
X-Gm-Message-State: APjAAAWRlIEd5Dk+xEegLmmTlw+cPz195OOPM2w3axRjBtyv0bFi4yTl
        oGbGpp9HGmwjZ8oSyrBm2kcENWFpFYxhi+o7/mX9nw==
X-Google-Smtp-Source: APXvYqwRt249N6Nnc3lDOtyH2RE286o2POCGTN4Y9Dd+KQhTUzxvnzvxmCpITQmOohY+Myh1tvYfqlbmJVebyc0CKlY=
X-Received: by 2002:a63:b919:: with SMTP id z25mr33087981pge.201.1565682820534;
 Tue, 13 Aug 2019 00:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-11-brendanhiggins@google.com> <20190813042455.4A04320644@mail.kernel.org>
 <CAFd5g46LHq1sQaio2Vj5jt54YN-Y2HuCT8FbALQhJoekkYJ-uQ@mail.gmail.com> <20190813055707.8B2BB206C2@mail.kernel.org>
In-Reply-To: <20190813055707.8B2BB206C2@mail.kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 13 Aug 2019 00:53:28 -0700
Message-ID: <CAFd5g45rLTB965BX24DKFauumbdbn=m4kxtzgwr_4uj66Vmzmw@mail.gmail.com>
Subject: Re: [PATCH v12 10/18] kunit: test: add tests for kunit test abort
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Kees Cook <keescook@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Rob Herring <robh@kernel.org>, shuah <shuah@kernel.org>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        devicetree <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kunit-dev@googlegroups.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        linux-um@lists.infradead.org,
        Sasha Levin <Alexander.Levin@microsoft.com>,
        "Bird, Timothy" <Tim.Bird@sony.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Lawall <julia.lawall@lip6.fr>,
        Kevin Hilman <khilman@baylibre.com>,
        Knut Omang <knut.omang@oracle.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Petr Mladek <pmladek@suse.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Richard Weinberger <richard@nod.at>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 12, 2019 at 10:57 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Brendan Higgins (2019-08-12 22:06:04)
> > On Mon, Aug 12, 2019 at 9:24 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Brendan Higgins (2019-08-12 11:24:13)
> > > > +
> > > > +static int kunit_try_catch_test_init(struct kunit *test)
> > > > +{
> > > > +       struct kunit_try_catch_test_context *ctx;
> > > > +
> > > > +       ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> > >
> > > Can this fail? Should return -ENOMEM in that case?
> >
> > Yes, I should do that.
>
> Looks like it's asserted to not be an error. If it's pushed into the API
> then there's nothing to do here, and you can have my reviewed-by on this
> patch.
>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

Cool, thanks!
