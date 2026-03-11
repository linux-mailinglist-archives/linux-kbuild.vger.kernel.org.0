Return-Path: <linux-kbuild+bounces-11821-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPYyL9wpsWkBrgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11821-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 09:37:48 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B25F25F756
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 09:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C3A030B33CB
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 08:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAA53B38B6;
	Wed, 11 Mar 2026 08:30:00 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7265F35B127;
	Wed, 11 Mar 2026 08:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217800; cv=none; b=Kp/9A+WXxnZpeAQAlT4mEB5M85m8dlKYd2q0Dty/bBmIVFc0lXgFLMAnhajR2n/L65GMtJDDOlR1mbdNFyahE0R1UwHpicLHUT3eJkOW1nHeKXVO2kBKrVcdnKiPiLGUcMl/EfE2OUdTVBWDBRhzwtX0HuioN6y7CCEt0lSQoto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217800; c=relaxed/simple;
	bh=ORDb4rz7pkZEG/AYr4fm0X3yvNxV+D8HlxcMfkqWYUQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mz2I/eo81TRDn7kc3eHu+F1O3X4OpRHu5cYTWrOKs4KcqznOljX6dDKeMb5ES2PVL008VZvfbOvrTEdNqpyyVig3avCLu1/B5oB2vI7opLieNQ8m7EuoPZ7VSoxJAwZHRFSUnCHE50y56zfRIrk0r0q8Ep5oVOilwVRa/a8bQls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5F07165C;
	Wed, 11 Mar 2026 01:29:51 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B5153F73B;
	Wed, 11 Mar 2026 01:29:50 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 00/30] tools build: Append -fzero-init-padding-bits=all
 option
Date: Wed, 11 Mar 2026 08:29:25 +0000
Message-Id: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOYnsWkC/43NSw6CMBCA4auYrq1ppwiNK+9hTNOXMglQ02KjE
 u5uYcPOuPwnM99MJPmIPpHTbiLRZ0wYhhLVfkdsq4e7p+hKE2BQM4CKjiF0SZkndk7d8KU+Pga
 FA47U2SPU3DhppCHl/hF9WVjty7V0i2kM8b2+yrBM/1EzUE4N19ZK3mjG/VnH/mBDTxYzi80RT
 P5yBGW0rppGMslBmGZz5nn+Aqkb8J8IAQAA
X-Change-ID: 20260224-tools_build_fix_zero_init-dc5261bd8b8b
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>, 
 James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>, 
 Quentin Monnet <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 William Breathitt Gray <wbg@kernel.org>, Barry Song <baohua@kernel.org>, 
 Qinxin Xia <xiaqinxin@huawei.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kent Gibson <warthog618@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Robert Moore <robert.moore@intel.com>, 
 Len Brown <lenb@kernel.org>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, 
 Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, 
 Mark Brown <broonie@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773217789; l=5405;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ORDb4rz7pkZEG/AYr4fm0X3yvNxV+D8HlxcMfkqWYUQ=;
 b=X80GbJ7tnZIC7IHU6/vKMszPB9MrKUsFSWnAJMY+OLOA7fs4SHLoVzHgMSMIvpQj6gSJZICzM
 +DBCkDMg0uGAaGXCe0UdWaynWRs/BI0omjcq4WROjAw6ROjHob0d9KM
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-Rspamd-Queue-Id: 6B25F25F756
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11821-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-kbuild@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_GT_50(0.00)[71];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.900];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,arm.com:mid,arm.com:email]
X-Rspamd-Action: no action

Thank you for reviewing v3 and I appreciate much Ian's suggestions, most
of which have been adopted into this series.

For anyone new to the series, the reason for appending this compiler
option is described in v3 (see "Link to v3" below).

In this version, the changes are organized into three parts:

  Patches 01 – 07: Preparation before adding the new compiler option.
                   Fix typos, adjust Makefiles to ensure the newly
                   introduced option does not cause regressions.
  Patch 08:        Propagate -fzero-init-padding-bits=all to
                   EXTRA_CFLAGS and HOST_EXTRACFLAGS for the
                   CC and HOSTCC compilers, respectively.
  Patches 09 – 30: Apply EXTRA_CFLAGS and HOST_EXTRACFLAGS in
                   project Makefiles.

The change has been verified:

Test 1: Cross compiling perf
	host: gcc 15.2.0 (x86_64), target: aarch64-linux-gnu-gcc

  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- LDFLAGS="-static" \
	    -C tools/perf VF=1 CORESIGHT=1 NO_JEVENTS=1 DEBUG=1

Test 2: Cross compiling selftest bpf and sched_ext
	host: gcc 15.2.0 (x86_64), target: aarch64-linux-gnu-gcc

  export ARCH=arm64
  export CROSS_COMPILE=aarch64-linux-gnu-
  make -C tools/testing/selftests/ TARGETS="bpf sched_ext" SKIP_TARGETS=""

Test 3: Native compiling selftest bpf and sched_ext
	host: gcc 15.2.0 (x86_64)

  make -C tools/testing/selftests/ TARGETS="bpf sched_ext" SKIP_TARGETS=""

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v4:
- Placed EXTRA_CFLAGS last so it can override the default options (Ian).
- Cached evaluated values to avoid invoking cc-option when each
  reference EXTRA_CFLAGS/HOST_EXTRACFLAGS (Ian).
- Dropped useless patches for feature, verification and nolibc
  (Gabriele / Ian / Thomas).
- Fixed typos for thermal (Ian).
- Removed duplicate $(CLANG_CROSS_FLAGS) in libbpf (Ian).
- Collected maintainers' reviewed and ACK tags.
- Link to v3: https://lore.kernel.org/r/20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com

Changes in v3:
- Extended to support cross compilation (Quentin).
- Link to v2: https://lore.kernel.org/r/20260224-tools_build_fix_zero_init-v2-1-b1acc817a01e@arm.com

---
Leo Yan (30):
      tools: lib: thermal: Fix typo
      tools/thermal: Fix typo
      tools: lib: thermal: Initialize CFLAGS before including Makefile.include
      tools/thermal: Initialize CFLAGS before including Makefile.include
      bpftool: Avoid adding EXTRA_CFLAGS to HOST_CFLAGS
      libbpf: Remove duplicate $(CLANG_CROSS_FLAGS)
      libbpf: Initialize CFLAGS before including Makefile.include
      tools build: Append -fzero-init-padding-bits=all to extra cflags
      bpftool: Append extra host flags
      perf build: Append extra host flags
      tools/bpf: build: Append extra cflags
      tools build: Append extra host cflags
      tools: bootconfig: Append extra cflags
      tools: counter: Append extra cflags
      tools: dma: Append extra cflags
      tools: gpio: Append extra cflags
      tools: hv: Append extra cflags
      tools: iio: Append extra cflags
      tools: mm: Append extra cflags
      tools: objtool: Append extra host cflags
      tools: power: acpi: Append extra cflags
      tools: power: x86/intel-speed-select: Append extra cflags
      tools: sched_ext: Append extra cflags
      tools: spi: Append extra cflags
      tools: tracing: Append extra cflags
      tools: usb: Append extra cflags
      selftests/bpf: Append extra cflags
      selftests/hid: Append extra cflags
      selftests/nolibc: Append extra cflags
      selftests/sched_ext: Append extra cflags

 tools/bootconfig/Makefile                   |  1 +
 tools/bpf/Makefile                          |  1 +
 tools/bpf/bpftool/Makefile                  |  9 +++++++--
 tools/build/Makefile                        |  6 ++++--
 tools/counter/Makefile                      |  1 +
 tools/dma/Makefile                          |  1 +
 tools/gpio/Makefile                         |  1 +
 tools/hv/Makefile                           |  1 +
 tools/iio/Makefile                          |  1 +
 tools/lib/bpf/Makefile                      | 17 ++++++++--------
 tools/lib/thermal/Makefile                  | 20 ++++++++++---------
 tools/mm/Makefile                           |  1 +
 tools/objtool/Makefile                      |  2 ++
 tools/perf/Makefile.config                  |  2 +-
 tools/power/acpi/Makefile.config            |  1 +
 tools/power/x86/intel-speed-select/Makefile |  1 +
 tools/sched_ext/Makefile                    |  1 +
 tools/scripts/Makefile.include              | 30 +++++++++++++++++++++++++++++
 tools/spi/Makefile                          |  1 +
 tools/testing/selftests/bpf/Makefile        | 10 ++++++++--
 tools/testing/selftests/hid/Makefile        |  1 +
 tools/testing/selftests/nolibc/Makefile     |  6 ++----
 tools/testing/selftests/sched_ext/Makefile  |  1 +
 tools/thermal/lib/Makefile                  | 20 ++++++++++---------
 tools/tracing/latency/Makefile              |  1 +
 tools/usb/Makefile                          |  1 +
 26 files changed, 101 insertions(+), 37 deletions(-)
---
base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
change-id: 20260224-tools_build_fix_zero_init-dc5261bd8b8b

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


