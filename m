Return-Path: <linux-kbuild+bounces-11307-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G6uMKB3j2lVRAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11307-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 20:12:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 362951391F1
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 20:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9689F305B29B
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 19:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268E427FB1C;
	Fri, 13 Feb 2026 19:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfKmG/+S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A88231842
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Feb 2026 19:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771009947; cv=none; b=MUqFZI84gQyAW4kTeOUwgjAL7yrirOB7HoEiH4/Qq22KSlM+CUq41KBPnLgzw3J5JIWJg5rabIOqJL/AWXiwE+g83e67neO85Qi6nY791HSR/7ABXNH9fK1Aagdh6xinrLqoYHQx40+QsgwmGWqMrHM/xf0JGgrdCKbx78kGb6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771009947; c=relaxed/simple;
	bh=OcH8w7RuyScwYrcF3u0PgWhZiy0vC1nFvdfSLmhr6ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dFFcBUdEtvDutekua0DS+x+hT+QZM/Yrv8WwfwhmnLHQZYBgjZtehUSLnXu5aUPe/inLHIumUfoJ4xfIAOIQC9+cZa3eaxkrQCePRzcRd7oBDhtwoK2eJw4R+ji3wU9mebttSxiqp1DgyjUBPngnyoxWo5lxlgDdXb4ylB710q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfKmG/+S; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65a3c320998so1771884a12.2
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Feb 2026 11:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771009944; x=1771614744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZpqJAf35CDxn8PSc9O1hec1UhW5JRewyjQeoYcibqk=;
        b=KfKmG/+S5I3jS7qi+NNZtD2TJT/B/XSCTFgYBBgAkw6kMU4v8iC4KwGvE8SzVLFKAD
         ztdL+1st3kRIDvu2auoIi/oGvDEHzV83nptV9i8K2XDb1pUMwFQopfM00UgEzMARHrdi
         EBgxshMgO6gxZD7LzEeNxRTp4HhiBoNe9lUus+q+0F6u9SsEY0k/x93V0252j0L0CUkb
         Liqf3qqcdwJfyjy6+6fDPueamJxgsxNzsYriXIm/rde5XNzborbmf8WRp9wvcBnkRKh0
         SlpElXek8dEdr4hWV+4/XvzNsRcQ8e/ScRrGa3g2cnQHtscFuPklzm09pBsqJVHIQUfU
         tT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771009944; x=1771614744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZpqJAf35CDxn8PSc9O1hec1UhW5JRewyjQeoYcibqk=;
        b=QGRozaZIwsrOoiPyYpCzQ5kgcuVCO7AeLHivjy3Ea2DwN/rw8foOhYvdOOv1wX0EJL
         gL/SoKIMBEjAQ3Db+HK5N0pnQLULWao+jTY1//sEoHZO1KzxiLYCkQvaM23wGsDapq5q
         3tIWYY1xV+BZllRb7kNVpVFNUh3OsiEZeic3vLscD9qIPMFLPSjEsUntMB50X+iHKeK7
         cWSOD9s85pz0GNinQ5/6H93CGSTqUDqwRXHJJw/v0rx6aHX7ZnU5VYLUtNVNV/clovyT
         W5e10C8zoFqmWHWdEeD7GfZXaklpyit2XL9I8RHV10MCmVFrk8iFscZEVVuNaCV2zpZT
         UeVg==
X-Forwarded-Encrypted: i=1; AJvYcCXRB6uD4Fn+NpyhYKsuquqyFrb0oE2It9MZCgG/YlpaQsOCW0YGyzlPoTQcrmBhF4AQt83shetJBvzpxfs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9hNGBr3kjdqJQ870y8ffHIEm3FmD7wL3ksYd+aBCR41ALgfb0
	8JZ6xDAY33+I3790lu9tzIuNZu4Y6JP+t2uLE4GL4j4hxoV8M+G3sOkA
X-Gm-Gg: AZuq6aKrmMXY3uO6ER09GFWPvnarxe5zpX9SopXYDx1N7Le4PwZnB/mL7CqcmIbhpC0
	v79tKDcUvHmr7hWfOevF3s1ENkNdcY6fudqkgh9CsNXYhEgzMozRCUFK0Jlf05J+WOEZRTA/HMW
	IeXdb15/lFXyatPwDhiUWU3uD5VmLSkdblHo2gJjFRk/nOwrdEGBvTMyLTManwdIVK5edMnlH8Z
	yS8p4BNt5wAl1QS5MByNjugchLWwUps/9HwPZXMK2GAyOooU2sgWZ+qoune1Yg0dP2elJYrh99E
	AYR6/FkGEuCQp4HV0UWeXVgnUaS4C1QFFg2w/iGQXN6npDuwC5EV99ZNOpXALuR/7XjsnGlV7tQ
	1LuyfjSwCjkFYGQMylNgafCX6pWeG69P0LY4/9tDiXeMoL7e2GP4T/mlUdymoXm0w7or1v1weSC
	uxy+crAH/wZy+cmhcyx3FvhUyna4GeuXmjZjMp71ZFFxNV9T0NtbPXQ7rCFRSSmoCIYcHr6t1xv
	GPrTB5ssrlOXYXf+bJOwVbdVx7yYkw=
X-Received: by 2002:a05:6402:398c:b0:65a:3c1b:d87d with SMTP id 4fb4d7f45d1cf-65bb10f4224mr1096630a12.6.1771009943923;
        Fri, 13 Feb 2026 11:12:23 -0800 (PST)
Received: from ddolgov-thinkpadt14sgen1.local (dslb-002-207-075-089.002.207.pools.vodafone-ip.de. [2.207.75.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f0b55sm950830a12.23.2026.02.13.11.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 11:12:23 -0800 (PST)
From: Dmitrii Dolgov <9erthalion6@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Ian Rogers <irogers@google.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Dmitrii Dolgov <9erthalion6@gmail.com>
Subject: [PATCH v1] tools build: Fix rust cross compilation
Date: Fri, 13 Feb 2026 20:12:09 +0100
Message-ID: <20260213191212.33328-1-9erthalion6@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-11307-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[9erthalion6@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,perfwiki.github.io:url]
X-Rspamd-Queue-Id: 362951391F1
X-Rspamd-Action: no action

Currently no target is specified to compile rust code when needed, which
breaks cross compilation. Detect required target and pass it via
rust_flags to the compiler.

Note that CROSS_COMPILE might be different from what rust compiler
expects, since it may omit the target vendor value, e.g.
"aarch64-linux-gnu" instead of "aarch64-unknown-linux-gnu". Thus
explicitly map supported CROSS_COMPILE values to corresponding Rust
versions, as suggested by Miguel Ojeda.

Tested using arm64 cross-compilation example from [1].

[1]: https://perfwiki.github.io/main/arm64-cross-compilation-dockerfile/

Signed-off-by: Dmitrii Dolgov <9erthalion6@gmail.com>
---
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
index a6d8ca3e923..f3919838243 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -271,7 +271,7 @@ ifeq ($(PYLINT),1)
   PYLINT := $(shell which pylint 2> /dev/null)
 endif
 
-export srctree OUTPUT RM CC CXX RUSTC LD AR CFLAGS CXXFLAGS V BISON FLEX AWK
+export srctree OUTPUT RM CC CXX RUSTC LD AR CFLAGS CXXFLAGS RUST_FLAGS V BISON FLEX AWK
 export HOSTCC HOSTLD HOSTAR HOSTCFLAGS SHELLCHECK MYPY PYLINT
 
 include $(srctree)/tools/build/Makefile.include

base-commit: 5d1ab659fb93eed85d6d8b2937013360157032f4
-- 
2.52.0


