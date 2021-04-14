Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCFA35FD89
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 00:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbhDNWDd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 18:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhDNWDd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 18:03:33 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5940C061574;
        Wed, 14 Apr 2021 15:03:11 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id k73so17561153ybf.3;
        Wed, 14 Apr 2021 15:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=699aoqN+q3vUmPr14JVf0N+eskZMzmP3aTTiMUHdeMo=;
        b=W2i8ZYJhNKXcdRdHbiW6Eak8FtrEcYdbza6zMu1qCpWaq1JEG9nfy51cBd3y8HVh28
         /k+uzV9VcheemKbfojLtPMJ3VK6jhNP8Sm3BlfJwxBgJ631j/ymJbvDbOkI33N2gqu1M
         UdVlxULC+dco67Kp20xkpQfw9ZHQCTGN/Is6HdKd6Z1NS51o7fIhowJfKNNjamFHRWS1
         l2p7k2hEOTBCehDqxT51XWFjx17tKMFg80cIwrQJbvVwrKRT1wFSxt9Q9Rknama3yj1+
         icR69dFM4GyHwSRxenjqVrY8ccwrMzWxYkzvrUQBb0BzSzIAI/xLT8t9I3pchWzXYJc8
         D0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=699aoqN+q3vUmPr14JVf0N+eskZMzmP3aTTiMUHdeMo=;
        b=rp9hdhOWCmAeWXlNC1TQZ8NtaSVtFe14ApJB0U3Gz1Lxm8RwCXlHiAxKr5sEGtL1Go
         pgP41M8FurbAraJZ+q8S0ehzOx5ksQNIJFJ8h9HHYWeakejo5nmbwh+pkBybe7x4nS3A
         EutOIBO7/GsvoZqYaErJ7/8cLbBkZhoYPtSv/WUYd72Q4UXunWuWoGaBoUKqpthajzMs
         F8ql34XWSJ/2q0QqDmMW/3noAGFvGQx1pKRtLarMcK3gJSBA8QqEL9jNTgPbzJ6Ut/Vh
         aol4RDiWTHTKd3uzgrneub6HYc5AAy+yAyir+AkuZMzYgaUB69vvjmXBV7xIbUbV9f0f
         tZdw==
X-Gm-Message-State: AOAM533x2Kb9rt0Xv9MQZ2W0+Gejqlr2gbBmPHe6F1mh5VNOhbE4Pp60
        wVlRam9PcSa79G7f0DtENADpIzh+NOGMuc647hw=
X-Google-Smtp-Source: ABdhPJzkC6ifvDZntokSHTMkS4h0ZYfFTvNv62iY08abxTuAERUafNxftPrxInXVYtV3Aw42V4kXElv9kDZv1uvY4Ak=
X-Received: by 2002:a25:c444:: with SMTP id u65mr189860ybf.93.1618437790954;
 Wed, 14 Apr 2021 15:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-12-ojeda@kernel.org>
 <CAKwvOdniKs+cNKS9qHgq3xR6cmJ7xdiVpAzxaQEN372HY6xc7w@mail.gmail.com>
In-Reply-To: <CAKwvOdniKs+cNKS9qHgq3xR6cmJ7xdiVpAzxaQEN372HY6xc7w@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 15 Apr 2021 00:02:59 +0200
Message-ID: <CANiq72=MyP5YMO34A=k0PZ66_a0LfLPM2afWO2r9OjAiL8awUg@mail.gmail.com>
Subject: Re: [PATCH 11/13] MAINTAINERS: Rust
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 11:55 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Assuming this will at least be part of Wedson's core responsibilities,
> shouldn't this be "Supported."  Per Maintainers:

Yeah, we were waiting until a couple other announcements to change it
-- but it will most likely be "Supported" by Wedson and myself :)

Cheers,
Miguel
