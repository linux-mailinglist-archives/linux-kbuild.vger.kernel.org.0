Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A796923215A
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jul 2020 17:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgG2POv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Jul 2020 11:14:51 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:29214 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgG2POv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Jul 2020 11:14:51 -0400
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 06TFEDHc030372;
        Thu, 30 Jul 2020 00:14:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 06TFEDHc030372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596035654;
        bh=K/lBXbWR+x3txyjbotv/nZAEEMUAZKchfnFj0DToDWk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uvIaubtEdgqQhZN5q3je9HyiqlDhgFOwhJAXmAorB38dYKVyuf3iaU/4QIQekt/ou
         q2s7aKQmNuFezqPlFZdXU1JmjILyBT5HH6dWcKBIEbOHRVl92uthyb/1gx6LSULxEf
         d5BaDB86rifemvBOgKQX5hfXkEGRSS02NQ0msW7LBBvAuBDIz4FwrzvQBKoXdbEdRG
         qyWwL0/Gg597sCbwgEPAhc7xENBYiptI1+381Tw7+Rg8xnlBqyFHjynfPkPI3lR5P4
         gpJauwPT7iZF6PkRLC2xSjXf3LXHtsW9x2shvSFq5cBmLqW9/im4Mase5tWr3U7i1B
         tRfM+NK8I3T9Q==
X-Nifty-SrcIP: [209.85.222.52]
Received: by mail-ua1-f52.google.com with SMTP id p27so3477359uaa.12;
        Wed, 29 Jul 2020 08:14:14 -0700 (PDT)
X-Gm-Message-State: AOAM532OJ/T+3gtbxaA7HjHnBpn1DNBKfPT8rU7ckCByo2Nbf+O7ejts
        SOp57ysObCGe928NkAr9DZnkPGYLyFmRue7l5Pw=
X-Google-Smtp-Source: ABdhPJyCO5ocIjSjCCCrBg/b+UNbHdAmrpbxBUNLui4XBSWgs2nOELlaJBu55/dPeNbkp8CEnFdZM5xW9ytKZxMTdfg=
X-Received: by 2002:ab0:2390:: with SMTP id b16mr6263692uan.25.1596035652852;
 Wed, 29 Jul 2020 08:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <DB7PR08MB380100FDD4D1B11062FA57819C690@DB7PR08MB3801.eurprd08.prod.outlook.com>
 <CAK7LNAQm87ykKi=OfToZRy2JtNt0OX3n6kXpNxNW5W7HREh4NA@mail.gmail.com> <DB7PR08MB38014590A0A929CF017546E89C700@DB7PR08MB3801.eurprd08.prod.outlook.com>
In-Reply-To: <DB7PR08MB38014590A0A929CF017546E89C700@DB7PR08MB3801.eurprd08.prod.outlook.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 30 Jul 2020 00:13:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNATO-z+S_jH_g9J1WFvzG1vqtODdK5vrav6xOV341yGX9g@mail.gmail.com>
Message-ID: <CAK7LNATO-z+S_jH_g9J1WFvzG1vqtODdK5vrav6xOV341yGX9g@mail.gmail.com>
Subject: Re: linux-5.8-rc4/scripts/kconfig/qconf.cc: 2 * bad delete ?
To:     David Binderman <dcb314@hotmail.com>
Cc:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 29, 2020 at 3:28 PM David Binderman <dcb314@hotmail.com> wrote:
>
> Hello there,
>
> >Will you send a patch, or shall I do it?
>
> Option 2 please. I gave up doing kernel patches a long time ago.

OK, I will send a patch.


> >Could you please teach me how to reproduce them?
>
> --language=c++ looks like a good candidate for a fix.
>
> Regards
>
> David Binderman
>

--language=c++ made no difference, but
I figured out why cppcheck did not work for me.


If scripts/kconfig/qconf.moc is remaining,
cppcheck does not work.


After I deleted it, cppcheck worked for me.


masahiro@oscar:~/workspace/linux$ make build_xconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/images.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  UPD     scripts/kconfig/qconf-cfg
  MOC     scripts/kconfig/qconf.moc
  HOSTCXX scripts/kconfig/qconf.o
  HOSTLD  scripts/kconfig/qconf
masahiro@oscar:~/workspace/linux$ cppcheck  scripts/kconfig/qconf.cc
Checking scripts/kconfig/qconf.cc ...
masahiro@oscar:~/workspace/linux$ rm -f scripts/kconfig/qconf.moc
masahiro@oscar:~/workspace/linux$ cppcheck  scripts/kconfig/qconf.cc
Checking scripts/kconfig/qconf.cc ...
scripts/kconfig/qconf.cc:1242:10: error: Mismatching allocation and
deallocation: data [mismatchAllocDealloc]
  delete data;
         ^
scripts/kconfig/qconf.cc:1236:15: note: Mismatching allocation and
deallocation: data
 char *data = new char[count + 1];
              ^
scripts/kconfig/qconf.cc:1242:10: note: Mismatching allocation and
deallocation: data
  delete data;
         ^
scripts/kconfig/qconf.cc:1255:10: error: Mismatching allocation and
deallocation: data [mismatchAllocDealloc]
  delete data;
         ^
scripts/kconfig/qconf.cc:1236:15: note: Mismatching allocation and
deallocation: data
 char *data = new char[count + 1];
              ^
scripts/kconfig/qconf.cc:1255:10: note: Mismatching allocation and
deallocation: data
  delete data;
         ^








-- 
Best Regards
Masahiro Yamada
