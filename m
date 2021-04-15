Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283CA360681
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 12:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbhDOKFl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 06:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231919AbhDOKFi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 06:05:38 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2048C061574;
        Thu, 15 Apr 2021 03:05:14 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id v72so4783095ybe.11;
        Thu, 15 Apr 2021 03:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6oeIFs7Ag00+enOPg/8U9CSlTyarnRdS/t7jZtMEknc=;
        b=cQe+lD2xs9LqPIp0h34xkwPNKG5VP0FV8kgPnyqPsbxBPvbT7u9hNVwYeyFeACyCuJ
         hq/WcLJuBM8uCBhVWaIurCV2BC/cklpaMWHUMY+Ox+RMS2tTJOvfx4J6eFAE0LzHdKxv
         46RJ0UJwwoYz//bYLnxEPv7cK/hBU7Be91qKB/iDiFECylr2flES0UFsqu4mLP3rUJvJ
         kAVl8L1PL5MHXbLJZ1XbDPe77RJMwnR26T02s0eRDIL7HjW35iUG9VMRFOBo5Kv6jaLM
         A8Nfot/8TmXuR9ph8IyrJgrEGH0fiqgduXMjvYZ7/f7TuzGCFJb1/lwpsQSZau6+P+3n
         AoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6oeIFs7Ag00+enOPg/8U9CSlTyarnRdS/t7jZtMEknc=;
        b=rupAi2SqoLX7JCNNJqiM2LaUJ1zlopX/0388LAsoYJUd5JZemtufBbAUpaEzErSxpw
         bbdODBS8c8cEWZogbDJot/S4+rOzvUGwvDsCZvKDdmRNYX19VxKpEY3bKpbFR0f4/1wH
         U386uBSs6I6GHSsz6f0Dly0hniE+3TR/ySHWwjOzoqTOhk2qoCCClxN5ZakrZQ8OV1gf
         qW/TB1s1nWb6TaCfRxhjRf1JTVmPqZYTCof9QKZBDIpqIZIqO+QrSUNOvsTgAE4BR3cP
         nedpJ4fhmmyDC6mXTiGan+HLxk46QDB/+hKGE+ieG35izrvw7kbBY6V7+8siVxDL8jXT
         PgQg==
X-Gm-Message-State: AOAM532Rv20tgS+MXHGSsuPlZwJzhf+ksjnv1gGPIT9oH//x7qgEdCvm
        bIqylUQqkZpqvw0bOGZoXdpxIZftpFUfIhrJs06GDo1EmWBHzg==
X-Google-Smtp-Source: ABdhPJxboetpX1Mmk/0DFs1Mo4sZybpbdkNJuiEPy+sitIoWrv9qaflK3e4jCMm+PMOGa/JD2jUmJVR1Cdr5b8WV1Zw=
X-Received: by 2002:a25:c444:: with SMTP id u65mr3406193ybf.93.1618481114331;
 Thu, 15 Apr 2021 03:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <CAKwvOdm8s7Yp8e=8tpscY805-bjQWyoNVzhFZnH4KL-q9ZP4Hw@mail.gmail.com>
In-Reply-To: <CAKwvOdm8s7Yp8e=8tpscY805-bjQWyoNVzhFZnH4KL-q9ZP4Hw@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 15 Apr 2021 12:05:03 +0200
Message-ID: <CANiq72n-trsFMzzUTPw9qP+98auYk9uOO0NNMrJzq-=SkEo5BA@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 15, 2021 at 2:23 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Looks like Wedson's writeup is now live. Nice job Wedson!
> https://security.googleblog.com/2021/04/rust-in-linux-kernel.html

+1 It is very nicely written and explains the semaphore samples
(included in the RFC) he wrote, with nice tables comparing how
different parts look like between C and Rust!

Anyone interested in this RFC, C or Rust, please take a look!

Cheers,
Miguel
