Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F40532D47F3
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Dec 2020 18:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732223AbgLIR3x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Dec 2020 12:29:53 -0500
Received: from foss.arm.com ([217.140.110.172]:37972 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728369AbgLIR3x (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Dec 2020 12:29:53 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DD0B1FB;
        Wed,  9 Dec 2020 09:29:07 -0800 (PST)
Received: from [10.37.8.43] (unknown [10.37.8.43])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F37163F68F;
        Wed,  9 Dec 2020 09:29:05 -0800 (PST)
Subject: Re: [PATCH 1/2] ld-version: use /usr/bin/env awk for shebank
To:     Dominique Martinet <asmadeus@codewreck.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1606828650-29841-1-git-send-email-asmadeus@codewreck.org>
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <69c82aee-59ec-f8d8-9546-b38f85bf08c0@arm.com>
Date:   Wed, 9 Dec 2020 17:32:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1606828650-29841-1-git-send-email-asmadeus@codewreck.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Dominique,

On 12/1/20 1:17 PM, Dominique Martinet wrote:
> /usr/bin/awk is not garanteed to exist (and doesn't on e.g. nixos),
> using /usr/bin/env to have it look in PATH is more robust
> 

This patch breaks the compilation on Ubuntu 16.04 and 18.04 in fact:

make[1]: Entering directory '/data1/Projects/LinuxKernel/linux-out'
  GEN     Makefile
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
*** Default configuration is based on 'defconfig'
/usr/bin/env: invalid option -- 'S'
Try '/usr/bin/env --help' for more information.
init/Kconfig:39: syntax error
init/Kconfig:38: invalid statement
/data1/Projects/LinuxKernel/linux-mte/scripts/kconfig/Makefile:80: recipe for
target 'defconfig' failed
make[2]: *** [defconfig] Error 1
/data1/Projects/LinuxKernel/linux-mte/Makefile:602: recipe for target
'defconfig' failed
make[1]: *** [defconfig] Error 2
make[1]: Leaving directory '/data1/Projects/LinuxKernel/linux-out'
Makefile:185: recipe for target '__sub-make' failed
make: *** [__sub-make] Error 2

The problem seems to be that the minimum version of env that supports '-S' is 8.30.

Reverting the patch fixes the issue.

Thanks!

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
>  # SPDX-License-Identifier: GPL-2.0
>  # extract linker version number from stdin and turn into single number
>  	{
> 

-- 
Regards,
Vincenzo
