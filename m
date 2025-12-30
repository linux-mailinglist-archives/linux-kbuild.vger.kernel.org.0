Return-Path: <linux-kbuild+bounces-10365-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63128CE9CD3
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 14:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46FD23024D61
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 13:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630D8239099;
	Tue, 30 Dec 2025 13:39:53 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0364B223705;
	Tue, 30 Dec 2025 13:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767101993; cv=none; b=WaTAE2RWP2Is0BEfpLuAgS34Nd3whDuecy2ktuT0bl41DczlNZiolZ2Hh+c5/PfKvqrEKGxY+1Lka8hFlj3GjmWZDlwGAw0foQq+2n5uvA2SGp5+DQ08fECrAiAnhRE21hO8B51uKUs9dx3nP2fwbrZb2o4+GvdbgvOEKrgjaNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767101993; c=relaxed/simple;
	bh=0d/OanXMJ0pRPad1es/3QtK336I3Hcqs1dKIXrOzFYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hVL12VA767k6sZvUtb8Y2A/1TsPonWfhatyCrcxuV99FCG6UwQIDcgFRdxuSaZmsRlKWhMW/0JOtO5dgjSllU4bZDuXReNFkJjdJ+wdFnKn2DJ/kIJet4Kjx4mFvDE2YKWqu9SpQXJue+vz9UF5ANYt00rfg603H9keOaymm0Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.0.2] (unknown [114.241.82.59])
	by APP-01 (Coremail) with SMTP id qwCowADnjWkN1lNpCqNgAg--.13684S2;
	Tue, 30 Dec 2025 21:39:26 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Tue, 30 Dec 2025 21:39:17 +0800
Subject: [PATCH] riscv: boot: Always make Image from vmlinux, not
 vmlinux.unstripped
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-riscv-vmlinux-not-unstripped-v1-1-15f49df880df@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAATWU2kC/yXNywqDMBCF4VeRWXdKEmlBX6Uo2GRsB2q0kwtC8
 N0b6vI7i/8UCCRMAfqmgFDmwKuv0JcG7HvyL0J21WCUuWnTKhQONmNePuzTjn6NmHyIwttGDlt
 FVtmuVbMzUBOb0Mz7P/8YTgt9U32J5wjPKRDadVk49k2+X3WHYvVYDhiO4wdoLjN0ngAAAA==
X-Change-ID: 20251230-riscv-vmlinux-not-unstripped-30ec0c930fd2
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Nathan Chancellor <nathan@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Han Gao <gaohan@iscas.ac.cn>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 stable@vger.kernel.org, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID:qwCowADnjWkN1lNpCqNgAg--.13684S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWUAF1DGr4UJw1DWrWUXFb_yoW8Cr15p3
	yUuw1YkrWUJrWj9F10y3y293y2qFn0g3y3ZFW8GF1DtrWjqF1vqwsIgayUWF9rGFs3Wa1D
	Xr4fGF95Ca40y3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

Since commit 4b47a3aefb29 ("kbuild: Restore pattern to avoid stripping
.rela.dyn from vmlinux") vmlinux has .rel*.dyn preserved. Therefore, use
vmlinux to produce Image, not vmlinux.unstripped.

Doing so fixes booting a RELOCATABLE=y Image with kexec. The problem is
caused by this chain of events:

- Since commit 3e86e4d74c04 ("kbuild: keep .modinfo section in
  vmlinux.unstripped"), vmlinux.unstripped gets a .modinfo section.
- The .modinfo section has SHF_ALLOC, so it ends up in Image, at the end
  of it.
- The Image header's image_size field does not expect to include
  .modinfo and does not account for it, since it should not be in Image.
- If .modinfo is large enough, the file size of Image ends up larger
  than image_size, which eventually leads to it failing
  sanity_check_segment_list().

Using vmlinux instead of vmlinux.unstripped means that the unexpected
.modinfo section is gone from Image, fixing the file size problem.

Cc: stable@vger.kernel.org
Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/boot/Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index bfc3d0b75b9b..5301adf5f3f5 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -31,11 +31,7 @@ $(obj)/xipImage: vmlinux FORCE
 
 endif
 
-ifdef CONFIG_RELOCATABLE
-$(obj)/Image: vmlinux.unstripped FORCE
-else
 $(obj)/Image: vmlinux FORCE
-endif
 	$(call if_changed,objcopy)
 
 $(obj)/Image.gz: $(obj)/Image FORCE

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251230-riscv-vmlinux-not-unstripped-30ec0c930fd2

Best regards,
-- 
Vivian "dramforever" Wang


