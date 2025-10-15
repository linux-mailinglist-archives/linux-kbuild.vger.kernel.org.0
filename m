Return-Path: <linux-kbuild+bounces-9153-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F62BDC234
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 04:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 037714EA14E
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 02:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564ED14D29B;
	Wed, 15 Oct 2025 02:18:50 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FCD1F5E6
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Oct 2025 02:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760494730; cv=none; b=nz/8YZ11+RmcIR+jVosIi+EEqkvRMRpjh/BGT/aM9DB/sOQygeZNwsnO144XzSBaHggjv/qrVYkjQNU/S7APUmfP4oi3S/xN56XwA8cOYGf9Zqvy8pWUa48BHqAcjzrf2GEeAmB7/+tYZZkb1xscfs+VuzSx0ZFJ+uEwkgQ0lxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760494730; c=relaxed/simple;
	bh=V3/oNQn2UwjY16nNnjDzZZ7vu7UV3L49t4kWV60WR+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q0WJuXQh8tEqjyeWUZBMa0o/qxhZyPjR3EPH9/H8JCKJ7Lx4a4JKIGzdVzGu8mWRPVx3GVPEPDK/gNDlBwQ9wPatYiuYeIoQepf34RM78cM3xuK5feQQyjGuU5KLgQ2s3G/ULoYg13QK5HeZ1tSImpHhIcNC1m7sCABgjlpKsZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 43739514a96d11f0a38c85956e01ac42-20251015
X-CTIC-Tags:
	HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NAME
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	UD_TRUSTED
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:11746228-c883-4aa5-91cd-8b16f92d1ea0,IP:10,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-5
X-CID-INFO: VERSION:1.3.6,REQID:11746228-c883-4aa5-91cd-8b16f92d1ea0,IP:10,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:b035a480d053dbea7c994b7a8c646170,BulkI
	D:2510151018407WL6TL6E,BulkQuantity:0,Recheck:0,SF:17|19|24|38|44|66|78|10
	2,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:ni
	l,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:
	0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_ULS,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 43739514a96d11f0a38c85956e01ac42-20251015
X-User: yangang@kylinos.cn
Received: from yangang-thinkpad-t14-gen-1.. [(223.70.160.239)] by mailgw.kylinos.cn
	(envelope-from <yangang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 322618025; Wed, 15 Oct 2025 10:18:39 +0800
From: Gang Yan <yangang@kylinos.cn>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	David Disseldorp <ddiss@suse.de>,
	linux-kbuild@vger.kernel.org
Cc: Gang Yan <yangang@kylinos.cn>
Subject: [PATCH] gen_initramfs.sh: add the positive check for timestamp
Date: Wed, 15 Oct 2025 10:18:31 +0800
Message-ID: <20251015021831.355966-1-yangang@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gen_initramfs.sh script has already checked that 'date' returned
somthing, but it did not verify the content of the return. This patch
adds a check to ensure the correctness of the timestamp obtained via the
'date -d'.

Signed-off-by: Gang Yan <yangang@kylinos.cn>
---
Notes:

This issue is reported in mptcp-upstream-virtme-docker. A issue in RUST
CoreUils [1] causes a compilation error:
'''
	ERROR: Timestamp out of range for cpio format
	make[4]: *** [<KERNEL_SRC>/usr/Makefile:76:
'''

The root cause of this error is the the output of 'date -d0' is 'Sat Jan 
1 00:00:00 UTC 0000'. We started a discussion on [2], and want your
suggestion about 'Is the compilation error too strict when failing to 
retrieve the date? Maybe an extra check could be added to make sure the
timestamp is positive?'

Thanks,
Gang

[1]https://github.com/uutils/coreutils/issues/8898
[2]https://patchwork.kernel.org/project/mptcp/patch/20251013101946.248420-1-yangang@kylinos.cn/
---
 usr/gen_initramfs.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/gen_initramfs.sh b/usr/gen_initramfs.sh
index 7eba2fddf0ef..a076719e4d9f 100755
--- a/usr/gen_initramfs.sh
+++ b/usr/gen_initramfs.sh
@@ -223,7 +223,7 @@ while [ $# -gt 0 ]; do
 			;;
 		"-d")	# date for file mtimes
 			timestamp="$(date -d"$1" +%s || :)"
-			if test -n "$timestamp"; then
+			if test -n "$timestamp" && test "$timestamp" -ge 0; then
 				timestamp="-t $timestamp"
 			fi
 			shift
-- 
2.43.0


