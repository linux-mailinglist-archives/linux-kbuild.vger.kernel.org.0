Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50A8F366520
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Apr 2021 08:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbhDUGEB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Apr 2021 02:04:01 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:34995 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231171AbhDUGD6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Apr 2021 02:03:58 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4FQ9300068z9v00X;
        Wed, 21 Apr 2021 08:03:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id rDYrE5nnxFhK; Wed, 21 Apr 2021 08:03:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4FQ92z666lz9v008;
        Wed, 21 Apr 2021 08:03:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id ACBC58B815;
        Wed, 21 Apr 2021 08:03:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id DeVc2UN9mFB6; Wed, 21 Apr 2021 08:03:24 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 596C88B814;
        Wed, 21 Apr 2021 08:03:24 +0200 (CEST)
Subject: Re: powerpc{32,64} randconfigs
To:     Randy Dunlap <rdunlap@infradead.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>
References: <45afab41-cc5f-dffa-712a-d5fb1a9d0a23@infradead.org>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a56093f8-9672-d815-81cc-ff0fd7743696@csgroup.eu>
Date:   Wed, 21 Apr 2021 08:03:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <45afab41-cc5f-dffa-712a-d5fb1a9d0a23@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi

Le 21/04/2021 à 01:31, Randy Dunlap a écrit :
> [time passes]
> 
> OK, I have a patch that seems for work as far as setting
> PPC32=y or PPC64=y... but it has a problem during linking
> of vmlinux:
> 
> crosstool/gcc-9.3.0-nolibc/powerpc-linux/bin/powerpc-linux-ld:./arch/powerpc/kernel/vmlinux.lds:6: syntax error
> 
> and the (bad) generated vmlinux.lds file says (at line 6):
> 
> OUTPUT_ARCH(1:common)
> 
> while it should say:
> 
> OUTPUT_ARCH(powerpc:common)
> 
> Does anyone have any ideas about this problem?

The following change fixes the problem, allthough I guess that's not what you want to do at the end.

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 1b6094a13034..00f72699c518 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -358,7 +358,7 @@ targets += $(lib-y) $(always-y) $(MAKECMDGOALS)
  # Linker scripts preprocessor (.lds.S -> .lds)
  # ---------------------------------------------------------------------------
  quiet_cmd_cpp_lds_S = LDS     $@
-      cmd_cpp_lds_S = $(CPP) $(cpp_flags) -P -U$(ARCH) \
+      cmd_cpp_lds_S = $(CPP) $(cpp_flags) -P -U$(SRCARCH) \
  	                     -D__ASSEMBLY__ -DLINKER_SCRIPT -o $@ $<

  $(obj)/%.lds: $(src)/%.lds.S FORCE


> 
> The ARCH=ppc32 / ARCH=ppc64 patch is below FYI.
> It is missing an update to Documentation/kbuild/kbuild.rst (aliases).
> 
> 
> thanks.
> 
