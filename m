Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48C4414412F
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2020 17:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbgAUQAz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Jan 2020 11:00:55 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:65434 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbgAUQAz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jan 2020 11:00:55 -0500
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 00LG0WWL004396;
        Wed, 22 Jan 2020 01:00:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 00LG0WWL004396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1579622433;
        bh=UkZRS9NcTgc/pE2ZU+XPobTZ8euQfmozs1NIKmVtgB8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pqq079j450i4kskTg34a6jXtvAm6UrFOje8O2rL51BsamArKYevluCjjjrjrwo4MO
         IdcRHNUesdrL1bktgbNyc69Qh9Df1rUE4l62+CEoKSHWHeTtqtSzYvU+ZUvS1mWarO
         gfGSKDFwX9553uC4fPsjIltwnKAPIuoFVfEGVgvlCnZEj6aZW18s3a6ScpwotBSGql
         SS7vn54wOVxV1OCgldGwlYq+NqPi576XhRy3741pIRUg12KBrlbgguOCQNelbvxwDk
         GaROZmNovid+1tJ3dWNAPrWJjXwzSX0Q6KLLC/dXrToTA4YDB/dhDN6l9rwyt41kKb
         6xeDE7GO3ZTGw==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id g15so2151976vsf.1;
        Tue, 21 Jan 2020 08:00:32 -0800 (PST)
X-Gm-Message-State: APjAAAULUAB/d01SzMMU2ZibxaLqnvaF4iS9DwIC/Hvr1P1EAFEZvDiK
        MTpSpKdrcii59YDZTjlC4qQkftlNeqsTy0l662U=
X-Google-Smtp-Source: APXvYqw5/xpKMwJ3Dni5RStdI/powNXLAkzCtS2BwVu0JOoQYeux1KW50NlZujdmVRzGgkinqYdNY6Sz30xA7gfj8lY=
X-Received: by 2002:a67:f8ca:: with SMTP id c10mr3210302vsp.54.1579622431647;
 Tue, 21 Jan 2020 08:00:31 -0800 (PST)
MIME-Version: 1.0
References: <20200104150238.19834-1-masahiroy@kernel.org>
In-Reply-To: <20200104150238.19834-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 22 Jan 2020 00:59:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNATS33-TfoGajRCT3nAAZ+AcfVmO4GorxRTNPk9z8mBcHA@mail.gmail.com>
Message-ID: <CAK7LNATS33-TfoGajRCT3nAAZ+AcfVmO4GorxRTNPk9z8mBcHA@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] initramfs: a lot of cleanups
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Greg Thelen <gthelen@google.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jan 5, 2020 at 12:03 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>
>
> Masahiro Yamada (13):
>   initramfs: replace klibcdirs in Makefile with FORCE
>   gen_initramfs_list.sh: remove unused variable 'default_list'
>   gen_initramfs_list.sh: fix the tool name in the comment
>   initramfs: rename gen_initramfs_list.sh to gen_initramfs.sh
>   initramfs: remove redundant dependency on BLK_DEV_INITRD
>   initramfs: make compression options not depend on INITRAMFS_SOURCE
>   initramfs: make initramfs compression choice non-optional
>   initramfs: specify $(src)/gen_initramfs.sh as a prerequisite in
>     Makefile
>   initramfs: generate dependency list and cpio at the same time
>   initramfs: add default_cpio_list, and delete -d option support
>   gen_initramfs.sh: always output cpio even without -o option
>   initramfs: refactor the initramfs build rules
>   gen_initramfs.sh: remove intermediate cpio_list on errors

All, applied to linux-kbuild.


>  usr/.gitignore                                |   8 +-
>  usr/Kconfig                                   |  26 ---
>  usr/Makefile                                  |  97 ++++++----
>  usr/default_cpio_list                         |   6 +
>  ...gen_initramfs_list.sh => gen_initramfs.sh} | 167 +++++-------------
>  usr/initramfs_data.S                          |   5 +-
>  6 files changed, 112 insertions(+), 197 deletions(-)
>  create mode 100644 usr/default_cpio_list
>  rename usr/{gen_initramfs_list.sh => gen_initramfs.sh} (53%)
>
> --
> 2.17.1
>


--
Best Regards
Masahiro Yamada
