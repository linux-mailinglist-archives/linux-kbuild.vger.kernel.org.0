Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF22B8D03F
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2019 12:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfHNKEB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Aug 2019 06:04:01 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42446 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbfHNKEB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Aug 2019 06:04:01 -0400
Received: by mail-pg1-f196.google.com with SMTP id p3so2533257pgb.9
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Aug 2019 03:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A8hpxCTzvYAcZn9UvY3kAbimH8cB/wVPQT2NUqi4FTg=;
        b=mX9zQWTJ21YVDsg/IO/lw3vK/5gRG1WKeYfq5hAVfRdrbxBQb/LOP7585An8TcS5uX
         tQfD//4o9HuUJa0OuyeBf0yYOxvzPAaOMjQC0e2XsG/XzCmrU1JU4X/cHR16Fl4JFHLe
         Zi0Tt+GUrI9Wq+kCxNmISk1ZO0HC18yrn6Nwe48kfT9CiA+xyYq2zY+VKjPraHI0VO+y
         z/s0hx02KzWhdnSkkt85Mam6mmVNYQ/kS61kWPXi/v/57imnYMdAPEqFsVlbDExrl+Ld
         2hdI8g4c1e8Cjj/bm8uvF1dfC8bBYtWFJT7eA1eUTgYFQ5SiQc/BI8jH+SCjQE2t4VrR
         5trQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A8hpxCTzvYAcZn9UvY3kAbimH8cB/wVPQT2NUqi4FTg=;
        b=e3wnP6UvJn1KqCfXaN3uweSzBElyWjQFxzEA6yVY/fZEU4plYeeEEO3LdiyjsNG4Pr
         +JNMnyxoM0Kzp4ZMV2pOQWy3S2+aBDS3zco8/RqfZKxpvoPOZ043YT97p8YQtJQFO2KQ
         mKC2DQNhKZuQ0Yby6gNFL6BbOTUnfNpe0NlaS5s/65UJnylileT/FzBu/cvrBA50/SHu
         0Zo9Qz8A30L0RIjIW12XjlCN8/OCWm+NB7a9x0daMxLaM0LPJE+BXACCSJvsgiAbg8Fe
         wnVsXPBTo06lmfXssrzBiYKzhxIAlXWIkd62MpZHtZXAqoFnpgZZcEZICqb+AfP4EINI
         s6eA==
X-Gm-Message-State: APjAAAWpjQCBGxdQekNJ+Tjnr56HwNulO4YD+V4YqzCP9ygY7e/k+lku
        sI3GYv1WJj3mU7G7tudZj0Ay5T+5Fq/D38B8ytEocA==
X-Google-Smtp-Source: APXvYqxyXqiNwjdTK3oFKny5yM7CmoKjVDpDDnZBrvH4fSE28h1/JfZ1mGpG1xfSCFWK+kgS1gJNI6SNjgBRmNUJeQM=
X-Received: by 2002:a63:205f:: with SMTP id r31mr36074127pgm.159.1565777039574;
 Wed, 14 Aug 2019 03:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190814055108.214253-1-brendanhiggins@google.com>
In-Reply-To: <20190814055108.214253-1-brendanhiggins@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 14 Aug 2019 03:03:47 -0700
Message-ID: <CAFd5g45NdQEcP0JQpZc3HYYgNZfsBsHL+ByXRK+OupWObwMuqg@mail.gmail.com>
Subject: Re: [PATCH v13 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To:     Frank Rowand <frowand.list@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Kees Cook <keescook@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        shuah <shuah@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
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

On Tue, Aug 13, 2019 at 10:52 PM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> ## TL;DR
>
> This revision addresses comments from Stephen and Bjorn Helgaas. Most
> changes are pretty minor stuff that doesn't affect the API in anyway.
> One significant change, however, is that I added support for freeing
> kunit_resource managed resources before the test case is finished via
> kunit_resource_destroy(). Additionally, Bjorn pointed out that I broke
> KUnit on certain configurations (like the default one for x86, whoops).
>
> Based on Stephen's feedback on the previous change, I think we are
> pretty close. I am not expecting any significant changes from here on
> out.

Stephen, it looks like you have just replied with "Reviewed-bys" on
all the remaining emails that you looked at. Is there anything else
that we are missing? Or is this ready for Shuah to apply?

[...]

Cheers!
