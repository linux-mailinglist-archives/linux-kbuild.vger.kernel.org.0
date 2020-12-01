Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610092CA2AB
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 13:31:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgLAM1h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 07:27:37 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:41466 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgLAM1h (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 07:27:37 -0500
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 0B1CQWoB009844;
        Tue, 1 Dec 2020 21:26:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 0B1CQWoB009844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606825593;
        bh=KWhXf126QdKZSIcCJw3jkh2GX10MniKd1jCj0kydoFw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nJfgxtSftWBlTEWVRbAeA1HNHcvxd6vqlY3IDtDzIPGx3weWblfqIepRRZLUYVnlj
         X4623+/a44Ec7DYryjwWxZgPC+tXZ/BVTKwvMla2Ipr+m544Qw9qnqBBc3CWdTqGZI
         SABly++IBGRjSrVs3/VNT5LowTIsjDK6Doqi+KnyE6bJ077uiDm26c8juHY/gtEGi5
         6v8IGqH2toM0aLPmbIcEMLlVoNYL/dMyxLKrcIwnRVtHkAzmqd1blQ2ydRTerBRxsw
         vOYGM86e/PPxDrJpownLV4sdioCtRQeMlBmiVMOz7xjdnzgKrH9ZlLvRWCa8DDRijp
         nJ4GEYrtfaLJw==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id v1so1129771pjr.2;
        Tue, 01 Dec 2020 04:26:32 -0800 (PST)
X-Gm-Message-State: AOAM533aih94qkAQmebMSGtBs6ep7SJEiAnBCbRZu3sv/i8a8Usr34HG
        6Pc3GiQL9kr96t6j7DZKJuqsHxE6aWZe1Kl63P0=
X-Google-Smtp-Source: ABdhPJxrotxNyHz233h6Czrg+SlWWO9Z9TFpx4dm8LPfrSJcncE+mazgZwdvVQ573qCfB2t7UjUoLvqxAyFiV3KyE4I=
X-Received: by 2002:a17:90a:c209:: with SMTP id e9mr2490401pjt.87.1606825592194;
 Tue, 01 Dec 2020 04:26:32 -0800 (PST)
MIME-Version: 1.0
References: <20201128004505.27619-1-scott.branden@broadcom.com>
In-Reply-To: <20201128004505.27619-1-scott.branden@broadcom.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 1 Dec 2020 21:25:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNATD0J3C_mFrXAju8-WmdCmrPmRFn7Um0yebnfL-_zcu8w@mail.gmail.com>
Message-ID: <CAK7LNATD0J3C_mFrXAju8-WmdCmrPmRFn7Um0yebnfL-_zcu8w@mail.gmail.com>
Subject: Re: [PATCH] menuconfig,mconf-cfg: Allow specification of ncurses location
To:     Scott Branden <scott.branden@broadcom.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Broadcom Kernel Feedback List 
        <bcm-kernel-feedback-list@broadcom.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Bruce Ashfield <bruce.ashfield@windriver.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Michal Marek <mmarek@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Nov 28, 2020 at 9:45 AM Scott Branden
<scott.branden@broadcom.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@windriver.com>
>
> In some cross build environments such as the Yocto Project build
> environment it provides an ncurses library that is compiled
> differently than the host's version.  This causes display corruption
> problems when the host's curses includes are used instead of the
> includes from the provided compiler are overridden.  There is a second
> case where there is no curses libraries at all on the host system and
> menuconfig will just fail entirely.
>
> The solution is simply to allow an override variable in
> check-lxdialog.sh for environments such as the Yocto Project.  Adding
> a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue and allowing
> compiling and linking against the right headers and libraries.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> cc: Michal Marek <mmarek@suse.cz>
> cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> ---


Some people solve the cross-compiling in Yocto
by using pkg-config.


For example,

commit 067c650c456e758f933aaf87a202f841d34be269
Author: Pavel Modilaynen <pavel.modilaynen@axis.com>
Date:   Fri Jul 12 13:52:19 2019 +0200

    dtc: Use pkg-config to locate libyaml

    Using Makefile's wildcard with absolute path to detect
    the presence of libyaml results in false-positive
    detection when cross-compiling e.g. in yocto environment.



mconf-cfg.sh already allows the path flexibility with pkg-config.
Why do you want yet another hook?








>  scripts/kconfig/mconf-cfg.sh | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  mode change 100755 => 100644 scripts/kconfig/mconf-cfg.sh
>
> diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
> old mode 100755
> new mode 100644
> index aa68ec95620d..32448bc198a5
> --- a/scripts/kconfig/mconf-cfg.sh
> +++ b/scripts/kconfig/mconf-cfg.sh
> @@ -4,6 +4,14 @@
>  PKG="ncursesw"
>  PKG2="ncurses"
>
> +if [ "$CROSS_CURSES_LIB" != "" ]; then
> +    echo libs=\'$CROSS_CURSES_LIB\'
> +    if [ x"$CROSS_CURSES_INC" != x ]; then
> +       echo cflags=\'$CROSS_CURSES_INC\'
> +    fi
> +    exit 0
> +fi
> +
>  if [ -n "$(command -v pkg-config)" ]; then
>         if pkg-config --exists $PKG; then
>                 echo cflags=\"$(pkg-config --cflags $PKG)\"
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
