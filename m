Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F42662D4A
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 03:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfGIBH5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Jul 2019 21:07:57 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:26826 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfGIBH4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jul 2019 21:07:56 -0400
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x6917aNE015671;
        Tue, 9 Jul 2019 10:07:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x6917aNE015671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562634457;
        bh=Oi+gJ4HjdFeJYGIhOMRbLASYMIcmJKxUKb0BC5utJb8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2n5CkPq4Drp9hqyl8EXSdGfcIVC/5h5DCr5xhvF9ZEf9FrRVRAPkHTLq8r1gT3eF5
         1A3+QcCEiTo1G0+0erm6MjYheXIkn2HNUs+smuzipXKPXB0rv3uCxB9+Aep8trlFLS
         lSE5j2qvmsnU452++kbGZh3x+U6cNVKYsDN+g4wnyuNAubzWAc0B8A0bGl5hLgNrrZ
         KMFSed5LJk9VmKbDBvCx15L1DGkJH3WM9ivXiA8zMV76zt6q7qKOVOVDrZZiIn1p2p
         zlCQcwGS+ckY9h/UC/jNJjTF3dTT37gtHZlwt3oiS7gBy38vmoUvL3AMGeU3q6MDl9
         VbSoWv7G712cA==
X-Nifty-SrcIP: [209.85.222.50]
Received: by mail-ua1-f50.google.com with SMTP id j2so5742102uaq.5;
        Mon, 08 Jul 2019 18:07:36 -0700 (PDT)
X-Gm-Message-State: APjAAAXyqcdex+LcOt4n56IRt+KK/vFwygnviP8nETa3gtzj//l/WWFg
        1aBiOcLJWYwDPaviByV89m2TrME9ehv26Vy3KXk=
X-Google-Smtp-Source: APXvYqytdy+Rsj1ktWvl7YXRGUOeJJcZxpwUHQgkKNLEvfRVRLhEJTgLnhE0we6l52NZwC93vFQP8FceJKJd6vYz6No=
X-Received: by 2002:ab0:234e:: with SMTP id h14mr1976914uao.25.1562634455710;
 Mon, 08 Jul 2019 18:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190706162508.8529-1-yamada.masahiro@socionext.com> <20190708140223.39d15d56@lwn.net>
In-Reply-To: <20190708140223.39d15d56@lwn.net>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 9 Jul 2019 10:06:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR50AdaOUZ9taD9rcD_mhKYR47YqWnxN0T9SbD9+j9vBA@mail.gmail.com>
Message-ID: <CAK7LNAR50AdaOUZ9taD9rcD_mhKYR47YqWnxN0T9SbD9+j9vBA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: get rid of misleading $(AS) from documents
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 9, 2019 at 5:02 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Sun,  7 Jul 2019 01:25:08 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
> > The assembler files in the kernel are *.S instead of *.s, so they must
> > be preprocessed. Since 'as' of GNU binutils is not able to preprocess,
> > we always use $(CC) as an assembler driver.
> >
> > $(AS) is almost unused in Kbuild. As of writing, there is just one place
> > that directly invokes $(AS).
> >
> >   $ git grep -e '$(AS)' -e '${AS}' -e '$AS' -e '$(AS:' -e '${AS:' -- :^Documentation
> >   drivers/net/wan/Makefile:  AS68K = $(AS)
> >
> > The documentation about *_AFLAGS* sounds like the flags were passed
> > to $(AS). This is somewhat misleading.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
>
> Would you like me to send this up through the docs tree?

No, I will apply it to linux-kbuild shortly.

Thanks.


-- 
Best Regards
Masahiro Yamada
