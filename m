Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24D502E19D2
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Dec 2020 09:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbgLWIPj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Dec 2020 03:15:39 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:28793 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbgLWIPj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Dec 2020 03:15:39 -0500
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 0BN8EghW014999
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Dec 2020 17:14:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 0BN8EghW014999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608711283;
        bh=kEG2h7lUMaa7pPjJ3mZqjny82CP0frf7EANqiEQbimc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iIip8CfsP0kk/W2aZCG+0ofsMr1xhA00xcMzlMBPKIbme87+jsoJq745Ja94I137x
         nbg64mXwSy3lEFyAPw7bgN3/9uPkL+HKI8kE8+kKfGW9cQ88Ef1lmntersVGCGvfQo
         Q9K1NfaDWOE9J9aHwT9z5F66bifcmWr4y5wFWiN3SSOa2syghrNVHMsaPKTrNfQMpy
         /v8lOJq8i4gZLCErFNrVTbMSqNkMWKkHFmmc9AeGOLug9KB5MNFHikjNIXARLpebeh
         B9ZXT+KNop5QEX3ppIm9sE7z1gDet9VJ9CWaVJ2mnS56n3tlUyad776njSriMstqbO
         l0g78l95FVD3A==
X-Nifty-SrcIP: [209.85.215.182]
Received: by mail-pg1-f182.google.com with SMTP id g15so5235320pgu.9
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Dec 2020 00:14:43 -0800 (PST)
X-Gm-Message-State: AOAM532Gijt9VBFJZAok3cOc/bM3V9p0OFt+FnRQ4R3WD3KN74GChRi0
        WmW6fQkopPjn1NlbtpD/K3A3e3zG4T9Ao/QCV/E=
X-Google-Smtp-Source: ABdhPJwzwKp7wcirDAy3pRuF9pxf4hcbzlTVMw+BR1DgOPQFfUUD/z+OJDDgb4JT7kMNNzVb28c3V3mYF5sOgJYFxy0=
X-Received: by 2002:a63:ff09:: with SMTP id k9mr4711806pgi.175.1608711282548;
 Wed, 23 Dec 2020 00:14:42 -0800 (PST)
MIME-Version: 1.0
References: <64b8db11-deeb-924f-7174-a7208190dce3@john-millikin.com>
In-Reply-To: <64b8db11-deeb-924f-7174-a7208190dce3@john-millikin.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 23 Dec 2020 17:14:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQWqoUmOgD64Peh2V_qR=EwYFMUxWsdKs4uvnMKU6Li-g@mail.gmail.com>
Message-ID: <CAK7LNAQWqoUmOgD64Peh2V_qR=EwYFMUxWsdKs4uvnMKU6Li-g@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: Support building mconf with vendor sysroot ncurses.
To:     John Millikin <john@john-millikin.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 23, 2020 at 2:04 PM John Millikin <john@john-millikin.com> wrote:
>
> Changes the final fallback path in the ncurses locator for mconf
> to support host compilers with a non-default sysroot.
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
> Changes in v2:
>   - Replace the existing check for '/usr/include/ncurses.h' instead of
>     preserving it, per review feedback.
>
>  scripts/kconfig/mconf-cfg.sh | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
> index aa68ec95620d..abb9252bde9e 100755
> --- a/scripts/kconfig/mconf-cfg.sh
> +++ b/scripts/kconfig/mconf-cfg.sh
> @@ -33,7 +33,10 @@ if [ -f /usr/include/ncurses/ncurses.h ]; then
>      exit 0
>  fi
>
> -if [ -f /usr/include/ncurses.h ]; then
> +# As a final fallback before giving up, check if $HOSTCC knows of a default
> +# ncurses installation (e.g. from a vendor-specific sysroot).
> +echo '#include <ncurses.h>' | "${HOSTCC}" -E - >/dev/null 2>&1
> +if [ $? -eq 0 ]; then

I squash these two lines as follows:

+if echo '#include <ncurses.h>' | "${HOSTCC}" -E - >/dev/null 2>&1; then


This would be robust against 'set -e'.



Applied to linux-kbuild. Thanks.




>      echo cflags=\"-D_GNU_SOURCE\"
>      echo libs=\"-lncurses\"
>      exit 0
> --



-- 
Best Regards
Masahiro Yamada
