Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E02C04431E7
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Nov 2021 16:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhKBPlu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Nov 2021 11:41:50 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:36861 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233646AbhKBPlu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Nov 2021 11:41:50 -0400
Received: from leknes.fjasle.eu ([92.116.76.76]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MTzjI-1n8qMj3B1G-00R3xe; Tue, 02 Nov 2021 16:38:11 +0100
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
        id 727003C3D9; Tue,  2 Nov 2021 16:38:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
        t=1635867489; bh=610F5WQ1yx00SQhXjORlJmcFXU+UbMId6bsECwrpfn8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IgDh870Zj5sQ5YDAl8AKuuz1QJlBcbkdwlcNlIa1gqYCMKhvecjbt6Yf90up6GMnr
         yfDURdXFTfvilYkmrOLdmey6nmR2z6f/GQfsD2sQIFvwf1eSBvoUCSoARwvtXwUObk
         D1c2F8LIANBy11C6/IdYkZPE3XQtIIIAoom8+WoU=
Date:   Tue, 2 Nov 2021 16:38:09 +0100
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH] scripts/config: allow "O=config-dir" option
Message-ID: <YYFbYac/iU21vYiu@fjasle.eu>
References: <20211031063322.20486-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211031063322.20486-1-rdunlap@infradead.org>
X-Provags-ID: V03:K1:+uVDPtlmlyJvq2GmWsJpFq4Qj5x4+n+UMw1MRBkt/s+lVH+Sm6A
 /IK7bVO3MdIjPTzHZ2v53joBQ8U68dMLoI5NcPuUyCpndgULJ8dco7vI+qJTknFYRVyskeW
 cr+d/73ZClEndiHrUyyTH4Wi0x6WifLcYdXtoAc5kJYYaBzKHpfdMyy5OsFMUA7T8ki3ajr
 CcjeugWJ93wCfJIyWIfEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uhAdAS0dlhQ=:qs/XlNiWJLo/PZk3vPpY8i
 ZZag4tVXy06NyLg8KxXsP70a3rUokwUkxCLFVuF4uFw64fzhcWI66w6FUvfMn/dkoKsYJGLaL
 XDsgzNpVtoJWzgGFTGxZybQuD0ZzPIi+mkzY1kvKrxMWIDGY4ehWZVRYH/yKCYOUkNx86w0B+
 URi+I2RkTCSiBUnUHFO2aSS7e/nFR6I5N3IzUu/aPo0dHuTJNOz8S8xHROeFNroEwsiafBh5d
 6ToLm4A4YmfOveFybF4pbWWWyfFd0iGNEuIfksDnV41PlOZZVwRhyLFThCdyK+nj8jnyfKvjP
 vzZviGlPdOJ0nJ8/dJbteGM2EC/ZTs810pprk1uNefeAvzN9eE8BSG1qD1YVhq/gCrcjarop1
 prg6GkbyrxsSBB77XH4SguTewluQoqRJWV1rNMo3t66o/ptFA8vH0rmdp7waPGUZ1GlrQBsid
 7Uan7tQB/0gowtlS067avif7KvL9OYu2L7KOaFJKS9Cg/8MMDFKUebMT9CSGvW64Vm0A/fomr
 IjRL/Z7MgJz+BDzbSzUM8zxzXX7rq03GQgcZrbS1p07Op7xVgorpl35Isn4luoEghRlVSpL88
 1pZL4vL3DKl9M/HK+ir+c8YY24dZL8LZaeQ6A6knhDvPxI7+K5qcrmmz3Sf9pzj/gBf+F3LWo
 aQdoz8rfsCnmGa8ETQI/1CXEMJyE2NrAHEfinWo3V21jo8QxcrIsa4d7sWE84byI7rFY=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Oct 30, 2021 at 11:33:22PM -0700, Randy Dunlap wrote:
> Support "O=config-dir" as the location of the .config file
> like (some) other kernel build (make) tools do.
> 
> Someone asked for this "feature" a few months ago but I don't
> recall who it was.
> 
> Also check for the existence of the config-dir/config-file
> and report if there is no such file instead of letting grep
> report that there is no such file.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: linux-kbuild@vger.kernel.org
> Cc: Andi Kleen <ak@linux.intel.com>
> ---
>  scripts/config |   44 +++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 39 insertions(+), 5 deletions(-)
> 
> --- linux-next-20211029.orig/scripts/config
> +++ linux-next-20211029/scripts/config
> @@ -37,6 +37,7 @@ commands:
>  
>  options:
>  	--file config-file   .config file to change (default .config)
> +	O=config-dir         Specify the directory location of the config-file
>  	--keep-case|-k       Keep next symbols' case (dont' upper-case it)
>  
>  $myname doesn't check the validity of the .config file. This is done at next
> @@ -124,15 +125,48 @@ undef_var() {
>  	txt_delete "^# $name is not set" "$FN"
>  }
>  
> -if [ "$1" = "--file" ]; then
> -	FN="$2"
> -	if [ "$FN" = "" ] ; then
> +DIR=
> +FN=
> +
> +while [ "$DIR" = "" -o "$FN" = "" ]; do

shellcheck recommends to use [ .. ] || [ .. ] instead of [ .. -o .. ].

> +
> +	if [ "$1" = "" ] ; then
>  		usage
>  	fi
> -	shift 2
> -else
> +	if [ "$1" = "--file" ]; then
> +		FN="$2"
> +		if [ "$FN" = "" ] ; then
> +			usage
> +		fi
> +		shift 2
> +		continue
> +	fi
> +
> +	optn=$1
> +	optnlen=${#optn}
> +	if [ $optnlen -gt 1 ] && [ ${optn:0:2} = "O=" ]; then
> +		DIR=${optn:2}
> +		shift
> +		if [ "$DIR" = "" ]; then
> +			usage
> +		fi
> +		continue
> +	fi
> +	break	# something other than --file or O=dir
> +done
> +
> +if [ "$FN" = "" ]; then
>  	FN=.config
>  fi
> +if [ "$DIR" != "" ]; then
> +	DIR=$DIR"/"
> +fi
> +FN="$DIR""$FN"

A bike shed colour thing: I'd prefer quotes around the complete right
hand side, e.g. "${DIR}/${FN}".

> +
> +if [ ! -r $FN ]; then
             ^^^
$FN needs quotes, otherwise it may lead to syntax errors, e.g. if FN
contains spaces or other syntactical things.

I do like that feature!

With quotes round $FN:
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

> +	echo "No such config file: $FN"
> +	exit
> +fi
>  
>  if [ "$1" = "" ] ; then
>  	usage
