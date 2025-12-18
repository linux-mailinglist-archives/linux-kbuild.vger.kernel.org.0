Return-Path: <linux-kbuild+bounces-10141-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3D0CC9E3B
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 01:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE21E3027CED
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 00:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC88188735;
	Thu, 18 Dec 2025 00:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="P6/LZ+vi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EC413B284;
	Thu, 18 Dec 2025 00:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766018058; cv=none; b=nzZkMg6hGTFL9WWi894rPyiMUf6VJtKuNI7tj7/JNeB83OBh5LhNiOswohspK6XtiupHMJRvXgK3DeB59NPgbGWw0cEnGWPXrCoMU66WAEs8c1Jc4ElTzm+NHgLErTCVFMnSfMom1eN+duRXZFlbg7W7HZErk/tYv5kD2pDWWM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766018058; c=relaxed/simple;
	bh=1H7v1yEOBd89QHThU8DOQ3A3hil6GVRheNxYDdBj7FA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RQewVUHzbbNbBSf6yPzmdsNJ/qNvNDUaqR7UzhLHZHR0YA+QToXbQEgrXbmXmdlM3V9RWWnngOo3JAs+WfD47IxCmxUPeVujcy+rnljtgUuP1okklFE01Fja2Ed0bl/PTcBhF9cw7jXYoaL8wMqqjkUMd8esBV7OhSzlsj32rvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=P6/LZ+vi; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766018042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Jjxg0msd0wrwT+/IAP3o4OvO/U5BQ2+j/m+JCjRvBu8=;
	b=P6/LZ+viF/VEuxUulJNKQqLmvOLbXIqTf1RDBGv2zgbiMET1VwJLeSWgU4tQiEUYX2xvTJ
	ttnm14orKHQ7Eolubo9UoAyebEA2Z2FXn9q9zl1Mee73uAyYXi+9fxYEoF3Bnm/QV6eqsX
	5Ztl9KRVsasT/7iMEA0HQGM3YTxLQOI=
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alan Maguire <alan.maguire@oracle.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrea Righi <arighi@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Changwoo Min <changwoo@igalia.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Vernet <void@manifault.com>,
	Donglin Peng <dolinux.peng@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	KP Singh <kpsingh@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Nicolas Schier <nsc@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Song Liu <song@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Tejun Heo <tj@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>
Cc: bpf@vger.kernel.org,
	dwarves@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sched-ext@lists.linux.dev
Subject: [PATCH bpf-next v4 0/8] resolve_btfids: Support for BTF modifications
Date: Wed, 17 Dec 2025 16:33:06 -0800
Message-ID: <20251218003314.260269-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This series changes resolve_btfids and kernel build scripts to enable
BTF transformations in resolve_btfids. Main motivation for enhancing
resolve_btfids is to reduce dependency of the kernel build on pahole
capabilities [1] and enable BTF features and optimizations [2][3]
particular to the kernel.

Patches #1-#4 in the series are non-functional changes in
resolve_btfids.

Patch #5 makes kernel build notice pahole version changes between
builds.

Patch #6 changes minimum version of pahole required for
CONFIG_DEBUG_INFO_BTF to v1.22

Patch #7 makes a small prep change in selftests/bpf build.

The last patch (#8) makes significant changes in resolve_btfids and
introduces scripts/gen-btf.sh. See implementation details in the patch
description.

Successful BPF CI run: https://github.com/kernel-patches/bpf/actions/runs/20321339588

[1] https://lore.kernel.org/dwarves/ba1650aa-fafd-49a8-bea4-bdddee7c38c9@linux.dev/
[2] https://lore.kernel.org/bpf/20251029190113.3323406-1-ihor.solodrai@linux.dev/
[3] https://lore.kernel.org/bpf/20251119031531.1817099-1-dolinux.peng@gmail.com/

---

v3->v4:
  - add patch #4: "resolve_btfids: Always build with -Wall -Werror"
  - add patch #5: "kbuild: Sync kconfig when PAHOLE_VERSION changes" (Alan)
  - fix clang cross-compilation (LKP)
    https://lore.kernel.org/bpf/cecb6351-ea9a-4f8a-863a-82c9ef02f012@linux.dev/
  - remove GEN_BTF env variable (Andrii)
  - nits and cleanup in resolve_btfids/main.c (Andrii, Eduard)
  - nits in a patch bumping minimum pahole version (Andrii, AI)

v3: https://lore.kernel.org/bpf/20251205223046.4155870-1-ihor.solodrai@linux.dev/

v2->v3:
  - add patch #4 bumping minimum pahole version (Andrii, Alan)
  - add patch #5 pre-fixing resolve_btfids test (Donglin)
  - add GEN_BTF var and assemble RESOLVE_BTFIDS_FLAGS in Makefile.btf (Alan)
  - implement --distill_base flag in resolve_btfids, set it depending
    on KBUILD_EXTMOD in Makefile.btf (Eduard)
  - various implementation nits, see the v2 thread for details (Andrii, Eduard)

v2: https://lore.kernel.org/bpf/20251127185242.3954132-1-ihor.solodrai@linux.dev/

v1->v2:
  - gen-btf.sh and other shell script fixes (Donglin)
  - update selftests build (Donglin)
  - generate .BTF.base only when KBUILD_EXTMOD is set (Alan)
  - proper endianness handling for cross-compilation
  - change elf_begin mode from ELF_C_RDWR_MMAP to ELF_C_READ_MMAP_PRIVATE
  - remove compressed_section_fix()
  - nit NULL check in patch #3 (suggested by AI)

v1: https://lore.kernel.org/bpf/20251126012656.3546071-1-ihor.solodrai@linux.dev/

Ihor Solodrai (8):
  resolve_btfids: Rename object btf field to btf_path
  resolve_btfids: Factor out load_btf()
  resolve_btfids: Introduce enum btf_id_kind
  resolve_btfids: Always build with -Wall -Werror
  kbuild: Sync kconfig when PAHOLE_VERSION changes
  lib/Kconfig.debug: Set the minimum required pahole version to v1.22
  selftests/bpf: Run resolve_btfids only for relevant .test.o objects
  resolve_btfids: Change in-place update with raw binary output

 Documentation/scheduler/sched-ext.rst         |   1 -
 MAINTAINERS                                   |   1 +
 Makefile                                      |   9 +-
 init/Kconfig                                  |   2 +-
 lib/Kconfig.debug                             |  13 +-
 scripts/Makefile.btf                          |  26 +-
 scripts/Makefile.modfinal                     |   5 +-
 scripts/Makefile.vmlinux                      |   2 +-
 scripts/gen-btf.sh                            | 157 ++++++++
 scripts/link-vmlinux.sh                       |  42 +--
 tools/bpf/resolve_btfids/Makefile             |   3 +-
 tools/bpf/resolve_btfids/main.c               | 356 ++++++++++++------
 tools/sched_ext/README.md                     |   1 -
 tools/testing/selftests/bpf/.gitignore        |   3 +
 tools/testing/selftests/bpf/Makefile          |  11 +-
 .../selftests/bpf/prog_tests/resolve_btfids.c |   4 +-
 16 files changed, 446 insertions(+), 190 deletions(-)
 create mode 100755 scripts/gen-btf.sh

-- 
2.52.0


