Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF418A4A5
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2019 19:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfHLRdj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Aug 2019 13:33:39 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43448 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfHLRdj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 13:33:39 -0400
Received: by mail-pg1-f193.google.com with SMTP id r26so13887184pgl.10
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Aug 2019 10:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RWh4tuyPAGsFihNxn0HM6rLNPT2QFeOahruI7q1karY=;
        b=px83n/ll4gi7A4LohcucE4f9BETb29n4N1Oa6Ae4fsaLJmpM3GWAo6sVFCg8Nfpw8V
         HTtfZf8MHozb4mQp9Vi5NQYDtrDof8q6jMXrWaHv3gKzzzvfMRP/1iHifrVhDElDB12M
         RB0T89WMKPfprB3oqt6KdyIp3q7HXz2J3X5R618WYB3QH6y+FtCCjhmx/oFQKZULH7AO
         PkIXD3xr2H+BHH+XqQ/yUPjeplbrU+Xc5cY5CC9Hx3clTv8oYpp7cTW4lMZaWm8fNRME
         uVbvgg57VcubLRr2APmpmWGI6O/4kDv9GXgPByAdibE3QHnPI9J09i2CuRBOFqCpXgR4
         KjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RWh4tuyPAGsFihNxn0HM6rLNPT2QFeOahruI7q1karY=;
        b=e5CwpJPGERdWUIBBHeIbpE/p7BxGQHav66NAB2df69LHHI1oKOm+4VfxzwijhhllwG
         LBFv5sJmNmzeHjE5RQmrPKRvtOKH8dAQSr7+EliImYRS+Ff9Civ0KbIqLD7A0wms6MAI
         KkboSd4+r293WowM4mFiBIXmizAch+E5jNTKhqJUIgU22XN4aOJ0KTA+BLSKoKTDM8UI
         z8KauKmsxW1JP9u/0BujT4mQHvspt31sLVPQVPL8bZVok2WQHltDpmcNCUeybenV6Iw3
         /x5/vEGR+57cL+sR2hSTcyHvDl7OPW+TsH2errr1Kt/YOv58PVCAUQOU50xGXHFZgcg7
         WrUg==
X-Gm-Message-State: APjAAAUPFhItmpSbWYR/rC7XiarQ870N3LdEFFt4g1sbEusXvLjwnnIT
        a7z8OuDoU+Id/ZiNAr2SR1prgHPwRON8IYoOSxj3Hw==
X-Google-Smtp-Source: APXvYqwQD1y90Hkai/z6J7JkHvQ9pWNYcGW8xdDndAWCUcrKKaamGDkGrZbIxzxM0p5C8vHGIzNLLX4QwvGTqeiGyEI=
X-Received: by 2002:aa7:8085:: with SMTP id v5mr19508497pff.165.1565631218202;
 Mon, 12 Aug 2019 10:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565297255.git.guillaume.tucker@collabora.com>
 <3885ccdcbdbe83eb367e8344584df944adc76e34.1565297255.git.guillaume.tucker@collabora.com>
 <CAKwvOdmOdJspcO8jqUhqR63-MOWkV3ZrVcCO6u=HG6peov8Htw@mail.gmail.com>
 <20190809051552.GA44466@archlinux-threadripper> <CAK7LNAT6Yp3oemUxSst+htnmM-St8WmSv+UZ2x2XF23cw-kU-Q@mail.gmail.com>
 <20190812171444.GL4592@sirena.co.uk>
In-Reply-To: <20190812171444.GL4592@sirena.co.uk>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 12 Aug 2019 10:33:27 -0700
Message-ID: <CAKwvOdmEe7gE7LUFRtqrUiHr3_Q2Ky4a-obUQWagbgdWZ33_ag@mail.gmail.com>
Subject: Re: [PATCH RFC 1/1] kbuild: enable overriding the compiler using the environment
To:     Mark Brown <broonie@kernel.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Guillaume Tucker <guillaume.tucker@collabora.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Guenter Roeck <linux@roeck-us.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 12, 2019 at 10:14 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Aug 13, 2019 at 01:37:14AM +0900, Masahiro Yamada wrote:
> > Only the problem I see is the situation where
> > a user directly runs scripts/kconfig/merge_config.sh
> > without using make as a start-point.

Further, if it's possible to detect if merge_config.sh was invoked
from Make or not, it might be useful to warn or error when not invoked
via Make.

>
> This is really a very common thing for testing infrastructure to do,
> it'll combine a base defconfig with a fragment enabling extra stuff
> either to directly cover that extra stuff or to ensure that
> configuration options needed for testsuites get turned on.
>
> > A user can wrap merge_config.sh with a simple Makefile
> > if they want to override CC, HOSTCC, etc.
>
> If we want to do that it seems sensible to provide that Makefile
> upstream so there's a standard thing, it might also help people notice
> that they need to do this and avoid getting surprised.



-- 
Thanks,
~Nick Desaulniers
