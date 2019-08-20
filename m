Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B30896B70
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2019 23:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730650AbfHTV0o (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Aug 2019 17:26:44 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45900 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbfHTV0o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Aug 2019 17:26:44 -0400
Received: by mail-pg1-f194.google.com with SMTP id o13so19126pgp.12
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Aug 2019 14:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kfF4vdGcFJm/Wf6JQ1wcuplxthXZW1HNbOa1JyPqpZg=;
        b=YezYmx2WChZMi1DRr1XoN8XfZITumH+PgqY3JQdS5w4u2vwKLbtcH66ah2vjoQnnog
         QyUxcFY+vLpiQeDhK9KTH5U7uOLNo0vnuD4a52N1MJjkiOZI294BDWFVvwrEEKdhPBaO
         XVT2+i53gVsOodGBAl0E+xI0gCcD/lVNo3bqvB93NFaE/xG/irV6qGiYAx5Sa0TgkhIz
         Derb91GymDQKbZ5lMgnZKtNSZMjrGXdFpCsjUGQOYWWslojKah3JT/incq30S9xuCblQ
         rssihHZxJUKUKjpEGuvFLm+OHFk0eFFOuKdMDTyPyJe4rypnj3lPr/tiL1vR+LS2dnzq
         EaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kfF4vdGcFJm/Wf6JQ1wcuplxthXZW1HNbOa1JyPqpZg=;
        b=VWvCfl9quwfh6GxgrH5BrxPRdEt22TRm5Byy/kE16JyFQlxEhhoycdMcpGmvHaQE2q
         FF7Q+7pkh/n93LL7JZiSWgr/GIM7W9oSI+0LlcR8Glk8yo1gG5rXE98rHMCovoGTX0xD
         gkVEUVkhuPQo6h5U2YMlEPvZW9XCt7Qj7TQjVmjjaqD8Rcmtdgpjb8GhyvCLPxxo5CPc
         lZywgRxgrne3Yxo64EWClof75QLu80aWk9bKhfou9hmVJqWXuorr6/ln2RZxDauoB/wM
         jPQeOPiwkEZc2EPiLRckOC7IIUWOTdcWYHHGyAp0bdy/oQvbkgmMuKBnvc7EJXeb5WMx
         pcNw==
X-Gm-Message-State: APjAAAXDLB7m5wIE9t8fZvuqZNTkhnMqXU6Xl9t5iYeY4BztoldXm5kd
        fIuWXjJji65vy/uHrrzP9uClLVUmoykiklEghMhwSg==
X-Google-Smtp-Source: APXvYqzLsasEUUNlQqQQsMBDlcH+Tp5YqnFlWE8k2udTHXgEapZH91qiWX0NVeTeH8163H7ZgTGtPG9Wj/vODuCC5PA=
X-Received: by 2002:aa7:8f2e:: with SMTP id y14mr32322000pfr.113.1566336403144;
 Tue, 20 Aug 2019 14:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190814055108.214253-1-brendanhiggins@google.com>
 <5b880f49-0213-1a6e-9c9f-153e6ab91eeb@kernel.org> <20190820182450.GA38078@google.com>
 <e8eaf28e-75df-c966-809a-2e3631353cc9@kernel.org>
In-Reply-To: <e8eaf28e-75df-c966-809a-2e3631353cc9@kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 20 Aug 2019 14:26:32 -0700
Message-ID: <CAFd5g44JT_KQ+OxjVdG0qMWuaEB0Zq5x=r6tLsqJdncwZ_zbGA@mail.gmail.com>
Subject: Re: [PATCH v13 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To:     shuah <shuah@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Kees Cook <keescook@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
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
        Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com,
        Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 20, 2019 at 12:08 PM shuah <shuah@kernel.org> wrote:
>
> On 8/20/19 12:24 PM, Brendan Higgins wrote:
> > On Tue, Aug 20, 2019 at 11:24:45AM -0600, shuah wrote:
> >> On 8/13/19 11:50 PM, Brendan Higgins wrote:
> >>> ## TL;DR
> >>>
> >>> This revision addresses comments from Stephen and Bjorn Helgaas. Most
> >>> changes are pretty minor stuff that doesn't affect the API in anyway.
> >>> One significant change, however, is that I added support for freeing
> >>> kunit_resource managed resources before the test case is finished via
> >>> kunit_resource_destroy(). Additionally, Bjorn pointed out that I broke
> >>> KUnit on certain configurations (like the default one for x86, whoops).
> >>>
> >>> Based on Stephen's feedback on the previous change, I think we are
> >>> pretty close. I am not expecting any significant changes from here on
> >>> out.
> >>>
> >>
> >> Hi Brendan,
> >>
> >> I found checkpatch errors in one or two patches. Can you fix those and
> >> send v14.
> >
> > Hi Shuah,
> >
> > Are you refering to the following errors?
> >
> > ERROR: Macros with complex values should be enclosed in parentheses
> > #144: FILE: include/kunit/test.h:456:
> > +#define KUNIT_BINARY_CLASS \
> > +       kunit_binary_assert, KUNIT_INIT_BINARY_ASSERT_STRUCT
> >
> > ERROR: Macros with complex values should be enclosed in parentheses
> > #146: FILE: include/kunit/test.h:458:
> > +#define KUNIT_BINARY_PTR_CLASS \
> > +       kunit_binary_ptr_assert, KUNIT_INIT_BINARY_PTR_ASSERT_STRUCT
> >
> > These values should *not* be in parentheses. I am guessing checkpatch is
> > getting confused and thinks that these are complex expressions, when
> > they are not.
> >
> > I ignored the errors since I figured checkpatch was complaining
> > erroneously.
> >
> > I could refactor the code to remove these macros entirely, but I think
> > the code is cleaner with them.
> >
>
> Please do. I am not veru sure what value these macros add.

Alright, I will have something for you later today.
