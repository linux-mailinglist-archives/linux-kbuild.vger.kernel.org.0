Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1249E1C2688
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 May 2020 17:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbgEBPbI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 May 2020 11:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728193AbgEBPbH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 May 2020 11:31:07 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928FAC061A0C;
        Sat,  2 May 2020 08:31:07 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 18so3089736pfv.8;
        Sat, 02 May 2020 08:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jTctI81ocl9yyJ3hc+58IO/PKZQms10MAqbFo7+Ph+0=;
        b=HCZ7jWkiH6hXUylSxqNlJ3stWylbGHz48YGtuWblTa9qS9TjqnQ1g6y/GRfg6jVX+F
         iGNVjC23mTpf1b4FC1IIkx+pIPH96WZiLBO+SXQIWsiU+Y+a/lNAtxMWmCszVYQMI9Yn
         HUiCKo3DFUFM3maWAIFK23JoX0YWg290iZnUze+VC+6ffDEwj3/QAoBYvq3y1vCNsyMZ
         8QgTl9T+AJgK97KLipRUyMahn4ZS+3W0ojvIfynW8tepT4/rB7MMPjKxRpZ6z18yYVDd
         AisLCPVLvXraRT+KTW9MV9G8gPK/TojT1CeoKK3O9gaepxQujgNtLCCjlQgpNi4rabNv
         0LJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jTctI81ocl9yyJ3hc+58IO/PKZQms10MAqbFo7+Ph+0=;
        b=Y4SZnXQSAooMyZdjNiSEtAemFKly+WZ+N8vyZqXM4xkqv589rmAMWehnstCnuXUTkr
         GoaZR0s/oC+wLFBzH+qoIiPXMe/EMuLW3Z/lFWi2tu44d7mfBAVZ+8wz/wqpVos8gKuc
         kqCBNljGSmdD0L0Y4smlXD18SjGA4UGfKrSThc+Au3VbZ165h9Tip3qLWSzNfBskEy+V
         5QuX9KSV6jUdCBmHG6cWEO7PBXX6h59Hy+1EqU11PssgvFXsnI8x/7Jei4dChz6r4g4J
         3CnPWDa8CHqxV/Tpqcrr9GQCRyvfc9YdQpDH73zQwY680HzEI/Fi6jq5eZaSYZZReiof
         KX7A==
X-Gm-Message-State: AGi0PuZmtf5rzD5rM6o4HJBdjPfQiN1HQ7y2P1NEvU0sjyMt3IZHRZBF
        pKFApitjV9t1aiCD6gEvwgY=
X-Google-Smtp-Source: APiQypLa0te1ilMixTx50JsQYjzzt9BOT+E1oz8iS2QUD9Ou7X+qQqkS32UTf35j+M/mtJPKOBffqw==
X-Received: by 2002:a63:4e0c:: with SMTP id c12mr9799761pgb.161.1588433467041;
        Sat, 02 May 2020 08:31:07 -0700 (PDT)
Received: from vultr.guest ([149.248.10.52])
        by smtp.gmail.com with ESMTPSA id j2sm4863174pfb.73.2020.05.02.08.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 08:31:06 -0700 (PDT)
From:   Changbin Du <changbin.du@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Changbin Du <changbin.du@gmail.com>
Subject: [PATCH v3] streamline_config.pl: add LMC_KEEP to preserve some kconfigs
Date:   Sat,  2 May 2020 23:30:52 +0800
Message-Id: <20200502153052.5461-1-changbin.du@gmail.com>
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
v3: rename LOCALMODCONFIG_PRESERVE to shorter LMC_KEEP.
v2: fix typo in documentation. (Randy Dunlap)
---
 Documentation/admin-guide/README.rst |  8 +++++++-
 scripts/kconfig/Makefile             |  1 +
 scripts/kconfig/streamline_config.pl | 23 +++++++++++++++++++++++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index cc6151fc0845..f7b02ce61ea7 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -209,10 +209,16 @@ Configuring the kernel
                            store the lsmod of that machine into a file
                            and pass it in as a LSMOD parameter.
 
+                           Also, you can preserve modules in certain folders
+                           or kconfig files by spcifying their paths in
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
index e2f8504f5a2d..f3a2ceed1e82 100755
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
 
+my @presevered_kconfigs;
+@presevered_kconfigs = split(/;/,$ENV{LMC_KEEP}) if (defined($ENV{LMC_KEEP}));
+
+sub in_presevered_kconfigs {
+    my $kconfig = $config2kfile{$_[0]};
+    if (!defined($kconfig)) {
+        return 0;
+    }
+    foreach my $excl (@presevered_kconfigs) {
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
+        if (in_presevered_kconfigs($1)) {
+            dprint "Preserve config $1";
+            print;
+            next;
+        }
 	if (defined($configs{$1})) {
 	    if ($localyesconfig) {
 	        $setconfigs{$1} = 'y';
-- 
2.25.1

