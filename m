Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27393A0788
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2019 18:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbfH1Qjs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 12:39:48 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:34508 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbfH1Qjs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 12:39:48 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x7SGddci009079;
        Thu, 29 Aug 2019 01:39:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x7SGddci009079
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567010380;
        bh=KKMXcx4MZH2tCnMUy9VJb4+KWRBKpdSFPmo+egKRxug=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=O2uxCK584KDa5zjAS1KvztgnLko5ByIMMxnbQtPcP1hlrzFJCm1wP27yqIoM+63ab
         YIdcSXXIflc8oS7IwRZujUG2qSlqdiIxeP4tEdFHN/kPFz1vg4U1+Zd/413eTBVerO
         SERzzCmQ6jGmYdhKFnDCHN1IB+B6dkAft1e9YQayJqDvTdtJPW4+fT0yLSZMSbvmNc
         7HfdRjXaXNOS4XaLXANWYACBNmzm3W4SB9GsO8NfKR8opwN+XN0uc/20MYyMixiEru
         bitspcYt5sRKS4x5eWyxFQ5RJ+lbFCtKNVi4EaiOixUZqYy/x2Lr1ExCIHxai5nDw+
         NvUFhIdvyEaYQ==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id q16so424573vsm.2;
        Wed, 28 Aug 2019 09:39:40 -0700 (PDT)
X-Gm-Message-State: APjAAAWWE3ooCyuYu5CT1uN75dPWWRM+39mFsm9G1eQ8QXKYJfCDYyhg
        bTBAAyK2OT1xiH08EI6orgIziuyud0xfTTqi/aA=
X-Google-Smtp-Source: APXvYqylJxRgovoI/FO2he+HZEc0MINZbZg6vw5PL1+Sf9uToYVyptIgY5ZQcKCGC9u4cLt8HneBpiSVqlx1lIRj/MM=
X-Received: by 2002:a05:6102:20c3:: with SMTP id i3mr3028094vsr.155.1567010379424;
 Wed, 28 Aug 2019 09:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190814105400.1339-1-yamada.masahiro@socionext.com> <20190814105400.1339-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190814105400.1339-2-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 29 Aug 2019 01:39:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNASwnqxT6fyv+qHTVzx_7-vZX7Rk+9D1f219Yvw1hwrZgA@mail.gmail.com>
Message-ID: <CAK7LNASwnqxT6fyv+qHTVzx_7-vZX7Rk+9D1f219Yvw1hwrZgA@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: kbuild: fix invalid ReST syntax
To:     Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 14, 2019 at 7:54 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> I see the following warnings when I open this document with a ReST
> viewer, retext:
>
> /home/masahiro/ref/linux/Documentation/kbuild/makefiles.rst:1142: (WARNING/2) Inline emphasis start-string without end-string.
> /home/masahiro/ref/linux/Documentation/kbuild/makefiles.rst:1152: (WARNING/2) Inline emphasis start-string without end-string.
> /home/masahiro/ref/linux/Documentation/kbuild/makefiles.rst:1154: (WARNING/2) Inline emphasis start-string without end-string.
>
> These hunks were added by commit e846f0dc57f4 ("kbuild: add support
> for ensuring headers are self-contained") and commit 1e21cbfada87
> ("kbuild: support header-test-pattern-y"), respectively. They were
> written not for ReST but for the plain text, and merged via the
> kbuild tree.
>
> In the same development cycle, this document was converted to ReST
> by commit cd238effefa2 ("docs: kbuild: convert docs to ReST and rename
> to *.rst"), and merged via the doc sub-system.
>
> Merging them together into Linus' tree resulted in the current situation.
>
> To fix the syntax, surround the asterisks with back-quotes, and
> use :: for the code sample.
>
> Fixes: 39ceda5ce1b0 ("Merge tag 'kbuild-v5.3' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>


Both applied to linux-kbuild.





>  Documentation/kbuild/makefiles.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index f4f0f7ffde2b..b4c28c543d72 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -1139,7 +1139,7 @@ When kbuild executes, the following steps are followed (roughly):
>
>      header-test-y
>
> -       header-test-y specifies headers (*.h) in the current directory that
> +       header-test-y specifies headers (`*.h`) in the current directory that
>         should be compile tested to ensure they are self-contained,
>         i.e. compilable as standalone units. If CONFIG_HEADER_TEST is enabled,
>         this builds them as part of extra-y.
> @@ -1147,11 +1147,11 @@ When kbuild executes, the following steps are followed (roughly):
>      header-test-pattern-y
>
>         This works as a weaker version of header-test-y, and accepts wildcard
> -       patterns. The typical usage is:
> +       patterns. The typical usage is::
>
> -                 header-test-pattern-y += *.h
> +               header-test-pattern-y += *.h
>
> -       This specifies all the files that matches to '*.h' in the current
> +       This specifies all the files that matches to `*.h` in the current
>         directory, but the files in 'header-test-' are excluded.
>
>  6.7 Commands useful for building a boot image
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
