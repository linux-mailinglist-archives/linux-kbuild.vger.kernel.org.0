Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9FC306DB7
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Jan 2021 07:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbhA1Gkx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Jan 2021 01:40:53 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:57438 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbhA1Gks (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Jan 2021 01:40:48 -0500
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 10S6diXZ023874;
        Thu, 28 Jan 2021 15:39:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 10S6diXZ023874
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611815985;
        bh=QW6uNmeQIM4CerhvKxJ/Ngyr94ilzVVhkE/KVozLC/c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NzLwkNDmFNAcHTOKrYy4/aS2N+HKNvl/Sj+ezN5hcrru+G7xS32UMlU0+rJHSpX6C
         OnCr6bYcUv76Vj36puJYvYHRQlFHM3lULrxFZqBbjl5euTMzlGt1W5viGX3+Ml8qs1
         txdji8D6C3scT3FQ5Le6UcgZn0m/qsK41Xbd0td0tOSQ0PhNmhhVAEAmPez5f43ZrY
         FQP8qXdSOHYZpWyQi/5UJoTl+O3hPwNtJ7O4SES+Mss+IKNd9YaElP2HdifvDJfUf+
         Y56I2Z5W2kceQrTw4EUAgHwse1/zTv/bvcuj1CLIgkvGThAxGCFG1kDG+9L1j4R1JB
         JJAvVYkljkQ6A==
X-Nifty-SrcIP: [209.85.215.174]
Received: by mail-pg1-f174.google.com with SMTP id i7so3635226pgc.8;
        Wed, 27 Jan 2021 22:39:44 -0800 (PST)
X-Gm-Message-State: AOAM532NLBF0XWpgppoRpZWyvM5ixAEesNNLS8Qk3JivE+GZ87STeQui
        F8eDiq6UTlGubAzZyV8f1T0chd+fAX2F+vRSjuE=
X-Google-Smtp-Source: ABdhPJxsorSQja4rHTNzxS+Qf3tljiWpChBj7qIY9yjq78uw2gZhnn8dz3m0KUUWbeGNa+CDN0KP+X9tBGHKpQ5DW34=
X-Received: by 2002:a63:ff09:: with SMTP id k9mr15229613pgi.175.1611815984111;
 Wed, 27 Jan 2021 22:39:44 -0800 (PST)
MIME-Version: 1.0
References: <20210126191541.210168-1-masahiroy@kernel.org> <c973355e545bcdc52b619f2d13bfa41915074307.camel@perches.com>
In-Reply-To: <c973355e545bcdc52b619f2d13bfa41915074307.camel@perches.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 28 Jan 2021 15:39:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR6HQaj0LPe1whPvcX7yebKg5puZ1q=CsQNp1J1Nw6eCQ@mail.gmail.com>
Message-ID: <CAK7LNAR6HQaj0LPe1whPvcX7yebKg5puZ1q=CsQNp1J1Nw6eCQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "checkpatch: add check for keyword 'boolean' in
 Kconfig definitions"
To:     Joe Perches <joe@perches.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Christoph Jaeger <cj@linux.com>,
        Andy Whitcroft <apw@canonical.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 27, 2021 at 12:02 PM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2021-01-27 at 04:15 +0900, Masahiro Yamada wrote:
> > This reverts commit 327953e9af6c59ad111b28359e59e3ec0cbd71b6.
> >
> > You cannot use 'boolean' since commit b92d804a5179 ("kconfig: drop
> > 'boolean' keyword").
> >
> > This check is no longer needed.
>

Applied to linux-kbuild.


> Thanks.
>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Acked-by: Joe Perches <joe@perches.com>
>
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -3390,13 +3390,6 @@ sub process {
> >                       }
> >               }
> >
> > -# discourage the use of boolean for type definition attributes of Kconfig options
> > -             if ($realfile =~ /Kconfig/ &&
> > -                 $line =~ /^\+\s*\bboolean\b/) {
> > -                     WARN("CONFIG_TYPE_BOOLEAN",
> > -                          "Use of boolean is deprecated, please use bool instead.\n" . $herecurr);
> > -             }
> > -
> >               if (($realfile =~ /Makefile.*/ || $realfile =~ /Kbuild.*/) &&
> >                   ($line =~ /\+(EXTRA_[A-Z]+FLAGS).*/)) {
> >                       my $flag = $1;
>
>


-- 
Best Regards
Masahiro Yamada
