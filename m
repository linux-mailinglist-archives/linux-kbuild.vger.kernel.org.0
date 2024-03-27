Return-Path: <linux-kbuild+bounces-1366-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B956288E7D2
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Mar 2024 16:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCC0F1C27A58
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Mar 2024 15:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F80147C92;
	Wed, 27 Mar 2024 14:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VwnaqOt8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7371F147C85
	for <linux-kbuild@vger.kernel.org>; Wed, 27 Mar 2024 14:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711549568; cv=none; b=fUcQAXeQFktiiEiEbLPABC84Kp1PQYFoSWHsFHsfjX/b1EXbA+kAvycWO82GylpaoOE/NVTSQQYkrQtcl5JYbcl5ss71pOFE/fPqQ+iddmIf8vpi6FMGM2mYg9/1klr2Phy2zWzDaqdad25uZK4d6YJmn55osYzpBsMHssjTdc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711549568; c=relaxed/simple;
	bh=F584rvY9Ael/CReGADwrBnGTlfcFElRXi+daopA8MFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g2diPJdtnyWTtgbDZYpcWM/ukbNROdnfSb4lpex+euPDz455r1xxTwVJ457TTgrzOYSnzfkA7qUQL5ConoEl//goSUaYa3iZNJIK98koGoxvjDjm2Ypk9K+UrJ0TfNLPMzD9/JLK/q27ec/Su3YFXcfxJ1NVWs9dWVLtXTXkk+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VwnaqOt8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-414974c6887so1675065e9.1
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Mar 2024 07:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711549565; x=1712154365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73OCrYqPUt68WHM39Ot0cX5xtXg6EOrolRVcpBahWYE=;
        b=VwnaqOt8CHodoxAn5Z3v6SHUw0B1e0qaXh4xRhu2dWCFD+Xh/hzwZmLUooIEQbAEA7
         QevdUtR8Chag0mLr5spQWgt50hbvSSAVixg9WuG62RB8T42fb8i3cJabyzE+k5Zj3QH6
         eXCMgXJvl+e+izffjHNLyVj0hAA4YVsZAVtHR/7TGGCmmn/usBEw6Bg5H5m66WqkTCpI
         lvbq7CYUbqIRtXRdFMsJlh34pG6kDUmVlr3Dr9McaZnPRHGEDt2izWYSLrqubU0e6x9T
         M3/wEL2Og8eru9QtZdPLqKpBMtqpyFdJipbEjGWH9o1WXOLRWLhPFhg8KwnazkT4P0LO
         ZCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711549565; x=1712154365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73OCrYqPUt68WHM39Ot0cX5xtXg6EOrolRVcpBahWYE=;
        b=mmJeBMheD4AV7udmhzyDkaPoDJrQ4WcTylcrRnNyBXAgG3rfXDIO1VxDvV45oW5WIL
         EBf1mHO8eAxfvufL6FjKfKvq6eiKI5nBcrpbV7ovVCxBZ24Mu4wZ3jHh0atpmaUaEh7l
         GxUY718i/JDPDnxfY5ULcoQ6WMk7MbNWDBYXzHR4zWW6nynm3rG0aq4uEXPvia+jQdl7
         f4PEP/CQO3Daaiip9Idhm2rVzlC8aopGgUPM9bd9MjCp/laIwoQxj1J6e9bGmcDVm6uF
         h4S6xrPeZUQkckOmY1NtLlgxGNDUfiMOTciBNmsuJApbWrYgexvGO3C/TJgdWvi1Ive0
         gzhg==
X-Forwarded-Encrypted: i=1; AJvYcCVh1xCkXUhdizIyKBO1cdTzP3HWPNkJdpr1rIymbl7y3S1VgvM6Lum/tsWyA7L0zvAQ7v73oOd18BL2nNfB0nRYox6Ef+m9BTenqg3x
X-Gm-Message-State: AOJu0YzLv12aYwq7IawZen/CBinQeLY0YFy2ij4gbaw1E4G3hOIHcsk0
	WllztAhTR4GqoZmXZKI758gwp7/23e9qL00I0f3fO0tCI/ZFZp9Hu6zDymFEl3Y=
X-Google-Smtp-Source: AGHT+IFikmKCrEwbGhQWaJgcSA86RpedL07E6S4CyB+EWdx+XRR9TNGvX7Sb7pDA6ciMSYIHD8Nm5A==
X-Received: by 2002:a05:600c:4f44:b0:414:902c:f8ba with SMTP id m4-20020a05600c4f4400b00414902cf8bamr159238wmq.1.1711549564473;
        Wed, 27 Mar 2024 07:26:04 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4091:a246:821e:6f3b:6b50:4762:8343])
        by smtp.gmail.com with ESMTPSA id m28-20020a05600c3b1c00b00414688af147sm2300840wms.20.2024.03.27.07.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 07:26:04 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Markus Schneider-Pargmann <msp@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [RFC 2/2] scripts: Add fzfconfig helper script
Date: Wed, 27 Mar 2024 15:25:44 +0100
Message-ID: <20240327142544.1728286-3-msp@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240327142544.1728286-1-msp@baylibre.com>
References: <20240327142544.1728286-1-msp@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a script to present all config options in fzf. This allows to fuzzy
search in all config options and their help texts. It also displays the
configuration state in the list. A preview window shows the actual
Kconfig snippet for the config option.

Using 'Enter' in the displayed list will open 'make menuconfig' and
automatically execute a search for the selected symbol. After that the
user can use the menuconfig to change the option or do other things.
After exiting menuconfig the fzf list is refreshed and you can continue
navigating the list from the point where you entered menuconfig.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 scripts/fzfconfig        | 112 +++++++++++++++++++++++++++++++++++++++
 scripts/kconfig/Makefile |   4 ++
 2 files changed, 116 insertions(+)
 create mode 100755 scripts/fzfconfig

diff --git a/scripts/fzfconfig b/scripts/fzfconfig
new file mode 100755
index 000000000000..48f9590c1031
--- /dev/null
+++ b/scripts/fzfconfig
@@ -0,0 +1,112 @@
+#!/usr/bin/env bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Author: Markus Schneider-Pargmann <msp@baylibre.com>
+#
+# List all config options inside of fzf and offer an easy option to jump to the
+# option in menuconfig
+
+config_script="scripts/config --file $KCONFIG_CONFIG"
+
+history_file="$HOME/.cache/kconfig_fzf.hist"
+
+kconfig_fzf_clenup_on_exit() {
+  rm -f "$menucfgpipe"
+}
+
+kconfig_fzf_oneline_config_items() {
+  make helpallconfig | \
+    grep -vE '^(Type  :|  Depends on:|  Visible if:|Selects:|Selected by|CONFIG_)' | \
+    sed 's/^  Prompt: \(.*\)$/1111111111\11111111111/g' | \
+    tr '\n' ' ' | \
+    sed 's/----- -----/\n/g' | \
+    sed 's/\(^ *\|-----\)//g' | \
+    sed 's/  */ /g' | \
+    sed 's/^\(.*\)1111111111\(.*\)1111111111\(.*\)/\t\2:\1\3/g' | \
+    sed 's/^\([^\t].*\)$/\t:\1/g' | \
+    sed 's/^\(.*\)Symbol: \([^ ]*\) \[\([^]]\{1,40\}\)[^]]*\].*Defined at \([^:]*\):\([0-9]*\) .*$/\4:\5\t:\2\3:\1/g' | \
+    grep -E '^.*:[0-9]*	:.*=.*:'
+}
+
+kconfig_fzf_make_menuconfig() {
+  menucfgpipe="$(mktemp --dry-run)"
+  trap kconfig_fzf_clenup_on_exit EXIT
+  mkfifo "$menucfgpipe"
+
+  make menuconfig < "$menucfgpipe" &
+  menuconfigpid=$!
+
+  echo "/^${1}\$" > "$menucfgpipe"
+
+  cat > "$menucfgpipe" < /dev/stdin &
+  redirectpid=$!
+
+  wait $menuconfigpid
+  kill $redirectpid
+}
+
+kconfig_fzf_get_catcmd() {
+  for cmd in bat batcat
+  do
+    if which $cmd > /dev/null
+    then
+      echo $cmd \
+        --paging=never \
+        --force-colorization \
+        --highlight-line {2}
+      return
+    fi
+  done
+  echo 'echo -e "+----------\n| "File: {1}:{2}"\n+----------"; cat --number'
+  exit 0
+}
+
+kconfig_fzf_command() {
+  menuconfig_action="execute(bash -c \"source $0;"' kconfig_fzf_make_menuconfig \$(echo {3} | cut -d '=' -f 1)")'
+  reload_action="reload(bash -c 'source $0; kconfig_fzf_oneline_config_items')"
+  catcmd="$(kconfig_fzf_get_catcmd)"
+
+  kconfig_fzf_oneline_config_items | column --table --separator '	' | \
+    env SHELL=/bin/bash \
+    fzf \
+      --history="$history_file" \
+      --tiebreak=begin \
+      --delimiter=: \
+      --nth=.. \
+      --with-nth=3,4 \
+      --preview "$catcmd"' \
+        "${srctree:-.}/"{1}' \
+      --preview-window 'right,90,+{2}-5,~3' \
+      --bind "ctrl-r:${reload_action}" \
+      --bind "ctrl-g:execute(echo \"'{}'\"; read)" \
+      --bind "enter:${menuconfig_action}+${reload_action}" \
+      --header 'enter: Open in menuconfig, ctrl-r: Reload, esc: Exit'
+    if [ "$?" -eq 130 ]
+    then
+      return 0
+    fi
+    return "$ret"
+}
+
+if [ "$#" -gt "0" ]
+then
+  echo "USAGE: $0"
+  echo ""
+  echo "Show all kconfig symbols in fzf and open selected item on enter in make menuconfig."
+  echo ""
+  echo "You can fuzzy search in these data fields: <KCONFIG_FILE>:<LINENO>:<CONFIG_SYMBOL>=<VALUE>:<PROMPT>:<HELP>."
+  echo "Not all fields are visible but the search is still done."
+  echo "A preview of the Kconfig file is shown on the right side."
+  echo ""
+  echo "Key bindings:"
+  echo "  Enter : Open symbol in make menuconfig"
+  echo "  CTRL-r: Reload config symbols"
+  echo "  Escape: Exit"
+  exit 0
+fi
+
+(return 0 2>/dev/null) && kconfig_fzf_sourced=1
+if [ "$kconfig_fzf_sourced" != "1" ]
+then
+  kconfig_fzf_command
+fi
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 87df82c03afb..1f47b9ae9786 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -124,6 +124,10 @@ testconfig: $(obj)/conf
 	$(if $(findstring 1,$(KBUILD_VERBOSE)),--capture=no)
 clean-files += tests/.cache
 
+PHONY += fzfconfig
+fzfconfig:
+	$(srctree)/scripts/fzfconfig
+
 # Help text used by make help
 help:
 	@echo  'Configuration targets:'
-- 
2.43.0


