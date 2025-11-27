Return-Path: <linux-kbuild+bounces-9894-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A39AC8FF13
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Nov 2025 19:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 36180351FA6
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Nov 2025 18:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F3726F28A;
	Thu, 27 Nov 2025 18:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VHgv2UZn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A455179C8
	for <linux-kbuild@vger.kernel.org>; Thu, 27 Nov 2025 18:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764269600; cv=none; b=MfDEHjgmK40xmU1NbVUtM8MgKt2gJ64n5oXOMM4bpIKGqZyPjY5bpGiv3ljCcmpGD/+EfupVDUntHRessfGFZ8RUiYNFijcSflbzhSfKDlMRdjtaDVayJQ3lWWKUCssq8NZREl5vayF1M9/Z4IHAVlrgwTE4zmz5YgDVJnqhlOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764269600; c=relaxed/simple;
	bh=2L9UD345rU94AfBtvlI4dQC63bAGeZGywGagB8VUEFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mzeL0ggpWtmVDUZcOy0hvHLXongd3lbiLHKzn/TGJ0yNgMj1N7weSnf/xGoxZ0D7J1PqWg0tdihLrnOUHTFYM0V83Qds052l6f/hyIOstSVLp3SIvc0TrixyTTApBIwglwUP98rhQbLaDlB3W0XmaoXYO9K5G7uIl0LFqVo5AQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VHgv2UZn; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764269595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GniM6YWeq8q57UYAO1fBBln/A1ZwY/HbEQa5QXtzgU4=;
	b=VHgv2UZnKYhAzLcVEt0ru2xlOmBTctJR6vyVekWuhm8sPwB16OMH731lHhsRuPdh2rMR5Y
	G2VXWK6ZElw3QjgeB0qPg/WH9JKItJd8XEX0SBkjUtD6AiDHuAZifZ05+frzrw7ipA4lEW
	+4XCDBwd3quuifFVfL1ze1BA6Os+gig=
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Alan Maguire <alan.maguire@oracle.com>,
	Donglin Peng <dolinux.peng@gmail.com>
Cc: bpf@vger.kernel.org,
	dwarves@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH bpf-next v2 0/4] resolve_btfids: Support for BTF modifications
Date: Thu, 27 Nov 2025 10:52:38 -0800
Message-ID: <20251127185242.3954132-1-ihor.solodrai@linux.dev>
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

Patches #1-#3 in the series are non-functional refactoring in
resolve_btfids. The last patch (#4) makes significant changes in
resolve_btfids and introduces scripts/gen-btf.sh. Implementation
changes are described in detail in the patch description.

[1] https://lore.kernel.org/dwarves/ba1650aa-fafd-49a8-bea4-bdddee7c38c9@linux.dev/
[2] https://lore.kernel.org/bpf/20251029190113.3323406-1-ihor.solodrai@linux.dev/
[3] https://lore.kernel.org/bpf/20251119031531.1817099-1-dolinux.peng@gmail.com/

---

v1->v2:
  - gen-btf.sh and other shell script fixes (Donglin)
  - update selftests build (Donglin)
  - generate .BTF.base only when KBUILD_EXTMOD is set (Alan)
  - proper endianness handling for cross-compilation
  - change elf_begin mode from ELF_C_RDWR_MMAP to ELF_C_READ_MMAP_PRIVATE
  - remove compressed_section_fix()
  - nit NULL check in patch #3 (suggested by AI)

v1: https://lore.kernel.org/bpf/20251126012656.3546071-1-ihor.solodrai@linux.dev/

Ihor Solodrai (4):
  resolve_btfids: rename object btf field to btf_path
  resolve_btfids: factor out load_btf()
  resolve_btfids: introduce enum btf_id_kind
  resolve_btfids: change in-place update with raw binary output

 MAINTAINERS                          |   1 +
 scripts/Makefile.modfinal            |   5 +-
 scripts/gen-btf.sh                   | 167 ++++++++++++++
 scripts/link-vmlinux.sh              |  42 +---
 tools/bpf/resolve_btfids/main.c      | 331 +++++++++++++++++----------
 tools/testing/selftests/bpf/Makefile |   5 +
 6 files changed, 395 insertions(+), 156 deletions(-)
 create mode 100755 scripts/gen-btf.sh

-- 
2.52.0


