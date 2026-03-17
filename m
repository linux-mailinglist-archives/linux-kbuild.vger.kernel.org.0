Return-Path: <linux-kbuild+bounces-12015-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MhIABg5uWlYvwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12015-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 12:20:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2CE2A8A3B
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 12:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE108301F399
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 11:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2357C372B2E;
	Tue, 17 Mar 2026 11:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="J6bKE1OF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from outbound.qs.icloud.com (qs-2004h-snip4-2.eps.apple.com [57.103.84.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7060537D106
	for <linux-kbuild@vger.kernel.org>; Tue, 17 Mar 2026 11:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.84.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773746452; cv=none; b=VTFcvSgXxM9XIZ8UGuM9RktB14oTRzbRrhsaEx+sO363iXD8PxDvWEsnjsC2KtR7OZsCBgl6vZoLG7CLyPoQ4kHGzpF4uxaTonei4E0Lt26ITg24B4L+xG2F+iGGeXNbHnksoKGbOjki7O4oQtc3EZ6qaaKMyr1UVEaablvIm/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773746452; c=relaxed/simple;
	bh=9YfWfZYiQkQYYOWiDHb9z3LuxMbFBAHWjytevN1hgmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bLqZCvHdHD91MINg7yZ5MWkd1FhsqmBxsI49qPCXEpRu75Egs7szKidUGvixVpra5O02GzgHtT7yRx/ZqtCMqZQuOu9/5pmP+F/fXgLgiRBrD7wiOELtYwkfMoQQuQ92ms8a/9w4PWyydGhtist2ryKUajgzgpX4ZHIts2sREDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=J6bKE1OF; arc=none smtp.client-ip=57.103.84.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-3 (Postfix) with ESMTPS id DC43818004E6;
	Tue, 17 Mar 2026 11:20:46 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1773746449; x=1776338449; bh=F4/202vbepzGQKwWETqlVFYD+WUFLrMm8DhgbZopSNw=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=J6bKE1OFLSMl3FTJNqJR5qWCxnlo4ZWx3icLvBBEcUHYtZEnV810plCIOgfSXjv3JPF9U+iK+TGUakl3YBLk498wZBGbjKjdw1GlyfJFOq99tI3IVjA6QUln2dtJiSAE0RnnUMyoHg+2WZfnsCOA+FwkLV7J0VFdkFgJ3ZlPQU+xtCU8zATyOCCaMz+zEaM+YEIzoxU0JbTTnKC8DzisqdFV9CmA95rdCA23DSvHffTh75uKlc1ohiqffpkfZ6xy7bnBWGp3my4+mJQSmIlLSOn+2Jc/PhrKYbnzBLr58aNcXKmzIb30U/a6MnDar7+6aKcKf0hBjifZo9U3LIPziA==
mail-alias-created-date: 1772007648188
Received: from localhost.localdomain (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-3 (Postfix) with ESMTPSA id 5809C1800252;
	Tue, 17 Mar 2026 11:20:44 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
To: nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org
Cc: gary@garyguo.net,
	miguel.ojeda.sandonis@gmail.com,
	linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Mohamad Alsadhan <mo@sdhn.cc>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v4] kbuild: host: use single executable for rustc -C linker
Date: Tue, 17 Mar 2026 14:20:21 +0300
Message-ID: <20260317112021.14353-1-mo@sdhn.cc>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260312002852.11292-1-mo@sdhn.cc>
References: <20260312002852.11292-1-mo@sdhn.cc>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: D8Tfr0LE4E8sGzdhcYwAuLwdeAGRWOg2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEwMCBTYWx0ZWRfX6f7dYn+V8L/T
 11Md/mZecPVQrSy/kqpKIc4m6wGSHiLCvGPP6tVbVbURPkG07UrNvewHa2CXZJ5c15gh/fqBd6l
 lNX/jaKxybP3umzotJ3FR8/gx+5wfRQipGqvkLbU33LNp8yZ2EdOzxCSpxjxF9y7Sxs280ikhw7
 0qbbHel0Ra5BxHNU5n0bTNiFjL9JlRaTMqyAWUwSgD66FYNWMfkkeER8BsbU5czYYCT4gNeekwq
 gQgSyAvvyIDr4XQaa47vPGtXnHeUh8WIs+Bs7JTf9iLjN+PZe7QaNaR6KBP61BYmevbjauRfj0D
 DcscO0fxODeKcNfTKKT3wQSDqLStQOGhG12zV4A9dwcD+AiIKExc6cwW9dL7cE=
X-Authority-Info-Out: v=2.4 cv=fLk0HJae c=1 sm=1 tr=0 ts=69b9390f
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=BnAdxDlUUgj7to-tmM8A:9
X-Proofpoint-ORIG-GUID: D8Tfr0LE4E8sGzdhcYwAuLwdeAGRWOg2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1030
 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603170100
X-JNJ: AAAAAAABswUu7SJNqYcz7k6I75BmUcIXuQLpdda/tr1PE9purYSjJEuLKS1jy7ihVCxCmbf77G3+w8vb2D5J7aAA3P6wqRpyoizAS4z3UCGpt2rJzvR35WlBQv+qyvVGcoYQ1iWtW1XaJOysm5Kiy8/aD+d2KRIEmVSxmf+lirdJ5yoczGIYVNxgTixj5FGD4dF8hDjq+GYuXqhXE95ohR9OfJuu6g17JMGjwukhEm3S+s18Y9w8YLkmcxf1uJTCM9ZExJVL/f8dIiWyI32OGRctMNKdY8+XrJPGWwnVM1Kww+XlK/IZD4k9tMQUMxCe70lDoyxnl+g953kWTIjCRhoP5mHvqaSXXbwaHgUj2Pszk0J54Er4FVDIbUwe9eLCe7xH5c9hjtSFcmQOaQQeIw65uVzNN52sOAAEyaA2/LoGuJNvR9q2L8kbRsZmNWedsEYtqD9/HRPW/vXcMKlVhUVlUh6NhAykeAqBKDES7On0hdBEZmlx6xuaDC5jRlC6h0CuQKuTAdXHf4X0bQnpDoGYhlf+PQ/UPhRNyzu3AcsWjIAakOq759FuPDmsAVcMAMEZRGxL48aDC5X124pZrYu69SPfAVhDOcpqWdQJyvRmYjmPI8tu2wBxkq7b1aUB3Pnc+wGhpUNeP3WZjPf8a2DeY9337ckWRAC1V34WmPP+jMPwacywdyKjyqzZ2+qZzyoLor0aIM0ldtiyQU6Vd1rRNX5u
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sdhn.cc:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-12015-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[sdhn.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[garyguo.net,gmail.com,vger.kernel.org,sdhn.cc,smile.fr];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[mo@sdhn.cc,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[sdhn.cc:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sdhn.cc:dkim,sdhn.cc:email,sdhn.cc:mid]
X-Rspamd-Queue-Id: 7E2CE2A8A3B
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
exec sh -c 'exec "$0" "$@"' ccache gcc "$@"
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
---
 scripts/Makefile.host | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index c1dedf646..e41753828 100644
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
+		'exec sh -c '\''exec "$$0" "$$@"'\'' $(HOSTRUSTC_LD) "$$@"'
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


