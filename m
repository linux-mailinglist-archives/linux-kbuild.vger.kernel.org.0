Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1312E1CC5E6
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 May 2020 03:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728823AbgEJBGP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 9 May 2020 21:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727067AbgEJBGO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 May 2020 21:06:14 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBAB3C061A0C;
        Sat,  9 May 2020 18:06:14 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id k7so1013590pjs.5;
        Sat, 09 May 2020 18:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vwtb+avupuFTmfSaGkefMyCAgyCs1Cv5abwom1lkME8=;
        b=EkzOd7LMvkxkOkM/669dbYuHGG/DPUqcMzcYBrjeMaWYWJcRiuY0DEsSMKydWy2O4s
         4bdPMvo3kd2QNBQq23hOhs+Jl/qjuNpqI9pR5bd7nQlIgU20nW/mNIpnDoNX6Eoleqhp
         wgJ+3QTOPu/k/kD7mge627IfjUG8wvSFXXGBLTcjt+TS7IXJb1RRxDMYNz54FEI1XYXo
         cyP6xpCbwkJk7+l3n91j1Ru07f8GZVB2e0+FEBBWdTarKtNAPtTqlJ9kY2ULLfXTKzAt
         AwVWxw2JC5x+sBB0iFGH1trqLaJ7c/+f7Zx7oNBgBsGCrb6eXrqsso9xnferl2IFU4N7
         Fnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vwtb+avupuFTmfSaGkefMyCAgyCs1Cv5abwom1lkME8=;
        b=W6xQsa1s1OBE05Bkg/oFJIsIh5ewAFAVVqfDnvF+8oLZFQfLutPIPUmMIrr2w6NZWS
         Z3PP0a5fGYaHYSK4QT4ACMPiq29j9LxJQ5jemWouxvftcgP6mHAIVtRwq1PjzhTaS840
         AHXacMGvwYDIvvMyrZnd/kPpXyqF7zi8R3+wB/SdR5tCwDU9u79QoU39eZu9bp3SJpJ2
         UxVev5SWhZgo0gCpqL9qlv+M4Nrsr24t7nw5rEtitbXS68KUKGQ8q1lCd9/mswcVT4lG
         lQ3EK43m7W5jOhg7W5SZTts9+ZaMUmp601LX89ilCLKPTQLOfm9K18LwanOZxDK8cjtT
         h5BA==
X-Gm-Message-State: AGi0PuYDRJ1zr8FgDR726UPM5z9wrHbDIOGbAZorHzHRn2+exaNSVuFj
        g4UhWYzFzDNtlSE3U4HCGbI=
X-Google-Smtp-Source: APiQypK78yeFMkke/iFRDsTLsFMdAWKw2e4+BhWD0bkww2orJYIgD5LPaEQK0BMedAiZ3KBQe5g9kQ==
X-Received: by 2002:a17:90a:2849:: with SMTP id p9mr9702308pjf.6.1589072774312;
        Sat, 09 May 2020 18:06:14 -0700 (PDT)
Received: from vultr.guest ([149.248.10.52])
        by smtp.gmail.com with ESMTPSA id e12sm4563312pgv.16.2020.05.09.18.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 18:06:13 -0700 (PDT)
From:   Changbin Du <changbin.du@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Changbin Du <changbin.du@gmail.com>
Subject: [PATCH v5] streamline_config.pl: add LMC_KEEP to preserve some kconfigs
Date:   Sun, 10 May 2020 09:06:03 +0800
Message-Id: <20200510010603.3896-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Sometimes it is useful to preserve batches of configs when making
localmodconfig. For example, I usually don't want any usb and fs
modules to be disabled. Now we can do it by:

 $ make LMC_KEEP="drivers/usb:fs" localmodconfig

Signed-off-by: Changbin Du <changbin.du@gmail.com>

---
v4: fix typo.
v3: rename LOCALMODCONFIG_PRESERVE to shorter LMC_KEEP.
v2: fix typo in documentation. (Randy Dunlap)
---
 Documentation/admin-guide/README.rst |  8 +++++++-
 scripts/kconfig/Makefile             |  1 +
 scripts/kconfig/streamline_config.pl | 21 +++++++++++++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index cc6151fc0845..407aa206bb70 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -209,10 +209,16 @@ Configuring the kernel
                            store the lsmod of that machine into a file
                            and pass it in as a LSMOD parameter.
 
+                           Also, you can preserve modules in certain folders
+                           or kconfig files by specifying their paths in
+                           parameter LMC_KEEP.
+
                    target$ lsmod > /tmp/mylsmod
                    target$ scp /tmp/mylsmod host:/tmp
 
-                   host$ make LSMOD=/tmp/mylsmod localmodconfig
+                   host$ make LSMOD=/tmp/mylsmod \
+                           LMC_KEEP="drivers/usb:drivers/gpu:fs" \
+                           localmodconfig
 
                            The above also works when cross compiling.
 
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index c9d0a4a8efb3..e0abbf5805f5 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -123,6 +123,7 @@ help:
 	@echo  '  gconfig	  - Update current config utilising a GTK+ based front-end'
 	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
 	@echo  '  localmodconfig  - Update current config disabling modules not loaded'
+	@echo  '                    except those preserved by LMC_KEEP environment variable'
 	@echo  '  localyesconfig  - Update current config converting local mods to core'
 	@echo  '  defconfig	  - New config with default from ARCH supplied defconfig'
 	@echo  '  savedefconfig   - Save current config as ./defconfig (minimal config)'
diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index e2f8504f5a2d..19857d18d814 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -143,6 +143,7 @@ my %depends;
 my %selects;
 my %prompts;
 my %objects;
+my %config2kfile;
 my $var;
 my $iflevel = 0;
 my @ifdeps;
@@ -201,6 +202,7 @@ sub read_kconfig {
 	if (/^\s*(menu)?config\s+(\S+)\s*$/) {
 	    $state = "NEW";
 	    $config = $2;
+	    $config2kfile{"CONFIG_$config"} = $kconfig;
 
 	    # Add depends for 'if' nesting
 	    for (my $i = 0; $i < $iflevel; $i++) {
@@ -591,6 +593,20 @@ while ($repeat) {
 }
 
 my %setconfigs;
+my @preserved_kconfigs = split(/:/,$ENV{LMC_KEEP});
+
+sub in_preserved_kconfigs {
+    my $kconfig = $config2kfile{$_[0]};
+    if (!defined($kconfig)) {
+        return 0;
+    }
+    foreach my $excl (@preserved_kconfigs) {
+        if($kconfig =~ /^$excl/) {
+            return 1;
+        }
+    }
+    return 0;
+}
 
 # Finally, read the .config file and turn off any module enabled that
 # we could not find a reason to keep enabled.
@@ -644,6 +660,11 @@ foreach my $line (@config_file) {
     }
 
     if (/^(CONFIG.*)=(m|y)/) {
+        if (in_preserved_kconfigs($1)) {
+            dprint "Preserve config $1";
+            print;
+            next;
+        }
 	if (defined($configs{$1})) {
 	    if ($localyesconfig) {
 	        $setconfigs{$1} = 'y';
-- 
2.25.1

