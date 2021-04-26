Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF5E36B028
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Apr 2021 11:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbhDZJC4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Apr 2021 05:02:56 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:20802 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232068AbhDZJC4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Apr 2021 05:02:56 -0400
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 13Q91pfm003701
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Apr 2021 18:01:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 13Q91pfm003701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619427712;
        bh=O8M1u4lKX3UcTGUmDHciwzgJ7QlrIv5ANQMpJUMJIP8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TtIcfW74695ziCEaQUOT/9L9dgj8+yZRiX38IhLwgHrv+nFpr60SLc56f7xAIEqPt
         6sckTzcQOFy7ktJe1peTj1CyG/FC+UCSt2ZHgwmk+I9p9RWLdtlX3T0Z55G9Cc0OLl
         c2SOUQQ8A9YEOM+120OdtYhcCpsSzXfj5h/tdfCQggQyeHgUaFwp11ayDdbpN66bPG
         23YlOV0+UNAd+czLjENFBAAK3A5XUJcYpHOu5lu35/MMuhpmrIdt4Qd0HtXe60OfRq
         nDzgriP+pv5frDbfmOzcljtVld6G5BKcU/PntjdrNngV+BuahgqPrOVLXDg6bPWXix
         e6huiO33SnhyA==
X-Nifty-SrcIP: [209.85.210.176]
Received: by mail-pf1-f176.google.com with SMTP id e15so1707221pfv.10
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Apr 2021 02:01:52 -0700 (PDT)
X-Gm-Message-State: AOAM533+F2P7nKEX3zdutC7uC7gDg0XV66PnOPIz6fZnkoTJ2NVa9pjE
        nYglw5KJf8Qj5FgracsKH+dpLAMq8wUKE4AhAqA=
X-Google-Smtp-Source: ABdhPJxqK9fD4iUaDfgYeXrcyWbzYgAmr7TDZ4lYRlnK+b77Yb6V7Hyuci9dHOA5Zc0RLt6WCEb8sf3nbdTmjJi29C8=
X-Received: by 2002:a65:45cf:: with SMTP id m15mr15769985pgr.7.1619427711420;
 Mon, 26 Apr 2021 02:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210425213521.3159899-1-ak@linux.intel.com>
In-Reply-To: <20210425213521.3159899-1-ak@linux.intel.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 26 Apr 2021 18:01:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNASP3yvjY-7=xTJvuXyEqZ_9uuNhAQYHm7PCXfGHKGbRsg@mail.gmail.com>
Message-ID: <CAK7LNASP3yvjY-7=xTJvuXyEqZ_9uuNhAQYHm7PCXfGHKGbRsg@mail.gmail.com>
Subject: Re: [PATCH] kbuild, link-vmlinux: Don't delete output files with make -i
To:     Andi Kleen <ak@linux.intel.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andi Kleen <andi@firstfloor.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 26, 2021 at 6:35 AM Andi Kleen <ak@linux.intel.com> wrote:
>
> From: Andi Kleen <andi@firstfloor.org>
>
> make -i is useful to see output files which normally get deleted on an
> error.  Make this work with link-vmlinux.sh too. Don't delete the output
> files on error when make -i is used.
>
> Signed-off-by: Andi Kleen <ak@linux.intel.com>
> ---
>  scripts/link-vmlinux.sh | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 0e039a4cf2cb..a1a57f214c58 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -300,6 +300,11 @@ sorttable()
>  # Delete output files in case of error
>  cleanup()
>  {
> +       # don't delete for make -i
> +       case "$MFLAGS" in
> +       *-i*) return ;;
> +       esac
> +
>         rm -f .btf.*
>         rm -f .tmp_System.map
>         rm -f .tmp_initcalls.lds
> --
> 2.25.4
>


How about removing on_exit() and on_signals() entirely?

.DELETE_ON_ERROR target removes vmlinux on error anyway.

Leaving intermediate files is safe, I think.



-- 
Best Regards
Masahiro Yamada
