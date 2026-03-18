Return-Path: <linux-kbuild+bounces-12031-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kE09NcttumnRWQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12031-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2026 10:18:03 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 680E42B8CD2
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2026 10:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9386F3015D24
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2026 09:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA5F3A4F58;
	Wed, 18 Mar 2026 09:17:22 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE0839C625;
	Wed, 18 Mar 2026 09:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825442; cv=none; b=B8cGBv7TxHXBA5zSQwA62LGiKyPzt6fPJe4jY1bzljXljv1Tlm4gpMXdOE7e1xYgULBaJ9lbKFt1udvvZYu2SDtRdKbYCpRkubNabO7YjesT2ogF0Ill2iwCLV8jU0VbD9pBU9oxlGvipWrkxl+BG+8c84W0OaGOH45O4tBSoQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825442; c=relaxed/simple;
	bh=ZGKuPIwbdXR8s5su0qDzEXK8S9PgMd8yIP/evG69qcc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B1lxV9nfVB+xqBkgL8+GaEbu3NrTsxsir347RW3BOcFz63yUJem5YGBIPcYu7zQFeNjthx3xyoJnmXYIjypl3wNPwIo9jqPQkgN/DnmGramURw4n6NVm5cz2bQuwhFrWGXZRVVaSfYKbF33/zQ2cPO5vWP0yb8NF69ZtR90zv9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C94121F37;
	Wed, 18 Mar 2026 02:17:04 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A38223F73B;
	Wed, 18 Mar 2026 02:17:01 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v5 00/26] tools build: Append -fzero-init-padding-bits=all
 option
Date: Wed, 18 Mar 2026 09:16:44 +0000
Message-Id: <20260318-tools_build_fix_zero_init-v5-0-bbeffd8da199@arm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHxtumkC/43NSw6CMBCA4auQrq3pg0dx5T2MIUxbZRKkpkWiE
 u5uYYNuiMt/MvPNSIL1aAM5JCPxdsCArouR7RKim7q7WoomNhFM5EyIlPbOtaGCB7amuuCzelv
 vKuywp0ZnIudgFCgg8f7ubVxY7NM5doOhd/61vBrEPP1HHQTlFHitteJFzbg91v621+5GZnOQq
 yOZ2nIkZTRPi0IxxYWE4tdJvxzOt5w0OqWVGRgoSw1ydaZp+gCG67AuUAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773825421; l=5318;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ZGKuPIwbdXR8s5su0qDzEXK8S9PgMd8yIP/evG69qcc=;
 b=rCs4AS2t7Rahlxd/h549WaR1+JjUhUAud2CA403JALg1IPppakXeQRXDKgwXYZ97EQrnBIzSJ
 CW7dqJDTNy6D0V52zCNmr050xXckAHKFB34mabWboySY9CApaGuGVY+
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12031-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	NEURAL_HAM(-0.00)[-0.968];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email,arm.com:mid]
X-Rspamd-Queue-Id: 680E42B8CD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for reviewing and commenting on v4.

For anyone new to the series, the reason for appending this compiler
option is described in v3 (see "Link to v3" below).

In this version, the BPF related patches have been split out and will be
sent separately (note that I have kept the bpftool patches in this
series, as I have gathered Quentin's Acked-by tags).

The changes are organized into three parts:

  Patches 01 – 05: Preparation before adding the new compiler option.
                   Fix typos, adjust Makefiles to ensure the newly
                   introduced option does not cause regressions.
  Patch 06:        Propagate -fzero-init-padding-bits=all to
                   EXTRA_CFLAGS and HOST_EXTRACFLAGS for the
                   CC and HOSTCC compilers, respectively.
  Patches 07 – 26: Apply EXTRA_CFLAGS and HOST_EXTRACFLAGS in
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
Changes in v5:
- Gathered Acked tags (thanks Daniel, Namhyung, Benjamin!)
- Appended HOST_EXTRACFLAGS after KBUILD_HOSTCFLAGS (Ian)
- Appended CFLAGS for libc-test (Thomas)
- Left out BPF patches and will send out separately (Alexei)
- Rebase on v7.0.0-rc4
- Link to v4: https://lore.kernel.org/r/20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com

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

---
Leo Yan (26):
      tools: lib: thermal: Fix typo
      tools/thermal: Fix typo
      tools: lib: thermal: Initialize CFLAGS before including Makefile.include
      tools/thermal: Initialize CFLAGS before including Makefile.include
      bpftool: Avoid adding EXTRA_CFLAGS to HOST_CFLAGS
      tools build: Append -fzero-init-padding-bits=all to extra cflags
      bpftool: Append extra host flags
      perf build: Append extra host flags
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
      selftests/hid: Append extra cflags
      selftests/nolibc: Append extra cflags
      selftests/sched_ext: Append extra cflags

 tools/bootconfig/Makefile                   |  1 +
 tools/bpf/bpftool/Makefile                  |  9 +++++++--
 tools/build/Makefile                        |  6 ++++--
 tools/counter/Makefile                      |  1 +
 tools/dma/Makefile                          |  1 +
 tools/gpio/Makefile                         |  1 +
 tools/hv/Makefile                           |  1 +
 tools/iio/Makefile                          |  1 +
 tools/lib/thermal/Makefile                  | 20 ++++++++++---------
 tools/mm/Makefile                           |  1 +
 tools/objtool/Makefile                      |  2 ++
 tools/perf/Makefile.config                  |  2 +-
 tools/power/acpi/Makefile.config            |  1 +
 tools/power/x86/intel-speed-select/Makefile |  1 +
 tools/sched_ext/Makefile                    |  1 +
 tools/scripts/Makefile.include              | 30 +++++++++++++++++++++++++++++
 tools/spi/Makefile                          |  1 +
 tools/testing/selftests/hid/Makefile        |  1 +
 tools/testing/selftests/nolibc/Makefile     |  7 +++----
 tools/testing/selftests/sched_ext/Makefile  |  1 +
 tools/thermal/lib/Makefile                  | 20 ++++++++++---------
 tools/tracing/latency/Makefile              |  1 +
 tools/usb/Makefile                          |  1 +
 23 files changed, 84 insertions(+), 27 deletions(-)
---
base-commit: a989fde763f4f24209e4702f50a45be572340e68
change-id: 20260224-tools_build_fix_zero_init-dc5261bd8b8b

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


