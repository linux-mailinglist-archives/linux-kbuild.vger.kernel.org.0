Return-Path: <linux-kbuild+bounces-2139-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EB7909E9A
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2024 18:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14CCFB20DAB
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2024 16:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBD71A270;
	Sun, 16 Jun 2024 16:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="TSXwG67Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAFE19BA6;
	Sun, 16 Jun 2024 16:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718555849; cv=none; b=cGMBrnF7Wg5HTlxsU450O49yhbG/LhBB5+jAe2WhEqlqlG2UFFb9Okr6Oth6BSRZ1V3X7s4+xNtWne/BziMs4Xe6vJGTR8j0owq8B8BxodHJWfY3IwfSOStiJQCt2WGtVw+L1v+6/Pbvk+C/fUFS31wwP5ZW1FSqKlr0IvyHvsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718555849; c=relaxed/simple;
	bh=AwVkDuQzZRSjmlMS1BoWAGxIs06SAqkrKfj1uZ6bm2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=igIz1LA8B80douTgMjdLR7wZS6iIqcwssOW6QdJMFAIwn92zgXJojAi3b1yLuU4/6x6eW6VviVavRpNk/ccwNatF33recDhCcFquTyiR+W73l59xI1rE92gRXRw9xaOztq8TvIQiFnTdiLnKpGDTkkKKodUemJsH3rsV7Hzpjaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=TSXwG67Q; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vMpGn0Tpn3IT+pFmW7abtHypd6xW4/5RdZSSzQaz50E=; b=TSXwG67Qn3MbHJBzV7CZto5XwZ
	yRLKADRfOGBhxfoY48dWqt1yq6cJsoFZGV0Z4ZPiVp+/q5BPTdVdcmF6/Ormb2gqk8zQ8I/ZBJcRj
	sa3e7U9YDehbu627TDQKNiyd6bIByzGJ0Zk/jz1q7x5AAJnrW59PesfWrpbxBaT7X/WxX6A53ObnX
	5n7FtNS595TBWPB7vk/aLHEcnjIPdM+MInkfBLQucU98h+gWNym6o0xJ3BnZv1ARz6AaYOmyAq8gB
	qkmDfT7PHcoJQkHq4CZvZbZAXMAGKYTENWPIYKUbnjm67S/rS9Wu4OlkzqzJ1IyJW46zdnsa118C5
	n22+hrMg==;
Received: from [2001:9e8:9e2:3f01:3235:adff:fed0:37e6] (port=40286 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sIssY-009A4w-Ob;
	Sun, 16 Jun 2024 18:37:19 +0200
Date: Sun, 16 Jun 2024 18:37:16 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: deb-pkg: Explicitly define optional user-defined
 variables
Message-ID: <20240616-sensible-celadon-hog-0b0dea@lindesnes>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

mkdebian supports some optional environment variables for controlling
the Debian package generation.  Declare those variables explicitly to
allow enabling of 'set -u' (error on unset variables).

Use of ': "${VAR:=}"' for variable assignment is POSIX compatible [1].

[1]: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#colon

Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
---
 scripts/package/mkdebian | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 070149c985fe..81e81906ad07 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -6,6 +6,18 @@
 
 set -e
 
+# Optional user-specified environment variables
+
+# Set target Debian architecture (skip auto-detection)
+: "${KBUILD_DEBARCH:=}"
+
+# Set target Debian distribution (skipping auto-detection)
+: "${KDEB_CHANGELOG_DIST:=}"
+
+# Overwrite the automatically determined package version.
+: "${KDEB_PKGVERSION:=}"
+
+
 is_enabled() {
 	grep -q "^$1=y" include/config/auto.conf
 }
-- 
2.39.2


-- 
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
↳ gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --

