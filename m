Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86F46162647
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2020 13:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgBRMlT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Feb 2020 07:41:19 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:57547 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbgBRMlT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Feb 2020 07:41:19 -0500
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 01ICf2jT028318
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Feb 2020 21:41:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 01ICf2jT028318
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582029663;
        bh=5WLyBNqBfdHbXYcVbM4zJouzFsvML+0yqJnzNVlR5y4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bdjuPCCoRQrRKByanB4+c05cQY7zO0rPYRmM5kDyiwgJUB1y/K32drUDSu29u2/99
         nCx5sGqi+siuBCbe+uxYTpqMipVw6akIrFfOcOVKEQNfZbhSmhfBSsDjCvJEgRnE7J
         dpUOczs7kXzClHdHqj+vS/d7v2CQ6OFKmqblow3r8BppPW/zyEIafHObRBvNqBau63
         l6Mlwszu/rom6DeDRjAOM7X5MZRk5nZohB42avIvq0M9OzTzU7LLduDPWPU5B4Ls0p
         1By3oiCKYnTXbHBf6KtTvTWhDhRBGrq+8cKFbHg/ZgFZTCgvdhrfYNZEmXmcGSfg6d
         rhJZtLf4gCnSw==
X-Nifty-SrcIP: [209.85.222.52]
Received: by mail-ua1-f52.google.com with SMTP id 73so7378391uac.6
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Feb 2020 04:41:03 -0800 (PST)
X-Gm-Message-State: APjAAAVQ4KzU/KnBx/J8sjW6Sjeydq5kP53Z9Ycfdqz6EG9CjGS4x35y
        EaokqDT6kQWNQBxze3X3MKeY9+dtWNb5MO8/clc=
X-Google-Smtp-Source: APXvYqyOx0VaGjr3MLtfBXvQBCzxhxw/amncW9F7TWzMdPNiNjJ9e1zJFUwPiaYkCDZuL7Ij/S4cVsEv1be0B4hehF0=
X-Received: by 2002:ab0:45c7:: with SMTP id u65mr9743531uau.109.1582029661933;
 Tue, 18 Feb 2020 04:41:01 -0800 (PST)
MIME-Version: 1.0
References: <20200218111842.1641-1-mpe@ellerman.id.au>
In-Reply-To: <20200218111842.1641-1-mpe@ellerman.id.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 18 Feb 2020 21:40:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNARM5nf4NhG=E7UZedDpm_Ndwa5zFCDF=XFM7gXBf5uVow@mail.gmail.com>
Message-ID: <CAK7LNARM5nf4NhG=E7UZedDpm_Ndwa5zFCDF=XFM7gXBf5uVow@mail.gmail.com>
Subject: Re: [PATCH] powerpc/Makefile: Mark phony targets as PHONY
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     linuxppc-dev@ozlabs.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 18, 2020 at 8:19 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Some of our phony targets are not marked as such. This can lead to
> confusing errors, eg:
>
>   $ make clean
>   $ touch install
>   $ make install
>   make: 'install' is up to date.
>   $
>
> Fix it by adding them to the PHONY variable which is marked phony in
> the top-level Makefile. In arch/powerpc/boot/Makefile we do it
> manually.


You can do likewise in arch/powerpc/boot/Makefile
because it is marked phony in scripts/Makefile.build





-- 
Best Regards
Masahiro Yamada
