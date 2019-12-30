Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DEC612D163
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Dec 2019 16:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbfL3PNY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Dec 2019 10:13:24 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39947 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727519AbfL3PNY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Dec 2019 10:13:24 -0500
Received: by mail-oi1-f194.google.com with SMTP id c77so10533403oib.7;
        Mon, 30 Dec 2019 07:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4q+CEmiEu7tVhYU1eBAHqYL1aB2h2oHWvUZLEg1NZ+0=;
        b=utyDhwUkDJRAY2idyKxKnXYVlGMi7efqSLt0it85sAFwenQWBQsDLp6CBKB6uKWGq7
         4gSbTLToTM3d3OPfw6QJjQFuLlwst3/xgh7NDr4Fb1yPqvxEqLqxOxZGg3p6hZTBNxz3
         8dfgff1tZIpiybUUkxCNVE3Wa4m+JSm4j9169Nli72p8BAjfXRMkQ383JQDMOhQRuoJl
         rJx18apdyNEl78EwZIl34VBaW9PEKYwFBGnmPrfComrw9trFQbnHBkDc9STvn2wa5ybt
         QLQ1K2uj7YCBvR3cTHa8bUX2hsNuCtNCIQ1FEFnNDv6w185Qpd4PRjUvKDUfnOz0r0eD
         1JYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4q+CEmiEu7tVhYU1eBAHqYL1aB2h2oHWvUZLEg1NZ+0=;
        b=ec1ChZIZ6dSbFwC9Q+cDpccHbodHvwxmRFRIr1D6ETsEjgEXFiKzXMWcpJl9tGmDgq
         QT02DjY3GGt0BdSSNIB/Q4U4DUaMDlVpScZ7vvMwudAOapgBbPeKxUlkB1inLesDz2FC
         nG7VwJ/MM5WEEHtCsyYfHE3s2S+40iMi0UbuE+eJi3KSfhIEbMh1cZsMEgBN9/M08ovQ
         3iatX5L6zJzEqIzg7EU6moMJFzSvQJmJZmc6lH0mmNwSkW4iVuRTbSPqoMck3bGgx3Dy
         YzaUtGFykOgvpSiBP2P115pcu4ZZ72mqpt/JjIFIv2aX1wy7kEFf7LBhmPbwnbPsogy+
         DQWg==
X-Gm-Message-State: APjAAAW0csaiDLL+2oBmhBjuahDQZYZKnNnS97DLpQfl14ggWiV+jXrz
        gs1kdJwLEnbaOXNwRrDRoL+8G3ryyQgZ5Tat2xQ=
X-Google-Smtp-Source: APXvYqyn2YFl5zcMnOSPe3unj9Lho2H4sZOI0TJLgx65TTOo0bk/qxyeC7PECRb0LNdF36kX1ce0/ysjIERupuiHLfI=
X-Received: by 2002:aca:ec4f:: with SMTP id k76mr5253287oih.156.1577718803555;
 Mon, 30 Dec 2019 07:13:23 -0800 (PST)
MIME-Version: 1.0
References: <20191230132006.7401-1-masahiroy@kernel.org>
In-Reply-To: <20191230132006.7401-1-masahiroy@kernel.org>
From:   Justin Capella <justincapella@gmail.com>
Date:   Mon, 30 Dec 2019 07:13:10 -0800
Message-ID: <CAMrEMU_5XmUmKmF99gg-RBkBAvpAbnM6G=Y0cBajcE2HMUQssg@mail.gmail.com>
Subject: Re: [PATCH] initramfs: fix 'bad variable name' error in gen_initramfs_list.sh
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        "Jory A . Pratt" <anarchy@gentoo.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I was looking at this, and in theory there are other problems that
could arise from non-escaped characters, or things with leading
hyphens... In general it isn't great to assume ls output will play
nicely with the internal field separator / IFS. I think a better
solution would be to use something like ${foo@Q} and instead of trying
to scrape ls -l, maybe using stat, since it can be asked to print out
the device number.

But I don't think this patch fixes the problem mentioned at all-- I
think the problem is initfs is not a variable name on line 61:

$(call if_changed,initfs)

https://github.com/torvalds/linux/blob/351c8a09b00b5c51c8f58b016fffe51f87e2d820/usr/Makefile#L61

The Makefile and script look like more patches would be needed to fix
mentioned issue, and I'm kind of wondering what the intent behind
lines 31-32 is...

ramfs-input := $(if $(filter-out "",$(CONFIG_INITRAMFS_SOURCE)), \
$(shell echo $(CONFIG_INITRAMFS_SOURCE)),-d)

why filter nothing, why shell echo?

Quoting and/or proper escaping would be needed in many other places,
and I suspect cpio input is always regenerated... The use of sed to
manually escape things and suggesting using \ instead of using the
argument terminator "--"... If weird paths with spaces and stuff are a
requirement for the script needs some overhauling

On Mon, Dec 30, 2019 at 5:21 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Prior to commit 858805b336be ("kbuild: add $(BASH) to run scripts with
> bash-extension"), this shell script was almost always run by bash since
> bash is usually installed on the system by default.
>
> Now, this script is run by sh, which might be a symlink to dash. On such
> distros, the following code emits an error:
>
>   local dev=`LC_ALL=C ls -l "${location}"`
>
> You can reproduce the build error, for example by setting
> CONFIG_INITRAMFS_SOURCE="/dev".
>
>     GEN     usr/initramfs_data.cpio.gz
>   ./usr/gen_initramfs_list.sh: 131: local: 1: bad variable name
>   make[1]: *** [usr/Makefile:61: usr/initramfs_data.cpio.gz] Error 2
>
> This is because `LC_ALL=C ls -l "${location}"` contains spaces.
> Surrounding it with double-quotes fixes the error.
>
> Fixes: 858805b336be ("kbuild: add $(BASH) to run scripts with bash-extension")
> Reported-by: Jory A. Pratt <anarchy@gentoo.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  usr/gen_initramfs_list.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/usr/gen_initramfs_list.sh b/usr/gen_initramfs_list.sh
> index 0aad760fcd8c..2bbac73e6477 100755
> --- a/usr/gen_initramfs_list.sh
> +++ b/usr/gen_initramfs_list.sh
> @@ -128,7 +128,7 @@ parse() {
>                         str="${ftype} ${name} ${location} ${str}"
>                         ;;
>                 "nod")
> -                       local dev=`LC_ALL=C ls -l "${location}"`
> +                       local dev="`LC_ALL=C ls -l "${location}"`"
>                         local maj=`field 5 ${dev}`
>                         local min=`field 6 ${dev}`
>                         maj=${maj%,}
> --
> 2.17.1
>
