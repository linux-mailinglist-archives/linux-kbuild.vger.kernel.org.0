Return-Path: <linux-kbuild+bounces-11485-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNB4J++coWkOvAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11485-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 14:32:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7EE1B7B8A
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 14:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E83D3161327
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 13:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EFA271A9A;
	Fri, 27 Feb 2026 13:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="PK2chCLi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from outbound.mr.icloud.com (p-west2-cluster1-host1-snip4-10.eps.apple.com [57.103.68.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030A223E34C
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Feb 2026 13:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772198844; cv=none; b=ETH83jbZ1/oJWPqxt9KthmoNz/Qb1UqIRvZB9gQ4NhlheUAMjXk4guZx/tDdyopGxQBR5xu0pDVHCe/mfG3YmitwdagGguWOHFie3TtzAu98eM+0F8v79ACv+deRUqA1GtHjhVYFL/8Qwf+xLx2CddMDUy+5zV7vQWYFtb/gAuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772198844; c=relaxed/simple;
	bh=sEgXL3WoF8wdiRr7K25ilKknZPwGl5esvG142bOJ5nQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dN3QHE23K4PgRdfXpr7QJh3pvc6mViNnE58qwmxLqlkaSRArgBRZRTKy0iF59YVI2Y+A+IpPTvK0OXiQSTVoh4DyrLSlgBeRvMj8f58dz3fKwKm4Y7BCK0L/Cjh3akglhHreBXKcr9LeTOPcf0hNZHal9LVsg+WLFzhEdI8UK/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=PK2chCLi; arc=none smtp.client-ip=57.103.68.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-7 (Postfix) with ESMTPS id 2D5E3180016B;
	Fri, 27 Feb 2026 13:27:21 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1772198841; x=1774790841; bh=NBL8i/gMkWhnGT+P+c8YRHFFPZcKzGJ6OnahLVdfmIc=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=PK2chCLiYzePN9NDo3wZJVPjgVMCBLITpxnltXIedA546KVAg4yJC8hg9UQ1gIDGfKpmWwoIFbUqJFKock49pjCDbSCIEMJygiqbw9dGeeigqmEZkhCG1FfTw7tCG4bJIFeRS9L8qS9Rh+uGlIDSbYJS6qTpw4uM0Hfy58qrmwrKMG7A8yxdwrI06aKEJApLw4k7P/A9M31Naua5ADsEKzp45rwd0/m/mEsq1yOaCtGHlas8QlU/ZKdI/SaO9DgzYjRXkoqG//2pitO7j3QKssk0gstxHCAED3W3F/gz9dw3wGR78/aR1xQaxohP2Cm6ps4GJEEfa46LxkannfJg6w==
mail-alias-created-date: 1772007648188
Received: from localhost.localdomain (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-7 (Postfix) with ESMTPSA id BA4021800140;
	Fri, 27 Feb 2026 13:27:18 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ojeda@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Mohamad Alsadhan <mo@sdhn.cc>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2] kbuild: host: use single executable for rustc -C linker
Date: Fri, 27 Feb 2026 16:27:13 +0300
Message-ID: <20260227132713.23106-1-mo@sdhn.cc>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225102819.16553-1-mo@sdhn.cc>
References: <20260225102819.16553-1-mo@sdhn.cc>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: s776J-1zVqQDbH6tTIMSP0jZsGbSoT1-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDExOSBTYWx0ZWRfX5272JshkG3il
 Zh0CHlU9qgwn268+kZ24iUT8LqhxuVAvq4IoRiYPv3Z345V68tzHnFVjwfNxwT+ybZ+H8zxQINB
 0fHEnWFetksfFTliAjMV1CUsbUXmPS5ZZ3b7cRLzbpNY/573uI0Rh2tfgSSPeROGKpTPxtMKLVa
 6al0mW560yvRqo5/uUmMtQt7e6q/eizZql7tGCLBYM65fmgSZCfWUi5OMHFIqVaU1eUGoXqay8i
 xKldgKpcZYo/TYv0LObTFJusMUHTCyEtYgiovwMg7lSkkikc02QSfY9Qz6gg+1jXHu2VAMyNDBH
 YSxpdTV25D8wdiw2LHEE+tqjyzdr6KGw6e15TL1ZAP+uFDA1OYa/KgNzrtljIY=
X-Proofpoint-ORIG-GUID: s776J-1zVqQDbH6tTIMSP0jZsGbSoT1-
X-Authority-Info-Out: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69a19bb9
 cx=c_apl:c_apl_out:c_pps a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=x15TNrMgF8Yv6q7hHcYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 clxscore=1030 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602270119
X-JNJ: AAAAAAAB505fCQDuvsixKucLwym0EmR/Ak7BJ4FAjZcPS5BzCY3tv4slMTbccWpVpXruJ/tP8VsyoefZF1qcQcYbMuko+N+R/zQ7rTupA276P0/GJ95zaldt8lDJsYpuIwJDpegLnrPzOcpBh7v6IwFc/dCPnMuvtFAZkvP+O9cjbdr3EW7MePCfuZRsBlfQfQ8M8FiDAh49C1gLL9OAzJcxBlCIR6APzpucnwN/qEm7wTKX/ob7nAS4CrCYc/aUIa2mWshiHldLfUqmjnB4bLpw2FHvyO/Hg8jYYA5u6krzaF5u5kucNocH43qBzQ5slWpIIO1xzgSK549w9RiHhjI0myZtdYU1ffUVCZEnDYliUMu4M8OWAzktKhvIJTCB3bsX2VpxBmfGGsIATro8q8JRSPxab1lYnXzjL8EekmV+sCc/deshNVzz5+pPT0JCNGc5iweaCB/cjRtFLyEaQgfICiBNRYygmDixq3h0CLYjr7XKJJaLRlfiHASRB924WEBI/4Wqz3iDgw/pk1D3g/C1Yd5Nck/5ync9XVYXvC6B1bMc7/8fupQ7Z54Gs3aDMmVOebU1jpAeFPDXob9RtUYzDp/v/YktsUQnAD6+xyVGlef1HykGDkUnnYvFG0duV/uC1kJEctFoaNu7QY/tQ0D2Y06Kz8mfuv6LgCdC6do2Y3E4dAJhM43bwboWgiwuccDPYw==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sdhn.cc:s=sig1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[sdhn.cc:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11485-lists,linux-kbuild=lfdr.de];
	DMARC_NA(0.00)[sdhn.cc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mo@sdhn.cc,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smile.fr:email,sdhn.cc:mid,sdhn.cc:dkim,sdhn.cc:email]
X-Rspamd-Queue-Id: 0B7EE1B7B8A
X-Rspamd-Action: no action

rustc's -C linker= option expects a single executable path. When
HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
-Clinker=$(HOSTCC) results in the shell splitting the value into
multiple words, and rustc interprets the additional word as an
input filename:

  error: multiple input filenames provided ...

Introduce HOSTRUSTC_LD to select the linker executable for host Rust
tools. When HOSTCC expands to multiple arguments and HOSTRUSTC_LD is
not set, fall back to the last word of HOSTCC and warn. Users needing
wrapper semantics can point HOSTRUSTC_LD at a wrapper script.

Closes: https://github.com/Rust-for-Linux/linux/issues/1224
Suggested-by: Yoann Congal <yoann.congal@smile.fr>

Acked-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
---
v1 -> v2:
  - Rename HOSTRUSTC_LINKER to HOSTRUSTC_LD for consistency
  - Introduce explicit HOSTRUSTC_LD override
  - Warn when falling back due to multi-argument HOSTCC
  - Error out if a user-specified HOSTRUSTC_LD is not an executable

v1: https://lore.kernel.org/all/20260225102819.16553-1-mo@sdhn.cc/
---
 scripts/Makefile.host | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index c1dedf646..f029f3f0c 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -87,11 +87,30 @@ hostcxx_flags  = -Wp,-MMD,$(depfile) \
                  $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
                  $(HOSTCXXFLAGS_$(target-stem).o)
 
+# rustc's `-C linker=` expects a single executable path, not a command line.
+# HOSTCC may be a multi-word command when wrapped (e.g. "ccache gcc"), which
+# would otherwise be split by the shell and mis-parsed by rustc.
+#
+# Allow users to override the linker used by host Rust tools via HOSTRUSTC_LD.
+# If HOSTCC is multi-word and HOSTRUSTC_LD is not set, default to the last
+# word of HOSTCC (typically the underlying compiler) and emit a warning.
+ifndef HOSTRUSTC_LD
+HOSTRUSTC_LD := $(HOSTCC)
+endif
+
+ifneq ($(words $(HOSTRUSTC_LD)),1)
+ifneq ($(filter command\ line environment,$(origin HOSTRUSTC_LD)),)
+$(error HOSTRUSTC_LD must be a single executable for rustc -C linker=. Got: "$(HOSTRUSTC_LD)")
+endif
+HOSTRUSTC_LD := $(lastword $(HOSTCC))
+$(warning HOSTCC expands to multiple arguments. Trying HOSTRUSTC_LD="$(HOSTRUSTC_LD)" for rustc. Set HOSTRUSTC_LD to override.)
+endif
+
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
 # modules case.
 hostrust_flags = --out-dir $(dir $@) --emit=dep-info=$(depfile) \
-		 -Clinker-flavor=gcc -Clinker=$(HOSTCC) \
+		 -Clinker-flavor=gcc -Clinker=$(HOSTRUSTC_LD) \
 		 -Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
                  $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
                  $(HOSTRUSTFLAGS_$(target-stem))
-- 
2.52.0


