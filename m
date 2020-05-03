Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7D31C292A
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 May 2020 02:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbgECALv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 May 2020 20:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbgECALv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 May 2020 20:11:51 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1006DC061A0C;
        Sat,  2 May 2020 17:11:51 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x2so3616927pfx.7;
        Sat, 02 May 2020 17:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F4dVWGdnJBudjfmV4kfu0JQaNGF0uFmvyJsPlpjHVKo=;
        b=uaU5kMpxU48VehdcgyqcP4jfbmZVVKXuSEnOoCuTyvuYRu9yh2211xVtTmwSlB0veL
         W9pM+h8jUZ91aN7Cm89BJVt9aIukEoYToZtBVTW0EnM0+QW2B3JgDT0r+t2fZduk8Psp
         hg3PPYgyjdJV67Ir3ykxOWNwOWdmq3DJAKRoyrYk9F5fJSLc7tbMLMarpuXRPaAPw7La
         ROQ9FKN0H1jPcGPONH8KbGsmbB9WXU3Zh8bsjm0KzqK3WPcz07yznzdplmPmde4XPxZd
         INb+VQuOAgv5nQqBCaAYHz0gmcebde9GJqN0BIGsm3bNi1NIqE6F60jQnE6YJ89qiWlj
         V3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F4dVWGdnJBudjfmV4kfu0JQaNGF0uFmvyJsPlpjHVKo=;
        b=JKS/cnA90GCBmvSukGlxkn/BTOTPJ4fj1AYijqSVYGuWahGgQIGdGuWT/PI3u2Nnjp
         W2jG2upRSU7Xv8G6eNG90V4Wf1zGpErbhm+DlyZ2gstf+FnToCUQseEBkF2R2sdNw3gW
         Ghs8WthWpUT+BIw9rVzZWmRu0/UYzYPWEIemt2oDrdL1v8WXnYbS6zh3eJogKR82t0tl
         ttuWn7cIatQMZbVYdz+kkrhftQUSKqF00RYvYHAtNW3W+EXfsHzoDUZQP6DmLzxZlsHM
         WcOECYutE+7cAYTnQNrG0apqEn6XdSgqspAa9UNClX7jRMuaqlrrvZF37F89e38DOKQA
         d82g==
X-Gm-Message-State: AGi0PuZlZzdFQMWR7I+rlz9aPexnGwsvBVQtlr1efw5dEeX2FMs5wRg7
        u23J64d5pXABrr+gsp/h/EExCc76x1A=
X-Google-Smtp-Source: APiQypKZUTUw+ADnWg9faIwbTT3MXFxXy1wTD3p1ZXBHFe25jtKfBRErFo8xtxT8FlN2bOOmLH6M/A==
X-Received: by 2002:a63:3206:: with SMTP id y6mr10650635pgy.68.1588464710539;
        Sat, 02 May 2020 17:11:50 -0700 (PDT)
Received: from vultr.guest ([149.248.10.52])
        by smtp.gmail.com with ESMTPSA id b15sm5368692pfd.139.2020.05.02.17.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 17:11:49 -0700 (PDT)
From:   Changbin Du <changbin.du@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Changbin Du <changbin.du@gmail.com>
Subject: [PATCH v4] streamline_config.pl: add LMC_KEEP to preserve some kconfigs
Date:   Sun,  3 May 2020 08:11:41 +0800
Message-Id: <20200503001141.9647-1-changbin.du@gmail.com>
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

 $ make LMC_KEEP="drivers/usb;fs" localmodconfig

Signed-off-by: Changbin Du <changbin.du@gmail.com>

---
v4: fix typo.
v3: rename LOCALMODCONFIG_PRESERVE to shorter LMC_KEEP.
v2: fix typo in documentation. (Randy Dunlap)
---
 Documentation/admin-guide/README.rst |  8 +++++++-
 scripts/kconfig/Makefile             |  1 +
 scripts/kconfig/streamline_config.pl | 23 +++++++++++++++++++++++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index cc6151fc0845..1371deab8bc7 100644
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
+                           LMC_KEEP="drivers/usb;drivers/gpu;fs" \
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
index e2f8504f5a2d..d26543a807c9 100755
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
@@ -592,6 +594,22 @@ while ($repeat) {
 
 my %setconfigs;
 
+my @preserved_kconfigs;
+@preserved_kconfigs = split(/;/,$ENV{LMC_KEEP}) if (defined($ENV{LMC_KEEP}));
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
+
 # Finally, read the .config file and turn off any module enabled that
 # we could not find a reason to keep enabled.
 foreach my $line (@config_file) {
@@ -644,6 +662,11 @@ foreach my $line (@config_file) {
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

