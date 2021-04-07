Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624AB356BDB
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Apr 2021 14:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352054AbhDGMOt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Apr 2021 08:14:49 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:22385 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234694AbhDGMOs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Apr 2021 08:14:48 -0400
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 137CE3rf009050;
        Wed, 7 Apr 2021 21:14:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 137CE3rf009050
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617797644;
        bh=1bEg4DwqoLkRHSlHPxJtia36wW/6/XGavCeOAqdt/M4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MZUisP48pzIRJds/I1QtyLByqUSWnKXIm0WwHLSxRz914P2cKViIvDg5tMtmxCCnM
         Fb/Y0V6JokG9EG4EQ/NYGG6eKkJKrIkysFPpl6edOv4n9g6iJUjf/lCR+ZglNH5nBL
         4OqBT/RIFPMwoeT2EhmXUYAZJJ8Jf/QzjEKXrGiqwovB2haDCgSFdRVvjn69QEqkAK
         xxoJdBv2KZy4qTh6SS3rIxrzGuP6tzQLFH7+Fv8dSI19Sp8tfWVngEMx+AI9j/KBGp
         3ZjCHkegxPwm3SkDc+sZGnW0agtdSVGaxoU2riYJyiZ1UNMvHiWpk+H8nVfSDnNoDy
         cDFCyKmDbFJKQ==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id d5-20020a17090a2a45b029014d934553c4so441176pjg.1;
        Wed, 07 Apr 2021 05:14:04 -0700 (PDT)
X-Gm-Message-State: AOAM5312enc5dp/5/1J+xmuRdg1MwzHnUqfeHrI3BldTaYEVOlhnbmjA
        JI/Ughj0gAbizvEkZHolSQ5GzuC0+isJxVWDFk0=
X-Google-Smtp-Source: ABdhPJw35iLYgW6F8pRv4BzomvWl9ZAhgwyrCah2UxF2SM8/TjJvBgSUiyG0RC1qesmmmc4T05FUYUc+9NDTDMbuC1w=
X-Received: by 2002:a17:902:d645:b029:e8:ec90:d097 with SMTP id
 y5-20020a170902d645b02900e8ec90d097mr2722925plh.47.1617797643416; Wed, 07 Apr
 2021 05:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210326211857.15156-1-unixbhaskar@gmail.com>
In-Reply-To: <20210326211857.15156-1-unixbhaskar@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 7 Apr 2021 21:13:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNATJxF0QaB9Ewe7MmLW+kiTjoc5fE_5j09wwf=f8eqX=dA@mail.gmail.com>
Message-ID: <CAK7LNATJxF0QaB9Ewe7MmLW+kiTjoc5fE_5j09wwf=f8eqX=dA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: lxdialog: A spello fix and a punctuation added
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Mar 27, 2021 at 6:21 AM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
>
> s/propperly/properly/
> s/thats/that\'s/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Applied to linux-kbuild. Thanks.


> ---
>  scripts/kconfig/lxdialog/util.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/util.c
> index 1b490d4af0d3..3f78fb265136 100644
> --- a/scripts/kconfig/lxdialog/util.c
> +++ b/scripts/kconfig/lxdialog/util.c
> @@ -363,7 +363,7 @@ void print_title(WINDOW *dialog, const char *title, int width)
>  /*
>   * Print a string of text in a window, automatically wrap around to the
>   * next line if the string is too long to fit on one line. Newline
> - * characters '\n' are propperly processed.  We start on a new line
> + * characters '\n' are properly processed.  We start on a new line
>   * if there is no room for at least 4 nonblanks following a double-space.
>   */
>  void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x)
> @@ -541,7 +541,7 @@ int first_alpha(const char *string, const char *exempt)
>   * lxdialog suggest <ESC> <ESC> which is correctly translated to two
>   * times esc. But then we need to ignore the second esc to avoid stepping
>   * out one menu too much. Filter away all escaped key sequences since
> - * keypad(FALSE) turn off ncurses support for escape sequences - and thats
> + * keypad(FALSE) turn off ncurses support for escape sequences - and that's
>   * needed to make notimeout() do as expected.
>   */
>  int on_key_esc(WINDOW *win)
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
