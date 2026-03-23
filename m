Return-Path: <linux-kbuild+bounces-12173-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLp/L81ewWmHSgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12173-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 16:39:57 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA612F6AC6
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 16:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FC9933734A5
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 15:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB6232D45C;
	Mon, 23 Mar 2026 15:13:50 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2422BEC3F;
	Mon, 23 Mar 2026 15:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278830; cv=none; b=cgvM5EA1T41pm/cQugS4bBSzTUuTsi/w0HMvBdESvfnqVfJN/S1zNcRszOWeD8cvWtQ65tWHXnHOT/slns51ow2zGQxZuxhiJsXYAj6siPvYq2IQaKuLZCy54DwBiRp93sr35JpRA01ueu/Ny0tTXyrEV3iIcFfdj3DTCxpTjTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278830; c=relaxed/simple;
	bh=scm2Teab3DTT7gUR3n9n43GRGxHQ8MDO9eljW4curP4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LnQ21RUzrVRTEQ3AHQ+JWcWXDyJONC8g2Iyk/py8vSsAegxtqquILnWWsCxZHtei/PBLm/lf4eICRLiaXiX5EH1fM5CX6VkFvmm8ik+tD3q4+dv5puCKGQW4MAXG5k9tM6k5p9FMrDl/XM3QbZ90tPU/e+fgrhsjfbxK2FNH8Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9C211516;
	Mon, 23 Mar 2026 08:13:41 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 302183F694;
	Mon, 23 Mar 2026 08:13:40 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v6 00/24] tools build: Append -fzero-init-padding-bits=all
 option
Date: Mon, 23 Mar 2026 15:13:21 +0000
Message-Id: <20260323-tools_build_fix_zero_init-v6-0-235858c51af9@arm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJFYwWkC/43Oz27DIAwG8FepOI8JQ/7ATnuPqYowOKulNkyQR
 tuqvPtoL20v0Y6f5e9nX0ShzFTE2+4iMi1cOE01dC87EQ5++iTJsWahle6U1o2cUzqWAc98jMP
 I38Mv5TTwxLOModUdYLRoUdT+V6a6cLM/9jUfuMwp/9xOLfo6/Y+6aAkSwYdgofcK6N3n02tIJ
 3E1F3N3jLJbjpFKdk3fW2VBG+yfnebBAdhymuo4Mi1GdC6geXbaR2fzn7Y6iDSO0UYPzt2ddV3
 /AOOsrNSYAQAA
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
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@arm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774278819; l=5235;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=scm2Teab3DTT7gUR3n9n43GRGxHQ8MDO9eljW4curP4=;
 b=mTKQNo0Mq5Wt1iBmXf+Fu7dzHuDzXFBaeabcrMbHlNIalkJpI8DWplr0nSZN2zPwUiorawOQG
 PX0v+Ibnzj4BCz/3d/PiK4UD+WpKGuWAd0L2w3htQu/0kWFLMfW5xYv
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	TAGGED_FROM(0.00)[bounces-12173-lists,linux-kbuild=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[70];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2CA612F6AC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

GCC-15 doesn't guarantee that a {0} initializer clears the whole union [1].
This may cause bugs if data is not intialized properly.

The kernel enabld the -fzero-init-padding-bits=all option to tackle the
issue, which was merged in commit dce4aab8441d ("kbuild: Use
-fzero-init-padding-bits=all").

This series propagates the same flag to the tools build.  It uses
tools/scripts/Makefile.include as the central place to add the
option to EXTRA_CFLAGS and HOST_EXTRACFLAGS for the CC and HOSTCC
compilers.  Each project under tools/ appends the variables as needed.

BPF/bpftool related patches will be sent separately, as maintainers
prefer them to go via the BPF tree.

The changes are organized into three parts:

  Patches 01 – 04: Fixes for thermal build.
  Patch 05:        Propagate -fzero-init-padding-bits=all to
                   EXTRA_CFLAGS and HOST_EXTRACFLAGS for the
                   CC and HOSTCC compilers, respectively.
  Patches 06 – 24: Apply EXTRA_CFLAGS and HOST_EXTRACFLAGS in
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

Test 4: BPF CI test (with BPF patches sent separately)

  https://github.com/kernel-patches/bpf/actions/runs/23439834394

[1] https://gcc.gnu.org/gcc-15/changes.html

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v6:
- Gathered Acked tags (thanks Jonathan!)
- Left out bpftool patches and will send together with other BPF patches (Quentin)
- Added back complete info in cover (Peter.Z)
- Link to v5: https://lore.kernel.org/r/20260318-tools_build_fix_zero_init-v5-0-bbeffd8da199@arm.com

Changes in v5:
- Gathered Acked tags (thanks Daniel, Namhyung, Benjamin!)
- Appended HOST_EXTRACFLAGS after KBUILD_HOSTCFLAGS (Ian)
- Appended CFLAGS for libc-test (Thomas)
- Left out BPF patches and will send out separately (Alexei)
- Rebase on v7.0.0-rc4
- Link to v4: https://lore.kernel.org/r/20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com

---
Leo Yan (24):
      tools: lib: thermal: Fix typo
      tools/thermal: Fix typo
      tools: lib: thermal: Initialize CFLAGS before including Makefile.include
      tools/thermal: Initialize CFLAGS before including Makefile.include
      tools build: Append -fzero-init-padding-bits=all to extra cflags
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
 22 files changed, 77 insertions(+), 25 deletions(-)
---
base-commit: bfec8e88ff6022b056615ec71506703e7e54de82
change-id: 20260224-tools_build_fix_zero_init-dc5261bd8b8b

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


