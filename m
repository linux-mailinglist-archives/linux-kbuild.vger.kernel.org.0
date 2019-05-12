Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55BC21AA0C
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 May 2019 05:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbfELDF3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 11 May 2019 23:05:29 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:45488 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfELDF3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 May 2019 23:05:29 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x4C35OJf015949;
        Sun, 12 May 2019 12:05:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x4C35OJf015949
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557630325;
        bh=PHCpTfH/NZWO5h1TGpj40t3Xwi0gsH7zm2ttJ8bgtjk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wlWg+EV6p2+hWfqagl6qKA6zeryeHT4AiHUyHpHG9bIJxM7i85RKK7kXdqcQhGRxf
         2BtclUHEyO5BMWmU88/ndzk4RCVUEboitZJneF7Z4bpQJjHNn0EnrOm+T9Ktz1relF
         mGyx3oQBRNdzhHGfrhkGwXDtNPzYiIdnX/K11bvowIcTIpOnkvBZZMmIuZjzo4XtC6
         w4R//jH/UtPPbJgBwEqLQbsaG9lrV5YAWUcNqB6AyUC1sA2LQNr8Gtx+gjZxGicUvQ
         GCVMes5FiCMmWUcBchcWApupfLIsgYo1mnm9MQH+1/FJTaS/wkOzg8OKQ/y7CmXhDy
         1AY/FPPdyAdTA==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id g187so5954926vsc.8;
        Sat, 11 May 2019 20:05:25 -0700 (PDT)
X-Gm-Message-State: APjAAAUGQIMUOu6eONWSO++AQXD+0WvATkIdq1GIOQr8IK0AzdJTp6NX
        +B4hb+r4ZexDJKZP+WUU3gW3kWEIMqSrRgGJReo=
X-Google-Smtp-Source: APXvYqyA7rGAUt6eu5OhrYBOkShM4Orx8bhmw0YZYMWyaFVc/82zhCGwtz59kicrBkLA2W9vTY4b8JPs7swdFESjGYU=
X-Received: by 2002:a67:f443:: with SMTP id r3mr10260907vsn.179.1557630324014;
 Sat, 11 May 2019 20:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190509201925.189615-1-ndesaulniers@google.com> <20190511022458.GA7376@archlinux-i9>
In-Reply-To: <20190511022458.GA7376@archlinux-i9>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sun, 12 May 2019 12:04:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNARB_ds9-dF9n1jHD==JRWsnPYNGoKxLqb+FwKvTTC0bLQ@mail.gmail.com>
Message-ID: <CAK7LNARB_ds9-dF9n1jHD==JRWsnPYNGoKxLqb+FwKvTTC0bLQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add script check for cross compilation utilities
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, May 11, 2019 at 11:25 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Few comments below but nothing major, this seems to work fine as is.
>
> On Thu, May 09, 2019 at 01:19:21PM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> > When cross compiling via setting CROSS_COMPILE, if the prefixed tools
> > are not found, then the host utilities are often instead invoked, and
> > produce often difficult to understand errors.  This is most commonly the
> > case for developers new to cross compiling the kernel that have yet to
> > install the proper cross compilation toolchain. Rather than charge
> > headlong into a build that will fail obscurely, check that the tools
> > exist before starting to compile, and fail with a friendly error
> > message.
>
> This part of the commit message makes it sound like this is a generic
> problem when it is actually specific to clang. make will fail on its
> own when building with gcc if CROSS_COMPILE is not properly set (since
> gcc won't be found).
>
> On a side note, seems kind of odd that clang falls back to the host
> tools when a non-host --target argument is used... (how in the world is
> that expected to work?)


I agree.
Failure is much better than falling back to host tools.


-- 
Best Regards
Masahiro Yamada
