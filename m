Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8ACE57D890
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Jul 2022 04:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234362AbiGVCZY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jul 2022 22:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234239AbiGVCY6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jul 2022 22:24:58 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF6397D4B
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jul 2022 19:24:45 -0700 (PDT)
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DD3813F12D
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Jul 2022 02:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1658456682;
        bh=21lfF1OMKLeXFtULRWjRtXARMWFjMfI3d/p5JlAEia8=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=j7ypn63L/VZft1Xt+AoQ482eB7JitZn+eM2kBk8QMadfswfT/mLTK6SvKcH3JwDkz
         nM120srDsJ/L1UR9dQ65B4t/4DabA+thQAq3w9btgSI+baFtysaOyHxngjPfiTz2vr
         ZBqMR3zUL4zFoELRQiD3pM8Yxu54+ZECTm8eyM4jXjL9zFHBrJIfKRb9vbuc6ULzzW
         NwSTiH5cGN+38TF7TlwSGkOg26CisYbRndE3CneAy4YLrbPWvtl/Ct7NH7+wLSH90x
         bFlt+nfV3Kyo/Wtn6XkhxYu0UFJv3MOhBqLQ9iB/Ocv523zotPglJFYBQKHS0MXaFu
         mX2nbWUXIFdPQ==
Received: by mail-ot1-f71.google.com with SMTP id s2-20020a0568301e0200b0061c8364ad61so1620687otr.1
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jul 2022 19:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=21lfF1OMKLeXFtULRWjRtXARMWFjMfI3d/p5JlAEia8=;
        b=GaCaCdFXnXHFltRzMTQOIx3OzgsIRYOOJ2j4bO4LwHBLZD8SQGNP4dQFDYgctzkgnx
         niMFyUTHNRHdZYfO/NZ1gEFzceIfs+O8uaY7yWUrFvNIk/w8NI5k7T05v5mbhBQ82Mvz
         uHD6+S0/nbb/GFTnaMbAH7HqRUAYis7l19olIHt++LNB6GKogvlccDmECoNPlpkvcKfr
         /LRd36TrYbPrvC5SRjjLMm69XkIBJcjbWnBNZoX9N+umm1yBX9eOshaL946foVBEdzD+
         hEmuHv2/RinyjQo0E0UjciPSKZEqrZJPjrx6bUQFOw0G5IniRkNDC7BEakmRKdW8I3q8
         ucKw==
X-Gm-Message-State: AJIora/j4p+TQX5SxmPRrxm2hCMifqd50zuZm6cJsJ7Z8ZRLDHbSK7VQ
        bPnok6uLHI0a8T/1SlKng36pwiUUjNM63wIt6GhoQcxPSmD25MvYjsrM3vcKceeY4GE1ywY3bAB
        /RBsZdYb/M/oKbWJ7H18wiz9D6hUUQGAtuRiujXCfug==
X-Received: by 2002:a05:6870:9691:b0:10d:4e09:6d0d with SMTP id o17-20020a056870969100b0010d4e096d0dmr620839oaq.54.1658456682546;
        Thu, 21 Jul 2022 19:24:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uvU9qJw3xZdY8qLtAMfrO1WVNCSVRdNA2PSo7g3N3dxoTLVc+Yd1R+zm9uxw3Fm3r+ZL9hVg==
X-Received: by 2002:a05:6870:9691:b0:10d:4e09:6d0d with SMTP id o17-20020a056870969100b0010d4e096d0dmr620824oaq.54.1658456682346;
        Thu, 21 Jul 2022 19:24:42 -0700 (PDT)
Received: from mfo-t470.. ([2804:14c:4e1:8732:c479:1206:16fb:ce1f])
        by smtp.gmail.com with ESMTPSA id k23-20020a056870959700b000f5f4ad194bsm1814528oao.25.2022.07.21.19.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 19:24:41 -0700 (PDT)
From:   Mauricio Faria de Oliveira <mfo@canonical.com>
To:     linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>
Subject: [RFC PATCH 6/6] sysctl: introduce /proc/sys/kernel/modprobe_sysctl_alias
Date:   Thu, 21 Jul 2022 23:24:16 -0300
Message-Id: <20220722022416.137548-7-mfo@canonical.com>
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

The goal of the earlier patches is to let sysctl userspace tools
load the kernel module with a sysctl entry that is not available
yet in /proc/sys/ when the tool runs (so it can become available).

Let's expose this file for userspace for two reasons:

1) Allow such tools to identify that the running kernel has the
   code which produces sysctl module aliases, so they could run
   'modprobe sysctl:<entry>' only when it may actually help.

2) Allow an administrator to hint such tools not to do that, if
   that is desired for some reason (e.g., rather have the tools
   fail if something is misconfigured in a critical deployment).

Also add a module parameter for that (proc.modprobe_sysctl_alias),
for another method that doesn't depend on sysctl tools to be set
(that wouldn't fail them to try and set it if it's not there yet).

Signed-off-by: Mauricio Faria de Oliveira <mfo@canonical.com>
---
 fs/proc/proc_sysctl.c  | 8 ++++++++
 include/linux/module.h | 1 +
 kernel/sysctl.c        | 9 +++++++++
 3 files changed, 18 insertions(+)

diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index ebbf8702387e..1e63819fcda8 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -33,6 +33,14 @@ static void check_struct_sysctl_device_id(void)
 	BUILD_BUG_ON(offsetof(struct sysctl_device_id, procname)
 			!= offsetof(struct ctl_table, procname));
 }
+
+/*
+ * Hint sysctl userspace tools whether or not to run modprobe with sysctl alias
+ * ('modprobe sysctl:entry') if they cannot find the file '/proc/sys/.../entry'
+ */
+int modprobe_sysctl_alias = 1;
+module_param(modprobe_sysctl_alias, int, 0644);
+
 #else
 static void check_struct_sysctl_device_id(void) {}
 #endif
diff --git a/include/linux/module.h b/include/linux/module.h
index 3010f687df19..5f565491c596 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -304,6 +304,7 @@ struct notifier_block;
 #ifdef CONFIG_MODULES
 
 extern int modules_disabled; /* for sysctl */
+extern int modprobe_sysctl_alias; /* for proc sysctl */
 /* Get/put a kernel symbol (calls must be symmetric) */
 void *__symbol_get(const char *symbol);
 void *__symbol_get_gpl(const char *symbol);
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 15073621cfa8..b396cfcb55fc 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -1763,6 +1763,15 @@ static struct ctl_table kern_table[] = {
 		.mode		= 0644,
 		.proc_handler	= proc_dostring,
 	},
+#ifdef CONFIG_PROC_SYSCTL
+	{
+		.procname	= "modprobe_sysctl_alias",
+		.data		= &modprobe_sysctl_alias,
+		.maxlen		= sizeof(modprobe_sysctl_alias),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec,
+	},
+#endif
 	{
 		.procname	= "modules_disabled",
 		.data		= &modules_disabled,
-- 
2.25.1

