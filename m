Return-Path: <linux-kbuild+bounces-29-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E63B7EC384
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Nov 2023 14:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 137381F25F60
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Nov 2023 13:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FB2DDAA;
	Wed, 15 Nov 2023 13:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-kbuild@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B31F18C07
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Nov 2023 13:21:54 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 346AE11D;
	Wed, 15 Nov 2023 05:21:51 -0800 (PST)
Received: from loongson.cn (unknown [112.22.233.25])
	by gateway (Coremail) with SMTP id _____8BxbOrtxVRlyEY6AA--.21729S3;
	Wed, 15 Nov 2023 21:21:49 +0800 (CST)
Received: from localhost.localdomain (unknown [112.22.233.25])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axzy_pxVRlXQNDAA--.16352S2;
	Wed, 15 Nov 2023 21:21:48 +0800 (CST)
From: WANG Rui <wangrui@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Xi Ruoyao <xry111@xry111.site>,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	WANG Rui <wangrui@loongson.cn>
Subject: [PATCH] LoongArch: Explicitly set -fdirect-access-external-data for vmlinux
Date: Wed, 15 Nov 2023 21:21:37 +0800
Message-ID: <20231115132137.178523-1-wangrui@loongson.cn>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Axzy_pxVRlXQNDAA--.16352S2
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7JrWUtr47Ww47Zr4rGryrZrc_yoW8Jrykpa
	97ur48Gws5ArWIqF9FqFWfXw4qyr4DJr4fZa47Krn8ZFyDZryfZw45Ar4qg3W2y34kAryx
	Wa1xGFy2qFW5JwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

After this llvm commit [1], The -fno-pic does not imply direct access
external data. Explicitly set -fdirect-access-external-data for vmlinux
that can avoids GOT entries.

Link: https://github.com/llvm/llvm-project/commit/47eeee297775347cbdb7624d6a766c2a3eec4a59
Suggested-by: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: WANG Rui <wangrui@loongson.cn>
---
 arch/loongarch/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index c31a62521e6b..1f0d74403419 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -68,6 +68,7 @@ LDFLAGS_vmlinux			+= -static -n -nostdlib
 ifdef CONFIG_AS_HAS_EXPLICIT_RELOCS
 cflags-y			+= $(call cc-option,-mexplicit-relocs)
 KBUILD_CFLAGS_KERNEL		+= $(call cc-option,-mdirect-extern-access)
+KBUILD_CFLAGS_KERNEL		+= $(call cc-option,-fdirect-access-external-data)
 KBUILD_AFLAGS_MODULE		+= $(call cc-option,-fno-direct-access-external-data)
 KBUILD_CFLAGS_MODULE		+= $(call cc-option,-fno-direct-access-external-data)
 KBUILD_AFLAGS_MODULE		+= $(call cc-option,-mno-relax) $(call cc-option,-Wa$(comma)-mno-relax)
-- 
2.42.1


