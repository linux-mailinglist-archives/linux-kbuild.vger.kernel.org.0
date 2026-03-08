Return-Path: <linux-kbuild+bounces-11648-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aP4KB/qnrWmE5gEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11648-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 17:46:50 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2478C2311E9
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 17:46:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3BC2300C54B
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Mar 2026 16:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60EB0341044;
	Sun,  8 Mar 2026 16:46:43 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6D533F365;
	Sun,  8 Mar 2026 16:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772988403; cv=none; b=jb99BPas1OjJWk1Tl9tEWG5emmHELzsm/tHxF0WEQW3yzy9fJoN3F/A5SvANA3QPn21pamQtUuoefo7m4ugh5dLDaROcgrNIu5P4TRMCYY4XJ4GzeunvErvLxsQ73xXIQV5iJ4qj6Ze5Ec7VXuYc4wWY5rtdyiTepP6xz1LdJEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772988403; c=relaxed/simple;
	bh=Tc0lndhA3qp3WkqrTPnPBNSk6pyPwX6QhyRxTEiuDnY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FosQ8wCT7wwtrY3PpCbs489LROsLsiL7cJqFYjQ96PbzVszPZqmoCTKy68FC47lh7Jm/fqW3fy8nu0dm3ZoAohyr68XZInpovAiakcUCJKyOyCwVgXU1a5sKWNmoKE2d8MY1Ds3ozu7V5M3x/gPAGoYazNva6kaXHKP8bQVG5aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B651D1758;
	Sun,  8 Mar 2026 09:46:26 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8B843F694;
	Sun,  8 Mar 2026 09:46:24 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v3 00/30] tools build: Append -fzero-init-padding-bits=all
 option
Date: Sun, 08 Mar 2026 16:46:05 +0000
Message-Id: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAM2nrWkC/42NXQ6CMBCEr0L22Rq6KjY+eQ9Dmv6ssgm0pEWiE
 u5u5QQ+fpOZbxbIlJgyXKoFEs2cOYYCh10FrjPhQYJ9YcAamxrxKKYY+6ztk3uv7/zSH0pRc+B
 JeHfCRlqvrLJQ9mOiUtjct7Zwx3mK6b1dzfhL/7HOKKSw0jin5NnUkq4mDXsXB2jXdf0CBGiwx
 cAAAAA=
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
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772988384; l=5429;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Tc0lndhA3qp3WkqrTPnPBNSk6pyPwX6QhyRxTEiuDnY=;
 b=/7RyLMM/efjUgseU6DFkghtJCkFtN/T0ka5j+jiiuEp7Td6vOngRngWVLncOqQAI8NGl1uWn0
 sttzYZ4XOv0DoeW3cBuiqE34X3ALthVmG/knEHLBCH7w5mvdla4NVBx
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-Rspamd-Queue-Id: 2478C2311E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11648-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-kbuild@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_GT_50(0.00)[70];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.318];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,gnu.org:url]
X-Rspamd-Action: no action

GCC-15 doesn't guarantee that a {0} initializer clears the whole union [1].
This may cause bugs if data is not intialized properly.

The kernel enabld the -fzero-init-padding-bits=all option to tackle the
issue, which was merged in commit dce4aab8441d ("kbuild: Use
-fzero-init-padding-bits=all").

This series propagates the same flag to the tools build.  It uses
tools/scripts/Makefile.include as the central place to add the
option to EXTRA_CFLAGS and HOST_EXTRACFLAGS for the CC and HOSTCC
compilers.  Each project under tools/ appends the variables as needed.

The variable name HOST_EXTRACFLAGS comes from kbuild conventions (see
Documentation/kbuild/makefiles.rst).

This series is divided into three parts:

  Patches 01 – 04: Preparation before adding the new compiler option.
                   These patches adjust Makefiles to ensure the newly
                   introduced option does not cause regressions.
  Patch 05:        Propagate -fzero-init-padding-bits=all to
                   EXTRA_CFLAGS and HOST_EXTRACFLAGS for the
                   CC and HOSTCC compilers, respectively.
  Patches 06 – 30: Apply EXTRA_CFLAGS and HOST_EXTRACFLAGS in
                   project Makefiles.

The change has been verified:

Test 1: cross compiling perf with aarch64 GCC-15.2 [2]:

  ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- \
       make LDFLAGS="-static" -C tools/perf VF=1 NO_JEVENTS=1 \
       DEBUG=1 V=1 NO_LIBELF=1 NO_LIBTRACEEVENT=1

Test 2: native selftest build on Arm64 machine:

  make -C tools/testing/selftests TARGETS=hid SKIP_TARGETS="" V=1

[1] https://gcc.gnu.org/gcc-15/changes.html
[2] https://developer.arm.com/-/media/Files/downloads/gnu/15.2.rel1/binrel/arm-gnu-toolchain-15.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v3:
- Extended to support cross compilation (Quentin).
- Link to v2: https://lore.kernel.org/r/20260224-tools_build_fix_zero_init-v2-1-b1acc817a01e@arm.com

---
Leo Yan (30):
      bpftool: Avoid adding EXTRA_CFLAGS to HOST_CFLAGS
      libbpf: Initialize CFLAGS before including Makefile.include
      tools: lib: thermal: Initialize CFLAGS before including Makefile.include
      tools/thermal: Initialize CFLAGS before including Makefile.include
      tools build: Append -fzero-init-padding-bits=all to extra cflags
      bpftool: Append extra host flags
      perf build: Append extra host flags
      tools/bpf: build: Append extra cflags
      tools build: Append extra host cflags
      tools build: Append extra cflags for feature
      tools: bootconfig: Append extra cflags
      tools: counter: Append extra cflags
      tools: dma: Append extra cflags
      tools: gpio: Append extra cflags
      tools: hv: Append extra cflags
      tools: iio: Append extra cflags
      tools: mm: Append extra cflags
      tools: nolibc: Append extra cflags
      tools: objtool: Append extra host cflags
      tools: power: acpi: Append extra cflags
      tools: power: x86/intel-speed-select: Append extra cflags
      tools: sched_ext: Append extra cflags
      tools: spi: Append extra cflags
      tools: tracing: Append extra cflags
      tools: usb: Append extra cflags
      tools: verification: Append extra cflags
      selftests/bpf: Append extra cflags
      selftests/hid: Append extra cflags
      selftests/nolibc: Append extra cflags
      selftests/sched_ext: Append extra cflags

 tools/bootconfig/Makefile                      |  1 +
 tools/bpf/Makefile                             |  1 +
 tools/bpf/bpftool/Makefile                     |  9 +++++++--
 tools/build/Makefile                           |  6 ++++--
 tools/build/feature/Makefile                   |  2 ++
 tools/counter/Makefile                         |  1 +
 tools/dma/Makefile                             |  1 +
 tools/gpio/Makefile                            |  1 +
 tools/hv/Makefile                              |  1 +
 tools/iio/Makefile                             |  1 +
 tools/include/nolibc/Makefile                  |  2 +-
 tools/lib/bpf/Makefile                         | 16 ++++++++-------
 tools/lib/thermal/Makefile                     | 16 ++++++++-------
 tools/mm/Makefile                              |  1 +
 tools/objtool/Makefile                         |  2 ++
 tools/perf/Makefile.config                     |  2 +-
 tools/power/acpi/Makefile.config               |  1 +
 tools/power/x86/intel-speed-select/Makefile    |  1 +
 tools/sched_ext/Makefile                       |  1 +
 tools/scripts/Makefile.include                 | 28 ++++++++++++++++++++++++++
 tools/spi/Makefile                             |  1 +
 tools/testing/selftests/bpf/Makefile           |  1 +
 tools/testing/selftests/hid/Makefile           |  1 +
 tools/testing/selftests/nolibc/Makefile.nolibc |  3 +++
 tools/testing/selftests/sched_ext/Makefile     |  1 +
 tools/thermal/lib/Makefile                     | 16 ++++++++-------
 tools/tracing/latency/Makefile                 |  1 +
 tools/usb/Makefile                             |  1 +
 tools/verification/rv/Makefile                 |  1 +
 29 files changed, 93 insertions(+), 27 deletions(-)
---
base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
change-id: 20260224-tools_build_fix_zero_init-dc5261bd8b8b

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


