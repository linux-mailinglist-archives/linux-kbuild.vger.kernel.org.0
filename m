Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFE741248BA
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2019 14:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfLRNvf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Dec 2019 08:51:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:55018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726788AbfLRNve (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 08:51:34 -0500
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 17DCD2176D;
        Wed, 18 Dec 2019 13:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576677094;
        bh=cOh4++xHQIRkDylmr8HwpBOGh6gMnbkUYWlw9NMr8E0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sYlf50RBdxx+pxhSWD1BvpEtIlsX6urQns7zaXMIv3xLbyRx/IUEycr6XUfkLBDm4
         SVwTO4PrmoTQUsHzfP/OJpnBQ9oJIh2WhbD72TraHAH624bbR7zGO8cSE/9520FlyZ
         kGmI83RXUewk7jjQ9e3/Dnp75wuEkhhHDW9E36HM=
Received: by mail-qk1-f175.google.com with SMTP id z76so1954400qka.2;
        Wed, 18 Dec 2019 05:51:34 -0800 (PST)
X-Gm-Message-State: APjAAAUlYPIPBWO8Su5tJtjjs1p4EI9Pn3E24KlwNITO/YP0X3J1fyJL
        C/7fGMUiQ7x1gV1mlPEZlooBoDwooif1BrSt/A==
X-Google-Smtp-Source: APXvYqxDR0S+4hI0M7nPfeX5e/U3cc3EvKNt/XOsy1604pvTEaKL7PVpAXykun6zLbhBXsK60cLuDkBNDJumnGDNeao=
X-Received: by 2002:a05:620a:135b:: with SMTP id c27mr2361206qkl.119.1576677093238;
 Wed, 18 Dec 2019 05:51:33 -0800 (PST)
MIME-Version: 1.0
References: <20191218114625.28438-1-frank-w@public-files.de> <CAK7LNARWYE4-4Qp-YfTrrt1YCZ68b28FDoE45cDJkZTqUyXNUw@mail.gmail.com>
In-Reply-To: <CAK7LNARWYE4-4Qp-YfTrrt1YCZ68b28FDoE45cDJkZTqUyXNUw@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 18 Dec 2019 07:51:21 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+we-0c25Hn+eGDTsyTDwKEvs9LWV9QtLX1+8V3DmtFtg@mail.gmail.com>
Message-ID: <CAL_Jsq+we-0c25Hn+eGDTsyTDwKEvs9LWV9QtLX1+8V3DmtFtg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add DTC_CPP_FLAGS
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Frank Wunderlich <frank-w@public-files.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 18, 2019 at 7:37 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> (+CC: DT maintainers)
>
> On Wed, Dec 18, 2019 at 8:55 PM Frank Wunderlich
> <frank-w@public-files.de> wrote:
> >
> > With this Patch we are able to change cpp-preprocessor options
> > (e.g. -D...) for using conditions (#ifdef) in devicetree files
> > and dynamically add include searchpaths
>
> I think this is questionable
> since DT is supposed to describe hardware.
> Does it depends on #ifdef or some external defines?

NAK. #ifdefs and complex macros in particular are features we don't
want in dts files.

Rob
