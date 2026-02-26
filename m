Return-Path: <linux-kbuild+bounces-11450-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id azwpFiSDoGkLkgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11450-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 18:30:12 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 788481AC708
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 18:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D46A730C774C
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 17:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA5F429803;
	Thu, 26 Feb 2026 17:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfCqnO6v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875154279E6
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Feb 2026 17:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772125237; cv=none; b=MWlJLwyM4E3WlSyrileClLacSgNRepb4wgi8o+lI0yrnYdLvYg9SvZ4xiGun3WNsk2K/u7EnJtPZqyQBUF0Gj8kte4uvR0PlUgb4CrfGtcw6lqZTgYnWZe2bOWVlyeAJZfjTe4KvAnJhCyw1HRXosUwTg7oib6zs35WZhDZDOBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772125237; c=relaxed/simple;
	bh=aUmpyzSrby1qhl5sgoZlhWbu9bvueo80bPZ+F/4kLzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GIbBKoeRHhlLQ1BGH34lv+Ekpr5CRPB+Hxoueho+6at+6dkXn8aAWQqgFC1tGG/O8KqxtvFGKuD3lo5TOUJ/haN6MY1a40J/fdU5Xa/x9xf12NxjFuvqG0NY+Q6SO8pxSdZZUGpGRFuB2ohUX/946T4AIvnCkN/mw69JHDjPIjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfCqnO6v; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b934f8ec6acso130588666b.2
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Feb 2026 09:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772125234; x=1772730034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ALqBvDE1FO+pe4+Grs49xjYdZp5dzbvZUUI22o6rYDw=;
        b=IfCqnO6vfhmLflYdiMHsOaSyjTm6lB4X9+UuCJfqLTQ14vkh+aRFUta5VUI45L33IO
         X5Ts9D4whddgELe8593teHhtfioPSF3JOpJNZ/zYnlLotFp6yctZzYwc+YfpmA/6PZri
         i7bpd1cfGssKnlZOJ9YY9Ds72DYpUEydm8HrCXWZlHTOzgv05IXZeRAlGS4R72qr+qNS
         Qey28boiqFD+971y4TZxKF9fOXr9h+6o8+lp83gD9fFgEkVvny0dOfFrK2FsDUZc+hze
         72nyJ9jGi4SwulRR2VXjbj7zXgWPW61eFQcDN6p7xV2Lcgh7KthcThnUsEGmA+eqh5+K
         CRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772125234; x=1772730034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALqBvDE1FO+pe4+Grs49xjYdZp5dzbvZUUI22o6rYDw=;
        b=XkRCz6qkSG7Sk8aT+t9ze3ucPBRwvkKOVQEltQFzMYBLFCwfw122T4Pbg6Vo25bV1r
         cbBCZsG6GL+oUECYL8hyy+Ksk7493Ul1vBEziqpQoza2r0BfivJ3KiCIpRAc7OVBQ01L
         5LnbxzMwNhvMHTPwS3AEC1iO6lmsbu+Uwy1uxxw+iAhtJWDx1w1iARvGY4ox7lmD9p54
         4dX+TTKHxYHP3AKLhb95f4032BmIHK/X3bzHW7ysdp6oLNqf4PzzwUVG6zVYjZNCfBSR
         yB83PyKRA5hzo9XEmop2HMgAJkxlhuZ6SSIAsMcn58/m77fEtn0JZNVq1nJVsRx4bpD7
         dwWA==
X-Forwarded-Encrypted: i=1; AJvYcCX0YAQSuLmUb7lW0NAtKhlQ77aA5Wy3w/EUR6xAQq5ahIAOdRAxyviYNof/BSbpki7aYbcVtRfw/Exu7Mc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfrTvdsfYOGD6E9Y1qO3uEKX2DkVrNnnJH4s1Mdwa/ffFhg4AE
	lzc5pgaPqcgiie1nSa7E407WNhcF7VqLNPGAFhIOcZEpiMzNOjzmtQuo
X-Gm-Gg: ATEYQzycx5gtoxc+PzpyWnxnSYTcUDLP7LeUmojhEPILarFhU+UF+7QK51Wzi4n/oUp
	sWvbWWl6Ad7OQFWe6jj7gtYEMXp2KyEZwoAnjwHm1ML4sCtA+CQXXNTiid6uMZmesaEHgYNkV5j
	Hn4kHLNX9eEszRMuJxQKY9xWPScMB+c3mjjoR450yjEg8IIl3Rkd+Aj+IVCet5De0Ad74c5XlKk
	O38TTeCelyVOErB9J2ActU/OD5IMQtfMIPnX6UNSMixx/J5jS3nriJFw9BkMbilPCFJTBRWj+1w
	7lAvvNnBmh0uKOnMUX7ZZTC2SR5owX3XtHy0HkJ4nGMpJ75CxuOCfYO+79epO6g+/iVHU+Q0uvL
	yLzNN03pTcKtcnQQlesB9coItewxgq4dW9q5dx8wPVekdtDR4BXDVtSJkwKrE6f6fnFvTRoND2S
	7aQkOf67euNaLY1cfRlRj9x6WbPwo0sc/uf6FIot0Cy9pvB7V8Q/GUPRsGoQ==
X-Received: by 2002:a17:907:6d13:b0:b93:335f:18d5 with SMTP id a640c23a62f3a-b935b8ea035mr225250866b.36.1772125233377;
        Thu, 26 Feb 2026 09:00:33 -0800 (PST)
Received: from ddolgov-thinkpadt14sgen1.rmtde.csb ([2a00:20:6364:854a:4ce7:5ea2:2f05:232b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac7371esm77838766b.24.2026.02.26.09.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 09:00:32 -0800 (PST)
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
Subject: [PATCH v5] tools build: Fix rust cross compilation
Date: Thu, 26 Feb 2026 17:59:59 +0100
Message-ID: <20260226170025.517743-1-9erthalion6@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-11450-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[9erthalion6@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 788481AC708
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
Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: Dmitrii Dolgov <9erthalion6@gmail.com>
---
Changes in v5
- Error out if the target arch is not covered

Changes in v4
- Fixed incorrect target name for riscv

Changes in v3
- Improved commit message, add an example of the compilation failure

Changes in v2:
- Map supported CROSS_COMPILE values to corresponding Rust targets

 tools/build/Build.include  |  9 +++++++++
 tools/perf/Makefile.config | 18 ++++++++++++++++++
 tools/perf/Makefile.perf   |  2 +-
 3 files changed, 28 insertions(+), 1 deletion(-)

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
index a8dc72cfe48..15fbba9f4ca 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -1163,6 +1163,24 @@ ifndef NO_RUST
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
+    ifeq ($(RUST_TARGET_FLAGS_$(ARCH)),)
+      $(error Unknown rust cross compilation architecture $(ARCH))
+    endif
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

base-commit: c5a244bf17caf2de22f9e100832b75f72b31d3e6
-- 
2.52.0


