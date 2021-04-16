Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 331C0361986
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 08:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238789AbhDPFxW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 01:53:22 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:34648 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238358AbhDPFxW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 01:53:22 -0400
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 13G5qSHO014226;
        Fri, 16 Apr 2021 14:52:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 13G5qSHO014226
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618552349;
        bh=WQhLqm4+QKuAfKFbPuWr/32+TJjPkkHvQQwkRrLTiv8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0xU3Q6lGxioXwmdJa6oHMklRN9fk1rBIALFc1bhEJLQEKoSvZcQTySexw8ThyPNDF
         R+Wf9aaBGvbra4+HhWh4OmxJrtsDUyynCVQggrHjJkkf6NZJfQ830t3DGsBk6mnw+s
         XOyYyKvrkACkLQIYpOIqVGxrDzCCalB3TBk5U6pLuoImAqyUv599gLranzGosWBA/b
         Nl+7oiBc4zsSo3py4Ni67QZ2KMJQAx7lwjcMS1Efgcq1bq+N2iSRo00Z6WSCrc+X6q
         lf2Eg+/RO6MRYaPU8jWU7Ki2Mpg6vF860nOXPiKvOAyYM/X1D1KxNZ9lF7jz2LVEzC
         oWuqKCfHso6Vg==
X-Nifty-SrcIP: [209.85.214.178]
Received: by mail-pl1-f178.google.com with SMTP id q11so280841plx.2;
        Thu, 15 Apr 2021 22:52:28 -0700 (PDT)
X-Gm-Message-State: AOAM533c9KvrzdBu72R2N329xKxaeo2azOUvjt5Ip8CNP4R33m3XG3Iy
        5ojBO0Q2+kAPRepH0KzAkKENVA9MLFNkBXXQLRM=
X-Google-Smtp-Source: ABdhPJwLGLIPGhYWQrmYzOJJRgQcrIoez9eOoky84sqnv3+AVSyd1FV1crs46aiZEwyITdNQVxF5/uCnufkJvG16dKE=
X-Received: by 2002:a17:902:d2c8:b029:eb:424b:84c with SMTP id
 n8-20020a170902d2c8b02900eb424b084cmr7915380plc.71.1618552348021; Thu, 15 Apr
 2021 22:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210415171352.27398-1-rdunlap@infradead.org> <CAK7LNASRLgRTZMwzbwnrYA96hLDpzWm8JVBMYQSHMNasXCHtdQ@mail.gmail.com>
In-Reply-To: <CAK7LNASRLgRTZMwzbwnrYA96hLDpzWm8JVBMYQSHMNasXCHtdQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 16 Apr 2021 14:51:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNATTZfWr227EQY-k7VJm_9X29g6fRKO-hGhXmJnhXOxCug@mail.gmail.com>
Message-ID: <CAK7LNATTZfWr227EQY-k7VJm_9X29g6fRKO-hGhXmJnhXOxCug@mail.gmail.com>
Subject: Re: [PATCH v2] uml: fix W=1 missing-include-dirs warnings
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 4:14 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Apr 16, 2021 at 2:14 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > Currently when using "W=1" with UML builds, there are over 700 warnings
> > like so:
> >
> >   CC      arch/um/drivers/stderr_console.o
> > cc1: warning: ./arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
> >
> > but arch/um/ does not have include/uapi/ at all, so add that
> > subdir and put one Kbuild file into it (since git does not track
> > empty subdirs).
> >
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Michal Marek <michal.lkml@markovi.net>
> > Cc: linux-kbuild@vger.kernel.org
> > Cc: Jeff Dike <jdike@addtoit.com>
> > Cc: Richard Weinberger <richard@nod.at>
> > Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> > Cc: linux-um@lists.infradead.org
> > ---
> > v2: use Option 4 from v1: add arch/um/include/uapi so that 'make' is
> >     placated -- and just like all other arch's have.
>
>
>
> Assuming the UML maintainer will pick up this:
>
> Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>


Now I see this patch queued up to UML repository.
Thanks.




--
Best Regards
Masahiro Yamada
