Return-Path: <linux-kbuild+bounces-4351-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D53B9B23A2
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 04:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A17CC1C2127C
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 03:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC1018B46E;
	Mon, 28 Oct 2024 03:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+Y+X284"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9BA189F20;
	Mon, 28 Oct 2024 03:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730087410; cv=none; b=n1uXJBS7pFPXp8aUQf5PLNzSJlxwm6CERVXAg8U1vs2/KejDEJJlEjpJ2y3su4IwtHRmFF4qZSS7Ev5ZwjvmeZVmClMAvnqy5YojaSRPBrhexvxtIZSgq4QL0DZc3g5B4jBz8lfSg5Du9G+J0reyZB+tODkanZtHDvED0A1oySY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730087410; c=relaxed/simple;
	bh=P9zb82ZF3TOsV01pX4uqRUgkoUgICbZMKDHOOuaHYGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F9fGh3r22NviamxkyrPyL6nY09S1T316mB21zle1DYYeFB9S3KOTXAyvQ3NJNZx3NF70N0J13ib3/gcPLxPIyyMG+sty94mh1lAEjZKN9/yqv2u4qag7COhJwtixiQoeYD6XFkkJL+IiaQQfmBSokG3CTAVUDbpp+R4eP22cwqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+Y+X284; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cb72918bddso5042769a12.3;
        Sun, 27 Oct 2024 20:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730087406; x=1730692206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4a2Y9QWZw7xiUTbneztFSO9nfoS4jbwm9CQiNKA4PU=;
        b=S+Y+X284ykdzk54aQ6XIM2CovTCbZtRs22f2YU2QdW0AtIUpyj4U8Zjsou6kPALb+5
         KNsCTigr6wYpP3KAU46CD5DHUSyKLPKU6b0x3BoqZNYs4Ctl0KW9CNOa6IB7rc3VLnHy
         wVN4nq6p6SdNKEOjRXkpx0rUzT1k/krmhfHl6D/3g0c36yIrinqUDm2sih281wYFRy9n
         uSYUlUv0EEz7WMgWfq7AYFFUVdrkw4jrdSlrlEZqUnibaHTRwMjEizNiGBDkjJRP6GBI
         g+KKTnChhpnWN+5Deo0q9yo1GvGrM43q+zj5+WpouZMTCpzIjMRTB6Ssnz/O5pzMbVc+
         2PoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730087406; x=1730692206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4a2Y9QWZw7xiUTbneztFSO9nfoS4jbwm9CQiNKA4PU=;
        b=bgfveUNtjv8kryzI0lRNHScsAmzqKHG8ovqM99Wh4A5X8ln7rVfy2RcvcGkaytCja6
         xrHd7yqhBIHdrmxrsYnCop8vFMQTUr9wES8EZQClrRUMg+tzwf7M2cnNbrkdn4z57wO/
         RS2zBK3WGkPem5qJM+aZDtkTme1T9+57FtyxEkKYzYA0cEGy0qBCc9l6XaHML1j5uzsr
         i/vTnR8ZNMj3q/LN48IkpCOLgvAfw7aii59rrVy9oFILvBscm0wUu+ZLtfwiH7MxfzWH
         NYl83cZAmLceII5OCQzslu5PSE1PAwiVNPiOnpKlxqv/VtumQAoQ/jlTG2B50WRiBAoL
         Hv+A==
X-Forwarded-Encrypted: i=1; AJvYcCWVDn1quRL7LzY7UHEGvxb1PbexA+R8TFM8stweCemEqOZSsJRJjAz3GvDTMlwVaRXdEMv3OV5C5/FM9i4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXTSJ6w22CqtaCVL1hMXBC3iF1PGOGZqpRcWH42QVGqej7DWgy
	stMtE08K1lDH7CVhCweY/lxe9WUDdleAZ7T6nM3vBTLPtCm2qLTWHJsgEA==
X-Google-Smtp-Source: AGHT+IGqVGnFy/jbmnTmkEau4V4aa/W20CG3f2rVO0eR6Qr+61F/dwJpDGqtY3JjDklo+mj2kWebiw==
X-Received: by 2002:a17:906:d550:b0:a9a:13c2:2b07 with SMTP id a640c23a62f3a-a9de5f27029mr688676966b.31.1730087405927;
        Sun, 27 Oct 2024 20:50:05 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20:78b:e59b:2b0:d2e9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30f5932fsm334599366b.168.2024.10.27.20.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 20:50:05 -0700 (PDT)
From: Ole Schuerks <ole0811sch@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: ole0811sch@gmail.com,
	jude.gyimah@rub.de,
	thorsten.berger@rub.de,
	deltaone@debian.org,
	jan.sollmann@rub.de,
	mcgrof@kernel.org,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Subject: [PATCH v6 01/11] kconfig: Add PicoSAT interface
Date: Mon, 28 Oct 2024 04:49:39 +0100
Message-Id: <20241028034949.95322-2-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028034949.95322-1-ole0811sch@gmail.com>
References: <20241028034949.95322-1-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PicoSAT (https://fmv.jku.at/picosat/) is the SAT solver used in this
project. It is used as a dynamically loaded library. This commit contains a
script that installs PicoSAT as a library on the host system, a source file
that provides a function for loading a subset of functions from the
library, and a header file that declares these functions.

Signed-off-by: Patrick Franz <deltaone@debian.org>
Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>
---
 scripts/kconfig/picosat_functions.c | 74 +++++++++++++++++++++++++++++
 scripts/kconfig/picosat_functions.h | 35 ++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 scripts/kconfig/picosat_functions.c
 create mode 100644 scripts/kconfig/picosat_functions.h

diff --git a/scripts/kconfig/picosat_functions.c b/scripts/kconfig/picosat_functions.c
new file mode 100644
index 000000000000..ada42abbc22b
--- /dev/null
+++ b/scripts/kconfig/picosat_functions.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <dlfcn.h>
+#include <unistd.h>
+
+#include "array_size.h"
+
+#include "cf_defs.h"
+#include "picosat_functions.h"
+
+const char *picosat_lib_names[] = { "libpicosat-trace.so",
+				    "libpicosat-trace.so.0",
+				    "libpicosat-trace.so.1" };
+
+PicoSAT *(*picosat_init)(void);
+int (*picosat_add)(PicoSAT *pico, int lit);
+int (*picosat_deref)(PicoSAT *pico, int lit);
+void (*picosat_assume)(PicoSAT *pico, int lit);
+int (*picosat_sat)(PicoSAT *pico, int decision_limit);
+const int *(*picosat_failed_assumptions)(PicoSAT *pico);
+int (*picosat_added_original_clauses)(PicoSAT *pico);
+int (*picosat_enable_trace_generation)(PicoSAT *pico);
+void (*picosat_print)(PicoSAT *pico, FILE *file);
+
+#define PICOSAT_FUNCTION_LIST             \
+	X(picosat_init)                   \
+	X(picosat_add)                    \
+	X(picosat_deref)                  \
+	X(picosat_assume)                 \
+	X(picosat_sat)                    \
+	X(picosat_failed_assumptions)     \
+	X(picosat_added_original_clauses) \
+	X(picosat_enable_trace_generation)\
+	X(picosat_print)
+
+static void load_function(const char *name, void **ptr, void *handle, bool *failed)
+{
+	if (*failed)
+		return;
+
+	*ptr = dlsym(handle, name);
+	if (!*ptr) {
+		printd("While loading %s: %s\n", name, dlerror());
+		*failed = true;
+	}
+}
+
+bool load_picosat(void)
+{
+	void *handle = NULL;
+	bool failed = false;
+
+	/*
+	 * Try different names for the .so library. This is necessary since
+	 * all packages don't use the same versioning.
+	 */
+	for (int i = 0; i < ARRAY_SIZE(picosat_lib_names) && !handle; ++i)
+		handle = dlopen(picosat_lib_names[i], RTLD_LAZY);
+	if (!handle) {
+		printd("%s\n", dlerror());
+		return false;
+	}
+
+#define X(name) load_function(#name, (void **) &name, handle, &failed);
+
+	PICOSAT_FUNCTION_LIST
+#undef X
+
+	if (failed) {
+		dlclose(handle);
+		return false;
+	} else
+		return true;
+}
diff --git a/scripts/kconfig/picosat_functions.h b/scripts/kconfig/picosat_functions.h
new file mode 100644
index 000000000000..5d8524afa844
--- /dev/null
+++ b/scripts/kconfig/picosat_functions.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef PICOSAT_FUNCTIONS_H
+#define PICOSAT_FUNCTIONS_H
+
+#include <stdbool.h>
+#include <stdio.h>
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+#define PICOSAT_UNKNOWN         0
+#define PICOSAT_SATISFIABLE     10
+#define PICOSAT_UNSATISFIABLE   20
+
+typedef struct PicoSAT PicoSAT;
+
+extern PicoSAT *(*picosat_init)(void);
+extern int (*picosat_add)(PicoSAT *pico, int lit);
+extern int (*picosat_deref)(PicoSAT *pico, int lit);
+extern void (*picosat_assume)(PicoSAT *pico, int lit);
+extern int (*picosat_sat)(PicoSAT *pico, int decision_limit);
+extern const int *(*picosat_failed_assumptions)(PicoSAT *pico);
+extern int (*picosat_added_original_clauses)(PicoSAT *pico);
+extern int (*picosat_enable_trace_generation)(PicoSAT *pico);
+extern void (*picosat_print)(PicoSAT *pico, FILE *file);
+
+bool load_picosat(void);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif // PICOSAT_FUNCTIONS_H
-- 
2.39.5


