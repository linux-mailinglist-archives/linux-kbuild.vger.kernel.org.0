Return-Path: <linux-kbuild+bounces-11326-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BnrAsl8lWl8RwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11326-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 09:48:09 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 325D0154453
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 09:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 175163002B71
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 08:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1699327C05;
	Wed, 18 Feb 2026 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ia9dWHdk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC97326922
	for <linux-kbuild@vger.kernel.org>; Wed, 18 Feb 2026 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404480; cv=none; b=otJRVtSoxr0DQu4ZexM7UK2ykLm878UBT4fXWGe1K9FH+0RjFXRqB9jFJNEU5mmAviClGZl3VoPcqWIY96xPMDmiSdnS7xpCAXRAaYoKzqvBfBzSiJAlVH10nSKDDzb8JFGeQGpktVOAOYV0kehF3yaQAj7ZJ6wwck43sKB3VZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404480; c=relaxed/simple;
	bh=db8UoqXBuWlXRrOvDWR6NTe1jADOw1CPeFcMqQs31ok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LiskK6bE78DZmTsz4t1VhwdicQVhcumOcK+UhkaejpOjTEqqkrY0WuwYit89p6sZOwrJhkFM6qb82MGufb78RCaq0Cytn+0LA3bwGe8SxliQeocP+kHJ0+CqA8VNnWleqXOF3W9pHTze0K3i72e8VVUTR3hln+Tht5rUDxu/te4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ia9dWHdk; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65bfe9c585cso4842182a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Feb 2026 00:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771404478; x=1772009278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E/5hsVF/ES9WFVEKAhexr1uhkj6T0T0kWE33e5/ideo=;
        b=ia9dWHdkFSmapGtt7InHJ9ylZD+FIhNJxzak6qdgRKDs5NaLvhPrmo1fG76sZrOPFr
         BeZdgy5FdFiN1xPCOzb8Ica/ZaAfR6L//kzmfy68vAbl/aIakPgdi46CAtQYY+3PhKxU
         dT+2Hf5YHFR1idOH0aWXNU2Rn3E+ydmWZF2hm8jfX2zk1eSTPL/ZU+desn/rZuRzLABq
         z+2jBVPo6SaumzydqAVwmA4442Sg4Y88pxLePlfby1+Zno0oMv2s+Z6Gu30h5UhRYRQ8
         DwNCiHfukvrBScxm2cd9vjBDSxN47dZvK67FrKsN9CyzSpKKCV5tnbnc0dvm0ZuZb4T/
         gZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771404478; x=1772009278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/5hsVF/ES9WFVEKAhexr1uhkj6T0T0kWE33e5/ideo=;
        b=TF9Ody5hhkaawyRWLBb/C6N6JrApW3lia+G8KH/PGm9lYp9StAGt4eNwzmQ4ANgbCe
         hyfE4C/W+K2OLpu/kHQ6AyWPjuEUjkHs1ET+DqOnXl1ts2H5mqqx2EdcncM8JcxIUJCf
         L2QyUEKSWrJiZ4WmZeWMZsdnRWbK0z67w0tawm2PtcivjN1kN+APqtbpDrLYxgxHI1OI
         JjleMRAhONc4Dq5FPeLFsF/KYbIc1LkbZJx7kbHT3RrPzKGH0RSPAaeQvvdsap0qni+N
         TzEjFcraZCCkIr3xwU/fTHKYB1zubRnRceqh8CE/RSuO6tQed7+o7XoDziFcnnMQlOva
         VVDg==
X-Forwarded-Encrypted: i=1; AJvYcCWZkGM9YWfjfSB0x7zaVGiewKg6R0T+xuJ2bNryhngHOwdX/tZ+nSQ4VXKRkWQ232PDSfqOHMCphSap4zw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsYPcZwNtR6+ylUDd4ucvX4W5pPN7VUc7OR0qxlSy0pNQPypYa
	2Vx1dqPTqIqcL5sUeIWbpNo0JxTbMzDFJhgQZHdEUTQ4gDWUMTcW/ZOj
X-Gm-Gg: AZuq6aKXc3zjskxQk7OHxDqEOpkaCSaiI/STX6aD/8CgVkC7TXCruwMF303Uh6OK3ev
	fdpnvoHaz52vXRSa7cWU7n1E3nFPZOsG2FtTSSwMd2R1+BuC/byLIB0sDkXbLtVd3htSJm/DoX+
	59otWQQN2ZeGZfmzwI5fnv2UQvw6qv5bGSVUTTROZexnZdGV2RBjHEXQD0mi1hEBdotddIDCe6s
	41AMM500wBMFPmDo/bMgDrbiFrxqgyhHkqrrjtL3ROTOK4s8rGE7GOXr787aRuGtRCyTl6HY9yh
	x0FtAkTDXvdItedSvER/5jV9C3bECqvAzdcLHBPmL/U79ZZUE7jNvbjN96hq84+k9E22obXPN5x
	aZ2ZbmjtkcHM7LneIVzuFasqPadEb5VrPtlQZXbYIeOUxrjl+P6ZEAIi1CFsPzChzisuDHDYMlM
	fwPIB4esclhXBDs8ET1hxwfmLDu9MRHT33pAgiVWh2I5TZYDsEj6Vsw3IdYn2iknPpVTns5C2LZ
	VlQjoc3BpiHrJqZiRoVfBIuUktSKv0=
X-Received: by 2002:a17:906:6a28:b0:b8f:a195:bad8 with SMTP id a640c23a62f3a-b8fc3cb90f5mr718449766b.45.1771404477251;
        Wed, 18 Feb 2026 00:47:57 -0800 (PST)
Received: from ddolgov-thinkpadt14sgen1.local (dslb-002-207-075-089.002.207.pools.vodafone-ip.de. [2.207.75.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7629b56sm447920766b.37.2026.02.18.00.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:47:56 -0800 (PST)
From: Dmitrii Dolgov <9erthalion6@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Ian Rogers <irogers@google.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Dmitrii Dolgov <9erthalion6@gmail.com>
Subject: [PATCH v3] tools build: Fix rust cross compilation
Date: Wed, 18 Feb 2026 09:47:25 +0100
Message-ID: <20260218084736.33114-1-9erthalion6@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-11326-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[9erthalion6@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,perfwiki.github.io:url]
X-Rspamd-Queue-Id: 325D0154453
X-Rspamd-Action: no action

Currently no target is specified to compile rust code when needed, which
breaks cross compilation. E.g. for arm64:

      LD      /tmp/build/tests/workloads/perf-test-in.o
    aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(code_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in generic ELF (EM: 62)
    aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(code_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in generic ELF (EM: 62)
    [...repeated...]
    aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(code_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in generic ELF (EM: 62)
    aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(code_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in generic ELF (EM: 62)
    aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a: error adding symbols: file in wrong format
    make[5]: *** [/perf/tools/build/Makefile.build:162: /tmp/build/tests/workloads/perf-test-in.o] Error 1
    make[4]: *** [/perf/tools/build/Makefile.build:156: workloads] Error 2
    make[3]: *** [/perf/tools/build/Makefile.build:156: tests] Error 2
    make[2]: *** [Makefile.perf:785: /tmp/build/perf-test-in.o] Error 2
    make[2]: *** Waiting for unfinished jobs....
    make[1]: *** [Makefile.perf:289: sub-make] Error 2
    make: *** [Makefile:76: all] Error 2

Detect required target and pass it via rust_flags to the compiler.

Note that CROSS_COMPILE might be different from what rust compiler
expects, since it may omit the target vendor value, e.g.
"aarch64-linux-gnu" instead of "aarch64-unknown-linux-gnu". Thus
explicitly map supported CROSS_COMPILE values to corresponding Rust
versions, as suggested by Miguel Ojeda.

Tested using arm64 cross-compilation example from [1].

Fixes: 2e05bb52a12 ("perf test workload: Add code_with_type test workload")
Link: https://perfwiki.github.io/main/arm64-cross-compilation-dockerfile/ [1]
Signed-off-by: Dmitrii Dolgov <9erthalion6@gmail.com>
---
Changes in v3
- Improved commit message, add an example of the compilation failure

Changes in v2:
- Map supported CROSS_COMPILE values to corresponding Rust targets

 tools/build/Build.include  |  9 +++++++++
 tools/perf/Makefile.config | 14 ++++++++++++++
 tools/perf/Makefile.perf   |  2 +-
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/tools/build/Build.include b/tools/build/Build.include
index e45b2eb0d24..cd0baa7a168 100644
--- a/tools/build/Build.include
+++ b/tools/build/Build.include
@@ -98,6 +98,15 @@ c_flags_2 = $(filter-out $(CFLAGS_REMOVE_$(basetarget).o), $(c_flags_1))
 c_flags   = $(filter-out $(CFLAGS_REMOVE_$(obj)), $(c_flags_2))
 cxx_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(CXXFLAGS) -D"BUILD_STR(s)=\#s" $(CXXFLAGS_$(basetarget).o) $(CXXFLAGS_$(obj))
 
+###
+# Rust flags to be used on rule definition, includes:
+# - global $(RUST_FLAGS)
+# - per target Rust flags
+# - per object Rust flags
+rust_flags_1 = $(RUST_FLAGS) $(RUST_FLAGS_$(basetarget).o) $(RUST_FLAGS_$(obj))
+rust_flags_2 = $(filter-out $(RUST_FLAGS_REMOVE_$(basetarget).o), $(rust_flags_1))
+rust_flags   = $(filter-out $(RUST_FLAGS_REMOVE_$(obj)), $(rust_flags_2))
+
 ###
 ## HOSTCC C flags
 
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index a8dc72cfe48..f40c5a70520 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -1163,6 +1163,20 @@ ifndef NO_RUST
     CFLAGS += -DHAVE_RUST_SUPPORT
     $(call detected,CONFIG_RUST_SUPPORT)
   endif
+
+  ifneq ($(CROSS_COMPILE),)
+    RUST_TARGET_FLAGS_arm	:= arm-unknown-linux-gnueabi
+    RUST_TARGET_FLAGS_arm64	:= aarch64-unknown-linux-gnu
+    RUST_TARGET_FLAGS_m68k	:= m68k-unknown-linux-gnu
+    RUST_TARGET_FLAGS_mips	:= mipsel-unknown-linux-gnu
+    RUST_TARGET_FLAGS_powerpc	:= powerpc64le-unknown-linux-gnu
+    RUST_TARGET_FLAGS_riscv	:= riscv64-unknown-linux-gnu
+    RUST_TARGET_FLAGS_s390	:= s390x-unknown-linux-gnu
+    RUST_TARGET_FLAGS_x86	:= x86_64-unknown-linux-gnu
+    RUST_TARGET_FLAGS_x86_64	:= x86_64-unknown-linux-gnu
+
+    RUST_FLAGS += --target=$(RUST_TARGET_FLAGS_$(ARCH))
+  endif
 endif
 
 # Among the variables below, these:
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 11b63bafdb2..f7b936deeaa 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -274,7 +274,7 @@ ifeq ($(PYLINT),1)
   PYLINT := $(shell which pylint 2> /dev/null)
 endif
 
-export srctree OUTPUT RM CC CXX RUSTC LD AR CFLAGS CXXFLAGS V BISON FLEX AWK
+export srctree OUTPUT RM CC CXX RUSTC LD AR CFLAGS CXXFLAGS RUST_FLAGS V BISON FLEX AWK
 export HOSTCC HOSTLD HOSTAR HOSTCFLAGS SHELLCHECK MYPY PYLINT
 
 include $(srctree)/tools/build/Makefile.include

base-commit: dbf0108347bdb5d4ccef8910555b16c1f1a505f8
-- 
2.52.0


