Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA1251639FE
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Feb 2020 03:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbgBSCTZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Feb 2020 21:19:25 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:49554 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbgBSCTY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Feb 2020 21:19:24 -0500
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 01J2J3Za001115
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Feb 2020 11:19:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 01J2J3Za001115
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582078744;
        bh=L+jL0JcoNlf0UHKJ6mZ37FrTR7jyH2kKU01xh86AXXk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=g23dvbrNn+CXJFzO/H4T175z6mOjwF0INV/f0bINhb9mcvdusGidsv1cxOMuYQcE5
         dorwOxRL5U6mij3bbajdjXTR1cvzX3KNq38+TVybgCkUeFl178rLniUVUAEZhcb73m
         ATzD6+cZtEX+gwOT6BKpMzXZ7LMFAleV7d75NFcRR3wwshczf6/rPard2T0hBcpm3U
         8Zp15jGNTOhHBxN+f8vGNHHhefiqDpSlpObI13fpc8HXQ0xe61XdxOaFGJFMD/QfWG
         mkTTWDdTSt68mk+BvnVZbr/EazQUe8hnYXYGbI7MuX3QVs7MTvS0WUL1fXSGcfqlzI
         YmXb2hleZ810w==
X-Nifty-SrcIP: [209.85.222.49]
Received: by mail-ua1-f49.google.com with SMTP id f7so8282949uaa.8
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Feb 2020 18:19:04 -0800 (PST)
X-Gm-Message-State: APjAAAU0vDYwEBZS8YjuZT3+18qh7PrS0czBf0VimLoPyup6yfRqvy6n
        SKcFGUzWEdulJlKpprVIcNZGtmQkHOh+T7L2MvA=
X-Google-Smtp-Source: APXvYqwY3Ra6AbiEANnmAAI3CumDsPbdXAaz7A9RWbQE4DdUoCwWZ+bdyhN5hO+9NgYA+Ft+U8gWlIQpvopNsZMwv+o=
X-Received: by 2002:ab0:2881:: with SMTP id s1mr12182273uap.95.1582078742909;
 Tue, 18 Feb 2020 18:19:02 -0800 (PST)
MIME-Version: 1.0
References: <20200219000434.15872-1-mpe@ellerman.id.au>
In-Reply-To: <20200219000434.15872-1-mpe@ellerman.id.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 19 Feb 2020 11:18:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNARm+iePH7F-W3ur5=TfhQSAdbOzX-uLm_9Qak-hFZ2EdQ@mail.gmail.com>
Message-ID: <CAK7LNARm+iePH7F-W3ur5=TfhQSAdbOzX-uLm_9Qak-hFZ2EdQ@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/Makefile: Mark phony targets as PHONY
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     linuxppc-dev@ozlabs.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 19, 2020 at 9:04 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
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
> the top-level Makefile, or in scripts/Makefile.build for the boot
> Makefile.
>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>



-- 
Best Regards
Masahiro Yamada
