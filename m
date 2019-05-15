Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F89F1F9BC
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2019 20:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbfEOSIo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 May 2019 14:08:44 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:44636 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726842AbfEOSIo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 14:08:44 -0400
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x4FI8VT5009311;
        Thu, 16 May 2019 03:08:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x4FI8VT5009311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557943712;
        bh=6pFm6Si0MzJA90GLBMP/sW2nK2yccg1/ZbKr730+hpg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wDx042KZ/Xy6piBKo5Gu3W93+m0o840oPxcym00+7GKA+3JYNsU5KLZPQVp3HM1UW
         bSdVapy+y37aXusoKfF0ulSAp+MwoSSJVVGWEeLu0086iPkZlI1PzzGspSjrrZ+GNw
         txQnrDK56GkS6nPfB+ni4YFVD7RhMhM9H4sBNDnWL64q8kAjxsPwmpyZyybReJq9Oe
         n1OImzsIDwwfmryTTBNorL8WwqJ9qFRFmC1768K5zoo0pNFPQMoAFlmO7TzLhWly/9
         1bviLqPcupBNmeoum7VcUxZGmgYoYeArQPujANJ99p5zpXgfgm2odNyRa61qEomyzT
         FSAe9Yzlz0qPQ==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id q13so554145vso.2;
        Wed, 15 May 2019 11:08:31 -0700 (PDT)
X-Gm-Message-State: APjAAAUjw8pkzs/wAJptQaBtIC+XZ6T54BYBeLlglceVGkE2fo4IU7tE
        Myk73Qe84gdp+HnW9NvXJ11Uiow+Gqqp39xLdz4=
X-Google-Smtp-Source: APXvYqzZZx1htXz6f2GzTXyLUF2YOsNvJFgXL440Vi7ZKxgAuCywki7F2v6W8Z/X2+LnThem7cFyE76Zx6ie9hbEHdU=
X-Received: by 2002:a67:1783:: with SMTP id 125mr803135vsx.54.1557943710766;
 Wed, 15 May 2019 11:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190515073818.22486-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190515073818.22486-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 16 May 2019 03:07:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNATUvPMqt93iwzNud0mxk99Si=CEBDyjA8BLEXM_tcTBfQ@mail.gmail.com>
Message-ID: <CAK7LNATUvPMqt93iwzNud0mxk99Si=CEBDyjA8BLEXM_tcTBfQ@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: check uniqueness of basename of modules
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 15, 2019 at 4:40 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

>         $(Q)$(AWK) '!x[$$0]++' $^ > $(objtree)/modules.builtin
> diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
> new file mode 100755
> index 000000000000..944e68bd22b0
> --- /dev/null
> +++ b/scripts/modules-check.sh
> @@ -0,0 +1,18 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# Warn if two or more modules have the same basename
> +check_same_name_modules()
> +{
> +       same_name_modules=$(cat modules.order modules.builtin | \
> +                               xargs basename -a | sort | uniq -d)


I noticed a bug here.


allnoconfig + CONFIG_MODULES=y
will create empty modules.order and modules.builtin.

Then, 'basename -a' will emit the error messages
since it receives zero arguments.


basename: missing operand
Try 'basename --help' for more information.



I can fix it by checking the size of them.


    # If both modules.order and modules.builtin are empty,
    # "basename -a" emits error messages.
    if [ ! -s modules.order -a ! -s modules.builtin ]; then
            return
    fi

    same_name_modules=$(cat modules.order modules.builtin | \
                                   xargs basename -a | sort | uniq -d)




I wonder if there is a more elegant way...




> +       for m in $same_name_modules
> +       do
> +               echo "warning: same basename '$m' if the following are built as modules:"
> +               grep --no-filename -e /$m modules.order modules.builtin | \
> +                                                       sed 's:^kernel/:  :'
> +       done
> +}
> +
> +check_same_name_modules
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
