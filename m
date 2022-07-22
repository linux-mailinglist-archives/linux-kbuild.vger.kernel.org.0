Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB3D257D88A
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Jul 2022 04:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234195AbiGVCYt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jul 2022 22:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234212AbiGVCYk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jul 2022 22:24:40 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786EB97D4F
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jul 2022 19:24:35 -0700 (PDT)
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0CFFD3F12B
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Jul 2022 02:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1658456674;
        bh=wJNrQQtx3gOtb03R7lr5BRoZshGsFg1ZQbX8SV/qIv0=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=DPHuJYlc4YmFRgeqIzI/U1mdavzByvRQGK76SyICVOOPYHxyoUIEC0ERg6BJnberM
         cJ1PnXRAVwfV1+N4PNTq/yf034WerjPwDaC7To1JvHdNW8W92WkOFJTqAu/x7FmKvZ
         pIfRnHA3FSv+3IOVw7vyPbKoDEudUiD7OJnZWqXFG0ihilEXxRq5NMoT3Eem6swotv
         X7WCb2cLW+6ff5qdv0t6Hn4Fj54rCCHmHsMGt4uS/0yw66JSS+nG7VoCY1SWagNN/F
         vezk3Tl0ijzpYBrYAV1hbaCAP50Im1iCzKLz9TKJMBawuIXt35rIZoscuZGfXqtZjH
         ZRVmm82DGc2Gg==
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-10d6ce04410so1783076fac.23
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jul 2022 19:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wJNrQQtx3gOtb03R7lr5BRoZshGsFg1ZQbX8SV/qIv0=;
        b=U8rXUFNMCFQa6gH2RTFFANRUsV17Hk/phQvafrF5QKPNPVzH0XiDYnymgs1ukruN1y
         KLPn7tpjdQfciKa9JSQyjOnKkbUxeysxYGGO/ZgW1RU+RydUdIQmWLkGl+b7J1aPpO8+
         0qKcLHSMEc24FbXotojL3Kyox74yu6KGNjM/8jcfRjQYZubm3s3AMx+rMvQAVha1R4VM
         zUjvPm+MqzIA6K1j8ev4P52PgC/FOrpTuRteXc4TlkDQo1HRmFGCf+rn3AvweY6Hjof2
         B2tXCymKSgzzfZ19aizYo6S4PcuFUCXLhm46ruaPwzzlVt5k1D9qdJTIBKkFFpUebzO6
         rTww==
X-Gm-Message-State: AJIora9L4L9rrYWCtzk4BP2qD5riToSLisKzlXoQTlXchDkVNyU2UUGM
        65oY25SVGF3d2azv1zgj6jMTi77EjHLaOPSpdjDat/D2XgZftCIPr829iiKabsvVJitJsEYHiVx
        HJHRWTNp8ziFTeV2Homx9RhpIKZfBcQw9TQQp8JG+dA==
X-Received: by 2002:a05:6808:168f:b0:325:2974:77d6 with SMTP id bb15-20020a056808168f00b00325297477d6mr475100oib.199.1658456672598;
        Thu, 21 Jul 2022 19:24:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s65fv3xUo8XMCP9XXulfad6SVF8ugAzDtIkHRV6v0nExF6efgLcw0ldBLwljX4w1+HXqAo5Q==
X-Received: by 2002:a05:6808:168f:b0:325:2974:77d6 with SMTP id bb15-20020a056808168f00b00325297477d6mr475086oib.199.1658456672319;
        Thu, 21 Jul 2022 19:24:32 -0700 (PDT)
Received: from mfo-t470.. ([2804:14c:4e1:8732:c479:1206:16fb:ce1f])
        by smtp.gmail.com with ESMTPSA id k23-20020a056870959700b000f5f4ad194bsm1814528oao.25.2022.07.21.19.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 19:24:31 -0700 (PDT)
From:   Mauricio Faria de Oliveira <mfo@canonical.com>
To:     linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>
Subject: [RFC PATCH 3/6] sysctl, mod_devicetable: shadow struct ctl_table.procname for file2alias
Date:   Thu, 21 Jul 2022 23:24:13 -0300
Message-Id: <20220722022416.137548-4-mfo@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220722022416.137548-1-mfo@canonical.com>
References: <20220722022416.137548-1-mfo@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In order to expose a sysctl entry to modpost (file2alias.c, precisely)
we have to shadow 'struct ctl_table' in mod_devicetable.h, as scripts
should not access kernel headers or its types (see file2alias.c).

The required field is '.procname' (basename of '/proc/sys/.../entry').

Since 'struct ctl_table' is annotated for structure randomization and
we need a known offset for '.procname' (remember, no kernel headers),
take it out of the randomized portion (as in, eg, 'struct task_struct').

Of course, add build-time checks for struct size and .procname offset
between both structs. (This has to be done on kernel side; for headers.)

With that in place, use the regular macros in devicetable-offsets.c to
define SIZE_... and OFF_... macros for the shadow struct and the field
of interest.

Signed-off-by: Mauricio Faria de Oliveira <mfo@canonical.com>
---
 fs/proc/proc_sysctl.c             | 19 +++++++++++++++++++
 include/linux/mod_devicetable.h   | 25 +++++++++++++++++++++++++
 include/linux/sysctl.h            | 11 ++++++++++-
 kernel/sysctl.c                   |  1 +
 scripts/mod/devicetable-offsets.c |  3 +++
 5 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index 021e83fe831f..ebbf8702387e 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -19,6 +19,24 @@
 #include <linux/kmemleak.h>
 #include "internal.h"
 
+#ifdef CONFIG_MODULES
+#include <linux/mod_devicetable.h>
+
+static void check_struct_sysctl_device_id(void)
+{
+	/*
+	 * The shadow struct sysctl_device_id for file2alias.c needs
+	 * the same size of struct ctl_table and offset for procname.
+	 */
+	BUILD_BUG_ON(sizeof(struct sysctl_device_id)
+			!= sizeof(struct ctl_table));
+	BUILD_BUG_ON(offsetof(struct sysctl_device_id, procname)
+			!= offsetof(struct ctl_table, procname));
+}
+#else
+static void check_struct_sysctl_device_id(void) {}
+#endif
+
 #define list_for_each_table_entry(entry, table) \
 	for ((entry) = (table); (entry)->procname; (entry)++)
 
@@ -1779,6 +1797,7 @@ int __init proc_sys_init(void)
 	proc_sys_root->proc_dir_ops = &proc_sys_dir_file_operations;
 	proc_sys_root->nlink = 0;
 
+	check_struct_sysctl_device_id();
 	return sysctl_init_bases();
 }
 
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 549590e9c644..9cee024d8f2f 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -20,6 +20,31 @@ enum {
 	PCI_ID_F_VFIO_DRIVER_OVERRIDE = 1,
 };
 
+/*
+ * "Device" table entry for a sysctl file (shadow of struct ctl_table).
+ *
+ * Only the procname field is reliable (known offset); all other fields
+ * are in the randomized portion of struct ctl_table, do NOT use them.
+ */
+struct sysctl_device_id {
+
+	/* This must be the first field (shadowed from struct ctl_table). */
+	const char *procname;
+
+	/* Here begins the randomizable portion of struct ctl_table. */
+
+	void *data;
+	int maxlen;
+	unsigned short mode; // umode_t in <linux/types.h>
+	void *child;
+	void *proc_handler;
+	void *poll;
+	void *extra1;
+	void *extra2;
+
+	/* Here ends the randomizable portion of struct ctl_table. */
+};
+
 /**
  * struct pci_device_id - PCI device ID structure
  * @vendor:		Vendor ID to match (or PCI_ANY_ID)
diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index 780690dc08cd..676112fde5ff 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -133,7 +133,13 @@ static inline void *proc_sys_poll_event(struct ctl_table_poll *poll)
 
 /* A sysctl table is an array of struct ctl_table: */
 struct ctl_table {
+
+	/* This must be the first field (shadowed to struct sysctl_device_id) */
 	const char *procname;		/* Text ID for /proc/sys, or zero */
+
+	/* This begins the randomizable portion of the struct. */
+	randomized_struct_fields_start
+
 	void *data;
 	int maxlen;
 	umode_t mode;
@@ -142,7 +148,10 @@ struct ctl_table {
 	struct ctl_table_poll *poll;
 	void *extra1;
 	void *extra2;
-} __randomize_layout;
+
+	/* New fields go above here, so they are in the randomized portion. */
+	randomized_struct_fields_end
+};
 
 struct ctl_node {
 	struct rb_node node;
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 223376959d29..15073621cfa8 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -2487,6 +2487,7 @@ int __init sysctl_init_bases(void)
 
 	return 0;
 }
+
 #endif /* CONFIG_SYSCTL */
 /*
  * No sense putting this after each symbol definition, twice,
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index c0d3bcb99138..43b2549940d2 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -262,5 +262,8 @@ int main(void)
 	DEVID(ishtp_device_id);
 	DEVID_FIELD(ishtp_device_id, guid);
 
+	DEVID(sysctl_device_id);
+	DEVID_FIELD(sysctl_device_id, procname);
+
 	return 0;
 }
-- 
2.25.1

