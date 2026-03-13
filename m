Return-Path: <linux-kbuild+bounces-11923-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNv2CcOftGkjrQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11923-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 00:37:39 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B94D28AB48
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 00:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F05C305FFF4
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Mar 2026 23:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71BB3E3C7D;
	Fri, 13 Mar 2026 23:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5q+MJsc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839583D5655;
	Fri, 13 Mar 2026 23:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773445056; cv=none; b=bIuvdTLYeT9DCyvgtqlbY5SwAi7UH+PLF7HXMCLnNzz6DNzX3/QSQf7J9FoEh1grncBbc0A1e1n71z3V3ecyhKT4n7NPxIU1+emvvdFjYH0kt/c69PHRsF36YybpptArjHd6L8BqYcuAmDbAKqvN0wXlMvEN1mAWGvrCDOoQqko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773445056; c=relaxed/simple;
	bh=P/b+26eLHzJBtQ41eepGb28Olwsac0ZQYyfKcCRSB6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Zcgf/hSiziC7yqIkPojzne+dKOafcIeqTnzk5/xL3ROVlYSfmLiZonENaOsIN22dCfDX/c2EOW2J+/mqcjuNJ8YEF7c0ZtCCDTlRClrnI2ZV6rSw6ilCiM25PffnT20hR71E/yZtVjOjTjzolMAOkaHEbzJv7HIeTLmIWfJ10og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5q+MJsc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9982CC19421;
	Fri, 13 Mar 2026 23:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773445056;
	bh=P/b+26eLHzJBtQ41eepGb28Olwsac0ZQYyfKcCRSB6s=;
	h=From:Date:Subject:To:Cc:From;
	b=g5q+MJscx8OlcpENFUbJonXsEG0iTUR0/J7qt4l7lA9rFt2hwLyn5fRNHgIGfd1YL
	 G/83WSaTqGXfK9Y0sWmQVDuHbV2J2CRSe0CDCcmN5yYhFZ1neJ341sLek5SOh/bt1o
	 XH7l+SZLvoO0Ooa3p2XAVDevDhyrmx37P+cWxH86bBOgDkLOyWNskaxbn84Up/QWyB
	 nSr8oi3GzqqpgzZOkzk8Kc5hIsW6Vg5csi2GKoALEOCTkDrNls/C+MuU20rs4Q+XTY
	 2EqZgtCGQSG+IxKLcD7+KwHYFB2K8pTUYezoYkJPMFtqwmxqjB/A8rASK2GZ1Bljqr
	 FY6OXbLPtZsCQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 13 Mar 2026 16:37:29 -0700
Subject: [PATCH] Documentation: kbuild: Update the debug information notes
 in reproducible-builds.rst
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-kbuild-docs-repro-builds-fdebug-prefix-map-updates-v1-1-3aeeef7fa710@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNywqDMBBFf0Vm3YFoVGh/pXSRzIw2fWjImFIQ/
 72pLs/lcs4KKimIwqVaIcknaJinAvWpArq7aRQMXBga0/TG1hafPocXI8+kmCSmGfdBcWDxecS
 YZAhffLuIObJbRJFastRyf+46A0V8XPbo9XawZv8QWv4l2LYffX1VepYAAAA=
X-Change-ID: 20260313-kbuild-docs-repro-builds-fdebug-prefix-map-updates-c4c3c4d69550
To: Nicolas Schier <nsc@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexander Coffin <alex@cyberialabs.net>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430; i=nathan@kernel.org;
 h=from:subject:message-id; bh=P/b+26eLHzJBtQ41eepGb28Olwsac0ZQYyfKcCRSB6s=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlb5u87suz9nzWza76yV25Qmcq9yM1Wtc8ryPr8N/E4l
 o0M2cvFOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEbggzMqwOfXP7zMzH2yx+
 TFhjuPmehaq/aGNVoMCjOd1LnCXmh59hZLikPSm4b9HDpSscuhe5h8+sOb/jZ+4bWdHJ77cvc1g
 f58ELAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11923-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,reproducible-builds.org:url]
X-Rspamd-Queue-Id: 7B94D28AB48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The debug information part of the "Absolute filenames" section in the
reproducible builds document only mentions providing
'-fdebug-prefix-map' to KCFLAGS but it needs to be provided to KAFLAGS
as well since debug information has been generated for assembly files
for a long time.

Additionally, mention that the build directory may also appear as an
absolute path in the debug information (via DW_AT_comp_dir), so it needs
to be overridden via '-fdebug-prefix-map' as well.

Reported-by: Alexander Coffin <alex@cyberialabs.net>
Closes: https://lore.kernel.org/b8dfe7035d19fd611b9be55ee3145fdb@purelymail.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 Documentation/kbuild/reproducible-builds.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
index 96d208e578cd..bc1eb82211df 100644
--- a/Documentation/kbuild/reproducible-builds.rst
+++ b/Documentation/kbuild/reproducible-builds.rst
@@ -50,8 +50,10 @@ Absolute filenames
 ------------------
 
 When the kernel is built out-of-tree, debug information may include
-absolute filenames for the source files.  This must be overridden by
-including the ``-fdebug-prefix-map`` option in the `KCFLAGS`_ variable.
+absolute filenames for the source files and build directory.  These must
+be overridden by including a ``-fdebug-prefix-map`` option for each in
+the `KCFLAGS`_ and `KAFLAGS`_ variables to cover both ``.c`` and ``.S``
+files.
 
 Depending on the compiler used, the ``__FILE__`` macro may also expand
 to an absolute filename in an out-of-tree build.  Kbuild automatically
@@ -135,6 +137,7 @@ See ``scripts/setlocalversion`` for details.
 .. _KBUILD_BUILD_TIMESTAMP: kbuild.html#kbuild-build-timestamp
 .. _KBUILD_BUILD_USER and KBUILD_BUILD_HOST: kbuild.html#kbuild-build-user-kbuild-build-host
 .. _KCFLAGS: kbuild.html#kcflags
+.. _KAFLAGS: kbuild.html#kaflags
 .. _prefix-map options: https://reproducible-builds.org/docs/build-path/
 .. _Reproducible Builds project: https://reproducible-builds.org/
 .. _SOURCE_DATE_EPOCH: https://reproducible-builds.org/docs/source-date-epoch/

---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260313-kbuild-docs-repro-builds-fdebug-prefix-map-updates-c4c3c4d69550

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


