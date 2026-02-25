Return-Path: <linux-kbuild+bounces-11419-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oF+8Fh7QnmnwXQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11419-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 11:34:06 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B61D7195CE5
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 11:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BA263086050
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 10:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AA434320A;
	Wed, 25 Feb 2026 10:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="SVXVX/MC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from outbound.qs.icloud.com (qs-2001a-snip4-5.eps.apple.com [57.103.87.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF9130F957
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Feb 2026 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.87.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772015425; cv=none; b=SNYTAWkIl1O3UJrHoRdzweZYJqzuuBW3JXT7eAiSOUiMnsjcMHzWFabn2jvyXWZgkR+EA0+TRodu/b+FIh4+hUURy+M8dwltS46XIdeuYx2vfm6rDSnmQyOYqR3cle/lPvm8ij+1p8WD2fDPxmfuk5NWvsYu8VtvXJfr1F8FA8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772015425; c=relaxed/simple;
	bh=vot+LDuTE+cmKTFdl94uc+ZR/1qByGg0+RRx3Kl/Ci0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t2MRA0NDm0QrHA16FJUvf+886JgC4/OH+AuSoplw6Pc5J+l8uRQymstx/vaFPpjpxRqE+588Hu9bdGqHaG4yQIa2I/l3+PGCweLFeoy3TxY5LLWxEtP32LaB4cP04+d1cUTQt7Spuf4BfgSIdnPJjxUhsIubDt74POmNyBTKxp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=SVXVX/MC; arc=none smtp.client-ip=57.103.87.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-3 (Postfix) with ESMTPS id 9E7F81800096;
	Wed, 25 Feb 2026 10:30:21 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1772015423; x=1774607423; bh=aMHJktdj9D6hqAzzVIJLCNpwBnLk0KLK8ZYuySSFxO8=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=SVXVX/MC7lArj1htrpqNqsEceirrFk9AyL8SnqKQgVvpN186yfn5LPkDmd8NS1j84ENbI7Wqybt8qGUxfsYT8hwF+YnhFJbqltgC5LZQNdhYVnS6OBRNWuUNJDTadCwDPCUJOgTyjDLMVPQfBUldqjdZT+sZtCQkebshrpj1rDvITk+F91iXH9mVwTUpb1lDcX8V0f8CG2VIgmP/wQYu+AwqlogUNt5Ao5AF/qY2v04ALngGe+173PQ3WSUG7sNRzIOTl1MjCecGqLIKVha5ugNpUK9uXCXMV+cr0YWZ+jvntpDq1ISAfXFEwCRWeO/euvPuTgxEIwcrWfZYQc++gw==
mail-alias-created-date: 1772007648188
Received: from localhost.localdomain (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-3 (Postfix) with ESMTPSA id A91D61800104;
	Wed, 25 Feb 2026 10:30:19 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamad Alsadhan <mo@sdhn.cc>
Subject: [PATCH] kbuild: host: use single executable for rustc -C linker
Date: Wed, 25 Feb 2026 13:28:19 +0300
Message-ID: <20260225102819.16553-1-mo@sdhn.cc>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEwMyBTYWx0ZWRfX0DWm/2m6OB2P
 3btW4FIri7kVZBG40jLekX0XGaSCeKLKU/Lr8f2mxCdKEnyML9kEan9E7UIi/6SnUIOGRI/YcST
 mY7zUWq1LXPa5I4/a0lE9W94aJfatWt/oB+xPEFn4NLo4276cdcKV8fxY2h7rYr1GC6XF2OcGsq
 bFdnslgeiiGev6ykcMfiVTRAKTFuq4nsKkvhypbGrhSgedJURIMvCCs2O/FYD4W90H5zNJmSrDM
 EV3G1u7IwdNqcMmZJsXRyQduWllXjXlKTcLCgyo0GP8vetN7yghRbMofZTrknxmLRJXSTWb+hW0
 BXJaqM6vzYbPhsCtTORxDMmtP4gpYrzd1msCLCVFJgTxfBgZUdxf+BH8tyuwBo=
X-Proofpoint-GUID: EbUHMkS2mSz4CypQT1I_u9a5FK3CnoiE
X-Authority-Info-Out: v=2.4 cv=C5jkCAP+ c=1 sm=1 tr=0 ts=699ecf3d
 cx=c_apl:c_apl_out:c_pps a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8 a=NZa_Kkzm5SJ8vrfDT1IA:9
X-Proofpoint-ORIG-GUID: EbUHMkS2mSz4CypQT1I_u9a5FK3CnoiE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=746
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1030 mlxscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602250103
X-JNJ: AAAAAAABbrHl4TdClZgn6lPB98nejUtjy5QFse8ZyEaZTVQtL39EM5G+utF/Mqxmod5CFASj9tZvz45yM009NybfGQ5Xo02c+aU5aobfMnvEfGv7IlkY60WnsOgEGUIW/2CGiFnk+Z5Ju66e+wjXG6Rr54ier45HS5DZGYsIxN4DwJ1319gpUExStK+VYe6GFCDESpb9sKNI+9885KfqLCJ0Ps/N2jmbCO2B2Aoltwe0QjTa3g4omhUslSW+nYb3jabQg7lHblFhGoF+71LI58LLiJpjzTUl4bqEVcON7S6EQokq9/SerHNTfnalrsh3LMXbVTN+8iFEtqPWhzsjy9XVP9PxzrL8F+ly8kr/wjJceLlVwi9eeM/cWGMG260zBT3BZn/S+cXGYLxt+yEE4PgVQF5c3MYkAom/F6aa8TVow8sRhc/XiP1L8DipbHZBJRNFihrANkuKYSGjTApcoVh5xU+1XLU4vFioGSwMml+O9wf/HidEeCJmtQEuYnh6/o4zLjO5A/RJNQbuGqpNAPZn62fflLCfQzIGMKhDbUVDScVmoP/0mzqHCR/UPZ9Es6nV1SsgOyYyXYbCB7ZiF6LDP83z5woBltiROMcFdyJi+3aqIyiGPBkEGCkaGNnMKnl+S7CZEKH0ng5IUl07Fm6nr/n8L6gtKe2rawJvdw==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sdhn.cc:s=sig1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[sdhn.cc];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11419-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mo@sdhn.cc,linux-kbuild@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[sdhn.cc:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sdhn.cc:mid,sdhn.cc:dkim,sdhn.cc:email]
X-Rspamd-Queue-Id: B61D7195CE5
X-Rspamd-Action: no action

rustc's -C linker= option expects a single executable path. When
HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
-Clinker=$(HOSTCC) results in the shell splitting the value into
multiple words, and rustc interprets the additional word as an
input filename:

  error: multiple input filenames provided ...

Use the last word of HOSTCC as the linker executable for host
Rust tools. This preserves wrapper usage for C host tools while
ensuring rustc receives a single executable path.

Closes: https://github.com/Rust-for-Linux/linux/issues/1224

Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
---
 scripts/Makefile.host | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index c1dedf646..22eab2734 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -87,11 +87,18 @@ hostcxx_flags  = -Wp,-MMD,$(depfile) \
                  $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
                  $(HOSTCXXFLAGS_$(target-stem).o)
 
+# rustc's `-C linker=` expects a single executable path, not a command line.
+# HOSTCC may be a multi-word command when wrapped (e.g. "ccache gcc"),
+# which would otherwise be split by the shell and mis-parsed by rustc.
+#
+# Use a dedicated variable for the linker program used by host Rust tools.
+HOSTRUSTC_LINKER ?= $(lastword $(HOSTCC))
+
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
 # modules case.
 hostrust_flags = --out-dir $(dir $@) --emit=dep-info=$(depfile) \
-		 -Clinker-flavor=gcc -Clinker=$(HOSTCC) \
+		 -Clinker-flavor=gcc -Clinker=$(HOSTRUSTC_LINKER) \
 		 -Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
                  $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
                  $(HOSTRUSTFLAGS_$(target-stem))
-- 
2.52.0


