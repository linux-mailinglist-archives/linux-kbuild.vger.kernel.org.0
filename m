Return-Path: <linux-kbuild+bounces-11870-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PB8N/AIsmkCIAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11870-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 01:29:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1606426BAE6
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 01:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F0933036095
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 00:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC13E1D555;
	Thu, 12 Mar 2026 00:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="XP26NMAT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from outbound.qs.icloud.com (qs-2001k-snip4-3.eps.apple.com [57.103.87.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BF133C502
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Mar 2026 00:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.87.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773275373; cv=none; b=UVK9Yj/6o6C4DmtUFBhKEmRPaTtIhzRGONasdxTjrKlYNStCoB4FIPcUia1FE1gEqXCHUN0mHVHmPDgdUZBfAIRVYVu+Khk3vbAQhINTTvj92XrJsd2cQlPa91jPLf8pa9oXgJ4p5A+D9JZeBI8hcgImCmuANtuqMa7CiJ74Cik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773275373; c=relaxed/simple;
	bh=W3ixQyue5mIQRfQ1o8cL0lq5llJHA0ACjVdyshalUcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XiVIyCaFkBnoOx7p9MSxhHEOnKdYKdZKjBmnMs0fA00+s/nVMFqgDWb3oSCCw+z5rH7ZKAQtvN3maZF85tM6a5LqH1ZMlZZvvRvpFOTtOP1ljd48Fm7XgcKJOrlDsU4WozdoY/l3QPgAzb7vlqY2f19D+YUM52rT9OQysevPsGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=XP26NMAT; arc=none smtp.client-ip=57.103.87.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-20-percent-1 (Postfix) with ESMTPS id 222BC18000B3;
	Thu, 12 Mar 2026 00:29:25 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1773275369; x=1775867369; bh=hjLSEGuwkxX4V+saABWaMm9bmM378h/ZDiC2CufLAQg=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=XP26NMATAB/7O28vYVr8WjTKonQaCp/1HJKrF4Xyrvjf1vqofHQCafa49kRNGH6xG5BuRqgWdT49fpvH7es4vzto6f9xa2iA345xVsHZbsgAHIQH4hgk3p1Sn5IIBozh2H1QPUQrIMzdrCzg88+lkEvmQkMDZcURr227+AA0Z55M2fYeBaako842syLSvDvwzWAeqPIXQw1rnTC/Jecvp/WNkGL9f3uDpTfdVVmdyPKwHwDHa8fMtkxfTuQ5BeKhAkpLU7WwxGRToQMi+OgAILh1M/4Zzy34ByBP6Hv4C+YFwxl7yDzs0kZXVK2KmAtjXffuNr8WJbh5eNDfuHcECw==
mail-alias-created-date: 1772007648188
Received: from localhost.localdomain (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-20-percent-1 (Postfix) with ESMTPSA id 43D4D180012A;
	Thu, 12 Mar 2026 00:29:23 +0000 (UTC)
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
Subject: [PATCH v3] kbuild: host: use single executable for rustc -C linker
Date: Thu, 12 Mar 2026 03:28:52 +0300
Message-ID: <20260312002852.11292-1-mo@sdhn.cc>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227132713.23106-1-mo@sdhn.cc/>
References: <20260227132713.23106-1-mo@sdhn.cc/>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAwMiBTYWx0ZWRfX0FpRWncWlNxF
 IB1pMWhGcxjE8ESUL7Q2VctxDVcB+ae90gFMg7LEOcrilgURNsXojt5gTZDLAM798dOSo8KHiWI
 EanFLk2Z7RRfX8I+ZupsX5n4PnWBny2HmK9ckND66/a7KfNJDDzVgTfPQ0oWNEfjrY3nvTgrY6i
 a1XEC42L+Ca60cxP8mx22syjDxwAz5hOtFOe3y7kLIEUVIo3kqPqzVfW+xdPw8CLn4OfR1SN38s
 m9QvxVoS0FUtNwfWuylq2Kpk4BDMXK5jdK9LklpBeDafkFo/4Irvdhntd/gZMde9z1g3/OQ3oTm
 w5GBzAqFFl2aQG611Vlaulg9BhN35ww4afK9L8YZuPI24vKXee4pKE5l0YbqCU=
X-Proofpoint-ORIG-GUID: gJsjsSNb5_7mOz1EUG5DplFkhetRMLkE
X-Authority-Info-Out: v=2.4 cv=b72/I9Gx c=1 sm=1 tr=0 ts=69b208e7
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=Ctbmymg6NlnuDDkWOYIA:9
X-Proofpoint-GUID: gJsjsSNb5_7mOz1EUG5DplFkhetRMLkE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxscore=0 clxscore=1030 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603120002
X-JNJ: AAAAAAAB3pdPDDBLnIQ25CJ1WeTRFk8HWjKqrsOKyQ5ClpGdtVt9o2t74VnMtSHZpi2TYkShcXMHswX9XMBz+G8Yu7ftqygAI2zIwZb2LWpdtMD/+HjPlVrZJi6FBHC8G4b8S0gmVGssFpF+4jDuTVV3oGDCeahAKzigNd0owvA1QRhWWPPvIHOAHhyzbfZB8X1Y0eT4umH61Jy/I1QK0fLgSodcwwdFVttTNfkGw+4eYaBHuKHnRxz2wfRsJFmmEH6bGfM052ZUUNP9Qqmx4FetIJ+jznXYKJdreKVdrRJeB4/joUIwH0dnb+rWyrFExtB7M8BOSus0Bxe8ZR+M0JyOqLf575+c9VyRQiPo1zgUYJ6VfHOaAx7yOW5tThaaeCrhO/PhWaIyULsZavd4HSJeLRR3/FtKsN3h/A3ZDCFPedmPeWJVXLQuCFqP4tOUFo7B6VCyffTy3O4JzrV+XtMpIEcMF/1kzjtnUhEqbIHpbivye1UpRP0SuZ6X+0JD6/AD/jADHruCcLwdh24cj9eqrVNNob1Yw6XJrV5/vnK8IT5eAadNdqGPcuXtAhOQ6v2WvuM/M2pLRee8DMO4W2b0LHV64HuMQZTjPpIz/UdNcIXJQD/Qk+T87O7CemzpW85FWniBiST6P837WopN9jjaiA8aE+0SlrLo6NDWgRkp5zk5tlu0YhmpHcbWwlY59+MNAG2QSIPgN7Obnh3UGMwiCMhb+KSDRg==
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sdhn.cc:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-11870-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1606426BAE6
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
\#!/bin/sh
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
---
 scripts/Makefile.host | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index c1dedf646..f976a07b7 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -87,11 +87,28 @@ hostcxx_flags  = -Wp,-MMD,$(depfile) \
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
+quiet_cmd_rustc-wrapper = HOSTGEN $@
+      cmd_rustc-wrapper = \
+	echo '\#!/bin/sh' > $@; \
+	echo 'exec sh -c '\''exec "$$0" "$$@"'\'' $(HOSTRUSTC_LD) "$$@"' >> $@; \
+	chmod +x $@
+
+$(obj)/rustc-wrapper: FORCE
+	$(call if_changed,rustc-wrapper)
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
@@ -153,7 +170,7 @@ $(host-cxxobjs): $(obj)/%.o: $(obj)/%.cc FORCE
 quiet_cmd_host-rust	= HOSTRUSTC $@
       cmd_host-rust	= \
 	$(HOSTRUSTC) $(hostrust_flags) --emit=link=$@ $<
-$(host-rust): $(obj)/%: $(src)/%.rs FORCE
+$(host-rust): $(obj)/%: $(src)/%.rs $(obj)/rustc-wrapper FORCE
 	+$(call if_changed_dep,host-rust)
 
 targets += $(host-csingle) $(host-cmulti) $(host-cobjs) \
-- 
2.52.0


