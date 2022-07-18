Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6618F577ACD
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Jul 2022 08:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbiGRGPL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Jul 2022 02:15:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiGRGPK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jul 2022 02:15:10 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46844DFB3
        for <linux-kbuild@vger.kernel.org>; Sun, 17 Jul 2022 23:15:01 -0700 (PDT)
Received: from leknes.fjasle.eu ([46.142.97.215]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M9WmQ-1o7oEs2mYe-005cvU; Mon, 18 Jul 2022 08:14:22 +0200
Received: from localhost.fjasle.eu (bergen.fjasle.eu [IPv6:fdda:8718:be81:0:6f0:21ff:fe91:394])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by leknes.fjasle.eu (Postfix) with ESMTPS id BBC153C0A3;
        Mon, 18 Jul 2022 08:14:18 +0200 (CEST)
Authentication-Results: leknes.fjasle.eu; dkim=none; dkim-atps=neutral
Received: by localhost.fjasle.eu (Postfix, from userid 1000)
        id 0E4B72D3F; Mon, 18 Jul 2022 08:14:16 +0200 (CEST)
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org
Cc:     Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] scripts: headers_install.sh: Update config leak ignore entries
Date:   Mon, 18 Jul 2022 08:14:13 +0200
Message-Id: <20220718061413.4643-1-nicolas@fjasle.eu>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ku1XEuGb9HQEKhbXiZdWjAw14qjq06QggzW47ypallZqT8qT1Iu
 yIdQhGV6nxiPTD9aOg6xzO7KOF5k5a7KAyPZtzXHZys1htUhoZy+34Kc5//pT1q/tJdE9Ei
 NYSwTm4mBrjFBtme+gzIT0A5bpb3hoYyQXyaTqTaooNfw7oQe4BOQD+51ftqSIFNUdoO/AG
 0bOeBEuMJ8ePcARHU6Ddw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BArwVdcuWbA=:T0f0wt/3cXeK+8ZpG7/Iy/
 BJ0HTQkjlRc3KwlyDwtgETp5sX3ynMfjd6HW8ttwaFuPqI7lq0QHccNhNqTs5K7PSryu5cd2K
 YI6d3pXyONG0TsyctiiLDHX993aaGAdRWGc0T+yW6R4WinbwsTzSb0zmpqJWi5FGHHeH9fVVQ
 JOUfbKGarnHCAPsNdi+G93hJihVK7lc/BmDMyl4DZbt0nTfesPPKHXWhSipFu76IVbIIL/NDB
 2T0+JnPzP6hIRWhZQgGXLEd7OsfzPH0rMkO4D1krZyUJzF3yVqOVYQFkf5tShEyNGsqQz+GQd
 6yKd89ZLF2tMC3lvdyLzbqW8xicEozRGkWENjy4ql3YwxIDh9Fh0CxfbNnNkg4IVfhU0kAJ4j
 Ry61aAVkJ54osdlruIF82JmPio3DSQFKaR6ix/otnAxt/61qPTKxRh/IlsYDyHhVS19HLwT8k
 EVBgBM1boRFYp/1Kx5Q+UEIQ3yywPz7aW+iue+lMmj3aioHsoOteOT6hhPaUVVTaQ6IXJZvY0
 FBBeyLMzrFJsln2f2Y87/Ut4/oVfJ6S+67JnlYMMGlZjdvf4k2vvi6+skX0uQ/oyJTy+6zoWg
 V365d/G1nCthdmuZruOvy4rtaCjrZoCIQ1WqGnEzHOqGdssOwPeR2u5MpqkS2ZzVBDp0c0WgR
 V6zGuP+rxq8vEtysXWnCIn4vJkjErcsplwYunlO1UNT+8k5suhS3L6hELTRGKQedf8OI753IG
 vIlF0mYOZ7km0g7zeDDSi9kjUEfV2136u7xUpw==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Remove two dated config leak ignore entries from scripts/headers_install.sh:
arch/alpha/include/uapi/asm/setup.h does no more leak any CONFIG_* symbol to
user-space any more since commit 3cb8b1537f8a ("alpha: Move setup.h out of
uapi", 2021-09-14).
Same holds for include/uapi/asm-generic/fcntl.h since commit 306f7cc1e906
("uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64 in fcntl.h", 2022-04-05).

Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
---
 scripts/headers_install.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index dd554bd436cc..4041881746ad 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -70,7 +70,6 @@ configs=$(sed -e '
 #
 # The format is <file-name>:<CONFIG-option> in each line.
 config_leak_ignores="
-arch/alpha/include/uapi/asm/setup.h:CONFIG_ALPHA_LEGACY_START_ADDRESS
 arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_16K
 arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_4K
 arch/arc/include/uapi/asm/swab.h:CONFIG_ARC_HAS_SWAPE
@@ -84,7 +83,6 @@ arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_SUPPORT
 arch/x86/include/uapi/asm/auxvec.h:CONFIG_IA32_EMULATION
 arch/x86/include/uapi/asm/auxvec.h:CONFIG_X86_64
 arch/x86/include/uapi/asm/mman.h:CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS
-include/uapi/asm-generic/fcntl.h:CONFIG_64BIT
 include/uapi/linux/atmdev.h:CONFIG_COMPAT
 include/uapi/linux/eventpoll.h:CONFIG_PM_SLEEP
 include/uapi/linux/hw_breakpoint.h:CONFIG_HAVE_MIXED_BREAKPOINTS_REGS
-- 
2.36.1

