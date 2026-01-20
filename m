Return-Path: <linux-kbuild+bounces-10728-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLHDCrB6cWkvHwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10728-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 02:17:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB3B603DD
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 02:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0E23A86783A
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 12:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68474279FE;
	Tue, 20 Jan 2026 12:37:49 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3473EDAC2;
	Tue, 20 Jan 2026 12:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912669; cv=none; b=HjfcjLvavmKc/W+FsMRN79zo/RflKtXyAlo6YDTVD52WpVuCpNVwUAnOYPS5Ac5TsUV1DgZUKjruuYle2iGTSq4vwnjqa3sxSvE8l/q3137bKKtrpxnh8KT6veh7JnnayTlPYOXjGswAWPOYuPOQMrUzmyjzaMXef9cwFgbXgEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912669; c=relaxed/simple;
	bh=ZfHo7bsbhy7sebKLb2eJ3ODN4FdVc6bkl4K2lv7V9u0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G2xO/Zn/8b6t6F2TdMGmmUFpofSpcrZm2MDwtpZv9+ePb0wae/g1ZI7OBazRI5QHRBXTyL4PQI4Wi63AsNF8loKt6iu7YCanlVErn667FHfBcrV+9JEykoXN8c66P+t0AMaMGCwEHBu7/mJVFR+vObOB1zSqrYcLp5ofOxqwtX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxqsISd29pDrgKAA--.34589S3;
	Tue, 20 Jan 2026 20:37:38 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxWcEKd29py60nAA--.733S4;
	Tue, 20 Jan 2026 20:37:37 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/3] kbuild: Make sure to generate config file
Date: Tue, 20 Jan 2026 20:37:29 +0800
Message-ID: <20260120123730.30487-3-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJAxWcEKd29py60nAA--.733S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtF43AFy8trykWryxCrWDWrX_yoWktrgEkF
	WIq3WxAws5AFWS9F1qgrW8Xr12ga1DZryfAr1xZFnrJw1DXws7GasxZFWxCr1fW3yUZr95
	GrZFvr92kr1UCosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jY38nUUUUU=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.24 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[36];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_FROM(0.00)[bounces-10728-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,loongson.cn:mid,loongson.cn:email,system.map:url]
X-Rspamd-Queue-Id: 8FB3B603DD
X-Rspamd-Action: no action

After commit 75cffd392bfa ("LoongArch: Using generic scripts/install.sh
in `make install`"), arch/loongarch/boot/install.sh is usually not used,
either /root/bin/installkernel or /sbin/installkernel is used if found.

Then it can not generate the config file in most cases, just copy it to
the installation path. Otherwise there may be an error when testing bpf,
for example.

  $ ./test_verifier
  gzopen /boot/config-6.19.0-rc6: No such file or directory

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 scripts/install.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/install.sh b/scripts/install.sh
index 05d62ac513ee..ecf354d8f4f1 100755
--- a/scripts/install.sh
+++ b/scripts/install.sh
@@ -34,6 +34,12 @@ do
 		continue
 	fi
 
+	# Install kernel config file
+	if [ -f ${INSTALL_PATH}/config-${KERNELRELEASE} ]; then
+	  mv ${INSTALL_PATH}/config-${KERNELRELEASE} ${INSTALL_PATH}/config-${KERNELRELEASE}.old
+	fi
+	cp .config ${INSTALL_PATH}/config-${KERNELRELEASE}
+
 	# installkernel(8) says the parameters are like follows:
 	#
 	#   installkernel version zImage System.map [directory]
-- 
2.42.0


