Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F2B2D48DC
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Dec 2020 19:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730901AbgLISXG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Dec 2020 13:23:06 -0500
Received: from gproxy5-pub.mail.unifiedlayer.com ([67.222.38.55]:50663 "EHLO
        gproxy5-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728099AbgLISXC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Dec 2020 13:23:02 -0500
Received: from cmgw14.unifiedlayer.com (unknown [10.9.0.14])
        by gproxy5.mail.unifiedlayer.com (Postfix) with ESMTP id DC89A1404B0
        for <linux-kbuild@vger.kernel.org>; Wed,  9 Dec 2020 11:22:09 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id n46LkcVOowNNln46LknPdl; Wed, 09 Dec 2020 11:22:09 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=A7FCwZeG c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=zTNgK-yGK50A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=BaYeErv0AAAA:8
 a=hvDuBlm12bxQwZt2C7QA:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=bGQ4bMmlmPoowcvdo74j:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=I8GmfP6hpRJ1e9IcmORUcQZIbZU+pUVsAZcRYdV366o=; b=2owOs5slhd2Er91GDytGijQzhG
        ql02CyIKfBEmDVeDfLbOvmdRxcHGFtfWyH1TjWHq2LyU9kd7VS5GcdPmmSdIPQH1W/b4IkEl54tYr
        umG1kgsEQsnFfHDf9Fua1FOxWOrW75fAGjujja+diQFjkYs5i7VuaR5O5dJ79NK2Vj6PiE/FxP80O
        XSIwrzlKGFyiSTA2rYGftSao2d+KGzx2g82Ec/MwAvtIhEGQmXlI5DULDUgtggX1ewwft7QNuagL6
        tORV/R3k312LbFUgWOwl8XiPaQc+z1lKyBY7rjwR/WabmLD9NxcpH8f5jwJ2rjIzlokIKqnBHbiCG
        ChMaxPsg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:49884 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kn46K-003bYP-UD; Wed, 09 Dec 2020 18:22:09 +0000
Date:   Wed, 9 Dec 2020 10:22:07 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dominique Martinet <asmadeus@codewreck.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ld-version: use /usr/bin/env awk for shebank
Message-ID: <20201209182207.GA143260@roeck-us.net>
References: <1606828650-29841-1-git-send-email-asmadeus@codewreck.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606828650-29841-1-git-send-email-asmadeus@codewreck.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kn46K-003bYP-UD
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:49884
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 01, 2020 at 02:17:29PM +0100, Dominique Martinet wrote:
> /usr/bin/awk is not garanteed to exist (and doesn't on e.g. nixos),
> using /usr/bin/env to have it look in PATH is more robust
> 
> Signed-off-by: Dominique Martinet <asmadeus@codewreck.org>
> Signed-off-by: Dominique Martinet <asmadeus@codewreck.org>
> ---
> I've been carrying these two patchs for local kernel development on
> nixos for a while, I don't think it'd break anything for anyone so
> might as well submit these -- please consider it :)
> 
>  scripts/ld-version.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> index f2be0ff9a738..05476b8f8925 100755
> --- a/scripts/ld-version.sh
> +++ b/scripts/ld-version.sh
> @@ -1,4 +1,4 @@
> -#!/usr/bin/awk -f
> +#!/usr/bin/env -S awk -f

This patch results in:

/usr/bin/env: invalid option -- 'S'
Try '/usr/bin/env --help' for more information.
init/Kconfig:39: syntax error
init/Kconfig:38: invalid statement
scripts/kconfig/Makefile:80: recipe for target 'defconfig' failed

when using:

env (GNU coreutils) 8.28

or any other version of "env" which doesn't support "-S".

Guenter
