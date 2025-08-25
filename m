Return-Path: <linux-kbuild+bounces-8568-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF26AB343C9
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 16:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEE8D3B82E0
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 14:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B262FC87A;
	Mon, 25 Aug 2025 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPWPBLMJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA03E38FB9;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131964; cv=none; b=oswmYukC9XnZmjoo24LM1uZG9kOM2jVqyifPlz86iDPs5KeeOix31fiq+4+PLCCYDnRaSPAa67yU/KaWRr1/sc9GQnnNUBWjTKYQf2EchU89aMxq4/MqHzBuWmxcdxyNkDEvUsptPqzFU0wJQ/K/M/39m/WyxPuV45m7dVb4/No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131964; c=relaxed/simple;
	bh=qKnJwvVOQdbIM7AwmZDu1aieujqnr4MVL8xJV+3xcWU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TEjIRi1LXKuBLD5jUTAohhszLUME9ODlaUxswkhzMvaE1nUsCmECAhCX/G/L2Lhxv9xRQ11w2hl4so/ZwxuUj0ixsS4d1otDpLwZ/5ocE7K6/rk/9y8teH+GtNB4u99nPSvEjBO3tp2ruN+GHO6rQm1kf0X7OvKkuQjrlBJLs/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPWPBLMJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81222C116C6;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756131963;
	bh=qKnJwvVOQdbIM7AwmZDu1aieujqnr4MVL8xJV+3xcWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bPWPBLMJbqPu4Ihz/jn1p85BL57qjQm0GeXE5FNWeLlN++/7RKlMCJ8dHmh3NN98j
	 a2MJOEJMImQWuqo4ojpxl7wQxUW+kMSttdKngdXjPS2kCUyc+BZ+1e8oOgQ0Ti2/6m
	 reEgKi6EjffV33DLzQyIgr8V9g2nlmSVYUG7EaM/MyY7M2lKY2Zv/dN2S7hOdASMCl
	 /HccRg3BXD9cdYB8R3XGPA4vYe8uLuojG1CaSJ1AIvlscFmLwGNseHrwr/ONQGONLO
	 cnGyoQE6fc06n1ued9gtzzjBPgY/6MjOfjPP43UQ+V4sPfnprtr50fs3xdqa5Qy6Yd
	 aMsiVDBIbNsJA==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 2/5] x86/traps: Clarify KCFI instruction layout
Date: Mon, 25 Aug 2025 07:25:49 -0700
Message-Id: <20250825142603.1907143-2-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825141316.work.967-kees@kernel.org>
References: <20250825141316.work.967-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Just a nit-picky change to the KCFI indirect call check instruction
documentation. The addl offset isn't always -4 (it depends on patchable
function entry configuration).

Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/x86/kernel/cfi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cfi.c b/arch/x86/kernel/cfi.c
index 77086cf565ec..638eb5c933e0 100644
--- a/arch/x86/kernel/cfi.c
+++ b/arch/x86/kernel/cfi.c
@@ -27,7 +27,7 @@ static bool decode_cfi_insn(struct pt_regs *regs, unsigned long *target,
 	 * for indirect call checks:
 	 *
 	 *   movl    -<id>, %r10d       ; 6 bytes
-	 *   addl    -4(%reg), %r10d    ; 4 bytes
+	 *   addl    -<pos>(%reg), %r10d; 4 bytes
 	 *   je      .Ltmp1             ; 2 bytes
 	 *   ud2                        ; <- regs->ip
 	 *   .Ltmp1:
-- 
2.34.1


