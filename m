Return-Path: <linux-kbuild+bounces-10727-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLO1KtdNcWkahAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10727-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 23:06:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CA95E79A
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 23:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4B9C1689CA0
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 12:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB3E426D1E;
	Tue, 20 Jan 2026 12:37:48 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D893F23C8;
	Tue, 20 Jan 2026 12:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912668; cv=none; b=mD+7UFuKWbvAL4BZ0JFeLW4OAp9CkBi9r58vf2d7AoqNu8eEs/glPqSmxn7wMWUZF+3vBJCZU0px3ghZKDuJfKpQ/0SutlxbKyjDbXahPmPbwC3ROC7zJb07X9wS0hkHncgA+3TFroccvh6/pO8fCs9Nrs8gxNhIrTRlvNVvJcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912668; c=relaxed/simple;
	bh=o/H120QuglZYp+2jypHZ3CE/IW5jst0eEeTnceWveDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+dgq9lKyMlhHG/XXTw1hHaIyHN3wRBEKOopDWOJ4CyPwaqYsNS0pGElpBRVP6meLJFnBhKJTOlGPy5Aih5oR1t2is+qdaXSoNwMzr2YPVRUn8ukEPozjyf/n3bCZYqj9N//0XnltbohiUZEcIhBu2MKzoJKED9ZUPjTkJHd7SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxacITd29pEbgKAA--.34642S3;
	Tue, 20 Jan 2026 20:37:39 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxWcEKd29py60nAA--.733S5;
	Tue, 20 Jan 2026 20:37:39 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] kbuild: Make sure to generate System.map file
Date: Tue, 20 Jan 2026 20:37:30 +0800
Message-ID: <20260120123730.30487-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260120123730.30487-1-yangtiezhu@loongson.cn>
References: <20260120123730.30487-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxWcEKd29py60nAA--.733S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWrtF43AFy8trykXr4rKFWUKFX_yoW8Jr4Up3
	Wxu347G3Wktr13uay5KrWfGryUA39aqFy5ur4UCFy2yryDtrykKrsxZryrCF4Uu3yrKryF
	gr4vya4Uua1UJFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcDDGUUUUU
X-Spamd-Result: default: False [1.24 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[33];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_FROM(0.00)[bounces-10727-lists,linux-kbuild=lfdr.de];
	DMARC_NA(0.00)[loongson.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangtiezhu@loongson.cn,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,loongson.cn:email,loongson.cn:mid,system.map:url]
X-Rspamd-Queue-Id: 30CA95E79A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

After commit 75cffd392bfa ("LoongArch: Using generic scripts/install.sh
in `make install`"), arch/loongarch/boot/install.sh is usually not used,
either /root/bin/installkernel or /sbin/installkernel is used if found.

It should generate System.map when using the script installkernel on x86
and LoongArch Fedora Linux system according to the man pages but it does
not in practice, just copy it to the installation path.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 scripts/install.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/install.sh b/scripts/install.sh
index ecf354d8f4f1..93714ef65967 100755
--- a/scripts/install.sh
+++ b/scripts/install.sh
@@ -40,6 +40,12 @@ do
 	fi
 	cp .config ${INSTALL_PATH}/config-${KERNELRELEASE}
 
+	# Install system map file
+	if [ -f ${INSTALL_PATH}/System.map-${KERNELRELEASE} ]; then
+	  mv ${INSTALL_PATH}/System.map-${KERNELRELEASE} ${INSTALL_PATH}/System.map-${KERNELRELEASE}.old
+	fi
+	cp System.map ${INSTALL_PATH}/System.map-${KERNELRELEASE}
+
 	# installkernel(8) says the parameters are like follows:
 	#
 	#   installkernel version zImage System.map [directory]
-- 
2.42.0


