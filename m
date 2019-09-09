Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0941ADB46
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Sep 2019 16:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727342AbfIIOfL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Sep 2019 10:35:11 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:56411 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbfIIOfK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 10:35:10 -0400
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x89EZ0ch004231;
        Mon, 9 Sep 2019 23:35:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x89EZ0ch004231
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568039701;
        bh=ie1ckEzIvaZxWKhGydYfTZWpoM5k0/RYzlH6fYm+h6U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WTvp7T8wY0zo/yjqYN7kHnxyzlxgb747ZmbG+bGhDiX2HQaSiOB7D72gKdAVY3j/X
         pfB/cENSvQ3X9Yx29ghy0nn85IyrYSzcCobcsUgNf1yZzptSS1ReznCryW+AY3ziwM
         ixyE/g9XJyK17ADGC7+/6XKyxmfle+OgIGoUlHmjxzUA9U0Gx8wv43/JOfsqNspZJ7
         h4H5HdQsaE6dSbgLptr4qyUlG2Ratkmeeme3/5DwY1HunJ3+7y7YxUGc7V3oPTC2nF
         niry7M8iqr35K+lwObDoyT9QmZyqZe8mGt5+l00TpyIFi0AnrGWiY6HB/7O/JTPLQW
         gQ391gUWr3v2Q==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id q9so8906948vsl.4;
        Mon, 09 Sep 2019 07:35:00 -0700 (PDT)
X-Gm-Message-State: APjAAAVXVeVDJz8bk3kDAc7pBYcGZAVJsGbd/XgFY0vPQ807ydjxmdh7
        x/olkNdTINEL6xk1ErclTNsGuSCcwQEdac0xBaA=
X-Google-Smtp-Source: APXvYqzKgVzgEi677hZsf8E68uLXz+WWSxO1rGtFg+nO06hwGz+6/frtkJsSBBy4oPzb4WQlVf3pJv7GwITJWHKaB+4=
X-Received: by 2002:a67:f418:: with SMTP id p24mr12470409vsn.215.1568039699729;
 Mon, 09 Sep 2019 07:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190909105317.20473-1-yamada.masahiro@socionext.com> <nycvar.YSQ.7.76.1909090942420.3091@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.76.1909090942420.3091@knanqh.ubzr>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 9 Sep 2019 23:34:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNATC1pZ_2BQ-Uh2+qfUjJtL0mRpsm78N-sUQXhF0tDf6Hw@mail.gmail.com>
Message-ID: <CAK7LNATC1pZ_2BQ-Uh2+qfUjJtL0mRpsm78N-sUQXhF0tDf6Hw@mail.gmail.com>
Subject: Re: [PATCH 1/2] export.h: remove defined(__KERNEL__)
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Denis Efremov <efremov@linux.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Nicolas,

On Mon, Sep 9, 2019 at 10:48 PM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Mon, 9 Sep 2019, Masahiro Yamada wrote:
>
> > This line was touched by commit f235541699bc ("export.h: allow for
> > per-symbol configurable EXPORT_SYMBOL()"), but the commit log did
> > not explain why.
> >
> > CONFIG_TRIM_UNUSED_KSYMS works for me without defined(__KERNEL__).
>
> I'm pretty sure it was needed back then so not to interfere with users
> of this file. My fault for not documenting it.

Hmm, I did not see a problem in my quick build test.

Do you remember which file was causing the problem?



-- 
Best Regards
Masahiro Yamada
