Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC1B41C0C28
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 May 2020 04:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgEAChU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Apr 2020 22:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728008AbgEAChT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Apr 2020 22:37:19 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B30BC035494;
        Thu, 30 Apr 2020 19:37:19 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id hi11so1807448pjb.3;
        Thu, 30 Apr 2020 19:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Tx4PpKumE7+hHOMexZLB6HaMGQrp+LFhXCasKj/4X4=;
        b=XPhaX+81o8qjj+9LAhbXwj92dzxOn0y874GMRLLUEqVqzYnXZvX/leVVIXT8idVHTf
         6fw8Ms3lBXnY542qFgUa/WW0PU1/UNhmAH18EiNovuLpSSMa9c7G+Iq6DOSZ2lND5h5c
         FzTlmFmLoBQduRR+KJd+x5V3t+Y16sIJtBMs0Bes8TLJYGEgx8vkJZhJLSQ1pfVGNAEz
         K2ob762AX9FMh9jLrikyFVkq4CHyHs+eIDOA8XyKxPXHEslqGzpE0/3I6Y9tckiQrkLI
         HkzKTQuMuyRJa26reG3SoGuyx91CQz13SS63wd8nyUm9wx5IQeEpR3dPmCYYEygk0dRq
         I6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Tx4PpKumE7+hHOMexZLB6HaMGQrp+LFhXCasKj/4X4=;
        b=cUWmvibF1U5qIxO7kaNrxc7Z3rhYrvL3YBWLgS4oEVvyyYfDveI6rP0og6i0v3Y3lC
         bYz3K9nREpiA2hgPjpAU//h/SafMIkhrDk2dWtYTUgb3EyKvfj03wIkCeJtr207prUf0
         xrQ0VmH3wqDA69KWGLL0W5VCERbaIlvtV8MUAQxXH0gtBals4nqnwec+DiR3REjWxR8o
         KuN3aZrsmZZMCNJatS7/+2y5bl0JHgzmmq2wQ0Svkc8Ql1CgWiB5+9w2DS551vaXN48b
         9TG0miWfYuz777y9EYEpY5nuG/bTwJAbMmzQb/CcueRCBrIlEo7ar8jyYC62CsaWYUk7
         k3Lg==
X-Gm-Message-State: AGi0PuYsWazKPUYQ1j5eEuzai1DIjThOCEeSjKffXkXM+2buNPWfeZdH
        W249yTwlm+r8ctQax4WBtg8=
X-Google-Smtp-Source: APiQypIl+H3bVs2N1KfiyJe5IJkbPjRbQz0m+dJRxuGxvqLHaNcaPc6eD78i0ZA0QZtnOxIdh+dlvQ==
X-Received: by 2002:a17:90a:e2c1:: with SMTP id fr1mr2131921pjb.124.1588300638823;
        Thu, 30 Apr 2020 19:37:18 -0700 (PDT)
Received: from vultr.guest ([149.248.10.52])
        by smtp.gmail.com with ESMTPSA id a142sm924681pfa.6.2020.04.30.19.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 19:37:18 -0700 (PDT)
From:   Changbin Du <changbin.du@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Changbin Du <changbin.du@gmail.com>
Subject: [PATCH] streamline_config.pl: add LOCALMODCONFIG_PRESERVE to preserve some kconfigs
Date:   Fri,  1 May 2020 10:37:08 +0800
Message-Id: <20200501023708.108830-1-changbin.du@gmail.com>
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
 Documentation/admin-guide/README.rst |  8 +++++++-
 scripts/kconfig/streamline_config.pl | 23 +++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index cc6151fc0845..6deff95362f8 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -209,10 +209,16 @@ Configuring the kernel
                            store the lsmod of that machine into a file
                            and pass it in as a LSMOD parameter.
 
+                           Also, you can preserve modules in certen folders
+                           or kconfig files by spcifying there paths in
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

