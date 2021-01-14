Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1972F5A14
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 05:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbhANE5k (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 Jan 2021 23:57:40 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:58229 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbhANE5k (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jan 2021 23:57:40 -0500
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 10E4ud6w028101;
        Thu, 14 Jan 2021 13:56:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 10E4ud6w028101
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1610600200;
        bh=alkNx32/Pn7CxrAXneGdwrvfeo41NsjmUKl3/mlVhtA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xZrVHEISRFJOXJWZUinTFdypaR4EPZDqDz5eEpiMO1q8w7fvbfqBcGmj6CEFdxaA9
         VsOraMV6Yud6CN7I8seSoPW3KPX94A3ukOiX7tIfs9UXG2sXAkhjvp0Z6VG+wUoDsT
         qk/pPmuO/ob8P8SDf6cBZaYev8QLe1VE3HyjE/Nd0RQAEmPx1CxZf0i/xcoqN0LPcQ
         UH8yOt/BX7J4d/KN7X8xn8M0MOCiMbdqC3x07uG4KcEB4u9DwxCJ3yaQ08lGmhQvcg
         0SzMjzzsPmYDW7q5+pJeryCUXGce85cSrfGIHzOfU/jQ29F2petNGGIWmSStTw8BcU
         HcHhKbm3mB13w==
X-Nifty-SrcIP: [209.85.214.171]
Received: by mail-pl1-f171.google.com with SMTP id j1so2315668pld.3;
        Wed, 13 Jan 2021 20:56:40 -0800 (PST)
X-Gm-Message-State: AOAM533qLW3eguMid384PmOond3wzqXBFclIgkSzce+KqCnHsf0SrnPy
        Z5WI05o+eQPmYAi7EXI8Z2Adndif9yPob8E6+Ew=
X-Google-Smtp-Source: ABdhPJww2g1FPG/R4noxYkdOnscyvrZVO/nTWkIyd4fCkHjkKTccnvG38ivGmr2nscth1WKHxusvSFDO7TRWBli7LnU=
X-Received: by 2002:a17:90a:fa0c:: with SMTP id cm12mr3098600pjb.87.1610600199281;
 Wed, 13 Jan 2021 20:56:39 -0800 (PST)
MIME-Version: 1.0
References: <20210113222112.ej4rrd5xw2pwegvw@treble>
In-Reply-To: <20210113222112.ej4rrd5xw2pwegvw@treble>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 14 Jan 2021 13:56:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNASbYiZ+UVTmUwRDGMMHQXO-oE-3a4RxbEqX+=dCG2U6dw@mail.gmail.com>
Message-ID: <CAK7LNASbYiZ+UVTmUwRDGMMHQXO-oE-3a4RxbEqX+=dCG2U6dw@mail.gmail.com>
Subject: Re: Toolchain-dependent config options
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 14, 2021 at 7:21 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> Hi Masahiro,
>
> If I copy a config with CONFIG_GCC_PLUGINS to another system which
> doesn't have the gcc-plugin-devel package, it gets silently disabled by
> "make olddefconfig".
>
> I've seen multiple cases lately where this is causing confusion.  I
> suspect the problem is getting worse with recent added support for a
> variety of toolchains and toolchain-dependent features.
>
> Would it be possible to have an error (or at least a warning) in this
> case?
>
> For example, a "depends-error" which triggers an error if its failure
> would disable a feature?
>
> --
> Josh
>


We disable any feature that is unsupported by the compiler in use.

Conventionally, we did that in the top Makefile
by using $(call cc-option, ) macro or by running some scripts.

Recently, we are moving such compiler tests to the Kconfig stage.

Anyway, we disable unsupported features so any combination
of CONFIG options builds successfully.
This will ease randconfg and allmodconfig tests.

A lot of people and CI systems are running allmodconfig tests
for various architectures and toolchains.

Introducing the build breakage is annoying.


-- 
Best Regards
Masahiro Yamada
