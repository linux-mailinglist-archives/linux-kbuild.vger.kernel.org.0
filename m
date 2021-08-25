Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA133F883D
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Aug 2021 15:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242295AbhHZNB0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Aug 2021 09:01:26 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:45495 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237214AbhHZNB0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Aug 2021 09:01:26 -0400
Received: from leknes.fjasle.eu ([92.116.68.110]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MvbOA-1n8KF12Ipq-00sayg; Thu, 26 Aug 2021 15:00:21 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
        id 57C093C081; Thu, 26 Aug 2021 15:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.5-pre1 (2020-06-20) on leknes
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.5-pre1
X-Original-To: nicolas@fjasle.eu
Received: from lillesand.fjasle.eu (lillesand.fjasle.eu [10.10.0.51])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "lillesand.fjasle.eu", Issuer "Fake LE Intermediate X1" (not verified))
        by leknes.fjasle.eu (Postfix) with ESMTPS id 0C8B13C04F;
        Wed, 25 Aug 2021 22:20:15 +0200 (CEST)
Received: by lillesand.fjasle.eu (Postfix, from userid 1000)
        id 9C7DF101848; Wed, 25 Aug 2021 22:20:14 +0200 (CEST)
Date:   Wed, 25 Aug 2021 22:20:14 +0200
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: add generic install.sh
Message-ID: <YSal/kodID/iE9NO@lillesand.fjasle.eu>
Mail-Followup-To: Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
References: <20210824165024.303771-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210824165024.303771-1-masahiroy@kernel.org>
X-Operating-System: Debian GNU/Linux bookworm/sid
Jabber-ID: nicolas@jabber.no
X-TUID: xqPv7H8SYeWU
X-UID:  9230
X-Keywords:                                                                     
X-Provags-ID: V03:K1:IQYv8p3dqZdlRxuNkMnxO8SncifLGHY6vcaZUA9+H9wZEEf6ras
 OMhN4KpIE78hgbxhH+Bqc5NEoS0CbOI3J36h5bdhXQNa+t26CeYdCWdP9iEzJeVDANftYkr
 UsUn+mluAm4tfQVsL50Z6FwRYO/BOMADAfFBbeqVg7QZ4kSqfFCcu8UUNJyuchPxHGR2xXj
 rUgEL8ZDDULsJ5yaU4ozA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Li05EnwIX/E=:QKsTnswyNZrPuriLtsGFGh
 GNJGsl+R8ze6fY+oxOoUAGIX7uRIyPaNcHJ28cq398sGJt5qdo1sfMb2U/S+BoOc/YCi4wJUW
 wNL8FDQCRwBZye6t6nEo2+zDxH2vZAYJDzub3PXTwqvVOmi1Jt3SC+G7IaSFwkBbFPaujNVo+
 7asYpdmC9pDhPtxjCBkZN2mEq9+3pl7fEVboFjyQcLJSD9x7rL8eVt1KOG9+P/AKehPtqeB27
 Hu2bHud+v3QGF8cPvl2L7S6Yaj72jiISOtuTVUSu8ST+lKs4ElapJd7/wfaYxY9/btvA/rM8b
 ncZTDcDi11KAg5V/kgWy1mrrkidoibmppy66MoRnKWXCApVRb2MqSqw30TEkvlBEKYcIhkIHN
 MtkqbtcPC21A1X78r9LRxm04Io/DsYN476fDTmTcoH+K/JsfAddMtMSqFHLYY2j2vCt7zZZvJ
 DMids2Pwulf+E09cg8OsgitiOg6MhsWAQd2bKZP9Pj42Ca8hikBLynlGkELRbvcB2Uwm3Tw3w
 n/x4kiZUyV8K50jIlCetz880o4jo/t/bd45n5VVozCkS2Pq/nV9hA8I4lxbIEmMTinITbth63
 Dw9UA/Tq6jzLTtKpniQ1NJHKGGPdfAfnunPqUKK5+i8wWcht/v0fZhhxUXrAsFvpwswrY/Wxi
 EwjJGETXAU+Vgl878wfemTjJHqwFbyuvN7ahlgblkcohAqG37vxFF0LRd74PSlSmbmoVsylrZ
 ZRrMSkWAaW1ru3QUcxLytwLjft9uHKywNZhotw==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 25 Aug 2021 01:50:24 +0900 Masahiro Yamada wrote:
> Many architectures has a similar install.sh script.
> 
> The first half is really generic; ensures the kernel image and the map
> file exist, then invokes ~/bin/${INSTALLKERNEL} or /sbin/${INSTALLKERNEL}
> if available.
> 
> The second half is kind of arch-specific. It just copies the kernel image
> and map file to the destination, but the code is slightly different.
> (Maybe, this part can be consolidated as well if we want).
> 
> This patch factors out the generic part into scripts/install.sh, which
> will architectures to drop the duplicated code.
      ^
I am afraid, a word is missing here, e.g.:
... which will allow architectures to drop ...?

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile           |  8 ++++++++
>  scripts/install.sh | 43 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100755 scripts/install.sh
> 
> diff --git a/Makefile b/Makefile
> index 185ce47d6734..725eadc4fcb8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1325,6 +1325,14 @@ scripts_unifdef: scripts_basic
>  
>  install: sub_make_done :=
>  
> +# Install $(KBUILD_IMAGE) by default.
> +# If necessary, override install-image per target.
> +install-image = $(KBUILD_IMAGE)
> +
> +quiet_cmd_install = INSTALL $(INSTALL_PATH)
> +      cmd_install = scripts/install.sh $(KERNELRELEASE) $(install-image) \
> +			System.map "$(INSTALL_PATH)"
> +
>  # ---------------------------------------------------------------------------
>  # Tools
>  
> diff --git a/scripts/install.sh b/scripts/install.sh
> new file mode 100755
> index 000000000000..6ac0e0c0f078
> --- /dev/null
> +++ b/scripts/install.sh
> @@ -0,0 +1,43 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# This file is subject to the terms and conditions of the GNU General Public
> +# License.  See the file "COPYING" in the main directory of this archive
> +# for more details.
> +#
> +# Copyright (C) 1995 by Linus Torvalds
> +#
> +# Adapted from code in arch/i386/boot/Makefile by H. Peter Anvin
> +#
> +# Arguments:
> +#   $1 - kernel version
> +#   $2 - kernel image file
> +#   $3 - kernel map file
> +#   $4 - default install path (blank if root directory)
> +
> +verify () {
> +	if [ ! -f "$1" ]; then
> +		echo >&2
> +		echo >&2 " *** Missing file: $1"
> +		echo >&2 ' *** You need to run "make" before "make install".'
> +		echo >&2
> +		exit 1
> +	fi
> +}
> +
> +# Make sure the files actually exist
> +verify "$2"
> +verify "$3"
> +
> +# User/arch may have a custom install script
> +
> +for script in "~/bin/${INSTALLKERNEL}" "/sbin/${INSTALLKERNEL}" \

Quoted ~ will not be expanded.  Either you need to put the leading ~/ 
before the quotes, or replace it by ${HOME}.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

> +		"arch/${SRCARCH}/install.sh" "arch/${SRCARCH}/boot/install.sh"
> +do
> +	if [ -x "${script}" ]; then
> +		exec "${script}" "$@"
> +	fi
> +done
> +
> +echo "No install script found" >&2
> +exit 1
> -- 
> 2.30.2
> 
