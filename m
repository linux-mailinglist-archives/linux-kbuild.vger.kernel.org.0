Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12EE738C59A
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 May 2021 13:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhEULZO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 May 2021 07:25:14 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:49657 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbhEULZN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 May 2021 07:25:13 -0400
Received: from leknes.fjasle.eu ([92.116.73.138]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MxVbb-1lYgTg47OD-00xoCI for <linux-kbuild@vger.kernel.org>; Fri, 21 May 2021
 13:23:46 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
        id 401BB3C4CC; Fri, 21 May 2021 13:23:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
        t=1621596222; bh=GsepezfK7SCDw4QRe3az2jXkhTITx9Jxd1jiPnHi2vo=;
        h=Resent-From:Resent-Date:Resent-To:Date:From:To:Cc:Subject:
         References:In-Reply-To:From;
        b=sozGZ0qcDkwXvXaDwvMTRYPoQLndJQZFs7rMelnUS7vu3+sZpz5ZjYy6IgzdToawt
         iNXsRGG7D39cB5QjcVKdWE6zBetAljk84BQg7JoAzswpN2mJWoy4LXrLnFEW/jpIwT
         g9CHTaSvF804qOMtn1hP8SA/rWSz9TRrjvc5y1Ao=
X-Spam-Checker-Version: SpamAssassin 3.4.5-pre1 (2020-06-20) on leknes
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.5-pre1
X-Original-To: nicolas@fjasle.eu
Received: from lillesand.fjasle.eu (unknown [IPv6:fd00::ba:f4ff:fe3b:a745])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "lillesand.fjasle.eu", Issuer "Fake LE Intermediate X1" (not verified))
        by leknes.fjasle.eu (Postfix) with ESMTPS id 83B3C3C071;
        Fri, 21 May 2021 12:29:53 +0200 (CEST)
Authentication-Results: leknes.fjasle.eu; dkim=none; dkim-atps=neutral
Received: by lillesand.fjasle.eu (Postfix, from userid 1000)
        id 17497101F68; Fri, 21 May 2021 12:29:53 +0200 (CEST)
Date:   Fri, 21 May 2021 12:29:52 +0200
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Brian Cain <bcain@codeaurora.org>,
        linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] hexagon: move core-y in arch/hexagon/Makefile to
 arch/hexagon/Kbuild
Message-ID: <YKeLoDy3QddLd6jb@lillesand.fjasle.eu>
Mail-Followup-To: Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, Brian Cain <bcain@codeaurora.org>,
        linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210512075729.60291-1-masahiroy@kernel.org>
 <20210512075729.60291-4-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210512075729.60291-4-masahiroy@kernel.org>
X-Operating-System: Debian GNU/Linux 11.0
Jabber-ID: nicolas@jabber.no
X-Provags-ID: V03:K1:S2BjR1hA9eJB9b+capvZLLcirWKGQTLrJtqrpzofzETj+2L9kib
 tL6qZDXmPdRLeULWolEDOn+hg9EFkZSSD/cmJEKKmoNQ7D6DgnTNi6dzBP/L00NQpwxENCw
 UcmvuVCI0t5fCx3v6V8C2x5Vd8z9pqAiS7zwMaXOwfcBBg+sK+NbPpFEZIrBVMbHvMN0H+r
 yX4Z3t8RVQwaQSyaYRo0Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uvJVj7LN/jA=:EN3CP+wY7nx74TC4iRpeYC
 KRuFQjz+wAoiZaj/wRe3iHqURfMDJBcmi4MNFP86ZiRKlm6CDbCW2Zv2MFjEHcio8+LXboFbk
 nHYjp/ofPxY4n5yQwn3Vh9qlmcNNNECrpsFTobylhbPsBOrJQUUOd0pe3OXhiMM3Ixqo8UVPQ
 1hYAzxNlPWL84u+Q1bnS0FX2UW68HJf8JFckuvDvB/F33f3/RyJlYjV0eHlFU2+LeFU/2/m58
 ny7JJISkerMdLqI4m3ArwQra3pqI6GGvH0nVrqayRNW6LHXTxGg76BJTEBt5XzyzOhVJTCZBg
 VU6e25BAMOnKMUBBiW6v3ueE5+TBTmcrHgahGCqQ8hp+LDy5Z+PIIPDCcRnwjh2KOakIxnyUe
 sTsxyd6h9jjSoAjeN4at+fyfL+3jNf89DQjG0PmZyoKph8e8r+FD7mTsDDm8PLdVH0AH+sS3k
 g41KMJowyZvB1Ybj6MDJje56GXYkqXxlvNuGKiLeMOVkjad1mZgNNpdZ6T/6nsyitEvKo1A7Z
 CvYaQe1uAtHCqp1G5yM/zw=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

On Wed 12 May 2021 16:57:28 GMT, Masahiro Yamada wrote:
> Use obj-y to clean up Makefile.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/hexagon/Kbuild   | 1 +
>  arch/hexagon/Makefile | 4 ----
>  2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/hexagon/Kbuild b/arch/hexagon/Kbuild
> index a4e40e534e6a..d930c2f954d5 100644
> --- a/arch/hexagon/Kbuild
> +++ b/arch/hexagon/Kbuild
> @@ -1 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +obj += kernel/ mm/ lib/

This should probably be 'obj-y' instead of 'obj'?

Kind regards,
Nicolas
