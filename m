Return-Path: <linux-kbuild+bounces-12113-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBCVMwmzvmkrXgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-12113-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Mar 2026 16:02:33 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F442E5EE0
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Mar 2026 16:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9451300C026
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Mar 2026 15:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2376E2F12A5;
	Sat, 21 Mar 2026 15:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="yOofEihl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from outbound.mr.icloud.com (p-west2-cluster5-host11-snip4-1.eps.apple.com [57.103.71.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84EA2DC332
	for <linux-kbuild@vger.kernel.org>; Sat, 21 Mar 2026 15:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.71.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774105295; cv=none; b=efrxQKpuyL4g53QMGQZUzZ83xCOxBfEEfgCUfO4xmQ1Z8YNTsD+O0zjbS1bP6TuWCO6LntuB1E0Mp6FnE7KsLCT5s5FnxEwjCT6COkQrOID4Xpr3MpxDEMYSN0v9KgACksgN4E0JPFZJaawqzldv/xvCnzCUEuVZJ5wsCObwi3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774105295; c=relaxed/simple;
	bh=hHfSHDRGB9n8nVCQPWOTjtJeGCPiq927fQbhSzET4M0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OMilhreghtiOvIq+xLxW1zKxK2xnqW60bPqU7MFLTJvdg2rU1rKo1ht349X1o+qr5K1/DxyGtla2FBuCV1FiBFg1Emaz4OJyEI/UpJ19iAgbfByYCBZNBoo6ajIRrHW502PlHnwqeszTa9EYeB3Cxr01po0bsX+ylv4drdClIWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=yOofEihl; arc=none smtp.client-ip=57.103.71.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-0 (Postfix) with ESMTPS id 64B6318029F5;
	Sat, 21 Mar 2026 15:01:30 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1774105293; x=1776697293; bh=4qgOAzheT2vartcrn59HnuiKmvocJv6yEQGbMNYvJCM=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=yOofEihlnwkFbtRs0qOZmTj4/E74fkqM7IgwJR3vIu7mAEnEXHt2DspKqew9EuICxEUOekxNNUnrYM7PoIXOS+fJvQWITxnAheZY/FU9ZQY5kcF8ackT1aQ/KPS1gHwdO22mjIyHOYfNAJVNn8UVkp7Cr0QQ5nJFSEImq8Bfa9hF8n7Wp/erhyFIF6gBSHH6NHWYoqmh78kmZTmmOD3TxPtmJ4oBf0XcCTEfNO/3JJ+NCQy5+/coZxRMP1/KAp4Et6blDecIMyySmoFFPR80raxF/sBb2uVDpFA5WZxFmm0GCOjMyD12F8MjN9oIyQ2ruP0veQl4JxrdWj9A1zWPQQ==
mail-alias-created-date: 1772007648188
Received: from localhost.localdomain (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-0 (Postfix) with ESMTPSA id 8054418029D8;
	Sat, 21 Mar 2026 15:01:27 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
To: nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org
Cc: gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Mohamad Alsadhan <mo@sdhn.cc>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v5] kbuild: host: use single executable for rustc -C linker
Date: Sat, 21 Mar 2026 18:00:34 +0300
Message-ID: <20260321150034.9915-1-mo@sdhn.cc>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317112021.14353-1-mo@sdhn.cc>
References: <20260317112021.14353-1-mo@sdhn.cc>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Z3XMx10p0bP2_zQ3Wyq_ZUvKGtmQ8FyJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDEyNiBTYWx0ZWRfXxuMjcMC9wzbi
 YRPQc0JTRaY6ACgrwELo4/fE+2r9rHz3UFUgIKwmrMFVOskU46cnn/ZSeyn3v13bU4WoLsSQc72
 0sXFNo9Um9ajNbC3O1hkK5KPFrIFX+Sug7jbLBkxqn18mUxHUboWeWE0sytdWk70Ja5jNucp/iN
 mjWeGmkMBgQnBDTR6ksIQZfOA6LV/DG5QlQZsllDggw35nP64ZJMWugRiPTAK+/Wh2Q47QV+/g9
 cnuQRbKUwmvUJ9rqI31Hd5Yehzz1KyvjYj6YmnwexkqW8K4MTCIT96t843ngOcQy6ZgBeas3on8
 GndbxD7eGYzxKDQji9WTmuOp7ArCgtckh6qoSi8l/MeEV5OamTRGM3Rf0on7OU=
X-Authority-Info-Out: v=2.4 cv=Ga4aXAXL c=1 sm=1 tr=0 ts=69beb2cb
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=g9kHoenxMy6Ypn5Nwk8A:9
X-Proofpoint-ORIG-GUID: Z3XMx10p0bP2_zQ3Wyq_ZUvKGtmQ8FyJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 clxscore=1030 phishscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603210126
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sdhn.cc:s=sig1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sdhn.cc:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12113-lists,linux-kbuild=lfdr.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sdhn.cc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mo@sdhn.cc,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,57.103.71.4:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sdhn.cc:dkim,sdhn.cc:email,sdhn.cc:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smile.fr:email]
X-Rspamd-Queue-Id: 32F442E5EE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

rustc's -C linker= option expects a single executable path. When
HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
`-Clinker=$(HOSTCC)` results in the shell splitting the value into
multiple words, and rustc interprets the additional word as an
input filename:

  error: multiple input filenames provided ...

Generate a small wrapper script and pass it to -Clinker e.g.

  ```
  #!/bin/sh
  ccache gcc "$@"
  ```

This fix should be general enough to address most if not all cases
(incl. wrappers or subcommands) and avoids surprises of simpler fixes
like just defaulting to gcc.

This avoids passing the user command as an environment variable as
that would be more challenging to trace and debug shell expansions.

Link: https://github.com/Rust-for-Linux/linux/issues/1224
Suggested-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
---
v4 -> v5:
  - Fix word splitting issues
  - Remove unnecessary `exec sh -c` and simplify generated script

v3 -> v4:
  - Use filechk instead of if_changed macro to regenerate script
  - Remove trailing space at EOL

v2 -> v3:
  - Scrap previous hacky approaches (e.g. using lastword) and go with
    a proper fix which turned out not that complex to implement.
    Apologies Gary, I should have listened to you earlier :/

v1 -> v2:
  - Rename HOSTRUSTC_LINKER to HOSTRUSTC_LD for consistency
  - Introduce explicit HOSTRUSTC_LD override
  - Warn when falling back due to multi-argument HOSTCC
  - Error out if a user-specified HOSTRUSTC_LD is not an executable

v1: https://lore.kernel.org/all/20260225102819.16553-1-mo@sdhn.cc/
v2: https://lore.kernel.org/all/20260227132713.23106-1-mo@sdhn.cc/
v3: https://lore.kernel.org/all/20260312002852.11292-1-mo@sdhn.cc/
v4: https://lore.kernel.org/all/20260317112021.14353-1-mo@sdhn.cc/
---
 scripts/Makefile.host | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index c1dedf646..2d2429ca0 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -87,11 +87,29 @@ hostcxx_flags  = -Wp,-MMD,$(depfile) \
                  $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
                  $(HOSTCXXFLAGS_$(target-stem).o)
 
+# rustc's `-Clinker=` expects a single executable path, not a command line.
+# `HOSTCC` may be a multi-word command when wrapped (e.g. "ccache gcc"), which
+# would otherwise be split by the shell and mis-parsed by rustc.
+# To work around this, we generate a wrapper script that forwards arguments to
+# `HOSTRUSTC_LD` so that such commands can be used safely.
+#
+# Set `HOSTRUSTC_LD` for a different rustc linker command than `HOSTCC`
+HOSTRUSTC_LD ?= $(HOSTCC)
+define filechk_rustc-wrapper
+	printf "%s\n" \
+		'#!/bin/sh' \
+		'$(call escsq,$(HOSTRUSTC_LD)) "$$@"'
+endef
+
+$(obj)/rustc-wrapper: FORCE
+	$(call filechk,rustc-wrapper)
+	$(Q)chmod +x $@
+
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
 # modules case.
 hostrust_flags = --out-dir $(dir $@) --emit=dep-info=$(depfile) \
-		 -Clinker-flavor=gcc -Clinker=$(HOSTCC) \
+		 -Clinker-flavor=gcc -Clinker=$(obj)/rustc-wrapper \
 		 -Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
                  $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
                  $(HOSTRUSTFLAGS_$(target-stem))
@@ -153,7 +171,7 @@ $(host-cxxobjs): $(obj)/%.o: $(obj)/%.cc FORCE
 quiet_cmd_host-rust	= HOSTRUSTC $@
       cmd_host-rust	= \
 	$(HOSTRUSTC) $(hostrust_flags) --emit=link=$@ $<
-$(host-rust): $(obj)/%: $(src)/%.rs FORCE
+$(host-rust): $(obj)/%: $(src)/%.rs $(obj)/rustc-wrapper FORCE
 	+$(call if_changed_dep,host-rust)
 
 targets += $(host-csingle) $(host-cmulti) $(host-cobjs) \
-- 
2.52.0


