Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8E21CF952
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2020 17:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgELPgq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 May 2020 11:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727882AbgELPgq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 11:36:46 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 441F7C061A0C;
        Tue, 12 May 2020 08:36:46 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id t11so6321004pgg.2;
        Tue, 12 May 2020 08:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YmZaO3pcIDrfR3KhTFbwCDYoppXKfYSJXDQjUNKHEVY=;
        b=MDZQjdd9m1y13p4rXxb5ek6crSsd2F3cWpU4AluYA6Fumci27S/F5+vMBNIFw9aPvE
         bF7isGhus8uwkrMDA2h8CwlFw4hXQijLZQvmYE5ssEVj2iAqMuQ2QYtgJE/M0JT/OL/m
         X7BjNlnEEBILlQ1ROroLfDCSiCg/BIE3Ix2BXd+LRVQHEtPaicCS7gI/sOvVfW2wklFN
         qOXZadgNnekYEFqG33K0wkzXvVZAcE/dx4sGqvxLRQj2Qn1Hq8gfIGfq8WkDnNYQPRdO
         Dl0+nEkLJs4H6G3UMN9B8YQRk/umrQgpNDr6djrOQdJ2dgAZENF/7rtsNTpqW79H8oeg
         lrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YmZaO3pcIDrfR3KhTFbwCDYoppXKfYSJXDQjUNKHEVY=;
        b=NYoXbtbHjNseyfVGIJS9YzModvPiwoeuTMlihZ7n5f3pv1zEgtbKwjFZ31gGWcPNmQ
         8KmI+GbT6qLmaG1it9hBk+oW5JfIi83mIwsNhAjJMmXMLean0iGs+3JSzhK2untCfSDP
         VtlGSs0JhRP96o8Thvp/a+bw8P9YVCmmCeabFzefmxMhYOJgtpNk/zMV5wpSJxCdWlJ8
         VYlzC3zT6HrNazI157PP7zELxxfZhCq8C9jBOV1bq0E6dWTm7f4HcWyMETMF/yWxiWhT
         2s4Hbap34oWmCfe81piGH9HAg1/Q0T20GBOLDk9Q3ySnYAORmdUOGR9NTbUfe/kujylj
         lf6g==
X-Gm-Message-State: AGi0Puad+8uRRsHppCqxaTsWUcSddK7n0RPitIMp2f6YPs3rn66TOPIN
        FkVAPscFyGGJzhQbKMTeQeo=
X-Google-Smtp-Source: APiQypJwhkhYXONVdXhsZYr4EJTG7RhyBOORX0Z93ewmdJCGeWKnlMX72zG0EERnx85aomm9q1LqJg==
X-Received: by 2002:a62:17c3:: with SMTP id 186mr22004540pfx.159.1589297805739;
        Tue, 12 May 2020 08:36:45 -0700 (PDT)
Received: from vultr.guest ([149.248.10.52])
        by smtp.gmail.com with ESMTPSA id q62sm7884906pfc.132.2020.05.12.08.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 08:36:44 -0700 (PDT)
From:   Changbin Du <changbin.du@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Changbin Du <changbin.du@gmail.com>
Subject: [PATCH v6] streamline_config.pl: add LMC_KEEP to preserve some kconfigs
Date:   Tue, 12 May 2020 23:36:07 +0800
Message-Id: <20200512153607.5560-1-changbin.du@gmail.com>
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
Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

---
v6: add note for localyesconfig.
v5: use ':' as delimiter.
v4: fix typo.
v3: rename LOCALMODCONFIG_PRESERVE to shorter LMC_KEEP.
v2: fix typo in documentation. (Randy Dunlap)
---
 Documentation/admin-guide/README.rst | 11 +++++++++--
 scripts/kconfig/Makefile             |  2 ++
 scripts/kconfig/streamline_config.pl | 21 +++++++++++++++++++++
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index cc6151fc0845..5fb526900023 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -209,15 +209,22 @@ Configuring the kernel
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
 
      "make localyesconfig" Similar to localmodconfig, except it will convert
-                           all module options to built in (=y) options.
+                           all module options to built in (=y) options. You can
+                           also preserve modules by LMC_KEEP.
 
      "make kvmconfig"   Enable additional options for kvm guest kernel support.
 
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index c9d0a4a8efb3..f3355bd86aa5 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -123,7 +123,9 @@ help:
 	@echo  '  gconfig	  - Update current config utilising a GTK+ based front-end'
 	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
 	@echo  '  localmodconfig  - Update current config disabling modules not loaded'
+	@echo  '                    except those preserved by LMC_KEEP environment variable'
 	@echo  '  localyesconfig  - Update current config converting local mods to core'
+	@echo  '                    except those preserved by LMC_KEEP environment variable'
 	@echo  '  defconfig	  - New config with default from ARCH supplied defconfig'
 	@echo  '  savedefconfig   - Save current config as ./defconfig (minimal config)'
 	@echo  '  allnoconfig	  - New config where all options are answered with no'
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

