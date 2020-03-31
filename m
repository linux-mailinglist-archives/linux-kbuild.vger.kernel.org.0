Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 318C61992B2
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2020 11:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730385AbgCaJuA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Mar 2020 05:50:00 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:30953 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730425AbgCaJt7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 05:49:59 -0400
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 02V9nteA014517;
        Tue, 31 Mar 2020 18:49:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 02V9nteA014517
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585648196;
        bh=PJEi61f0eXDArR9pXCoZ/Z/BGWbJnqqejf5xDCJSlfM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=stvV9/fegBpehk7fgbJMhsvCS1+6Io735ElZFseXsd7KumwfWryM3VKA7jAeDG/hO
         7s+d0TLz3rsWV+ebVFxOU/JKKQN6IDbfb4/qquibSoYuAJML6gDvx4q8UMgjhlym0/
         xo21BKcrjqqQckxisq5nwO6F7Kl3SBHis6G8jJq8ivwoZKY9dhFJkCSvXHFNGoDFmt
         sbMTXSHFCiDaBcRy5lby+IH/KrdTOM+r9Gq/UOGXzTUss4I6LbSL6dzJSNuTW2pctx
         +/ULlD2rXHjftkHCK9K1zn3PPRy5IcD5q6M4rgdXhU/EP7d3u4wQqPq9xBQqZa4WTC
         TZeqPqc46u4Qg==
X-Nifty-SrcIP: [209.85.222.42]
Received: by mail-ua1-f42.google.com with SMTP id a6so7444004uao.2;
        Tue, 31 Mar 2020 02:49:56 -0700 (PDT)
X-Gm-Message-State: AGi0PubSeL1UXPbjIXexQbBfJNhuiqld7w1fT02DExM4+F3NSk4yJHeF
        n0Ve2D5DTdgkBkUf7471fSZvQfC30Wr9RUGZgZM=
X-Google-Smtp-Source: APiQypIimurUkMjDdWAC3rg/jiqG8zx6Nv5xFZ+/8O3gxpsq8vLwlbUtzCWSeJ5/ovngutBvnVuaJ+W1QeCQEx5D+Tg=
X-Received: by 2002:ab0:28d8:: with SMTP id g24mr10825054uaq.121.1585648195026;
 Tue, 31 Mar 2020 02:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <a5ce79eb-be9d-df97-0b58-5aee5a48f4d3@oracle.com>
In-Reply-To: <a5ce79eb-be9d-df97-0b58-5aee5a48f4d3@oracle.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 31 Mar 2020 18:49:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ8LZMPxrjVkuLizHjVZyBtSmLFZ=EvDCCAPb-XGfJLHA@mail.gmail.com>
Message-ID: <CAK7LNAQ8LZMPxrjVkuLizHjVZyBtSmLFZ=EvDCCAPb-XGfJLHA@mail.gmail.com>
Subject: Re: single target builds are broken
To:     Vegard Nossum <vegard.nossum@oracle.com>
Cc:     Jens Axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 31, 2020 at 6:16 PM Vegard Nossum <vegard.nossum@oracle.com> wrote:
>
>
> Hi,
>
> I often run 'make foo/bar.o' as part of my workflow, even when bar.o is
> not specified in any kernel makefile, and this has worked just fine for
> years.
>
> This is broken after commit 394053f4a4b3e3eeeaa67b67fc886a9a75bd9e4d
> (kbuild: make single targets work more correctly) and just gives an error:
>
> $ make kernel/test.o
>    CALL    scripts/checksyscalls.sh
>    CALL    scripts/atomic/check-atomics.sh
>    DESCEND  objtool
> make[2]: *** No rule to make target 'kernel/test.o'.  Stop.
> scripts/Makefile.build:502: recipe for target '__build' failed
> make[1]: *** [__build] Error 2
> Makefile:1670: recipe for target 'kernel' failed
> make: *** [kernel] Error 2


This is intentional to make the single target builds
work in the same manner as the normal builds.


The necessary CONFIG dependency must be met.

obj-$(CONFIG_FOO) += foo.o

foo.o can be built only when CONFIG_FOO is y/m.



> For top-level objects (e.g. 'make bar.o') the situation is even worse,
> since make exits with status 0 without building anything :-/


There is no .c or .S file at the top-level of the kernel source tree.

'make bar.o' never happens.



> Is there any chance we can get this back? It was super useful for me.


What you want is "Let's build whatever", right?

No, please add 'obj-y += test.o' if you want to
test your local file.


-- 
Best Regards
Masahiro Yamada
