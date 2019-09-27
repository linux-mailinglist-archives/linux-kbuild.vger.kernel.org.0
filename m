Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4CACC02C3
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Sep 2019 11:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbfI0J57 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Sep 2019 05:57:59 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:25430 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbfI0J56 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 05:57:58 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x8R9vWf1002432;
        Fri, 27 Sep 2019 18:57:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x8R9vWf1002432
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1569578253;
        bh=4qDVNhnCcZvGDKMTTIvOCeP5JH/7NpDusdsDsAqAwwE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XKYBcXnLL3ZwLskkyYgV3ToDdaoh4S6dXjI6i7nfRhPYljatB45u87bsSnkufj3LD
         vhLUDHE4hPxHEjHJPUhWFRRCy3NyyJDy6VBkWEP7hFeMwS03zu/FOfWkRcjqeyq+yQ
         xhVLn1kH2IDmWNAB4k4JZfoo08PbjP8vupONrmOvdLGoiCeAF9XNS7qy8W8X/tion1
         1Ar/Fq/riIcDGBaN72hUdjC7suttWC/SI/ugjbbGWdWkCcVHDoXjNpVb4zDmLyK0zM
         4eYjr9h42tsauJ5eK6lE/T5WBVfdtBU3APHwzUdImWW2keoHT6NnUKrkoEyd+2itFa
         mAUufZSL/FHrw==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id p13so1481496vso.0;
        Fri, 27 Sep 2019 02:57:32 -0700 (PDT)
X-Gm-Message-State: APjAAAWOawkst2/O+ZJg1Zh23WM7OZ7yZ4dZwAqMElKOsC6mHPTP1DPm
        VTmbqlXrGfauZ9+fLGXDFO5ed0XVWDv2pTLa4sI=
X-Google-Smtp-Source: APXvYqzo/9mNBtclqqTkTJmMEstPaZ5zh57euEA+T9x0aWafTycgwYSoynhe8JWUGJ3pMgFODt5t91+VngMZHC2VP7c=
X-Received: by 2002:a67:88c9:: with SMTP id k192mr1864063vsd.181.1569578251420;
 Fri, 27 Sep 2019 02:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190927093603.9140-1-yamada.masahiro@socionext.com> <20190927093603.9140-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190927093603.9140-2-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 27 Sep 2019 18:56:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNATamQYGDj0CQCn6Fg-+tNykfGqFzhjFxUyoGYxn2DSKgA@mail.gmail.com>
Message-ID: <CAK7LNATamQYGDj0CQCn6Fg-+tNykfGqFzhjFxUyoGYxn2DSKgA@mail.gmail.com>
Subject: Re: [PATCH 1/7] modpost: fix broken sym->namespace for external
 module builds
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Matthias Maennich <maennich@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Martijn Coenen <maco@android.com>,
        Will Deacon <will.deacon@arm.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 27, 2019 at 6:37 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Currently, external module builds produce tons of false-positives:
>
>   WARNING: module <mod> uses symbol <sym> from namespace <ns>, but does not import it.
>
> Here, the <ns> part shows a random string.
>
> When you build external modules, the symbol info of vmlinux and
> in-kernel modules are read from $(objtree)/Module.symvers, but
> read_dump() is buggy in multiple ways:
>
> [1] When the modpost is run for vmlinux and in-kernel modules,
> sym_extract_namespace() correctly allocates memory for the namespace.
> On the other hand, read_dump() does not, then sym->namespace will
> point to somewhere in the line buffer of get_next_line(). The data
> in the buffer will be replaced soon, and sym->namespace will end up
> with pointing to unrelated data. As a result, check_exports() will
> show random strings in the warning messages.
>
> [2] When there is no namespace, sym_extract_namespace() returns NULL.
> On the other hand, read_dump() sets namespace to an empty string "".
> (but, it will be later replaced with unrelated data due to bug [1].)
> The check_exports() shows a warning unless exp->namespace is NULL,
> so every symbol read from read_dump() emits the warning, which is
> mostly false positive.
>
> To address [1], I added NOFAIL(strdup(...)) to allocate memory.
> For [2], I changed the if-conditional in check_exports().
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Fixes: cb9b55d21fe0 ("modpost: add support for symbol namespaces")


-- 
Best Regards
Masahiro Yamada
