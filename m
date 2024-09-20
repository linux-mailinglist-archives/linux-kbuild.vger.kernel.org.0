Return-Path: <linux-kbuild+bounces-3642-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 005F997D310
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 10:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BEF91F21904
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 08:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8D3137750;
	Fri, 20 Sep 2024 08:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGAkg7VV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D89F34CF5;
	Fri, 20 Sep 2024 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726822607; cv=none; b=eBHv+Q6LHx0xMYAP8j6J7eyMZJaHerATYiT3s9/R5CgApl3MWerP0ICvqV4rLWIGIlyNgWdL1LRGFLpqh8xye70Q6uf9ipjiqFATN1mwEPbS3RvN6I9l0THJwnc6KfCyyNIiYA3Z374LEiCsEfWvzjgsebGzPULxb8Gehjhbx58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726822607; c=relaxed/simple;
	bh=Irg2GzBKQZUEkCk4UB0i5rJX3bypgVmO3Uz93YVGkOw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k7G71cR19NrnJSikOQHvQGLmAPuiJxflRRqYSlaZc05rXl3yV/n9L97W1QuUuF2E0O4oIjDHmibPCc9UYAGXN3iDVbG623QgwZnBHEF3ss/Vf4hsEVxjaQNJBoqk0DHDY3awPLyq214FHIp8wzNfpChYJl3Pl8UOAvnG0y9LKR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGAkg7VV; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c46680a71bso437447a12.2;
        Fri, 20 Sep 2024 01:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726822604; x=1727427404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuBVbFf1k61tFrHxuv3u3r5EVuVStgJFdmZAOMLjXg4=;
        b=EGAkg7VVfVwjYiUTLmRfvbsz5raDXSELcdlpqLmps1tfxvhUxK66qxwl8LCQFGuOUR
         xVSbHeNdg1x4jiwYEow04UiaZ1f/S90noxBkqGeOQ5zCl8TXtZr1NVEoUEYcZfxJeeyu
         VD01sxuRjtZPX994y2Poi4ImCcXiBXTY2S9A600AJr2r3CIa9+tjuAcuNx3fEGwB2OQp
         GeANDoEnogkm/AafWat5ZYbLHlV2u8FPwNBpbNEmKDU88hp2/hIGCOCGfkW9wHsZV0VK
         AjgZqe9IyutFZA74oNcV34DRt5XNZYxzybNhD+DvGHc91E+c+BKN8u1sKMzxL+KCNBxr
         cd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726822604; x=1727427404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zuBVbFf1k61tFrHxuv3u3r5EVuVStgJFdmZAOMLjXg4=;
        b=sPe7UAfpe0m3Vd/w3JK+GFiwgDl46n5un6o+C0O+JH7gXrLHB6W37pdrNxMFAdXx+E
         1xIKD1M0NZud2dcMxDDGhMdlRbYYZ+PcSqiDC8/dubNKGVaXn7kVg1l9SRv9u4VyDmB6
         Q18zG3fxEJ7mFfCN8JuUATVfHGKzh5KPXbwzRH9J5/DUT6rQ9Cy+h6+5+o5GO3s/07/H
         wY584sy55R3W1fnHXp52YcG1TxX9poPr7kbakCjTzxp2CuIW7HqPJQUn5/Nx2YB1MT1X
         N8SehPLc0Y+vrGKqO7J4hD6mdqzfXWC9GejVVhqs3GHipSZtAGrUniMhRMleInv9Ud1N
         c9sA==
X-Forwarded-Encrypted: i=1; AJvYcCXFCMqYY8YeyjnOepHUl0ZXA7aW4mer7JW0bSDUHCrrZhw3AAc6EQgcWa5UCCODRd2+bouQUUDLMLUfntA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu/6N35DFJwNzpVcKdGND68nzNxkqYSiIWEE+frisJjUJ4/0s3
	PkoAeNdopibUJmA8x25cl9MpueRqwcMms6V2nMjZzGLAayYDklvsyNE7Ng==
X-Google-Smtp-Source: AGHT+IEui0lGllXaB2nDV3EznWZIkawQfwzGCJbAWqlQMYGwpy+N24PXX+4D/QRvLLkzBiedPaU4/A==
X-Received: by 2002:a17:907:e647:b0:a88:b93b:cdcb with SMTP id a640c23a62f3a-a90d510a264mr158134366b.47.1726822603671;
        Fri, 20 Sep 2024 01:56:43 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20:422c:48db:9094:2fa9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906109637esm817861866b.40.2024.09.20.01.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 01:56:43 -0700 (PDT)
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
Subject: [PATCH v5 01/11] kconfig: Add PicoSAT interface
Date: Fri, 20 Sep 2024 10:56:18 +0200
Message-Id: <20240920085628.51863-2-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240920085628.51863-1-ole0811sch@gmail.com>
References: <20240920085628.51863-1-ole0811sch@gmail.com>
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
 scripts/kconfig/install-picosat.sh  | 29 +++++++++++
 scripts/kconfig/picosat_functions.c | 74 +++++++++++++++++++++++++++++
 scripts/kconfig/picosat_functions.h | 35 ++++++++++++++
 3 files changed, 138 insertions(+)
 create mode 100755 scripts/kconfig/install-picosat.sh
 create mode 100644 scripts/kconfig/picosat_functions.c
 create mode 100644 scripts/kconfig/picosat_functions.h

diff --git a/scripts/kconfig/install-picosat.sh b/scripts/kconfig/install-picosat.sh
new file mode 100755
index 000000000000..aadfa9582ecb
--- /dev/null
+++ b/scripts/kconfig/install-picosat.sh
@@ -0,0 +1,29 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+psinstdir=$(mktemp -d)
+if [ $? -ne 0 ]; then
+	echo "mktemp failed"
+	exit 1
+fi
+cd $psinstdir
+wget "https://fmv.jku.at/picosat/picosat-965.tar.gz"
+tar -xf picosat-965.tar.gz
+cd picosat-965
+cp makefile.in makefile.in2
+# change soname to conform with packages for Debian and Fedora
+sed -e "s,-soname -Xlinker libpicosat.so,-soname -Xlinker	\
+	libpicosat-trace.so.0," makefile.in2 > makefile.in
+./configure.sh -O -t --shared
+make libpicosat.so
+install -m 0755 -p libpicosat.so /usr/local/lib/libpicosat-trace.so.0.0.965	\
+&& ln -s -f libpicosat-trace.so.0.0.965 /usr/local/lib/libpicosat-trace.so.0	\
+&& ln -s -f libpicosat-trace.so.0 /usr/local/lib/libpicosat-trace.so \
+&& ldconfig
+echo
+if [ $? -ne 0 ]; then
+	echo "Installation of PicoSAT failed, make sure you are running with root privileges."
+	exit 1
+else
+	echo "Installation of PicoSAT succeeded."
+fi
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
2.39.2


