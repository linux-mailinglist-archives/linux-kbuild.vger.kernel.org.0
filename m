Return-Path: <linux-kbuild+bounces-13478-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l2vIKePtHmoSZQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13478-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 16:51:15 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 079E262F774
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 16:51:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=lgTkBPQg;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13478-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13478-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28ABB324C98D
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 14:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666473EEAED;
	Tue,  2 Jun 2026 14:40:57 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7421434388F;
	Tue,  2 Jun 2026 14:40:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780411257; cv=none; b=ll0H456wJVrSE9DNxrQd9btrRPKhxERVaTMmbuNFuCcKZ/5Gd9806r/cByvq5a7OJy5aOk9mUlgi5pvBOIfPzmKexWtc+K1gHOSv4RdJBwKj319aI10tzPcvnrnjLTBrwV5U7fQn4E8/uK83iWQswB62qdfF3nxRP0kgsQjqQbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780411257; c=relaxed/simple;
	bh=Zn0w4wp5vqzPAJ4/rSvegWIQOqon6BRz1s5y1808x9w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=adzZYcUl47XYiPO6SUwNdughdzx42fAZ8umTtElncZWpcAvy2ovXSQd5nRbufBUsCJucjkDLwfLETpNFNUlRVnCdJU0Hv/3C90I6Toht8cCNSgS8M0VlV3qYWob4EKj0eY/ZAosEHQDsmoI4RpCEvef9OEytXZmTninVaLZUzsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lgTkBPQg; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3ED2F356D;
	Tue,  2 Jun 2026 07:40:48 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38E393F632;
	Tue,  2 Jun 2026 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780411253; bh=Zn0w4wp5vqzPAJ4/rSvegWIQOqon6BRz1s5y1808x9w=;
	h=From:Subject:Date:To:Cc:From;
	b=lgTkBPQgQ5o+QqaGqVO+KCngxzrS3/5+sJI1X2Go5wu2odPQQPjTdnig/2UeMhhZN
	 MT3yxHfKQA0O1NzdkcWfdY1Yjjn/INm4HF5hygvceTxxe3C+MZbSjt3NSYpExQqcJt
	 5ON6LksSxqsAu6zIyWr8tQ2drWKgWMPqSCCOjsKM=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v7 00/23] tools build: Append -fzero-init-padding-bits=all
 option
Date: Tue, 02 Jun 2026 15:40:34 +0100
Message-Id: <20260602-tools_build_fix_zero_init-v7-0-631baf679fe7@arm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGLrHmoC/43OTW7DIBAF4KtErEsFg/nLqveoIosB3CAlpgLXS
 hv57iXZ1N5YXb7RvG/mTmosKVZyPNxJiXOqKY8t6JcD8Wc3fkSaQssEGCgG0NEp50vt8StdQj+
 kW/8TS+7TmCYavATFMRg0SFr/s8S28LTfTy2fU51y+X6emuEx/Y86A+UUufPecO0Yj2+uXF99v
 pKHOYs/RzCz5wjKqOq0NsxwEKi3TrdyON9zuubYKCQGtNaj2Dpy7ez+I5uDGIchmOC4tVtHrRw
 Qe45qDghppPGSu2HlLMvyC4c8mdHgAQAA
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
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780411243; l=5707;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Zn0w4wp5vqzPAJ4/rSvegWIQOqon6BRz1s5y1808x9w=;
 b=hwTA1ypJ8YhmPzrxJRrOKyMIijYevstbg1xw0CzdZ9uq21uO9qad9dbDWIpmknp9UC2sxGFoJ
 eILkpq+6a/NC+t5OS+NQ9+n5eLiqaQvQnlz3WslYt+hAZz8lMuIlh/c
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13478-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:acme@kernel.org,m:irogers@google.com,m:namhyung@kernel.org,m:james.clark@linaro.org,m:kees@kernel.org,m:qmo@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:peterz@infradead.org,m:mingo@redhat.com,m:mark.rutland@arm.com,m:alexander.shishkin@linux.intel.com,m:adrian.hunter@intel.com,m:mhiramat@kernel.org,m:wbg@kernel.org,m:baohua@kernel.org,m:xiaqinxin@huawei.com,m:brgl@kernel.org,m:warthog618@gmail.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:jic23@kernel.org,m:dlechner@b
 aylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:akpm@linux-foundation.org,m:w@1wt.eu,m:linux@weissschuh.net,m:jpoimboe@kernel.org,m:robert.moore@intel.com,m:lenb@kernel.org,m:srinivas.pandruvada@linux.intel.com,m:tj@kernel.org,m:void@manifault.com,m:arighi@nvidia.com,m:changwoo@igalia.com,m:broonie@kernel.org,m:rostedt@goodmis.org,m:gmonaco@redhat.com,m:shuah@kernel.org,m:jikos@kernel.org,m:bentiss@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:leo.yan@arm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:nickdesaulniers@gmail.com,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[leo.yan@arm.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[70];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:mid,arm.com:dkim,arm.com:from_mime,arm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 079E262F774

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
  Patch 05:        Rename to cross-cc-option so the function name
                   cc-option can be reserved for using globally.
  Patch 06:        Propagate -fzero-init-padding-bits=all to
                   EXTRA_CFLAGS and HOST_EXTRACFLAGS for the
                   CC and HOSTCC compilers, respectively.
  Patches 07 – 23: Apply EXTRA_CFLAGS and HOST_EXTRACFLAGS in
                   project Makefiles.

The change has been verified:

Test 1: Cross compiling perf (rebased on perf-tools-next)
	host: gcc 15.2.0 (x86_64), target: aarch64-linux-gnu-gcc

  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- LDFLAGS="-static" \
	    -C tools/perf VF=1 CORESIGHT=1 NO_JEVENTS=1 DEBUG=1

Test 2: Cross compiling selftest bpf and sched_ext
	host: gcc 15.2.0 (x86_64), target: aarch64-linux-gnu-gcc

  export ARCH=arm64
  export CROSS_COMPILE=aarch64-linux-gnu-
  make -C tools/testing/selftests/ TARGETS="bpf sched_ext" SKIP_TARGETS=""

Test 3: BPF CI test (BPF patches will be sent separately)

  https://github.com/kernel-patches/bpf/actions/runs/26815163486

[1] https://gcc.gnu.org/gcc-15/changes.html

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v7:
- Appended $(EXTRA_CFLAGS) in tracing/rtla/Makefile.
- Refactored testing/selftests/lib.mk to include Makefile.include, as
  the $(EXTRA_CFLAGS) can be applied globally for selftest, dropped the
  patches for selftests/hid, selftests/nolibc and selftests/sched_ext.
- Link to v6: https://lore.kernel.org/r/20260323-tools_build_fix_zero_init-v6-0-235858c51af9@arm.com

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
Leo Yan (23):
      tools: lib: thermal: Fix typo
      tools/thermal: Fix typo
      tools: lib: thermal: Initialize CFLAGS before including Makefile.include
      tools/thermal: Initialize CFLAGS before including Makefile.include
      selftests/nolibc: Use a dedicated cross cc-option helper
      tools build: Append -fzero-init-padding-bits=all to extra cflags
      perf build: Append extra host flags
      tools build: Append extra host CFLAGS for fixdep
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
      selftests: Include tools Makefile.include

 tools/bootconfig/Makefile                      |  1 +
 tools/build/Makefile                           |  8 ++++---
 tools/counter/Makefile                         |  1 +
 tools/dma/Makefile                             |  1 +
 tools/gpio/Makefile                            |  1 +
 tools/hv/Makefile                              |  1 +
 tools/iio/Makefile                             |  1 +
 tools/lib/thermal/Makefile                     | 20 +++++++++--------
 tools/mm/Makefile                              |  1 +
 tools/objtool/Makefile                         |  2 ++
 tools/perf/Makefile.config                     |  2 +-
 tools/power/acpi/Makefile.config               |  1 +
 tools/power/x86/intel-speed-select/Makefile    |  1 +
 tools/sched_ext/Makefile                       |  1 +
 tools/scripts/Makefile.include                 | 30 ++++++++++++++++++++++++++
 tools/spi/Makefile                             |  1 +
 tools/testing/selftests/lib.mk                 | 30 +++++++++++++-------------
 tools/testing/selftests/nolibc/Makefile.nolibc | 12 +++++------
 tools/thermal/lib/Makefile                     | 20 +++++++++--------
 tools/tracing/latency/Makefile                 |  1 +
 tools/tracing/rtla/Makefile                    |  1 +
 tools/usb/Makefile                             |  1 +
 22 files changed, 95 insertions(+), 43 deletions(-)
---
base-commit: 6f3ed7fec72fc8979b2a8c7219c0a9fcfc8d07b5
change-id: 20260224-tools_build_fix_zero_init-dc5261bd8b8b

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


