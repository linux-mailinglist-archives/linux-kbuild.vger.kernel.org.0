Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E15F6199ABB
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2020 18:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731346AbgCaQEB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Mar 2020 12:04:01 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:47429 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731335AbgCaQEB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 12:04:01 -0400
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 02VG3o86010377;
        Wed, 1 Apr 2020 01:03:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 02VG3o86010377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585670631;
        bh=g8NpbIU/UC4q+xrWFvooNF2DdilLvEWkxEVzIf5x6dQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pVA71gWrU82P2NSLczJmJtUieM8LJx6belN5whZu4rBJW8UjDvz/3/aa+fU76v3kF
         E3QZVAdxKh/OvcWvdoGSlAhPAxyMPpkVqg2eYnyFxoKeLHcPTbq00SyIwFat70D4RV
         MM7xpKEjqsIWm02zkxE8SJgG2BJPXaC1EpqpXfRVOJ1J/mf4bBsm7UQmI7NeiFuA4n
         MQLo8gaktJ9ClO7NB4OLBGjaIb1VDzV40GzOl+lg4zVMeuGKy4HN+z+oOg0X/moaPR
         B4uJsrwBG2FaZafQUQwWTQqFtj/qnV34bxak2osj9GzZLXkhH+OiDyPhbSSdxVrGWT
         pbSfItGW7e79A==
X-Nifty-SrcIP: [209.85.217.52]
Received: by mail-vs1-f52.google.com with SMTP id s10so13775651vsi.9;
        Tue, 31 Mar 2020 09:03:50 -0700 (PDT)
X-Gm-Message-State: AGi0PuYqicOk1npx14Ni2uhWdNMv+lCedsDMNEXoJ3r91MbPL5pFsJcp
        IAMoi/871kQ6cciPP15s6SihKjaIiXivLNDplEs=
X-Google-Smtp-Source: APiQypID6adS4u5eA7kE/v0+dVrrluNOnmRV1pxnz1uMJaWnu1FGs7pyn+sbb+gOJmtZWscxKLx62+Jdjw1TJXd2HIk=
X-Received: by 2002:a67:b01:: with SMTP id 1mr847069vsl.181.1585670629321;
 Tue, 31 Mar 2020 09:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <a5ce79eb-be9d-df97-0b58-5aee5a48f4d3@oracle.com>
 <CAK7LNAQ8LZMPxrjVkuLizHjVZyBtSmLFZ=EvDCCAPb-XGfJLHA@mail.gmail.com> <8c491e3b-a622-14c1-15c3-8cff061017ba@oracle.com>
In-Reply-To: <8c491e3b-a622-14c1-15c3-8cff061017ba@oracle.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 1 Apr 2020 01:03:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT-8TbLRPB=PNsbAORKYvYL+m3JmA-iSDieK8Uv7MAvGA@mail.gmail.com>
Message-ID: <CAK7LNAT-8TbLRPB=PNsbAORKYvYL+m3JmA-iSDieK8Uv7MAvGA@mail.gmail.com>
Subject: Re: single target builds are broken
To:     Vegard Nossum <vegard.nossum@oracle.com>
Cc:     Jens Axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 31, 2020 at 8:02 PM Vegard Nossum <vegard.nossum@oracle.com> wrote:
>
>
> On 3/31/20 11:49 AM, Masahiro Yamada wrote:
> > On Tue, Mar 31, 2020 at 6:16 PM Vegard Nossum <vegard.nossum@oracle.com> wrote:
> >>
> >>
> >> Hi,
> >>
> >> I often run 'make foo/bar.o' as part of my workflow, even when bar.o is
> >> not specified in any kernel makefile, and this has worked just fine for
> >> years.
> >>
> >> This is broken after commit 394053f4a4b3e3eeeaa67b67fc886a9a75bd9e4d
> >> (kbuild: make single targets work more correctly) and just gives an error:
> >>
> >> $ make kernel/test.o
> >>     CALL    scripts/checksyscalls.sh
> >>     CALL    scripts/atomic/check-atomics.sh
> >>     DESCEND  objtool
> >> make[2]: *** No rule to make target 'kernel/test.o'.  Stop.
> >> scripts/Makefile.build:502: recipe for target '__build' failed
> >> make[1]: *** [__build] Error 2
> >> Makefile:1670: recipe for target 'kernel' failed
> >> make: *** [kernel] Error 2
> >
> >
> > This is intentional to make the single target builds
> > work in the same manner as the normal builds.
> >
> >
> > The necessary CONFIG dependency must be met.
> >
> > obj-$(CONFIG_FOO) += foo.o
> >
> > foo.o can be built only when CONFIG_FOO is y/m.
> >
> >
> >
> >> For top-level objects (e.g. 'make bar.o') the situation is even worse,
> >> since make exits with status 0 without building anything :-/
> >
> >
> > There is no .c or .S file at the top-level of the kernel source tree.
> >
> > 'make bar.o' never happens.
>
> It doesn't happen in mainline, but I often use that to small test things
> in an isolated source file. As just one example you can do
>
> #include <linux/sched.h>
> unsigned int task_struct_size = sizeof(struct task_struct);
>
> and then you can look in the object file to find the size. Or any other
> of a million useful things that you might want to do without rebuilding
> an actual source file or modifying makefiles.
>
> >> Is there any chance we can get this back? It was super useful for me.
> >
> >
> > What you want is "Let's build whatever", right?
>
> It's really useful to be able to build object files separately, but as
> if it was part of the kernel (so e.g. with all the gcc flags, include
> paths, etc.).
>
> > No, please add 'obj-y += test.o' if you want to
> > test your local file.
>
> This is a clear workflow regression for me. Why is it so absolutely
> necessary to break the way it used to work?


Because this is the only way to do this correctly.


Previously, 'make foo/bar/baz.o' descended into foo/bar
(it always assumed there was Makefile in the directory part)

So, there were lots of cases where single builds did not work:

https://www.spinics.net/lists/linux-kbuild/msg21921.html


The way to do this correctly is to
descend directories one by one, parsing Makefiles.

With no entry in obj-y/m,
Kbuild cannot determine where to build that object.



> At the very least, can we find a way to reduce the typing overhead for
> testing one-offs like that? 'make STANDALONE=1 test.o' or something?


Probably, I do not want to do this.

Supporting everybody's demand is not a good idea.
So, I draw a line somewhere.

Saving some typing is less important.

>
>
> Vegard



--
Best Regards
Masahiro Yamada
