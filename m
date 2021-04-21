Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0902C366619
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Apr 2021 09:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbhDUHQ2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Apr 2021 03:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236418AbhDUHQ0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Apr 2021 03:16:26 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 015E1C06138B
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Apr 2021 00:15:52 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQBfZ2mP0z9tk7;
        Wed, 21 Apr 2021 17:15:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1618989350;
        bh=UySx5eDRAPT7GEPHue3bdLTKovZ8cO4zdHi7YU4W7BI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Uy/lZY6VNaMmyURiWCQUNKfm1X8qkapbojxVYIJSOhTeHrX5EdMDpA/MeRALXNykq
         AcpgmUAxzfBP1X6V5ipmIyj0SfvJOSxqzd5OgAPePDr44VyB/v9eJ8yXGjbANb9u45
         HMDvdRCxLJSReeATA6vzsAQLqG2Ml+L9JhnRgf0Bog6dn0YXlUMexCKursiNxyE1ph
         R7MzsPabifeRuOGOWQ/2Kvd9DWHPjyLuLMQ3S/oRBtuPqYQRu+kShi6Rx3viEj2F1p
         mYoytYdwsF/xveja3nuaD1LDq21i4PoQO1WAm6AeP7awX/IopSJ8z62yt0ha9i8n8X
         1LsFSiiB+G61w==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Randy Dunlap <rdunlap@infradead.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: Re: powerpc{32,64} randconfigs
In-Reply-To: <45afab41-cc5f-dffa-712a-d5fb1a9d0a23@infradead.org>
References: <45afab41-cc5f-dffa-712a-d5fb1a9d0a23@infradead.org>
Date:   Wed, 21 Apr 2021 17:15:49 +1000
Message-ID: <87tuo0az16.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:
> Hi,
>
> Is there a way to do this?
>
> $ make ARCH=powerpc randconfig # and force PPC32

Sort of:

$ KCONFIG_ALLCONFIG=arch/powerpc/configs/book3s_32.config make randconfig

But that also forces BOOK3S.

> and separately
> $ make ARCH=powerpc randconfig # and force PPC64

No.

...
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

I guess your patch broke something? :D
Not sure sorry.

What about something like this?

cheers


diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 3212d076ac6a..712c5e8768ce 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -376,6 +376,16 @@ PHONY += ppc64_book3e_allmodconfig
 	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/85xx-64bit.config \
 		-f $(srctree)/Makefile allmodconfig
 
+PHONY += ppc32_randconfig
+ppc32_randconfig:
+	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/32-bit.config \
+		-f $(srctree)/Makefile randconfig
+
+PHONY += ppc64_randconfig
+ppc64_randconfig:
+	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/64-bit.config \
+		-f $(srctree)/Makefile randconfig
+
 define archhelp
   @echo '* zImage          - Build default images selected by kernel config'
   @echo '  zImage.*        - Compressed kernel image (arch/$(ARCH)/boot/zImage.*)'
diff --git a/arch/powerpc/configs/32-bit.config b/arch/powerpc/configs/32-bit.config
new file mode 100644
index 000000000000..bdf833009006
--- /dev/null
+++ b/arch/powerpc/configs/32-bit.config
@@ -0,0 +1 @@
+CONFIG_PPC64=n
diff --git a/arch/powerpc/configs/64-bit.config b/arch/powerpc/configs/64-bit.config
new file mode 100644
index 000000000000..0fe6406929e2
--- /dev/null
+++ b/arch/powerpc/configs/64-bit.config
@@ -0,0 +1 @@
+CONFIG_PPC64=y

