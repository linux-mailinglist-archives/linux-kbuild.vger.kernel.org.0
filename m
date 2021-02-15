Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93E2331B93B
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Feb 2021 13:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhBOM3A (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Feb 2021 07:29:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbhBOM2q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Feb 2021 07:28:46 -0500
Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [IPv6:2001:1600:3:17::bc09])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227FAC061574
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Feb 2021 04:28:00 -0800 (PST)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
        by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4DfNd11gQnzMqC30;
        Mon, 15 Feb 2021 13:26:29 +0100 (CET)
Received: from localhost (unknown [23.97.221.149])
        by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4DfNd03z7nzlh8TQ;
        Mon, 15 Feb 2021 13:26:27 +0100 (CET)
From:   =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To:     James Morris <jmorris@namei.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "Serge E . Hallyn" <serge@hallyn.com>
Cc:     =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Nicolas Iooss <nicolas.iooss@m4x.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@linux.microsoft.com>
Subject: [PATCH v1 3/3] security: Add LSMs dependencies to CONFIG_LSM
Date:   Mon, 15 Feb 2021 13:25:13 +0100
Message-Id: <20210215122513.1773897-4-mic@digikod.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210215122513.1773897-1-mic@digikod.net>
References: <20210215122513.1773897-1-mic@digikod.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Mickaël Salaün <mic@linux.microsoft.com>

Thanks to the previous commit, this gives the opportunity to users, when
running make oldconfig, to update the list of enabled LSMs at boot time
if an LSM has just been enabled or disabled in the build.  Moreover,
this list only makes sense if at least one LSM is enabled.

Cc: Casey Schaufler <casey@schaufler-ca.com>
Cc: James Morris <jmorris@namei.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Serge E. Hallyn <serge@hallyn.com>
Signed-off-by: Mickaël Salaün <mic@linux.microsoft.com>
Link: https://lore.kernel.org/r/20210215122513.1773897-4-mic@digikod.net
---
 security/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/security/Kconfig b/security/Kconfig
index 7561f6f99f1d..2bc9ff351176 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -277,6 +277,10 @@ endchoice
 
 config LSM
 	string "Ordered list of enabled LSMs"
+	depends on SECURITY_LOCKDOWN_LSM || SECURITY_YAMA || SECURITY_LOADPIN || \
+		SECURITY_SAFESETID || INTEGRITY || SECURITY_SELINUX || \
+		SECURITY_SMACK || SECURITY_TOMOYO || SECURITY_APPARMOR || \
+		BPF_LSM
 	default "lockdown,yama,loadpin,safesetid,integrity,smack,selinux,tomoyo,apparmor,bpf" if DEFAULT_SECURITY_SMACK
 	default "lockdown,yama,loadpin,safesetid,integrity,apparmor,selinux,smack,tomoyo,bpf" if DEFAULT_SECURITY_APPARMOR
 	default "lockdown,yama,loadpin,safesetid,integrity,tomoyo,bpf" if DEFAULT_SECURITY_TOMOYO
-- 
2.30.0

