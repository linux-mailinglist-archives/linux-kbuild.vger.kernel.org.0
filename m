Return-Path: <linux-kbuild+bounces-10726-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDIUFBVYcGlvXQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10726-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 05:37:41 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C83BE5117E
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 05:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0042D68954B
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 12:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FEA4219E0;
	Tue, 20 Jan 2026 12:37:45 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE73366DA5;
	Tue, 20 Jan 2026 12:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912665; cv=none; b=sXdyfE78g0Jtfl2nStVzOA3BImD7C9mZzmN4LBwxv2KvyO5UB/Hy5JiP9UlC5uzlH3DFfDmaCOhznsTkMYEClkZRQ5/LhqPwP1o3WmQ79pf68ajYX2LDdi/IYUqD35zBYjLkXE+SAhRowpFVTZOcTpqJ/oapStbwoat6hud5eyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912665; c=relaxed/simple;
	bh=sNnZIX2Sg/ZOWRaCygdvrmNSzumbtcx5gutP+tyKGz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=enCgwD0ebnDc0zFpLv3YE1c1qljNIX4CoTjZRenvaJrTwQCIS7RAqKps0thPS39wMNIA4KyRHPPETdO29gyiwrofoi+8htXgSgR94lS0VQUCqX+m5A/HFWJDjSPUHKelyWCcCOfDfNkidkEOv1FHn2B+IhCKeK7H5nip/N1WPaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxWcIRd29pDbgKAA--.35120S3;
	Tue, 20 Jan 2026 20:37:37 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxWcEKd29py60nAA--.733S3;
	Tue, 20 Jan 2026 20:37:32 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] MAINTAINERS: Add scripts/install.sh into Kbuild entry
Date: Tue, 20 Jan 2026 20:37:28 +0800
Message-ID: <20260120123730.30487-2-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJAxWcEKd29py60nAA--.733S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XF4DGw13Kr4rKr43WF4DGFX_yoWxurX_Cr
	sFqayxXF18Ja13AFy8uan8tw43Kw4UXr4xGan7JF47Ja4DKrZ8KFnIgrZ7Ca13Cr4rCFZY
	qFW2qry2kr4fCosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jb_-PUUUUU=
X-Spamd-Result: default: False [0.24 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangtiezhu@loongson.cn,linux-kbuild@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[loongson.cn];
	TAGGED_FROM(0.00)[bounces-10726-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[loongson.cn:email,loongson.cn:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,get_maintainer.pl:url]
X-Rspamd-Queue-Id: C83BE5117E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The common installation code is in scripts/install.sh, add it into
Kbuild entry to reflect the reality.

With this updated entry, folks running get_maintainer.pl on patches
that touch scripts/install.sh will know to send it to linux-kbuild@
as well.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index da9dbc1a4019..8effca525b71 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13681,6 +13681,7 @@ F:	scripts/include/
 F:	scripts/mk*
 F:	scripts/mod/
 F:	scripts/package/
+F:	scripts/install.sh
 F:	usr/
 
 KERNEL HARDENING (not covered by other areas)
-- 
2.42.0


