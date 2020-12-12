Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D65A2D88A4
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Dec 2020 18:31:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgLLRbC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 12 Dec 2020 12:31:02 -0500
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:6123 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2407639AbgLLRav (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Dec 2020 12:30:51 -0500
X-IronPort-AV: E=Sophos;i="5.78,414,1599516000"; 
   d="scan'208";a="482633059"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Dec 2020 18:30:06 +0100
Date:   Sat, 12 Dec 2020 18:30:06 +0100 (CET)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Masahiro Yamada <masahiroy@kernel.org>
cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Dominique Martinet <asmadeus@codewreck.org>,
        Matthias Maennich <maennich@google.com>,
        linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH 1/3] kbuild: do not use scripts/ld-version.sh
 for    checking spatch version
In-Reply-To: <20201212165431.150750-1-masahiroy@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2012121829560.3058@hadrien>
References: <20201212165431.150750-1-masahiroy@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On Sun, 13 Dec 2020, Masahiro Yamada wrote:

> scripts/ld-version.sh was, as its file name implies, originally intended
> for the GNU ld version, but is (ab)used for the spatch version too.
>
> Use 'sort -CV' for the version comparison, then coccicheck does not need
> to use scripts/ld-version.sh. Fix nsdeps as well.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Applied, thanks.

julia

> ---
>
>  scripts/coccicheck | 14 +++++---------
>  scripts/nsdeps     |  4 +---
>  2 files changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/scripts/coccicheck b/scripts/coccicheck
> index 209bb0427b43..d7f6b7ff130a 100755
> --- a/scripts/coccicheck
> +++ b/scripts/coccicheck
> @@ -16,7 +16,6 @@ if [ ! -x "$SPATCH" ]; then
>  fi
>
>  SPATCH_VERSION=$($SPATCH --version | head -1 | awk '{print $3}')
> -SPATCH_VERSION_NUM=$(echo $SPATCH_VERSION | ${DIR}/scripts/ld-version.sh)
>
>  USE_JOBS="no"
>  $SPATCH --help | grep "\-\-jobs" > /dev/null && USE_JOBS="yes"
> @@ -186,14 +185,11 @@ coccinelle () {
>
>      OPT=`grep "Options:" $COCCI | cut -d':' -f2`
>      REQ=`grep "Requires:" $COCCI | cut -d':' -f2 | sed "s| ||"`
> -    REQ_NUM=$(echo $REQ | ${DIR}/scripts/ld-version.sh)
> -    if [ "$REQ_NUM" != "0" ] ; then
> -	    if [ "$SPATCH_VERSION_NUM" -lt "$REQ_NUM" ] ; then
> -		    echo "Skipping coccinelle SmPL patch: $COCCI"
> -		    echo "You have coccinelle:           $SPATCH_VERSION"
> -		    echo "This SmPL patch requires:      $REQ"
> -		    return
> -	    fi
> +    if [ -n "$REQ" ] && ! { echo "$REQ"; echo "$SPATCH_VERSION"; } | sort -CV ; then
> +	    echo "Skipping coccinelle SmPL patch: $COCCI"
> +	    echo "You have coccinelle:           $SPATCH_VERSION"
> +	    echo "This SmPL patch requires:      $REQ"
> +	    return
>      fi
>
>  #   The option '--parse-cocci' can be used to syntactically check the SmPL files.
> diff --git a/scripts/nsdeps b/scripts/nsdeps
> index dab4c1a0e27d..e8ce2a4d704a 100644
> --- a/scripts/nsdeps
> +++ b/scripts/nsdeps
> @@ -12,11 +12,9 @@ if [ ! -x "$SPATCH" ]; then
>  	exit 1
>  fi
>
> -SPATCH_REQ_VERSION_NUM=$(echo $SPATCH_REQ_VERSION | ${DIR}/scripts/ld-version.sh)
>  SPATCH_VERSION=$($SPATCH --version | head -1 | awk '{print $3}')
> -SPATCH_VERSION_NUM=$(echo $SPATCH_VERSION | ${DIR}/scripts/ld-version.sh)
>
> -if [ "$SPATCH_VERSION_NUM" -lt "$SPATCH_REQ_VERSION_NUM" ] ; then
> +if ! { echo "$SPATCH_REQ_VERSION"; echo "$SPATCH_VERSION"; } | sort -CV ; then
>  	echo "spatch needs to be version $SPATCH_REQ_VERSION or higher"
>  	exit 1
>  fi
> --
> 2.27.0
>
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
