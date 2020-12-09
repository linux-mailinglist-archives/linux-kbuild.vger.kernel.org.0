Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 233512D42C9
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Dec 2020 14:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732181AbgLINIP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Dec 2020 08:08:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732177AbgLINIG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Dec 2020 08:08:06 -0500
Received: from nautica.notk.org (ipv6.notk.org [IPv6:2001:41d0:1:7a93::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC95BC0613CF;
        Wed,  9 Dec 2020 05:07:25 -0800 (PST)
Received: by nautica.notk.org (Postfix, from userid 1001)
        id B056CC01B; Wed,  9 Dec 2020 14:07:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
        t=1607519244; bh=XWg47bgxAj8nQZjE0IGan2QQPTetflZ/x0QygfsXtHw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H9bt2GdanC69DfdfCbF7ucTssXSoXeC+arfv7Hl3DbXxw3pk3DxadlTliEllMecCc
         3A5N8Y6ROH2vD879DWIk5kSKpeelX+1TbC4GtNN3npmGpgnF72Cr4DOQsem0ZbLkm1
         OhWEk3BkQu4yoYdc4ZEl/yix524KAPOs2wLyAMmdVCmML1VYiS8bbtHkisbboX0KOx
         UQKGdCNXk4dP6Gy/IvV845woK3e72Nxypix//fuV1jELNcd+JjchnW+3VjX6EVuPdD
         NzJZuWZUJzOMdVXYG5Q31deQ3ghgT1omRSzVxslcG2vtdvdA+ScBcy+zcZV+f1xqQ1
         ozR1YvgeFmJPA==
Date:   Wed, 9 Dec 2020 14:07:09 +0100
From:   Dominique Martinet <asmadeus@codewreck.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: Re: Broken /usr/bin/env (invalid option)
Message-ID: <20201209130709.GB15469@nautica>
References: <20201209122437.GA26815@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201209122437.GA26815@kozik-lap>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Krzysztof Kozlowski wrote on Wed, Dec 09, 2020:
> Your commit ece075366294 ("ld-version: use /usr/bin/env awk for
> shebank") breaks current linux-next on Ubuntu 16.04:
> 
>     $ make defconfig
> 
>     make[1]: Entering directory '/mnt/data2/linux/linux-upstream/out'
>       GEN     Makefile
>     *** Default configuration is based on 'multi_v7_defconfig'
>     /usr/bin/env: invalid option -- 'S'
>     Try '/usr/bin/env --help' for more information.
>     init/Kconfig:39: syntax error
>     init/Kconfig:38: invalid statement
>     ../scripts/kconfig/Makefile:80: recipe for target 'defconfig' failed
>     make[2]: *** [defconfig] Error 1
>     /mnt/data2/linux/linux-upstream/Makefile:602: recipe for target 'defconfig' failed
>     make[1]: *** [defconfig] Error 2
>     make[1]: Leaving directory '/mnt/data2/linux/linux-upstream/out'
>     Makefile:185: recipe for target '__sub-make' failed
>     make: *** [__sub-make] Error 2
> 
> https://krzk.eu/#/builders/12/builds/1170/steps/4/logs/stdio
> 
> It's not possible to build anything...

Hm, what version of env is that?
I only checked on a couple of systems that env -S exists, but it might
not be available (e.g. now I'm looking, at least busybox env does not
provide -S)

OTOH, we need -S to split arguments because the kernel splits the
shebang as [binary, single argument], so without it awk wouldn't work.

Apparently gawk can work without an explicit -f is invoked as gawk (so
could be used without -S), but that won't be much better wrt
compatibility in my opinion.


I don't see any way to make this work out of the box for me (awk not in
/usr/bin) and you (env not supporting -S), but I guess I can keep that
patch around locally...

Sorry for the trouble.
-- 
Dominique
