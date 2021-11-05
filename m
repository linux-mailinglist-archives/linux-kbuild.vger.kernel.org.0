Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5DF14460D9
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Nov 2021 09:47:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbhKEIuB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Nov 2021 04:50:01 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:30008 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbhKEIuB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Nov 2021 04:50:01 -0400
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 1A58koj8013729;
        Fri, 5 Nov 2021 17:46:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 1A58koj8013729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1636102010;
        bh=hEhJl2HdynqX/cF0owA6s9AgGPrScZoY2qglPu0+FfE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ak8PZCssR7Bow/bWI9HqjRhuTFrqtAjgowh/6OzS4z572N9CbgdblEi/vi7bYk7k+
         Yeclupgq0S1Et8ceLVDGxlNp0PhD7H4tLaDiVBWs2nNPl2FZOhojvFcAB/8ILJ5g18
         yA+Ri3qRpjqblI3QcMSt5XwCTgbuFz2ynwS3k4MDt5I8ZaoixRdVl+ANkO4MmLos2f
         HYJQJw/3PG42yjIpzLL+jfKy1Ro/ENTBBWR8nTKnoILqA39F6NgAMehZwYSjVUwJsW
         gzDhnet41AJtzzDlEo4JekafOUOKkrFTKzR0tV5ldc0ZMgQP2lqFm0udsQjKgXn7d3
         P63MI3uuPC8aQ==
X-Nifty-SrcIP: [209.85.214.180]
Received: by mail-pl1-f180.google.com with SMTP id t21so10672472plr.6;
        Fri, 05 Nov 2021 01:46:50 -0700 (PDT)
X-Gm-Message-State: AOAM5328U2f2SmNDmtpEQpukVfw9M0BXvN1m9Xo3QHjC/hajjG46aWXc
        2YRye0EOYqTU46xBvYgawtsgXyJNWHeTGa+1Rqo=
X-Google-Smtp-Source: ABdhPJygdgn5UgdZjMaG+cOCSDm3kljTr1w8GPZi1lXnvecM9e+48pkqKi3e0chVMcGUZx2vmzk2NLRgodiaolvYSaE=
X-Received: by 2002:a17:902:6b83:b0:141:6368:3562 with SMTP id
 p3-20020a1709026b8300b0014163683562mr49190366plk.42.1636102009703; Fri, 05
 Nov 2021 01:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211001053253.1223316-1-masahiroy@kernel.org>
 <20211001053253.1223316-3-masahiroy@kernel.org> <boris.20211028071331@codesynthesis.com>
In-Reply-To: <boris.20211028071331@codesynthesis.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 5 Nov 2021 17:46:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNASx05b8pWJDaBbRE8rMZ_ceL1qFCMZQ9Dy21pJsuTM_+w@mail.gmail.com>
Message-ID: <CAK7LNASx05b8pWJDaBbRE8rMZ_ceL1qFCMZQ9Dy21pJsuTM_+w@mail.gmail.com>
Subject: Re: [PATCH 03/10] kconfig: refactor conf_write_symbol()
To:     Boris Kolpackov <boris@codesynthesis.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 28, 2021 at 2:16 PM Boris Kolpackov <boris@codesynthesis.com> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
>
> > +static void __print_symbol(FILE *fp, struct symbol *sym, enum output_n output_n,
>
> Identifier that start with double underscore are reserved. The same
> goes for __conf_write_autoconf() in another patch.


Without this patch, there are some functions that start with double underscores.

For example,

  __expr_eliminate_eq() in scripts/kconfig/expr.c
  __expand_string()  in scripts/kconfig/preprocess.c

Are they problematic as well?


-- 
Best Regards
Masahiro Yamada
