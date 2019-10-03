Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBF3C96E9
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2019 05:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728486AbfJCDSw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Oct 2019 23:18:52 -0400
Received: from mail-pl1-f178.google.com ([209.85.214.178]:34993 "EHLO
        mail-pl1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728432AbfJCDSv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 23:18:51 -0400
Received: by mail-pl1-f178.google.com with SMTP id y10so811507plp.2
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Oct 2019 20:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:user-agent:date:from:to:cc:cc:subject:references
         :mime-version:content-disposition;
        bh=Qr6DS77HJ5e+p5OyN8xn8C8h5cCk4y9GoxhhXGMgws4=;
        b=ZhG4f8dhgil7a1q4qVi9HiZUlbVgjFwzOFw1q8C69lzPUGyA18w5TYOD/s49u8UtGr
         50CidJC+KEuoa75FJF9xCLdss0BEmvqE9hXX9pq9rSuGN3Odq0EgiePMHtm/jnIRmmkP
         SL0p8D4HwT6PthtcpX70YlauPFb05QEp0An3RK4GS3iMod60C9lz5XbWbnzjIrHCf4Su
         u97n0g9TNilXMV7XdIYFgbybTeN62LIchuagwIlEhaWuMSfMILjknupBp7rn418D2gv4
         UXquTzkavzsL9Ils1ZtxHCJCq/3udfA13IJzjDWAVV6GNiADJpZ427bY7xAaIUokSZhS
         d2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:user-agent:date:from:to:cc:cc:subject
         :references:mime-version:content-disposition;
        bh=Qr6DS77HJ5e+p5OyN8xn8C8h5cCk4y9GoxhhXGMgws4=;
        b=kHwXP1EHopaRlUmUh7NcxmuUrylsYfdvrvErAgZQtAtwSyVbC3GcI+1W1wM9OgNa9/
         p8ntxdzm7qmjMiClH4HoJOXtDvC1bathQWtzHtQY0Gv2gtkAlmfxiW3kdsPHcmk2B8yf
         dXCQRnGvTOx+yZXcdawczmf/U85mExXAKJs8QJg3X56bKvISakhIfeRCiLxKVEykZiE+
         kIpPI9FVLBG708jOfVNC44ObUH6RUZ88wzeT/gbgnTQWRDyPgFMLBeM+eJ7Okn4+/sSe
         l39hXMN+hlRTu2CkGGX6w7ytk01xm5s4yLR0zGfIYl6VaUn/4MZQa+AmZT3Vda5o3wp4
         ah9g==
X-Gm-Message-State: APjAAAVWAUrB3KX+/HAGZ4WGS1dhKXqKfQRPH/0ocZydjdcWZ3+QMHT9
        tHTklcSEppHtAkMNwlpTsxU92aBD
X-Google-Smtp-Source: APXvYqzdoMDa4PuwVf4armUAwaLo0nain96VzLxNHgBsgW1oeRRSUCwBVWBC5M4NFSpVKTb0HE9w2A==
X-Received: by 2002:a17:902:be09:: with SMTP id r9mr7471705pls.105.1570072730639;
        Wed, 02 Oct 2019 20:18:50 -0700 (PDT)
Received: from localhost ([2601:1c0:6280:3f0::9a1f])
        by smtp.gmail.com with ESMTPSA id c10sm828236pfo.49.2019.10.02.20.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 20:18:49 -0700 (PDT)
Message-Id: <20191003031312.374601455@gmail.com>
User-Agent: quilt/0.65
Date:   Wed, 02 Oct 2019 20:13:15 -0700
From:   rd.dunlab@gmail.com
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rd.dunlab@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     rdunlap@infradead.org
Subject: [PATCH 3/4] scripts: namespace.pl: add .o to nmexception file names and fix "acpica"
References: <20191003031312.157994411@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline; filename=scr-namespace-fix-excepts.patch
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

'nm' exceptions are checked against $fullname, which includes the
trailing '.o', so the list of file names should include the trailing
'.o'.
Also, the sub-directory for drivers/acpi/acpica/ has a typo, so
s/acpia/acpica/g.

The acpica list of exceptions almost surely needs to be updated.

Signed-off-by: Randy Dunlap <rd.dunlab@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
patch 3/4:
 scripts/namespace.pl |   42 ++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

--- linux-next-20191002.orig/scripts/namespace.pl
+++ linux-next-20191002/scripts/namespace.pl
@@ -86,29 +86,29 @@ my %ref = ();		# $ref{$name} exists if t
 my %export = ();	# $export{$name} exists if there is an EXPORT_... of $name
 
 my %nmexception = (
-    'fs/ext3/bitmap'			=> 1,
-    'fs/ext4/bitmap'			=> 1,
-    'arch/x86/lib/thunk_32'		=> 1,
-    'arch/x86/lib/cmpxchg'		=> 1,
-    'arch/x86/vdso/vdso32/note'		=> 1,
+    'fs/ext3/bitmap.o'			=> 1,
+    'fs/ext4/bitmap.o'			=> 1,
+    'arch/x86/lib/thunk_32.o'		=> 1,
+    'arch/x86/lib/cmpxchg.o'		=> 1,
+    'arch/x86/vdso/vdso32/note.o'	=> 1,
     'arch/x86/entry/vdso/vdso-note.o'	=> 1,
     'arch/x86/entry/vdso/vdso32/note.o'	=> 1,
-    'lib/irq_regs'			=> 1,
-    'usr/initramfs_data'		=> 1,
-    'drivers/scsi/aic94xx/aic94xx_dump'	=> 1,
-    'drivers/scsi/libsas/sas_dump'	=> 1,
-    'lib/dec_and_lock'			=> 1,
-    'drivers/ide/ide-probe-mini'	=> 1,
-    'usr/initramfs_data'		=> 1,
-    'drivers/acpi/acpia/exdump'		=> 1,
-    'drivers/acpi/acpia/rsdump'		=> 1,
-    'drivers/acpi/acpia/nsdumpdv'	=> 1,
-    'drivers/acpi/acpia/nsdump'		=> 1,
-    'arch/ia64/sn/kernel/sn2/io'	=> 1,
-    'arch/ia64/kernel/gate-data'	=> 1,
-    'security/capability'		=> 1,
-    'fs/ntfs/sysctl'			=> 1,
-    'fs/jfs/jfs_debug'			=> 1,
+    'lib/irq_regs.o'			=> 1,
+    'usr/initramfs_data.o'		=> 1,
+    'drivers/scsi/aic94xx/aic94xx_dump.o' => 1,
+    'drivers/scsi/libsas/sas_dump.o'	=> 1,
+    'lib/dec_and_lock.o'		=> 1,
+    'drivers/ide/ide-probe-mini.o'	=> 1,
+    'usr/initramfs_data.o'		=> 1,
+    'drivers/acpi/acpica/exdump.o'	=> 1,
+    'drivers/acpi/acpica/rsdump.o'	=> 1,
+    'drivers/acpi/acpica/nsdumpdv.o'	=> 1,
+    'drivers/acpi/acpica/nsdump.o'	=> 1,
+    'arch/ia64/sn/kernel/sn2/io.o'	=> 1,
+    'arch/ia64/kernel/gate-data.o'	=> 1,
+    'security/capability.o'		=> 1,
+    'fs/ntfs/sysctl.o'			=> 1,
+    'fs/jfs/jfs_debug.o'		=> 1,
 );
 
 my %nameexception = (


