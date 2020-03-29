Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61D59196CF3
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2020 13:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbgC2LcH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 29 Mar 2020 07:32:07 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:63710 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727875AbgC2LcH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Mar 2020 07:32:07 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 02TBW3pD010445;
        Sun, 29 Mar 2020 20:32:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 02TBW3pD010445
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585481524;
        bh=7dJHfr2LzJ7oqZtL5ADchvZm+cCmIsPEjQ2cJQ3Gn+s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=aJ2dtpoFcRwdlHCcHrCkUadX5HAP3XjMFVEdIZK4/8y1C/T+TCmvZWD/Hb52E+oWz
         kgOj2BnOiK9k3GrJPpgmz+GriPLCva5ALvSXFfiAZWefzD7ijw98XvdUOlq0Drt2s6
         HlK4NzgmINSGYoaZ/S/nO78ohYXHeh0qf6ezvFt0uM2vGaGGJJP7lVKnxmIYdMPEh+
         wYGYYZiOoT0n2LsRX1sTyhnZIzBQzgECrzXh6gAXsQ0njOFA8D8fUkrFCZoCsEtP8d
         AT10cjGG5UHr1zJOZzDhZ1rcWAXO7Ggf/gO48UTuN4e1Nki1iJZ02/IPRBtOPwC6ie
         c+F5Efgab/cRw==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id z125so9119694vsb.13;
        Sun, 29 Mar 2020 04:32:04 -0700 (PDT)
X-Gm-Message-State: AGi0PubDGcTHO8p1QwSbRmXHQP6SCESCd99VBSUcOsJ/foRrOhOggrV0
        2ZIJs3PC9U2RydIS++CMSfjQw5z6nNIOEOSk1jY=
X-Google-Smtp-Source: APiQypL503oKQ4coHqRYgxfFJnNdWa7wgDfkabbS4Do8+Pa6D0D/Lqv+3J4gB6BELjorl8yu4UVwBomdq2awy+JhUv0=
X-Received: by 2002:a67:3201:: with SMTP id y1mr5074418vsy.54.1585481522839;
 Sun, 29 Mar 2020 04:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200326194155.29107-1-natechancellor@gmail.com>
In-Reply-To: <20200326194155.29107-1-natechancellor@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 29 Mar 2020 20:31:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ8uHtuhd7DiGGOLbkEX524rPjfUuWAHjU-_92Ow3_1Pg@mail.gmail.com>
Message-ID: <CAK7LNAQ8uHtuhd7DiGGOLbkEX524rPjfUuWAHjU-_92Ow3_1Pg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Enable -Wtautological-compare
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 27, 2020 at 4:42 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Currently, we disable -Wtautological-compare, which in turn disables a
> bunch of more specific tautological comparison warnings that are useful
> for the kernel such as -Wtautological-bitwise-compare. See clang's
> documentation below for the other warnings that are suppressed by
> -Wtautological-compare. Now that all of the major/noisy warnings have
> been fixed, enable -Wtautological-compare so that more issues can be
> caught at build time by various continuous integration setups.
>
> -Wtautological-constant-out-of-range-compare is kept disabled under a
> normal build but visible at W=1 because there are places in the kernel
> where a constant or variable size can change based on the kernel
> configuration. These are not fixed in a clean/concise way and the ones
> I have audited so far appear to be harmless. It is not a subgroup but
> rather just one warning so we do not lose out on much coverage by
> default.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/488
> Link: http://releases.llvm.org/10.0.0/tools/clang/docs/DiagnosticsReference.html#wtautological-compare
> Link: https://bugs.llvm.org/show_bug.cgi?id=42666
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>
> v1 -> v2: https://lore.kernel.org/lkml/20200219045423.54190-7-natechancellor@gmail.com/
>
> * Expand commit message a bit by adding more reasoning behind change.
> * Disable -Wtautological-constant-out-of-range-compare under a normal
>   build but allow it to show up at W=1 for easy auditing.
>
> I hope this can be accepted for 5.7. There are two warnings that I see
> still across a bunch of allyesconfig/allmodconfig builds that have
> patches sent but not accepted. I will ping them today.
>
> * https://lore.kernel.org/lkml/20191023002014.22571-1-natechancellor@gmail.com/
> * https://lore.kernel.org/lkml/20200220051011.26113-1-natechancellor@gmail.com/


OK, I will queue this up and send it to Linus
in the second week of MW.

I hope all warnings will be fixed by that time.



-- 
Best Regards
Masahiro Yamada
