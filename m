Return-Path: <linux-kbuild+bounces-11329-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ/jNUDflWneVgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11329-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 16:48:16 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B6B157778
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 16:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F49830137A4
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 15:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20AB733FE30;
	Wed, 18 Feb 2026 15:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PM/JryG+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEDE2765D4
	for <linux-kbuild@vger.kernel.org>; Wed, 18 Feb 2026 15:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771429689; cv=none; b=kFUXQLLyNunre630jvIQXFZeapMDFuhbBF764lDMU0BCbIRg+zv3Uw+1E+vuvoJa2C3uUtFK28J2QoDWECVuBWjta+U4fcHf/I6BsdlrtzT1fvZu5yXg3oVkiHuWurXHgd49lJvw9S/puBNwE7s0MgLJuonvHXSUs373dQWnrmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771429689; c=relaxed/simple;
	bh=zpyqzpFOHppQVJAb1owM5FRBK9bKCVLDsQ7J3h9lQ88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kIKURgrpgUFcUmsLgHcdYmFzphxMqYDrvFGSZkajKw0KaBdAlA949q5VUtl9EviIW03fNY/IB4oRy8vXY0FANscGPcq6pyq8tAhwvCOZAla9JmjoxHHEDgG/jczYADMshyzFhmM2Dz7Hs1JLu8uv+xWR0XlVQh+uNMPYNpA/nQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PM/JryG+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4834826e555so54435195e9.2
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Feb 2026 07:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771429686; x=1772034486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xj239r5RLCKwLTm1AZYnx5SxtOGhPSVfSA9B5DKaX3Y=;
        b=PM/JryG+eIlWviqiLmGcbTXff7DUuNtisx+oUhskRu+ivkgzPMdfgV52ErI1yss4B2
         /1tosHoiVOre/afT6jaKL/eLwjbqxBj5s2kMTyyLhhxjsLaNw1aR9qPcdM2ykEbEmGlB
         +41n9TUWG5idCfLViP4Mq1M+O5Cq4cpPdVgbZnlGMaVjnrUHwX4SmSoPypED+nyY4btb
         dzx2CrRkb3vwWLvEBb1Ae2dLeiha+Wo6wxC4hrcu4INyphAb6VMaRrqb+vrzwWM8c0Tm
         wpDyr8OQAJylvNhL2iyj0rbeiMW80KPlAr/02AQTLKMZnT5hcjSzUzikbvo1hWrgc7l6
         g5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771429686; x=1772034486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xj239r5RLCKwLTm1AZYnx5SxtOGhPSVfSA9B5DKaX3Y=;
        b=XLSS+uKUb02PcwfsVm5h+Bbb9ns3XKSgprK57rT5trPWHvu6mPBw0n5gzcbiJdpa93
         pTdSik8amv8iNyq7Hu8PhMAfTcXochtV7+BWvX51kYXSv+XMbwNc84ydH8TVnObu/w3r
         vF9goLrA6Z6ouxa1bwanM2mguahf7u9gdZel7P4hEfdReqyc9va0JC1gyOO/ghv4cq6l
         ZDX56jXgIAXmE0c5WaLAmapEk+82ZZmzApwHBimiFRG826N+oi3svoT4GVaxrlrISfdO
         9ZXRft6AU/DFmKig2G8gRGEiH18zZSvrfWjOQ+vkhrrgqH/D3Up2RtXphRf/bRUJed9U
         02hw==
X-Forwarded-Encrypted: i=1; AJvYcCX7lKFKsXzNQEEin74VyIAq1k09TK1GboRnkME4pj5Ujbf6UUsGJz9a6b49x+ZnQKT+3i8a/TyGXodNsmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFn9pZJJIZwk5MGqR8saisEBtS9Cn0lwk/RZ2oaU2iPL7ZrgHJ
	Nk0dvywC8P41WzbnC12yqQBpHIzeIeTcT0lvl7RBe/tweBqtokHfRMbo
X-Gm-Gg: AZuq6aKrYN1cgcwQgqhYT8TbfJMcwZCQnh0EigkO2grhZjJL2O0r+rLpbwLwZi6wybl
	lLbCfcRue9hNqJNqwEcoSJMgZ+D5ywzrGwvle9tqd852KA53Rflfa/KRY+gLaWYp0VW+7y1WtgW
	tXVCHiFJJ+50g5oVfXuJw3f3//3J2nIMmSU4NBZ6+dkAFGUD35RyptRF9OW4EUYhecSQxL+r7OB
	JRRjNz5Z1H65Urjgx/4zCuvUP7+d5dj2ihfNCvN82mU/lxKblUPo4vBLY0cb+Lez76H1rRweZHw
	Azi599FV2BsZnnQYnEmK86jXyLXDl0uZh9j/pz3ff0e4CARBMUAsFNEZqwKMq6z4Q25J7HCWB1L
	ooSM4564N9Ilq6YtBv6vP9z78su5CtQM4zMAiyY0twiLIbO4fc/esa84cUHYPA+vy+nPJDGqvnP
	ElczoSB513uPXasX2BohzHPFsPZ+nu3cUORtozS7odNMaGBb3pXmG2AW0i/A8njVsELK6SKPgvU
	ivP2e7iPETwYkGW8Y2axvNMp8zBHVyTi9qJHP4ZUtbTExs=
X-Received: by 2002:a05:600c:c491:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-48379be8253mr257859815e9.22.1771429685657;
        Wed, 18 Feb 2026 07:48:05 -0800 (PST)
Received: from ddolgov-thinkpadt14sgen1.rmtde.csb (dslb-002-207-075-089.002.207.pools.vodafone-ip.de. [2.207.75.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4837e565f5esm428352325e9.10.2026.02.18.07.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:48:05 -0800 (PST)
From: Dmitrii Dolgov <9erthalion6@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Ian Rogers <irogers@google.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Levi Zim <i@kxxt.dev>
Cc: Namhyung Kim <namhyung@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Dmitrii Dolgov <9erthalion6@gmail.com>
Subject: [PATCH v4] tools build: Fix rust cross compilation
Date: Wed, 18 Feb 2026 16:47:53 +0100
Message-ID: <20260218154800.367720-1-9erthalion6@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11329-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[9erthalion6@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 84B6B157778
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
Changes in v4
- Fixed incorrect target name for riscv

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
index a8dc72cfe48..214d8f6d9b8 100644
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
+    RUST_TARGET_FLAGS_riscv	:= riscv64gc-unknown-linux-gnu
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


