Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1D04157D9
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2019 05:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbfEGDCk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 May 2019 23:02:40 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:58979 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbfEGDCk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 May 2019 23:02:40 -0400
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x4732XTi030985;
        Tue, 7 May 2019 12:02:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x4732XTi030985
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557198154;
        bh=UOVlLy/wVLqCQ3IZ+Xag1tGC9ICcteYP+5Dq8Jc65YI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qnU27xfl2yzx44U8NaR8OU7ABPcGyNqa7uFJGGZjX9cXCokLckUcXX9ZuDz//UxXN
         GOE+EqtXEFxSinlaoVXqcYz3BxOzUAVwRjFqi+71qtK1ykNrrU2/2px/kd7rAQZk5a
         cGVPc4u5sQn97E4BHufZBrNvAvMHoN/aTEd2RP8iT7qGrLY3GOalcyX5+Q+5+m7I4i
         Ciqcg93DefrJEPE+kqoOatuYoxYfOqa3dl0Bfa+EQXj8uH9fAsOkDjJZBmS3nNUSDq
         thuQiTpbPA3RTc1Mw3Lurq09bPBvSTWKLc4HAGtWAC391uBYOZJ5pdEvOSntRCuch6
         VnKPqTXdVqTqQ==
X-Nifty-SrcIP: [209.85.221.172]
Received: by mail-vk1-f172.google.com with SMTP id s80so3686018vke.6;
        Mon, 06 May 2019 20:02:33 -0700 (PDT)
X-Gm-Message-State: APjAAAXEN7lThhOqdEBEK60RCocds4BkqIZKURmp88mUaleCPmLzsTmg
        jrwVMMW9RQtE6mhDddHi4LCbgRRqj31MYWENHSA=
X-Google-Smtp-Source: APXvYqwZFmp6rx95CPF6ap2Yd8GVckWMHJtSP4IT1kInt+74f9qNDrEMuC5mHVSMzYfllgArBDaTWG+xaTomfNEtkuA=
X-Received: by 2002:a1f:b297:: with SMTP id b145mr15295623vkf.74.1557198152590;
 Mon, 06 May 2019 20:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <1552234395-7699-1-git-send-email-yamada.masahiro@socionext.com> <84db9131-5498-d2d5-a984-11079e3c2a6e@gmail.com>
In-Reply-To: <84db9131-5498-d2d5-a984-11079e3c2a6e@gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 7 May 2019 12:01:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNARLOvginNm-YCUtqju4J=oqU5TTjt0GxPh+Y-KV-jV-PA@mail.gmail.com>
Message-ID: <CAK7LNARLOvginNm-YCUtqju4J=oqU5TTjt0GxPh+Y-KV-jV-PA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix 'Save As' menu of xconfig
To:     Robert Gadsdon <rhgadsdon@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 7, 2019 at 4:10 AM Robert Gadsdon <rhgadsdon@gmail.com> wrote:
>
> On 03/10/2019 09:13 AM, Masahiro Yamada wrote:
> > The 'Save As' menu of xconfig is not working; it always saves the
> > kernel configuration into the default file irrespective of the file
> > chosen in the dialog box.
> >
> > The 'Save' menu always writes into the default file, but it would
> > make more sense to write into the file previously chosen by 'Load'
> > or 'Save As'.
> >
> > Signed-off-by: Masahiro Yamada<yamada.masahiro@socionext.com>
> > ---
>
> The 'save as' may be used for out-of-tree kernel config saves, but the
> default 'save' should always save to the in-tree .config file, as before
> (and for the past 10+ years..)  If the kernel config was loaded from an
> out-of-tree location, it now saves back to that out-of-tree location,
> which is useless for the kernel compile..


I think it is quite natural that
"save" overwrites the file being edited.

And, that is how the 'save' of menuconfig/nconfig works.


> I have always kept my hardware/system-specific kernel configs
> out-of-tree, and then applied them in-tree before compiling.
>
> Now, I have to use 'save as' and type in the entire in-tree path
> (/usr/src/linux-5.1/.config) each time, in order to apply the specific
> config to the kernel, ready for compilation.


It is easy to do it without using xconfig.

cp /your/custom/config .config




> Robert Gadsdon.
> rglinuxtech.com



-- 
Best Regards
Masahiro Yamada
