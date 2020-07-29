Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEF4323178D
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jul 2020 04:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731030AbgG2CP1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 28 Jul 2020 22:15:27 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:39871 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728401AbgG2CP0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Jul 2020 22:15:26 -0400
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 06T2F6UI016692;
        Wed, 29 Jul 2020 11:15:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 06T2F6UI016692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1595988907;
        bh=Qkn+kiJdhteGcggEnh5A4hePD7ExGuNIIh74wMoDJJU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=umve6b0p6HKToioLtP4Ziv+K/KzsD3boGM9ulTtcboyoMyJHaON5gLb5ObRIUow0F
         o+qfyy6mVaJ+wbsg1u7+sCXM4GBrcHyGZYFeX6ceuwqMQPP8bZc5c1jsgZI0eQTyRg
         YUu56A2L4EOAnnVU92vWDt+/Wv5E+drhUELngqddl/3WndB6zG1xCsg80UzUT+/Cbe
         qdbsxDjLFx+eAwr8m1lhtwg4tyd4CIgRAfPztSJSunxLM9AQpesD/qmRbcYx8hVrdn
         LZYabkaeEhp9sjUa+xtjZh1kBsOK1U7NnYy2nXBcP031DaFpzl9aZFXJFWXT0n+DAm
         istxPBXYR1iFA==
X-Nifty-SrcIP: [209.85.217.52]
Received: by mail-vs1-f52.google.com with SMTP id k7so11294661vso.2;
        Tue, 28 Jul 2020 19:15:07 -0700 (PDT)
X-Gm-Message-State: AOAM531lLNpZ7Pz4Kz1RjZ+Vep1p7CD/J3ThCUTghxbS6Rgn33qLuC0/
        8gjqeUIToPI3HU42YUEHdMg9Dlhhx0T7xwFSowA=
X-Google-Smtp-Source: ABdhPJxHS/wdsjCJ01OGRsbq6xgw9iJxUiIoq5iqy8Ryces8bJ+zBV7WGCZ5ZFIDG281wY0aBfri71iy4As6H59X2ZQ=
X-Received: by 2002:a67:de09:: with SMTP id q9mr22428084vsk.179.1595988906252;
 Tue, 28 Jul 2020 19:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <DB7PR08MB380100FDD4D1B11062FA57819C690@DB7PR08MB3801.eurprd08.prod.outlook.com>
In-Reply-To: <DB7PR08MB380100FDD4D1B11062FA57819C690@DB7PR08MB3801.eurprd08.prod.outlook.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 29 Jul 2020 11:14:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQm87ykKi=OfToZRy2JtNt0OX3n6kXpNxNW5W7HREh4NA@mail.gmail.com>
Message-ID: <CAK7LNAQm87ykKi=OfToZRy2JtNt0OX3n6kXpNxNW5W7HREh4NA@mail.gmail.com>
Subject: Re: linux-5.8-rc4/scripts/kconfig/qconf.cc: 2 * bad delete ?
To:     David Binderman <dcb314@hotmail.com>
Cc:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 6, 2020 at 6:22 PM David Binderman <dcb314@hotmail.com> wrote:
>
> Hello there,
>
> linux-5.8-rc4/scripts/kconfig/qconf.cc:1242:10: error: Mismatching allocation and deallocation: data [mismatchAllocDealloc]
> linux-5.8-rc4/scripts/kconfig/qconf.cc:1255:10: error: Mismatching allocation and deallocation: data [mismatchAllocDealloc]
>
> new [] needs delete [].
>
> Regards
>
> David Binderman


Thanks for the report, and sorry for the delay.

Will you send a patch, or shall I do it?


BTW, I guess those error messages are from cppcheck.


Could you please teach me how to reproduce them?


I ran cppcheck against qconf.cc
but no success to check it.




masahiro@oscar:~/ref/linux$ cppcheck  scripts/kconfig/qconf.cc
Checking scripts/kconfig/qconf.cc ...
masahiro@oscar:~/ref/linux$ cppcheck --enable=all scripts/kconfig/qconf.cc
Checking scripts/kconfig/qconf.cc ...
scripts/kconfig/qconf.cc:0:0: information: This file is not analyzed.
Cppcheck failed to extract a valid configuration. Use -v for more
details. [noValidConfiguration]

^
nofile:0:0: information: Cppcheck cannot find all the include files
(use --check-config for details) [missingIncludeSystem]

masahiro@oscar:~/ref/linux$ cppcheck -v --enable=all scripts/kconfig/qconf.cc
Checking scripts/kconfig/qconf.cc ...
Defines:
Undefines:
Includes:
Platform:Native
scripts/kconfig/qconf.cc:0:0: information: This file is not analyzed.
Cppcheck failed to extract a valid configuration. The tested
configurations have these preprocessor errors:
'' : [scripts/kconfig/qconf.moc:12] #error "The header file 'qconf.h'
doesn't include <QObject>."
Q_MOC_OUTPUT_REVISION : [scripts/kconfig/qconf.moc:14] #error "This
file was generated using the moc from 5.12.8. It"
[noValidConfiguration]

^
nofile:0:0: information: Cppcheck cannot find all the include files.
Cppcheck can check the code without the include files found. But the
results will probably be more accurate if all the include files are
found. Please check your project's include directories and add all of
them as include directories for Cppcheck. To see what files Cppcheck
cannot find use --check-config. [missingIncludeSystem]







--
Best Regards
Masahiro Yamada
