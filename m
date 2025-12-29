Return-Path: <linux-kbuild+bounces-10354-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 903CBCE821C
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Dec 2025 21:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E16B30161AB
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Dec 2025 20:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FD426B760;
	Mon, 29 Dec 2025 20:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aaM+eKAG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA0D261B6D
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Dec 2025 20:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767040143; cv=none; b=AwrIxOXO7BrxTkDn23frbRwZFGYObbcM1yCHmog5rNUVecwfZpWQAiDE+nBwHnDm4yH2qj7agJm9pSY9yHOrEIgrui4h7ySoBEDNerxjT+4mY8EwTXTfhQAjxla9tGAVrGL1jGxvGrDjPwtj3wmny53MsX4PspvqaH8dxC+2xFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767040143; c=relaxed/simple;
	bh=8l70OTim6XjUp23ekQsAZ33A3YoAPuKldtj6TuiRU28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bnu7TFknnfWuRu+u38ZKacghmziRcPXUqcx8D3e5EqHcE6SlUMWnZAqB0Uqxw1Sv9Gwq7wbgUQ50PsOobx0wMZvT1FlN/t5ycATc80flS3vHdetaPY5xL67syjAKQKKX127eLB/ZfQ2tRja3HPUWQ0tVaHsXDNjY9KKt+m/ayiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aaM+eKAG; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767040128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=66RyJtvFY4/td0oW3dHBamAjsmRJXPQckDimQmVLu+A=;
	b=aaM+eKAGmaBXwvnMTxR319XP55l+85bqCxm0N9ztJ2Kvyjph/zlmMCdNJ7m8rxJhdGMfXw
	fjgXyo/Ny+ZWjVnlmCUnSWpy66D+8iuL/bkNk1syePirgnPbL8ScDrwab19VLl0reYIhvF
	A5La9N10X/2tapVPpLqNx1rUSvKMTAI=
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next] scripts/gen-btf.sh: Fix .btf.o generation when compiling for RISCV
Date: Mon, 29 Dec 2025 12:28:23 -0800
Message-ID: <20251229202823.569619-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

gen-btf.sh emits a .btf.o file with BTF sections to be linked into
vmlinux in link-vmlinux.sh

This .btf.o file is created by compiling an emptystring with ${CC},
and then adding BTF sections into it with ${OBJCOPY}.

To ensure the .btf.o is linkable when cross-compiling with LLVM, we
have to also pass ${KBUILD_FLAGS}, which in particular control the
target word size.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512240559.2M06DSX7-lkp@intel.com/
Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 scripts/gen-btf.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gen-btf.sh b/scripts/gen-btf.sh
index 06c6d8becaa2..12244dbe097c 100755
--- a/scripts/gen-btf.sh
+++ b/scripts/gen-btf.sh
@@ -96,7 +96,7 @@ gen_btf_o()
 	# deletes all symbols including __start_BTF and __stop_BTF, which will
 	# be redefined in the linker script.
 	info OBJCOPY "${btf_data}"
-	echo "" | ${CC} ${CLANG_FLAGS} -c -x c -o ${btf_data} -
+	echo "" | ${CC} ${CLANG_FLAGS} ${KBUILD_CFLAGS} -c -x c -o ${btf_data} -
 	${OBJCOPY} --add-section .BTF=${ELF_FILE}.BTF \
 		--set-section-flags .BTF=alloc,readonly ${btf_data}
 	${OBJCOPY} --only-section=.BTF --strip-all ${btf_data}
-- 
2.52.0


