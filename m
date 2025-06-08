Return-Path: <linux-kbuild+bounces-7396-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3707AD1297
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Jun 2025 16:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9B581689B7
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Jun 2025 14:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA2224DCF8;
	Sun,  8 Jun 2025 14:27:57 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788311FE455;
	Sun,  8 Jun 2025 14:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749392877; cv=none; b=qxyx4BOFSY4QWUDW4eRf3rT4v4l1k+nk3AgilUZIcjMPNxRm8qNT4TGpPP+5XMm1k/GZtHcoEif2aRE47P8vvagKtXQCA5Mq3t2jRj6ftiCnEd0ardtMDsljAK1Myh+JVFtkh4Bv89Gk/aHZ5+5Ghj8kMCfM6qmmDqFBy/iTTFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749392877; c=relaxed/simple;
	bh=yWQL4s47QCYcRIFV28KOQF6sJyk9kJ3f9WRi8LtlGWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=osw48s7tFFyvWxDC//LvbKU6jwXKhAUQFzWD7fxVQ7ScGrB+k+YI345Byn7uMNJI2kAwj9OUIxVEn+3bsmrCtLtBKCTuuLNvNbGnTVpNMJWbpdEzvrIy6JmkL/MtGZMTz9I03brttgTTgij5Q8c9POaC2ygONq1QBVONpWbua/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8AxSWrnnUVolnQQAQ--.7257S3;
	Sun, 08 Jun 2025 22:27:51 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMAxTsXhnUVoVsEQAQ--.2327S2;
	Sun, 08 Jun 2025 22:27:50 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] ASoC: loongson: Fix build warnings about export.h
Date: Sun,  8 Jun 2025 22:27:37 +0800
Message-ID: <20250608142737.168829-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxTsXhnUVoVsEQAQ--.2327S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GFWrZw4kJryrGryDKFy8JFc_yoWDurc_Cw
	1Igw4rWry7JFy2k343Aa1DAr15X34rJa15uF1vyr13X3ZFy39agayxCa4DuF1xWr1vvFs5
	Zr48Wr18ZryFkosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j83kZUUUUU=

After commit a934a57a42f64a4 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") and 7d95680d64ac8e836c ("scripts/misc-check:
check unnecessary #include <linux/export.h> when W=1"), we get some build
warnings with W=1:

sound/soc/loongson/loongson_i2s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

So fix these build warnings for ASoC/Loongson.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 sound/soc/loongson/loongson_i2s.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index e8852a30f213..e336656e13eb 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
+#include <linux/export.h>
 #include <linux/pm_runtime.h>
 #include <linux/dma-mapping.h>
 #include <sound/soc.h>
-- 
2.47.1


