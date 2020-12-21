Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD112DFB17
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Dec 2020 11:34:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbgLUKee (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Dec 2020 05:34:34 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:45638 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgLUKed (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Dec 2020 05:34:33 -0500
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0BLAXQBP010887
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Dec 2020 19:33:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0BLAXQBP010887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608546806;
        bh=MBDCbV6X5Yq/Rg5jZ9uMTkgGbVGeoUNjyYFHE4q6TJo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jDdFhTakBumEZjlcwAfgs4P4zZ76V42euu9HrIjHSudbVvXNQ3/7ClJ9ugOxCkk93
         RFpmo4nBEnFfPatbqbCg4YV+SKMg3N6quXmY92WtH4/gpAu7mL5gsgfRGKD4raM+lI
         GzfG7iemslkeWUlA8P5SQRszGROjP8IjUkBS9iQuM0DZVPA7ysmfic/zqk6aImla0W
         HjNtLGgmlF09/Of9dVKE17RWYMXu+U5xXqmIk/mspmgFnPyNstNkdGKUnbAO3K/LR2
         KADukIMAevwm0QRN0urIaeuIg21vSSEADgLCJuJtgYiz2bBClIOFjlrdW+4o0EXxMs
         0T8xQCoCXYZVQ==
X-Nifty-SrcIP: [209.85.214.181]
Received: by mail-pl1-f181.google.com with SMTP id s15so969214plr.9
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Dec 2020 02:33:26 -0800 (PST)
X-Gm-Message-State: AOAM533Fd41gGRFB0Be5edwJiE0008UJR+JuNorJwO2fv0ycsWu9+GBP
        53HBHxC4F8Rb1xbLiB9mmMpF/bxImUnOOmDBJ1Q=
X-Google-Smtp-Source: ABdhPJw78Bc0HGKHNL836ebb1iGGduZB6vRkBZQH18/uM0RV8UxmJCfjUxGklSeWq0DuFntPCf0V0PMi3ChKrJTYL+o=
X-Received: by 2002:a17:90a:c910:: with SMTP id v16mr16627191pjt.198.1608546805524;
 Mon, 21 Dec 2020 02:33:25 -0800 (PST)
MIME-Version: 1.0
References: <boris.20201125161355@codesynthesis.com> <CAK7LNAR+OkuHyELBYvcFZpO1b-bKe5rmodtGSuzxPhZsGwTSQA@mail.gmail.com>
 <boris.20201202094405@codesynthesis.com>
In-Reply-To: <boris.20201202094405@codesynthesis.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 21 Dec 2020 19:32:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNASeAM8FTqrLz0bKCPNLvzgqiG3HdadVA4CsMkMXOVRbwg@mail.gmail.com>
Message-ID: <CAK7LNASeAM8FTqrLz0bKCPNLvzgqiG3HdadVA4CsMkMXOVRbwg@mail.gmail.com>
Subject: Re: kconfig: diagnostics cleanups
To:     Boris Kolpackov <boris@codesynthesis.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 2, 2020 at 5:06 PM Boris Kolpackov <boris@codesynthesis.com> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
>
> > We can change them if there is a reason, but I cannot see it in your
> > description.
>
> > Boris Kolpackov <boris@codesynthesis.com> wrote:
> >
> > > 1. Add 'warning' word to $(warning-if) output:
>
> This will make the diagnostics consistent with other places in kconfig
> where warnings are issued (see conf_warrning() in confdata.c).


'warning:' from C code and $(warning-if) are implemented
in different layers. So, I do not think it is necessary
to prepend 'warning:'.



More importantly, I cannot find a good way to print
multiple lines of error messages when $(error ...) is hit.
I prefer wrapping a long message in 80-columns.


After all, the best way I came up with for GNU Make is to use
$(error ) for the last line, and $(warning ) for the rest.

$(warning This is the first line)
$(warning This is the second line)
$(error This is the last line)


masahiro@grover:~$ make
Makefile:1: This is the first line
Makefile:2: This is the second line
Makefile:3: *** This is the last line.  Stop.



This works, except the small flaw, "***".



What if GNU Make prepended 'warning:' and 'error:'
as you suggest?


Makefile:1: warning: This is the first line
Makefile:2: warning: This is the second line
Makefile:3: error: *** This is the last line.  Stop.

This is even odd since I just want to split the message
into multiple lines.

If you want, you can include 'warning: ' in the message,
but you would not be able to get rid of it if it were
printed by default.

So, I do not want to add unwanted prefixes.


In a little more thought, I'd rather go opposite;
make $(warning-if) and $(error-if) as simple as
just printing the given message without any prefix.

https://patchwork.kernel.org/project/linux-kbuild/patch/20201221094650.283511-1-masahiroy@kernel.org/



>
> > > 2. Print $(info) output to stderr instead of stdout.
>
> There are two reasons:
>
> 1. Error, warning, and info are different diagnostics levels. It was
>    surprising to me that the first two go to stderr while info goes
>    to stdout. For example, as a user, if I redirect stderr, I would
>    naturally expect all the diagnostics to go there.
>
> 2. More importantly, stdout is used by terminal-based UI configurators.
>    So depending on exactly when $(info) is issued, its output could either
>    be clobbered by UI (so the user won't notice it) or it can clobber UI
>    (so the user will see broken UI).


I do not think this is overly problematic
because Kconfig enters the GUI mode after
parsing all Kconfig files.

Also, if my new patch lands, the format from $(info) and $(warning-if )
will be the same.
If we directed the $(info ) to stderr,
$(info ) and $(warning-if ) will be completely equivalent, and
we will lose the reason to have $(info ).



--
Best Regards
Masahiro Yamada
