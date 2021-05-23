Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A669C38DAA6
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 May 2021 11:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbhEWJPO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 23 May 2021 05:15:14 -0400
Received: from mx.ungleich.ch ([185.203.112.16]:33774 "EHLO smtp.ungleich.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231599AbhEWJPO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 May 2021 05:15:14 -0400
X-Greylist: delayed 573 seconds by postgrey-1.27 at vger.kernel.org; Sun, 23 May 2021 05:15:13 EDT
Received: from nb3.localdomain (localhost [IPv6:::1])
        by smtp.ungleich.ch (Postfix) with ESMTP id 295D120104;
        Sun, 23 May 2021 11:04:14 +0200 (CEST)
Received: by nb3.localdomain (Postfix, from userid 1000)
        id 605F614C0444; Sun, 23 May 2021 11:04:40 +0200 (CEST)
References: <20210523031428.164186-1-masahiroy@kernel.org>
 <20210523031428.164186-4-masahiroy@kernel.org>
User-agent: mu4e 1.4.15; emacs 27.2
From:   Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Maennich <maennich@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] scripts/setlocalversion: factor out 12-chars hash
 construction
In-reply-to: <20210523031428.164186-4-masahiroy@kernel.org>
Date:   Sun, 23 May 2021 11:04:40 +0200
Message-ID: <87tumt6ct3.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Hey Masahiro,

Masahiro Yamada <masahiroy@kernel.org> writes:
> -			if atag="$(git describe --abbrev=12 2>/dev/null)"; then
> -				echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),substr($(NF),0,13))}'
> -
> -			# If we don't have a tag at all we print -g{commitish},
> -			# again using exactly 12 hex chars.
> -			else
> -				head="$(echo $head | cut -c1-12)"
> -				printf '%s%s' -g $head
> +			if atag="$(git describe 2>/dev/null)"; then
> +				echo "$atag" | awk -F- '{printf("-%05d", $(NF-1))}'
>  			fi
> +
> +			# Add -g and exactly 12 hex chars.
> +			printf '%s%s' -g "$(echo $head | cut -c1-12)"
>  		fi
>
>  		# Check for uncommitted changes.

That was quite fun reviewing and wrapping my head around ~20y old code.

I had a very long mail prepared looking at all the corner cases, just to
see they are actually handled before the actual change.

Nicely simplified, for all 5 of them:

Reviewed-by: Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>

--
Sustainable and modern Infrastructures by ungleich.ch
