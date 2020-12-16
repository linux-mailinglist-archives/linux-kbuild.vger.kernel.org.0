Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9932DBB59
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Dec 2020 07:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbgLPGoM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Dec 2020 01:44:12 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:37143 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725824AbgLPGoM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Dec 2020 01:44:12 -0500
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 0BG6h8gp005768
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Dec 2020 15:43:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 0BG6h8gp005768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608100989;
        bh=/MPzK9zwfCfzRXuQ/4uA2kQi/dY74KHG/tN8xcPYXTw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Nch+uGlyCRL2FKI3NZVcn4rWKF0LJmhcNuCmNPYjEJiXpZxuTwabOol2VtulhpdF8
         o28WqgnYtU7FSeNgYrDOyq009spqqcHghono0XfpNPIqwce2+M2DXXfwn4pylhWOGn
         +sTFbGOd95X1pDBTxBqkI3LzVBXovr/PZem4u0zSyBDOjwPiLt5qkefj0UQquYkoHx
         5Th1ceJFkzizL4t9b9aO4wG9Dd/RuH2/ZreZ1Elyxtzdsxuunght10odMj/ARD3Vnk
         wnqXNKVk1dPyfhlyKIlLs5qMW11hw+Qt+GLjWGz3VMYPOVYbNvD5bmAn8VKxjD6nQW
         s2RMbdn2NZmyg==
X-Nifty-SrcIP: [209.85.210.178]
Received: by mail-pf1-f178.google.com with SMTP id h186so5514335pfe.0
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Dec 2020 22:43:08 -0800 (PST)
X-Gm-Message-State: AOAM532VaOucxWmpXWnts/A97oxDJh851ysZKPuVwySIDngKFifmPksv
        J1+eggkNDFjovcN/Z2eeg7YYEJonApCkj2cI0fk=
X-Google-Smtp-Source: ABdhPJxyrgUay851vCfle9WXgK3QIO/u8A7BBYc2nHyZx45dKSIMoDNv8VVKz6kDBdb7Iwjq1Pt14OK6i4cA5J89C9s=
X-Received: by 2002:a63:4821:: with SMTP id v33mr32071486pga.7.1608100988069;
 Tue, 15 Dec 2020 22:43:08 -0800 (PST)
MIME-Version: 1.0
References: <CAL1ky9qQtFnJ0+2BBu6OwafaZex9_i+DQJgs3Nij2J06tge26w@mail.gmail.com>
In-Reply-To: <CAL1ky9qQtFnJ0+2BBu6OwafaZex9_i+DQJgs3Nij2J06tge26w@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 16 Dec 2020 15:42:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS53U1rFycYdm9skPdTEoeYgh--eioYLV_8KYKqPDJ==Q@mail.gmail.com>
Message-ID: <CAK7LNAS53U1rFycYdm9skPdTEoeYgh--eioYLV_8KYKqPDJ==Q@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Support building mconf with vendor sysroot ncurses.
To:     John Millikin <jmillikin@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 14, 2020 at 6:30 PM John Millikin <jmillikin@gmail.com> wrote:
>
> Adds a new fallback path in the ncurses locator for mconf to support
> host compilers with a non-default sysroot.
>
> This is similar to the hardcoded search for ncurses under
> '/usr/include', but can support compilers that keep their default
> header and library directories elsewhere.
>
> For nconfig, do nothing because the only vendor compiler I'm aware
> of with this layout (Apple Clang) ships an ncurses version that's too
> old for nconfig anyway.
>
> Signed-off-by: John Millikin <john@john-millikin.com>
> ---
>  scripts/kconfig/mconf-cfg.sh | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
> index aa68ec95620d..d38f44976418 100755
> --- a/scripts/kconfig/mconf-cfg.sh
> +++ b/scripts/kconfig/mconf-cfg.sh
> @@ -39,6 +39,15 @@ if [ -f /usr/include/ncurses.h ]; then
>   exit 0
>  fi
>
> +# As a final fallback before giving up, check if $HOSTCC knows of a default
> +# ncurses installation (e.g. from a vendor-specific sysroot).
> +echo '#include <ncurses.h>' | "${HOSTCC}" -E - >/dev/null 2>&1
> +if [ $? -eq 0 ]; then
> + echo cflags=\"-D_GNU_SOURCE\"
> + echo libs=\"-lncurses\"
> + exit 0
> +fi
> +


I think this is a nicer check
than the hard-coded /usr/include/ncurses.h.


Could you replace the last one in the current code?

if [ -f /usr/include/ncurses.h ]; then
        echo cflags=\"-D_GNU_SOURCE\"
        echo libs=\"-lncurses\"
        exit 0
fi





>  echo >&2 "*"
>  echo >&2 "* Unable to find the ncurses package."
>  echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
> --
> 2.24.3 (Apple Git-128)



-- 
Best Regards
Masahiro Yamada
