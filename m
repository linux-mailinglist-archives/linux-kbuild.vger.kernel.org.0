Return-Path: <linux-kbuild+bounces-12883-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKvEMwKL72nuCgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12883-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 18:12:50 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C0D476153
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 18:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8B44A30231F8
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 16:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F60834D3BE;
	Mon, 27 Apr 2026 16:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Zv86YZ7x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833B7341660;
	Mon, 27 Apr 2026 16:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305957; cv=none; b=jsuOaeAObDHE833C6YizU/1SSidZ07dgwvd4mRWsEaNuK+LyCs/8m+OJKLW1E6KPuVJJUs4POdNALhtrzz0laVZnER4EyBzWVE2k93Q/Oe4Ceh613n2qcaYvvc00AtvjRciRr5RqxHKYAVv4BoH+qD9I8JOjQt0tXjf9pLI9xtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305957; c=relaxed/simple;
	bh=T5Q/izJx7hg/QUUHDFKPTpLsTO4+gBEZnXygCLpSSjc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HHggRrzUVb9FNbpgSUwFGotxIERxpwI7SheVvEzufdQO3V2aOg+csz3+mxGyFG77EO6OR70trnRMP7FNbQHK6AA2j4d/eC25D2zgLb/8rXS0AktDqanI6v49+EOia3qnQ9G6ojAzBT98Y4577T9uRDqJMj/0PS0wNbyL3CJHUiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Zv86YZ7x; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1777305953;
	bh=T5Q/izJx7hg/QUUHDFKPTpLsTO4+gBEZnXygCLpSSjc=;
	h=From:Subject:Date:To:Cc:From;
	b=Zv86YZ7xyFxBwjQTToySmVhX3+mKRB8iXSB8ZVxyPe0JBplEvO/eusx8iLots+XpX
	 C0EhpS5D4oa613eM8MFub+rRJpAWkeonOKgL3rHGX6CFXWSgxI0qLob/mkFn6LEaCt
	 cQGxIi5CFBesI0AALHD2pcIqj7o8rWjqYBDyYYBc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/2] kunit: qemu_configs: Add or1k / openrisc configuration
Date: Mon, 27 Apr 2026 18:04:55 +0200
Message-Id: <20260427-kunit-or1k-v1-0-9d3109e991e8@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDWZ1k8TVxELajAkJS0iadxds
 fwW7wXw5Jg8VEkARyd7Xm2ETBMwU2tHEtxHg0JVYq60WA7Lu1idXAQiZoWRWa+RIAabo4Gvb1Y
 3v/3RzWT29wD3/QAec5j2bgAAAA==
X-Change-ID: 20260427-kunit-or1k-00035c13d70e
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777305952; l=593;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=T5Q/izJx7hg/QUUHDFKPTpLsTO4+gBEZnXygCLpSSjc=;
 b=ZBGpsShrNJn7Kugx5aDvGmon6NXXf746zYSo+kRMHfUeeJSpI7EjU8aS3SmahUvJbLuzLnlvp
 9FgudjqwtJ+ChQxf1V5maSTBRLRyWMQ9feCDSOYegxlxVMFuI9cdbAD
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Queue-Id: 45C0D476153
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12883-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,linux.dev,davidgow.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,weissschuh.net:email,weissschuh.net:dkim,weissschuh.net:mid]

Add a basic configuration to run kunit tests on or1k / openrisc.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (2):
      gen_compile_commands: Ignore libgcc.a
      kunit: qemu_configs: Add or1k / openrisc configuration

 scripts/clang-tools/gen_compile_commands.py |  2 ++
 tools/testing/kunit/qemu_configs/or1k.py    | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260427-kunit-or1k-00035c13d70e

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>


