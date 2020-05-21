Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5965D1DC5FC
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2020 05:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbgEUD6o (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 May 2020 23:58:44 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:33507 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbgEUD6o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 May 2020 23:58:44 -0400
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 04L3w7WE015180;
        Thu, 21 May 2020 12:58:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 04L3w7WE015180
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590033488;
        bh=cdcXcp7GKJaQpoiglOE1SstMA8V7OfLShCEkDd6sbPw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=abdOFj1i0J9pa0dxt1L9GfRe+lMOKG1wZ3CCJCF+SzSFEoaPuc1hJ8bYGoP704Uj7
         R/gOJmRfaCjwbNnvbgDTpqwyfnK5GvXBum1ba2dZwe2YvJK52dwLS6wFpGKavxCE8j
         +EhQ1PUju1nA9lCJBHl6LN2WyBLZugw5aJO/Km/zMcfMychRu9rZrnFIhQMD5DiQQy
         dij8j+BRLGFD+M0uGpHbgW/1DE/fbZLyPRzZL7IG6sQv/gDegR1LJpuuXViuWW+LVU
         gxXatApVeJwJv/QCXA0bFFua+QHZfD2wZKW6KcgCdrQcSgT/3fu/irvKzi6T3szDbz
         IOcU+AOvuP7Fw==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id c17so2113968uaq.13;
        Wed, 20 May 2020 20:58:08 -0700 (PDT)
X-Gm-Message-State: AOAM533JdntVdi1/4nQUYtl3V94YzkkthB9AMrUnrNSht501yPhSfrWN
        y1wSqdnzgC3kOIPQrORlVzbkxxvE3nowDnXHVZM=
X-Google-Smtp-Source: ABdhPJzpnqCQGJ4c2bi+MEob+kwmt7nGFJPa9S2qehtmVIvnGWQiwFvzL8eOgt3jRjoUpdjLDDnbTBvWPi4aQIIDzNA=
X-Received: by 2002:a9f:3e0d:: with SMTP id o13mr5991460uai.25.1590033486833;
 Wed, 20 May 2020 20:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200517094859.2376211-1-masahiroy@kernel.org>
 <20200517094859.2376211-10-masahiroy@kernel.org> <fe378a92bba24164a4f901902ab06820@AcuMS.aculab.com>
In-Reply-To: <fe378a92bba24164a4f901902ab06820@AcuMS.aculab.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 21 May 2020 12:57:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQNyD-1-tHkjgc3_cG2XGbLN7rmPM4m371iO2eWAfX55Q@mail.gmail.com>
Message-ID: <CAK7LNAQNyD-1-tHkjgc3_cG2XGbLN7rmPM4m371iO2eWAfX55Q@mail.gmail.com>
Subject: Re: [PATCH 09/29] kbuild: disallow multi-word in M= or KBUILD_EXTMOD
To:     David Laight <David.Laight@aculab.com>
Cc:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 17, 2020 at 9:33 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Masahiro Yamada
> > Sent: 17 May 2020 10:49
> > $(firstword ...) in scripts/Makefile.modpost was added by commit
> > 3f3fd3c05585 ("[PATCH] kbuild: allow multi-word $M in Makefile.modpost")
> > to build multiple external module directories.
> >
> > This feature has been broken for a while. Remove the bitrotten code, and
> > stop parsing if M or KBUILD_EXTMOD contains multiple words.
>
> ISTR that one of the kernel documentation files says that it is possible
> to build multiple modules together in order to avoid 'faffing' with
> exported symbol lists.
>
> So the docs need updating to match.


Do you remember which doc mentions it?



>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>


-- 
Best Regards
Masahiro Yamada
