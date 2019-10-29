Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64B01E7E45
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2019 02:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730082AbfJ2B5A (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Oct 2019 21:57:00 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:41073 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727263AbfJ2B47 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Oct 2019 21:56:59 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x9T1ufbp013620;
        Tue, 29 Oct 2019 10:56:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x9T1ufbp013620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1572314202;
        bh=WiGt+TCyyATo5E1qzm7PLkeK8QQ2Cm8OCwWpT1e4wCI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pT5nXJVc2vnAqpTvk7LjqeXZFnkhsKLCcbarM4RZdq2krk8GUlh/Hm1LiVHfYMS1N
         l/4CmjA6bXuGkykUTHuBgkptWP+QjGuVT79bR8k7dCQ8DIjvnTvOsAF2nw4QNMBZXJ
         snvZ99/qEBIAAhTsvbUx77S1xP0XQHhHCAInzEGOF3PZEXYGj/ZIfgfQK4KePr8DBW
         zpua6fFLJremi+i/GcE+n9P3QeMUjjeMgbxh4p/NGwcEWXh7vE4ErPbMBmgcPOF8Vi
         hw0SdxsNs11za2H4osYYS8o13aOY8sa3z6zal85UzFXDAC1Lv8B2CE5TX4zRCI1rCc
         TKEDTQREOT1cg==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id k1so5121939vsm.0;
        Mon, 28 Oct 2019 18:56:42 -0700 (PDT)
X-Gm-Message-State: APjAAAXqX4JjueQpxjBVQ4/1eA7HYliayFLytWjVBzYZE0vgK2LMbQHf
        5tilmaSlZLnKiQhedAhMFTkraBEUK8t1AL+laLQ=
X-Google-Smtp-Source: APXvYqw4kXxcZxGMoV8fdNR8r1mhiMi5Z5h5vFWYkK8GzACp8lOcuRj3PXb39YwbsZs+601M5TcPsE18xEHxVq5KHww=
X-Received: by 2002:a67:2d08:: with SMTP id t8mr298470vst.155.1572314201070;
 Mon, 28 Oct 2019 18:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191028155639.30330-1-e5ten.arch@gmail.com> <CAK7LNAS41TxKMLBj3_N=WE57CT7ttHes+7GdLWNW-mAgPkvW7w@mail.gmail.com>
 <CAMEGPiq+Z7kbjJSNA0m=1TAymamQExud_7v5yzakSPdciPbq1Q@mail.gmail.com>
In-Reply-To: <CAMEGPiq+Z7kbjJSNA0m=1TAymamQExud_7v5yzakSPdciPbq1Q@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 29 Oct 2019 10:56:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNASG4GzaU6SR=ThfJpjrqmC53xmcSMAWqppciWbx3jMgdw@mail.gmail.com>
Message-ID: <CAK7LNASG4GzaU6SR=ThfJpjrqmC53xmcSMAWqppciWbx3jMgdw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: support byacc as alternative YACC to bison
To:     Ethan Sommer <e5ten.arch@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Ethan,

On Tue, Oct 29, 2019 at 10:41 AM Ethan Sommer <e5ten.arch@gmail.com> wrote:
>
> > I applied this patch, and tried the latest byacc,
> > but I still cannot build kconfig probably because
> > %destructor is not supported.
> > byacc does not seem to work anyway.
>
> Hi Masahiro, because I hadn't built it in a while I completely forgot
> that to support %destructor byacc needs to be built with
> --enable-btyacc, should I update the commit message to include that
> detail?

OK, I was able to build kconfig with --enable-btyacc.

byacc still cannot build scripts/dtc/dtc-parser.y
Thought?

dtc is not compiled for x86.
Please try ARCH=arm.


masahiro@pug:~/ref/linux$ make ARCH=arm
CROSS_COMPILE=arm-linux-gnueabihf- YACC=/home/masahiro/bin/yacc
scripts/kconfig/conf  --syncconfig Kconfig
  SYSHDR  arch/arm/include/generated/uapi/asm/unistd-common.h
  SYSHDR  arch/arm/include/generated/uapi/asm/unistd-oabi.h
  SYSHDR  arch/arm/include/generated/uapi/asm/unistd-eabi.h
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.[ch]
/home/masahiro/bin/yacc: e - line 120 of "scripts/dtc/dtc-parser.y",
syntax error
ERROR(&@2, "Header flags don't match earlier ones");
       ^
make[1]: *** [scripts/Makefile.host;17: scripts/dtc/dtc-parser.tab.h] Error 1
make[1]: *** Deleting file 'scripts/dtc/dtc-parser.tab.h'
make[1]: *** [scripts/dtc/dtc-parser.tab.h] Deleting file
'scripts/dtc/dtc-parser.tab.c'
make: *** [Makefile;1260: scripts_dtc] Error 2




-- 
Best Regards
Masahiro Yamada
