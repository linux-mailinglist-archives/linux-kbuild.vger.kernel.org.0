Return-Path: <linux-kbuild+bounces-5677-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D2EA2D767
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 17:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 020FC7A2C12
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 16:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FAE1F3B96;
	Sat,  8 Feb 2025 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UygrmsIr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CE21F3B86;
	Sat,  8 Feb 2025 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032840; cv=none; b=r9B19FLhb7goTSZaQLMrQy8zzcWlU41rRiP3d3TW9IhwRjMXnuIorD2062Ij6Iq3w19ZBlpG7rcuEydBkiOFlD+S31vn5nOhUSQJ90O0EYGqCRS9Hlh2Nyl/p8C6ILiW1C4szhBTc5mlnFaTCP6W0vjh5oBZ3ssfbs9oMzoY1QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032840; c=relaxed/simple;
	bh=Fgxku5RPW8FWV3C8caf/gIzbndc0xmCblOC0ySNF51A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IZIPSVL8E8v+EB3LvzvRVIlYQZ00aRU2Qo93BC1q+vpQQ/wBoQuM21FqFb7QlA3gwxKtVYVkbDi7Z+tse6PoHKnfRWvFUZvnyvO5UYMHtNllmQ8KFOeXjGDl2MbG64UW5x85fyRMRoVXoYOk7FYOVIc1JbiDjlxXCrDvN06PstE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UygrmsIr; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab7a4b40cc1so100659166b.0;
        Sat, 08 Feb 2025 08:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739032837; x=1739637637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDYe9in7ppLsTtVsenOBRVJi5GL6J9SBuShnxnSy6NE=;
        b=UygrmsIrn1jnryqg0IDxwSDCKmT8nGBNGqKOUTZSLmnFBk3rQRiwpqJ/Ex59RE5uFM
         asJ58rZOM8ZJUU9iJcrTRux7yJ4Zx2WCd2KxIXfeThPwPu5PWGQ0kxVGU3f4ULbYd3Ga
         6gfEBylzqSZzS+/dlx6VssUynv6pfGp5rQD1zEBsGkocLYtg7l8QsSBGBhryIgLU9dIt
         RN5Kyo3/DbSLVTsvujt+C9SM8z02Xw6h/AVY8EPWwaU+hQeRbd+yohX01LVIhpMaVofx
         BWolTiqkdd3JgCtSxrAEbC4Hdp6czEmen//Ah5ztkudVhvvzIaygfFQyESZzxOXfsAfo
         W2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739032837; x=1739637637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDYe9in7ppLsTtVsenOBRVJi5GL6J9SBuShnxnSy6NE=;
        b=VtiB2XQkdcbtozr1oj76kxtNmSEtYTKrn4egFEEOXU3OAv1bemoSaeyVIVWmKwUUOq
         G/xHJ9tilU7VJhRHJTUDw4JF9EUmCoLtV1mFcMo/pUKcTcp0+iJ9fDyXUHpnVx3mY5l4
         59Yz0XFiva8P+/CPrRWT5Mwpwus6LiBFm9DvDLxfXUUc0zEFhx2Rcd+OhR/tGu2RqbBo
         SMAYtb2VG6P9QfIQoZWntwr7N91xqx9VI0ck0j4DpAaUNpiKrYLLEqBtVrX84Xt/cdTk
         HOQRfWgIuwA1HT15sd9XJhSd59NHZAao/rGp26ye+KtuaFlBVgSsYioCFxt/4P3ujnez
         TMmA==
X-Forwarded-Encrypted: i=1; AJvYcCW59YgQlYKf7dUENfxWFd8M3WE4bTqYcnf7Nqk98ncIsKoRUz8CPPkH4PXpE6/LTdSdU9HDIjGTgmeJud0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOAy0Fx8CId5hcUGCnYDl/dDyfmXQyIlCgmacHnzvO4xtlmRcw
	lX+N/b1bRax9hBRVbfPLRuVkl7v5XuA/v21wfazzd/U0LkaJ4+8jDhxMtw==
X-Gm-Gg: ASbGncuLwYrWc8LbWozVBWDh7G7ozmccY9iaHFoql0uJfbu8EYqsDkSLegRqGw7z5an
	9obbZgKMP++N81UKqLBHkfUmwLiBXsRziW18oD3AHV0aoGr7MgHzYd6GDjXDiY6XFoVVyo/7D/E
	T0spXX3VUuK7Gcip1e1dk6gK89s8QqAJ3pO6tFay4jUZi33E5BW7YupwzladVIYIc5Dm0gGvvZ+
	6Ekhr+XIqKBPMioDAjVb6um8WfyZwas4ZZOtx7jDWhPo0rytcozZWOnP6QI2NRHn30vfEPc55iN
	BBR6wwOu9kaSR2JVPPktEExG7zgmPA==
X-Google-Smtp-Source: AGHT+IH03k6Ap+U8QUh7GB24E2m/Ci6bNLoyNBjkMmx/L2TYMgr43Tr3Vj8Xc1tlA0G4lHGJU08skw==
X-Received: by 2002:a17:907:72d0:b0:ab6:d4d0:2be9 with SMTP id a640c23a62f3a-ab789c544c0mr752546366b.56.1739032836658;
        Sat, 08 Feb 2025 08:40:36 -0800 (PST)
Received: from localhost.localdomain ([2a02:908:e842:bf20:e115:64e7:5d6:176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773337f3dsm501539166b.139.2025.02.08.08.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 08:40:36 -0800 (PST)
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
Subject: [PATCH v7 01/11] kconfig: Add PicoSAT interface
Date: Sat,  8 Feb 2025 17:39:49 +0100
Message-Id: <20250208163959.3973163-2-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250208163959.3973163-1-ole0811sch@gmail.com>
References: <20250208163959.3973163-1-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PicoSAT [0] is the SAT solver used in this project. It is used as a
dynamically loaded library. Add PicoSAT dynamic library support to
kconfig, which will be used in the subsequent patches.

Link: https://fmv.jku.at/picosat/ # [0]

Signed-off-by: Patrick Franz <deltaone@debian.org>
Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>
---
 scripts/kconfig/picosat_functions.c | 79 +++++++++++++++++++++++++++++
 scripts/kconfig/picosat_functions.h | 35 +++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 scripts/kconfig/picosat_functions.c
 create mode 100644 scripts/kconfig/picosat_functions.h

diff --git a/scripts/kconfig/picosat_functions.c b/scripts/kconfig/picosat_functions.c
new file mode 100644
index 000000000000..dcfc80d418c2
--- /dev/null
+++ b/scripts/kconfig/picosat_functions.c
@@ -0,0 +1,79 @@
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
+#define PICOSAT_FUNCTION_LIST              \
+	X(picosat_init)                    \
+	X(picosat_add)                     \
+	X(picosat_deref)                   \
+	X(picosat_assume)                  \
+	X(picosat_sat)                     \
+	X(picosat_failed_assumptions)      \
+	X(picosat_added_original_clauses)  \
+	X(picosat_enable_trace_generation) \
+	X(picosat_print)
+
+static void load_function(const char *name, void **ptr, void *handle,
+			  bool *failed)
+{
+	const char *error_str;
+
+	if (*failed)
+		return;
+
+	dlerror(); // clear error
+	*ptr = dlsym(handle, name);
+	error_str = dlerror();
+	if (error_str) {
+		printd("While loading %s: %s\n", name, error_str);
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


