Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 987D221F56B
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2020 16:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbgGNOvZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 14 Jul 2020 10:51:25 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:19665 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728687AbgGNOvC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Jul 2020 10:51:02 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 06EEojV1012207
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2020 23:50:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 06EEojV1012207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1594738246;
        bh=4vh0FpFnzyr2Ro9+3Dle+VZRoRpEdQnYrtctd0bmD/s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=j6vFnm/+jUs9EC10jq8iGeqNRS8D+v4gbU37Gqdc93rHBiHGWezketgv3MPcPPWIG
         SJSldvHVVmDzqJj1EGCgxeQGlNfhh0Ml57XLfzisVdlcSDsqpVSY513ZNRbWI4jXp4
         fjDbCg2IMskLNf11q+AY6xrQQJx2cTHdSnZUI0BTR7euu7V0l0ZHvW55cakb6hM3dh
         rdGDOoBY6HQKuhaKZLLsarw9Ktr6He3lvWkI0viNdrLEM8g4hZSVUnnxWeDhnKdZfV
         +GWy9+6xMqs8CeGU267rUD1jZ0rJ1+kFZaHxD4nRTb5seUsP+lS0a4wwy5tIlT/xdc
         umSkBW5v4PbtQ==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id q15so8632990vso.9
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2020 07:50:46 -0700 (PDT)
X-Gm-Message-State: AOAM533qwubPbgNtImS46YhmUImcmMgbve91dHT54xudas1w+GZfxqz8
        +yjASNw2GqsOPOs9QMdksNTNwzo/E2WgaevPcwk=
X-Google-Smtp-Source: ABdhPJyQi4lQfMSf+WZQp8I8kC6QsFivvQzuE9ToPtu574TrkgLuUyNtqNmmzEtdrSE+6e3rojHAhKPH1zQPpLCAbbM=
X-Received: by 2002:a67:6c84:: with SMTP id h126mr3324325vsc.181.1594738244759;
 Tue, 14 Jul 2020 07:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX+9pxg99bT-njDG1rCVZtZGe--k8=7t6CfEnCnCwxaMA@mail.gmail.com>
In-Reply-To: <CA+icZUX+9pxg99bT-njDG1rCVZtZGe--k8=7t6CfEnCnCwxaMA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 14 Jul 2020 23:50:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQiVZeiA31QOJkGtnzb7gk1h4QYtGAUjZd2dNf4ngEJng@mail.gmail.com>
Message-ID: <CAK7LNAQiVZeiA31QOJkGtnzb7gk1h4QYtGAUjZd2dNf4ngEJng@mail.gmail.com>
Subject: Re: Building stuff only in arch/x86/boot/compressed
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Sedat,


On Tue, Jul 14, 2020 at 10:28 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Hi Masahiro,
>
> I wanted to test the patch-series "x86/boot: Remove runtime
> relocations from compressed kernel" version 4 against Linux v5.8-rc5.
>
> This modifies/touches stuff in arch/x86/boot/compressed.
>
> How can I just test the series the fast way?
>
> I tried...
>
> make $make_opts vmlinux

This does not build
under arch/x86/boot/compressed/.



>
> That takes far too long - unsure it does what I want.


bzImage wrapps vmlinux.
(setup + self-extracting-vmlinux)

So, you cannot build the decompressor only.

See this dependency:
https://github.com/torvalds/linux/blob/v5.7/arch/x86/Makefile#L259



> Thanks in advance.


$ make bzImage

... is the best I can suggest.


As I said above, Kbuild must build
vmlinux before bzImage
(so it takes far too long)
but you can skip building modules.



>
> Regards,
> - Sedat -
>
> [1] https://lore.kernel.org/patchwork/project/lkml/list/?series=&submitter=23508



-- 
Best Regards
Masahiro Yamada
