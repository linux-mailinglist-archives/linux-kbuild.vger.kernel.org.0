Return-Path: <linux-kbuild+bounces-2325-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90878924B2E
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 00:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0044B2168F
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 22:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC68A1C2DE4;
	Tue,  2 Jul 2024 21:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="llkhDD92"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DB41C093C
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jul 2024 21:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719957548; cv=none; b=tfI5SWw8dhQ1zBhGomfpDsjNG1V/gbKTrN8wcCBXdFMCCl6Q0fznkGJlTrVHIRVx4OsJOjYUpLYSQfp4/ak2ht3MMYkMDJ5BcB4o8R3TbBWrrjE+UBfTiFNwYZnj6KDIqSfEuZrF1ujF2AhMfupKKRx0CFMSOqa4N0PyMnxOtco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719957548; c=relaxed/simple;
	bh=KS6v5h2TMxV5p5idCDDKxL5D9ipXivXxl0yGY6wRk5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=agLAbvxPU9FXaYRPIbJxyOJO0E7U3nSVbFzvmDKNbU6EB99rnMYBZnxrNBew2wlEOPFEOWbnNETyswe+xuFGFl+TjLjMqGPIVm6k8Mth4sKhRKDfC0vyRGP3cXMWkAXOyq3+SDTHlQmg3LJNpDE6ubFclWPfecPlmCGvCyosTXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=llkhDD92; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c7b14bb4a5so17916a91.0
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jul 2024 14:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719957546; x=1720562346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaROXC68GNyaX4Dj5ZGqXjQP0U0kBkL9jho+BZ7xcjY=;
        b=llkhDD9289OvZvEm6UOR8hFnxssZxsWHbMXwCUkB50MMIAmep75hkV/Hd6bpKKG9sj
         s/MaPzqE4E7upg5DEG3Pq7BgHfQSf+AC++DtO1+wu4+RBHfjyYoblOJNWlpzw8xqmxRc
         NV8I6xtY4oKkYfsX7+tl6BKxagL1b+ozroIDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719957546; x=1720562346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaROXC68GNyaX4Dj5ZGqXjQP0U0kBkL9jho+BZ7xcjY=;
        b=OBifMWCiESTjDxtSfFl7VQzALxhoj2HQK6cwKEshriO43vdq/IQAkPmKcax2zOgg9e
         f0U7/kMKsWzzpQ8iE6A9h9yJuiML35T5eYmDVtrCBFV7Nh91V03TMIx8rAiEgGdzpC/k
         RaySloS56txOXG607SgAQlaAo1wsG2JGaR7BedAMXe/FUzyadBvpK18AcrCRSGxETWiF
         An+lucho3kKIMzcQm5Q0ysT00Vx+16zbnShQ9swJhUMNSMIe+FL/pWSBd8n0XUwlbgfO
         CXx055FMTeUJKvbuBvdDtERQWJ7087sYS2T/rlKJfXa9rEb92tMlng1jgee/2riwIYsQ
         655A==
X-Forwarded-Encrypted: i=1; AJvYcCXntQNJ2Nqetki6gxFx3sq66Dm5LV0M3lzumOKVmecqtDhAZ3+6ajOKU0/Qr6asXtWoSinUEnI3XnQNaK939YcRqfnntSqP2El+BZYj
X-Gm-Message-State: AOJu0YzRtOkjobnKUvsAeqOBwEEVR/oHjgPOozp+zCYWHKEVCHDXzqaW
	pW6BWbg3rCMsudMRkgAOLNPHYIyk00fkNeVVfKMOVVscoZg0WAkvoAkwyRinpg==
X-Google-Smtp-Source: AGHT+IH2/m6EIFOLSLhgMDsvvUV/sVJEQ8WwfSylFVNaQ8sawGIDNdYdzlJnCUgCZbHRviLXsCiLow==
X-Received: by 2002:a17:90a:c912:b0:2c9:36bf:ba6f with SMTP id 98e67ed59e1d1-2c93d186753mr15586471a91.3.1719957545989;
        Tue, 02 Jul 2024 14:59:05 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:5fa9:4b10:46fe:4740])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2c91c7df8b0sm9517429a91.0.2024.07.02.14.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 14:59:05 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 3/3] tools build: Correct bpf fixdep dependencies
Date: Tue,  2 Jul 2024 14:58:39 -0700
Message-ID: <20240702215854.408532-4-briannorris@chromium.org>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240702215854.408532-1-briannorris@chromium.org>
References: <20240702215854.408532-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dependencies in tools/lib/bpf/Makefile are incorrect. Before we
recurse to build $(BPF_IN_STATIC), we need to build its 'fixdep'
executable.

I can't use the usual shortcut from Makefile.include:

  <target>: <sources> fixdep

because its 'fixdep' target relies on $(OUTPUT), and $(OUTPUT) differs
in the parent 'make' versus the child 'make' -- so I imitate it via
open-coding.

I tweak a few $(MAKE) invocations while I'm at it, because
1. I'm adding a new recursive make; and
2. these recursive 'make's print spurious lines about files that are "up
   to date" (which isn't normally a feature in Kbuild subtargets) or
   "jobserver not available" (see [1])

I also need to tweak the assignment of the OUTPUT variable, so that
relative path builds work. For example, for 'make tools/lib/bpf', OUTPUT
is unset, and is usually treated as "cwd" -- but recursive make will
change cwd and so OUTPUT has a new meaning. For consistency, I ensure
OUTPUT is always an absolute path.

And $(Q) gets a backup definition in tools/build/Makefile.include,
because Makefile.include is sometimes included without
tools/build/Makefile, so the "quiet command" stuff doesn't actually work
consistently without it.

After this change, top-level builds result in an empty grep result from:

  $ grep 'cannot find fixdep' $(find tools/ -name '*.cmd')

[1] https://www.gnu.org/software/make/manual/html_node/MAKE-Variable.html
If we're not using $(MAKE) directly, then we need to use more '+'.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 - also fix libbpf shared library rules
 - ensure OUTPUT is always set, and always an absolute path
 - add backup $(Q) definition in tools/build/Makefile.include

 tools/build/Makefile.include | 12 +++++++++++-
 tools/lib/bpf/Makefile       | 14 ++++++++++++--
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/tools/build/Makefile.include b/tools/build/Makefile.include
index 8dadaa0fbb43..0e4de83400ac 100644
--- a/tools/build/Makefile.include
+++ b/tools/build/Makefile.include
@@ -1,8 +1,18 @@
 # SPDX-License-Identifier: GPL-2.0-only
 build := -f $(srctree)/tools/build/Makefile.build dir=. obj
 
+# More than just $(Q), we sometimes want to suppress all command output from a
+# recursive make -- even the 'up to date' printout.
+ifeq ($(V),1)
+  Q ?=
+  SILENT_MAKE = +$(Q)$(MAKE)
+else
+  Q ?= @
+  SILENT_MAKE = +$(Q)$(MAKE) --silent
+endif
+
 fixdep:
-	$(Q)$(MAKE) -C $(srctree)/tools/build CFLAGS= LDFLAGS= $(OUTPUT)fixdep
+	$(SILENT_MAKE) -C $(srctree)/tools/build CFLAGS= LDFLAGS= $(OUTPUT)fixdep
 
 fixdep-clean:
 	$(Q)$(MAKE) -C $(srctree)/tools/build clean
diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
index 2cf892774346..630369c0091e 100644
--- a/tools/lib/bpf/Makefile
+++ b/tools/lib/bpf/Makefile
@@ -108,6 +108,8 @@ MAKEOVERRIDES=
 
 all:
 
+OUTPUT ?= ./
+OUTPUT := $(abspath $(OUTPUT))/
 export srctree OUTPUT CC LD CFLAGS V
 include $(srctree)/tools/build/Makefile.include
 
@@ -141,7 +143,13 @@ all: fixdep
 
 all_cmd: $(CMD_TARGETS) check
 
-$(BPF_IN_SHARED): force $(BPF_GENERATED)
+$(SHARED_OBJDIR):
+	$(Q)mkdir -p $@
+
+$(STATIC_OBJDIR):
+	$(Q)mkdir -p $@
+
+$(BPF_IN_SHARED): force $(BPF_GENERATED) | $(SHARED_OBJDIR)
 	@(test -f ../../include/uapi/linux/bpf.h -a -f ../../../include/uapi/linux/bpf.h && ( \
 	(diff -B ../../include/uapi/linux/bpf.h ../../../include/uapi/linux/bpf.h >/dev/null) || \
 	echo "Warning: Kernel ABI header at 'tools/include/uapi/linux/bpf.h' differs from latest version at 'include/uapi/linux/bpf.h'" >&2 )) || true
@@ -151,9 +159,11 @@ $(BPF_IN_SHARED): force $(BPF_GENERATED)
 	@(test -f ../../include/uapi/linux/if_xdp.h -a -f ../../../include/uapi/linux/if_xdp.h && ( \
 	(diff -B ../../include/uapi/linux/if_xdp.h ../../../include/uapi/linux/if_xdp.h >/dev/null) || \
 	echo "Warning: Kernel ABI header at 'tools/include/uapi/linux/if_xdp.h' differs from latest version at 'include/uapi/linux/if_xdp.h'" >&2 )) || true
+	$(SILENT_MAKE) -C $(srctree)/tools/build CFLAGS= LDFLAGS= OUTPUT=$(SHARED_OBJDIR) $(SHARED_OBJDIR)fixdep
 	$(Q)$(MAKE) $(build)=libbpf OUTPUT=$(SHARED_OBJDIR) CFLAGS="$(CFLAGS) $(SHLIB_FLAGS)"
 
-$(BPF_IN_STATIC): force $(BPF_GENERATED)
+$(BPF_IN_STATIC): force $(BPF_GENERATED) | $(STATIC_OBJDIR)
+	$(SILENT_MAKE) -C $(srctree)/tools/build CFLAGS= LDFLAGS= OUTPUT=$(STATIC_OBJDIR) $(STATIC_OBJDIR)fixdep
 	$(Q)$(MAKE) $(build)=libbpf OUTPUT=$(STATIC_OBJDIR)
 
 $(BPF_HELPER_DEFS): $(srctree)/tools/include/uapi/linux/bpf.h
-- 
2.45.2.803.g4e1b14247a-goog


