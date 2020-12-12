Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3982D88C5
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Dec 2020 18:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732158AbgLLRte (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 12 Dec 2020 12:49:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgLLRt0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Dec 2020 12:49:26 -0500
Received: from nautica.notk.org (ipv6.notk.org [IPv6:2001:41d0:1:7a93::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F06C0613CF;
        Sat, 12 Dec 2020 09:48:46 -0800 (PST)
Received: by nautica.notk.org (Postfix, from userid 1001)
        id 7FECBC009; Sat, 12 Dec 2020 18:48:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
        t=1607795323; bh=6jNxUhafw80XJW0WSZExsgVli3qWFNDqo5FolrVmiRY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fMijNZFQAEDU1akj6LT6eWxrqxHtibNpYRWAePwkhu5MFby7/RtOtUopfEi+i6YHg
         Jd0Ymtj/vmEzT8mCiH09TSKXxbJN/GF0m1Y690d8nEKeK3ZsJNcUsaunO98/Zp8UdS
         nnw4vxkwLu7Gwhd6frUCqT4J9W9ajJHYIrLkDSzf/ud9eAVcboQbQnNCKrjO7r6uxa
         cOKDWxYlwWLHC1kUiMiy25yLvygOs4FGFRfXER2S1bek9PyrQCCpHKeYHEijNPCCtZ
         6dw5StAd5xGwLqmhAt1O12uvBAHwIpcE3AOzpL6HgHzvi6qwfOYJo1OYSNq53E9pUm
         WMQ79mHkkkakw==
Date:   Sat, 12 Dec 2020 18:48:28 +0100
From:   Dominique Martinet <asmadeus@codewreck.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] kbuild: rewrite ld-version.sh in shell script
Message-ID: <20201212174828.GA17179@nautica>
References: <20201212165431.150750-1-masahiroy@kernel.org>
 <20201212165431.150750-3-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201212165431.150750-3-masahiroy@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada wrote on Sun, Dec 13, 2020:
> This script was written in awk in spite of the file extension '.sh'.
> Rewrite it as a shell script.

Wow! I wasn't expecting so much, would have sent some rework after the
upcoming merge window.
Thank you.

Some comments below that you can probably ignore, this works for me.


> diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> index 0f8a2c0f9502..c214aeb3200d 100755
> --- a/scripts/ld-version.sh
> +++ b/scripts/ld-version.sh
> @@ -1,11 +1,22 @@
> -#!/usr/bin/awk -f
> +#!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0
> -# extract linker version number from stdin and turn into single number
> -	{
> -	gsub(".*\\)", "");
> -	gsub(".*version ", "");
> -	gsub("-.*", "");
> -	split($1,a, ".");
> -	print a[1]*10000 + a[2]*100 + a[3];
> -	exit
> -	}
> +#
> +# Usage: $ ./scripts/ld-version.sh ld
> +#
> +# Print the linker version of `ld' in a 5 or 6-digit form
> +# such as `23501' for GNU ld 2.35.1 etc.
> +
> +first_line="$($* --version | head -n 1)"

Just nitpicking: this ($*) would fail if the argument contains spaces,
it's generally better to use "$@" or "$1" (with quotes)

Probably doesn't matter here as gcc/clang-version scripts have the same
problem, so if someone had a problem with that they probably would have
reported it there.

> +
> +if ! ( echo $first_line | grep -q "GNU ld"); then
> +	echo 0
> +	exit 1
> +fi
> +
> +# Distributions may append an extra string like 2.35-15.fc33
> +# Take the part that consists of numbers and dots.
> +VERSION=$(echo $first_line | sed 's/.* \([^ ]*\)$/\1/' | sed 's/^\(^[0-9.]*\).*/\1/')
> +MAJOR=$(echo $VERSION | cut -d . -f 1)
> +MINOR=$(echo $VERSION | cut -d . -f 2)
> +PATCHLEVEL=$(echo $VERSION | cut -d . -f 3)
> +printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL

There is a bug if there is no dot at all (e.g. if binutils ever releases
a version 3 and call it version 3 and not 3.0, the script would print
30303 because cut when no delimiter is found always returns the whole
string)
This can be fixed by artificially appending a dot to VERSION:
VERSION=$(echo $first_line | sed 's/.* \([^ ]*\)$/\1/' | sed 's/^\(^[0-9.]*\).*/\1./')

I'm not sure it's worth worrying about either.


Thanks again,
-- 
Dominique
