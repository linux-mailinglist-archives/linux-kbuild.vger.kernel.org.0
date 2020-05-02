Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F10001C25AF
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 May 2020 15:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbgEBNdg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 May 2020 09:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727914AbgEBNdf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 May 2020 09:33:35 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8619DC061A0C;
        Sat,  2 May 2020 06:33:35 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id s8so5982700pgq.1;
        Sat, 02 May 2020 06:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hMm84SPSByLw3R4Nf70xivWbzJKX1oEFGozqAzehKXg=;
        b=mjNHsOJUEUWPW3GgTRq95PGLI6elZ0XdP1BMc+zkOnGGYEBUd0+OpGOdEQ/SQ8pbL0
         k4rs74dxjgKetFkSOBojXxvZCFfnC/ByMnZVkwCYpwXYJybRrGWbolRdPzDx8f5ptC6S
         YYLotds7BfcD7lvrX3ydpuTo//8ddomidvLaJdXqZ7ZQcbxp4CSqDvg2FIA7SuWWmMpW
         E/XDIrj472swi+ICO2GLWT+D5QQTYcdhM7acoEnrXYARnqd1HSLj7P0oknXq+ttj/MI5
         P3KSGL5wkYQ1CpTTfD71eG5vLXCiDVdXTA0pGEPdLuecbActwUN9cLoYNOVITmBCBEXV
         SMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hMm84SPSByLw3R4Nf70xivWbzJKX1oEFGozqAzehKXg=;
        b=qSlQHJP0Nhkeq4sOM5fCMKTuQnC+yQhgH1NhQRhaTDawaBwYta3mnwx0XpORTWHwY9
         RgCYvA3M4Jl+7C3SLs62GabaU70iWxAF54Ec6Ud/oPashN6nF0OxaWCfTGccHNm4OagZ
         kRXt/GHj2qvGJYFfhXV+Fk6EeHCfv41N8dHjM9qtaaA9hybubDzuiGQQiNEbE6y0Bcvm
         Zb38DySE+Ng6LE4flXM8K5mtqbwJfS0va7GvPzfajJHRI81LVBrcaN/YLaxbwkZBQs8c
         W9uBdOAc2+swRx8BpeVp4ZvsGYhWYZ+MKKpznhjfEHJVQIQQUu9LTvBw/M4WdF7FmPB0
         NHpA==
X-Gm-Message-State: AGi0Pua9xvCQ86zZJZ8vkfYeQ/jwB1LRDcUrs9BemEzR2eI4GYp8SU4o
        T43RIs4NqzZ7NbFEksxw618=
X-Google-Smtp-Source: APiQypKPWnVZfeYKNhWKjQgRyY9VmayqlniMEaIF2zh94MODEBuFUuxzcp1MO5WEQCPSfCPnJRNjiA==
X-Received: by 2002:aa7:8ad6:: with SMTP id b22mr8207259pfd.251.1588426414709;
        Sat, 02 May 2020 06:33:34 -0700 (PDT)
Received: from vultr.guest ([149.248.10.52])
        by smtp.gmail.com with ESMTPSA id w125sm4200116pgw.22.2020.05.02.06.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 06:33:33 -0700 (PDT)
From:   Changbin Du <changbin.du@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Changbin Du <changbin.du@gmail.com>
Subject: [PATCH v2] streamline_config.pl: add LOCALMODCONFIG_PRESERVE to preserve some kconfigs
Date:   Sat,  2 May 2020 21:33:20 +0800
Message-Id: <20200502133320.4473-1-changbin.du@gmail.com>
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

 $ make LOCALMODCONFIG_PRESERVE="drivers/usb;fs" localmodconfig

Signed-off-by: Changbin Du <changbin.du@gmail.com>

---
v2: fix typo in documentation. (Randy Dunlap)
---
 Documentation/admin-guide/README.rst |  8 +++++++-
 scripts/kconfig/streamline_config.pl | 23 +++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index cc6151fc0845..2fff55834085 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -209,10 +209,16 @@ Configuring the kernel
                            store the lsmod of that machine into a file
                            and pass it in as a LSMOD parameter.
 
+                           Also, you can preserve modules in certain folders
+                           or kconfig files by spcifying their paths in
+                           parameter LOCALMODCONFIG_PRESERVE.
+
                    target$ lsmod > /tmp/mylsmod
                    target$ scp /tmp/mylsmod host:/tmp
 
-                   host$ make LSMOD=/tmp/mylsmod localmodconfig
+                   host$ make LSMOD=/tmp/mylsmod \
+                           LOCALMODCONFIG_PRESERVE="drivers/usb;drivers/gpu;fs" \
+                           localmodconfig
 
                            The above also works when cross compiling.
 
diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index e2f8504f5a2d..ab5d1e10a5d0 100755
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
+@presevered_kconfigs = split(/;/,$ENV{LOCALMODCONFIG_PRESERVE}) if (defined($ENV{LOCALMODCONFIG_PRESERVE}));
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

