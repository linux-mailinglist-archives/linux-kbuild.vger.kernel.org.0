Return-Path: <linux-kbuild+bounces-13603-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hh5xAofnI2pu0AEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13603-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 06 Jun 2026 11:25:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DFC64D007
	for <lists+linux-kbuild@lfdr.de>; Sat, 06 Jun 2026 11:25:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13603-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13603-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7286630210DA
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jun 2026 09:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C0F282F0E;
	Sat,  6 Jun 2026 09:25:24 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC77C175A7E
	for <linux-kbuild@vger.kernel.org>; Sat,  6 Jun 2026 09:25:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780737924; cv=none; b=YxJW7pUp3Soy469RcE+ACRmdehQNreT5jhN25GujPtq/XOwMgF48aC96giYRrtBX+Str7MG4m25w7bb3FMMcZbh1yitdZZmVIb1Y/7WWK/jVBV1fgtL1wqYNIhjfkJQ4PVspzEn/kpVtvvgv7HbD8kJOHBlvkOynDjCD2ITRHnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780737924; c=relaxed/simple;
	bh=yiJks0Hgz5BvAgHP5aJNTgjm3liJYMoCPMsQSkYYP/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gB6upz9YxbZbD19dB375mctfsYUzZ20ynMxzEfBGSh27TcO9+bnFTYlzx/HmGaN5R/tvfkhzpGImQVY64MPfrfW+NeSPzVvREc3bm2G0hnIFUpJDDuBBlwh2ANIDeK5EH0QS/47kDp2Exv4RROZy5fAzHI99ISAHnmWTAWYnL90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8DxVeh45yNqhz4RAA--.40937S3;
	Sat, 06 Jun 2026 17:25:12 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJBxxuJ05yNqs56dAA--.65499S2;
	Sat, 06 Jun 2026 17:25:12 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>,
	Andy Lutomirski <luto@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] init/Kconfig: Update the THREAD_INFO_IN_TASK description
Date: Sat,  6 Jun 2026 17:25:01 +0800
Message-ID: <20260606092501.3200459-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxxuJ05yNqs56dAA--.65499S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFWxtw48Aw13Jw1kJw4kXwc_yoW8urW8pr
	Z3C3W7Gr45Ar4F9rWkJa4xuFn5Jrs2gay5Gr97A34UK34xGw1qgryfKayakr13Ar4v9a4j
	vrWqg3sxtFWqkabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJUUUUU=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[loongson.cn];
	TAGGED_FROM(0.00)[bounces-13603-lists,linux-kbuild=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:chenhuacai@kernel.org,m:yangtiezhu@loongson.cn,m:luto@kernel.org,m:linux-kbuild@vger.kernel.org,m:chenhuacai@loongson.cn,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chenhuacai@loongson.cn,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[chenhuacai@loongson.cn,linux-kbuild@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7DFC64D007

When commit c65eacbe290b81 ("sched/core: Allow putting thread_info into
task_struct") introduces THREAD_INFO_IN_TASK in 4.9, the only supported
architecture is x86 and thread_info only has a flags field. The Kconfig
description said thread_info should only has the flags field but didn't
explain the reason.

When commit c02433dd6de32f ("arm64: split thread_info from task stack")
introduces THREAD_INFO_IN_TASK for arm64 in 4.10, its thread_info has
more fields than a single flags, and arm64 works well.

Then commit 37a8f7c38339b2 ("x86/asm: Move 'status' from thread_struct
to thread_info") adds status back to thread_info for x86 in 4.16, and
x86 still works well.

After that, risc-v, powerpc and many other architectures all introduce
THREAD_INFO_IN_TASK and their thread_info have more fields rather than
a single flags field, of course they also work well.

I don't know the exact reason of the original description, but obviously
it is wrong and misleading, so I update it, let LoongArch and some other
architectures easier to support THREAD_INFO_IN_TASK.

Also improve the try_get_task_stack() and put_task_stack() description.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 init/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 2937c4d308ae..a9466879d553 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -207,11 +207,12 @@ config THREAD_INFO_IN_TASK
 	bool
 	help
 	  Select this to move thread_info off the stack into task_struct.  To
-	  make this work, an arch will need to remove all thread_info fields
-	  except flags and fix any runtime bugs.
+	  make this work, an arch will need to remove the task_struct pointer
+	  field from thread_info and fix any runtime bugs.
 
 	  One subtle change that will be needed is to use try_get_task_stack()
-	  and put_task_stack() in save_thread_stack_tsk() and get_wchan().
+	  and put_task_stack() in save_thread_stack_tsk(), get_wchan() and any
+	  other stacktrace functions.
 
 menu "General setup"
 
-- 
2.52.0


