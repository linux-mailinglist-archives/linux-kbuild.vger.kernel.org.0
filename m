Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD9762C6E0C
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Nov 2020 02:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731028AbgK1A7n (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Nov 2020 19:59:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730991AbgK1AwU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Nov 2020 19:52:20 -0500
Received: from mail-oi1-x263.google.com (mail-oi1-x263.google.com [IPv6:2607:f8b0:4864:20::263])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C63C0613D1
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2020 16:45:32 -0800 (PST)
Received: by mail-oi1-x263.google.com with SMTP id s18so7678637oih.1
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2020 16:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=J/RUqOLrtG/yyp8LIFv88+rY6UY1ibdpQZmu4ra8MIc=;
        b=NwcWu3Dn+7J31LulCNEb8sfGRew7LV15BVccEBmzBPELzHoQ5PetqiagK3Qfu/Sn6A
         vHiKKWfgnUrCy+eYmTaBnJvuFMvzfU7Bta1y9gbIodIefPoJZ24Xs/JIiZL7ajtlvt7N
         Q1bT6Fsdn3l30EDxKo2oI1d1TSXF24SgUq/bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=J/RUqOLrtG/yyp8LIFv88+rY6UY1ibdpQZmu4ra8MIc=;
        b=ja3KzZo0pg1h+ygbX7gy7Al0WqaMAMxWHgfKvpxXZJN09fI9QnesOoYaYAyfL780D5
         15zeJ8pgl9rIgMqI5ng+7Uj6Zmkwr3ugDuf4FE2VOwnOUSXKShN949qj7yZJ2qSG47iU
         6HjpqwNBE1cFfNeAr3sZisUCgXFpu4CKeY+RudKnW5ODIpQdj+Wh6sPWfsOV3jEngGFc
         xA7FdPWY+up7eANBXYcHXiMQa4kqBNA+UOqCH2MaGWOa++kNsERwQCEAfPEFkDKA0hzD
         8pnHZ57SXVnteHYTp1xQUQgkaFU4Sqw4bKS2q+JAyfMZiLduCvLcX0oyjdqZ3NizTuh0
         W5TA==
X-Gm-Message-State: AOAM531aGO2q5WqE+TYktP6Lm+BVyzTZ1V9iO4rtDtrGVK6ZhCPzG1Ac
        VgwYdLQDCLuWU7Vwga8yAVpycrXwD63jUaMUIrYpILRVBiel
X-Google-Smtp-Source: ABdhPJwN+hE5UZQLPsQy5ABrV6RyrZ19iaTfdyCDSc1RUvOwSOWWyBjQETK4623l5Z/bNJWP+c+XgjUCHRZu
X-Received: by 2002:aca:f03:: with SMTP id 3mr7552629oip.92.1606524331466;
        Fri, 27 Nov 2020 16:45:31 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
        by smtp-relay.gmail.com with ESMTPS id v26sm1302459oth.8.2020.11.27.16.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 16:45:31 -0800 (PST)
X-Relaying-Domain: broadcom.com
From:   Scott Branden <scott.branden@broadcom.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, bruce.ashfield@gmail.com,
        Bruce Ashfield <bruce.ashfield@windriver.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Michal Marek <mmarek@suse.cz>,
        Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH] menuconfig,mconf-cfg: Allow specification of ncurses location
Date:   Fri, 27 Nov 2020 16:45:05 -0800
Message-Id: <20201128004505.27619-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Bruce Ashfield <bruce.ashfield@windriver.com>

In some cross build environments such as the Yocto Project build
environment it provides an ncurses library that is compiled
differently than the host's version.  This causes display corruption
problems when the host's curses includes are used instead of the
includes from the provided compiler are overridden.  There is a second
case where there is no curses libraries at all on the host system and
menuconfig will just fail entirely.

The solution is simply to allow an override variable in
check-lxdialog.sh for environments such as the Yocto Project.  Adding
a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue and allowing
compiling and linking against the right headers and libraries.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
cc: Michal Marek <mmarek@suse.cz>
cc: linux-kbuild@vger.kernel.org
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 scripts/kconfig/mconf-cfg.sh | 8 ++++++++
 1 file changed, 8 insertions(+)
 mode change 100755 => 100644 scripts/kconfig/mconf-cfg.sh

diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
old mode 100755
new mode 100644
index aa68ec95620d..32448bc198a5
--- a/scripts/kconfig/mconf-cfg.sh
+++ b/scripts/kconfig/mconf-cfg.sh
@@ -4,6 +4,14 @@
 PKG="ncursesw"
 PKG2="ncurses"
 
+if [ "$CROSS_CURSES_LIB" != "" ]; then
+    echo libs=\'$CROSS_CURSES_LIB\'
+    if [ x"$CROSS_CURSES_INC" != x ]; then
+	echo cflags=\'$CROSS_CURSES_INC\'
+    fi
+    exit 0
+fi
+
 if [ -n "$(command -v pkg-config)" ]; then
 	if pkg-config --exists $PKG; then
 		echo cflags=\"$(pkg-config --cflags $PKG)\"
-- 
2.17.1

