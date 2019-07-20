Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5411F6EDD2
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2019 07:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbfGTFJs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 20 Jul 2019 01:09:48 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:33438 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfGTFJs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 Jul 2019 01:09:48 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x6K59cQV025137;
        Sat, 20 Jul 2019 14:09:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x6K59cQV025137
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563599379;
        bh=Vt8e4ZibGh6YbYrqAYP6YFb33zJbcUfxyLcUA52ZLCE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VHK6YSbea5EyMgOh50x4apyr9R0Er3JKrwgRzqWa9x8GJcw+7fU6ZipmMnx/M93WA
         9A17JQyJeocJmXgFdkV9sBKbUC8OX8mXSGlQxUG2vnNt9d6AjOzPL8/fyQaluyeSHA
         MNz5h5IaJbUDCNMwj+m9vPQJB/t0pLmXNB6tPdLhebhPAMldwgsxVhRbRct/ByEjyp
         rOPMP3Ur5bCQnyE04nHbmepDzbgD2t2RH8tAZ6wyCEqu8UCOUqK4q+EvDE2FoctuCW
         sDUf/X0WPnQqEpnR/N9eZCDnTZ880M/VWVOfHUiuJdRXtrqRQBHtocd1EpwCIPhR/h
         tp2GFOE2QBSrA==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id a186so21238020vsd.7;
        Fri, 19 Jul 2019 22:09:38 -0700 (PDT)
X-Gm-Message-State: APjAAAXnY2K5OySyBmwN8cOA1XacwTaaux+C8nrqkQuwWig2WyenlLra
        GIdbzLTFQlhCnjpE5w6DkbrCEa82LQ0oFjihuf0=
X-Google-Smtp-Source: APXvYqzPm1XVv4vlss8TM6aaCj/lOCVAn9tMmbSrOhWcHRkLrATsWbcHjwgGjFzsHaVwHEAYvQGWCzN5Rr5q4y2QMic=
X-Received: by 2002:a67:f495:: with SMTP id o21mr35269851vsn.54.1563599377517;
 Fri, 19 Jul 2019 22:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190711054434.1177-1-yamada.masahiro@socionext.com>
 <20190711054434.1177-9-yamada.masahiro@socionext.com> <20190716214023.GA15159@redhat.com>
 <CAK7LNAQ41NhPPO6xoVObgFctTO6WewSXPfZkE7_bZXsdAtKSpA@mail.gmail.com> <f1222c8a-9301-1e76-981d-a36e8687a29f@redhat.com>
In-Reply-To: <f1222c8a-9301-1e76-981d-a36e8687a29f@redhat.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 20 Jul 2019 14:09:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNATrS_ENkz3-dT70mXi=L89w0a-x6tSsDT-r7qxNa+kaOQ@mail.gmail.com>
Message-ID: <CAK7LNATrS_ENkz3-dT70mXi=L89w0a-x6tSsDT-r7qxNa+kaOQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] kbuild: create *.mod with full directory path
 and remove MODVERDIR
To:     Joe Lawrence <joe.lawrence@redhat.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Joe,

On Fri, Jul 19, 2019 at 5:18 AM Joe Lawrence <joe.lawrence@redhat.com> wrote:

> > Perhaps, adding a new field
> > to *.mod files might be cleaner.
>
> I can look into that.  By "field" you mean a new row in the file?

Yes.


-- 
Best Regards
Masahiro Yamada
