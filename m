Return-Path: <linux-kbuild+bounces-4968-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0A99E1FFD
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 15:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BEDCB36CBB
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 14:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38ACA1EF08A;
	Tue,  3 Dec 2024 14:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YvNAmp7n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEFA1E3DDE;
	Tue,  3 Dec 2024 14:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234487; cv=none; b=CF8HkMvyLegGz1hSU9m+FRr0Ohh+6o5wX8x0p3pmLB0LWwnsUCqMCIXlNOwrJ59/LD8l8rxawC2xOldvYCumA2zVtAISd4QnckJSDekogFrRmWo4mJER+YP0lYEl3G7x17/hcO7bVmJeFZJmsGGSQytSUsRCy07bhC2qYpze9To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234487; c=relaxed/simple;
	bh=yUrPNA5MtLOOQlZ09c4Dst/923u0dNM7GcsApgelThQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KuO3ZEQXadUDZF55H5LaP2aF/JxJ1nYdfed9avPnqwjygPK9MjK5VLvgLJoCoL3h2rzdNYQmyiYCPf057FmZS3G1XxwGREqh3LdQrE4MIsyMLNrax7rarxPJElMgFOdm3LwCTiW1Io/OHlaQiES7q0I1a/RScleZQZOx8dmjImw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YvNAmp7n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97540C4CECF;
	Tue,  3 Dec 2024 14:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733234485;
	bh=yUrPNA5MtLOOQlZ09c4Dst/923u0dNM7GcsApgelThQ=;
	h=From:To:Cc:Subject:Date:From;
	b=YvNAmp7nwhva4HXw9yltQw4dyGtU4u7kyK23HoysbNnaoXuJbw6aHFWAlwIN5OxCb
	 haIZyC061UtRYSdvIb4vtlbjvw0iU+0pNJmz4eVlt3hFab6IOls5b8X4wJ3NHvcTUD
	 ydP37MpuV6UhWnpQ5flevXwF4zUTrSSToBPoGFc7ejmPNobYeE3nsB4JBGqc0+0ZGB
	 Z9qdWPrv+EIfeg8vlR0lMedx9E71iHlkhHQ/CTxRxHiwx2dM9Cca41MVUpNr3DJytL
	 cNaFc39/oKpsLxsFJJsYqGeEL6zkmBDMzO6jyA+uQtHhD2aegQhgnm7VqQvvsakuwr
	 jrYbjqbnXL3tw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: deb-pkg: do not include empty hook directories
Date: Tue,  3 Dec 2024 22:59:58 +0900
Message-ID: <20241203140108.3401773-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The linux-image package currently includes empty hook directories
(/etc/kernel/{pre,post}{inst,rm}.d/ by default).

These directories were perhaps intended as a fail-safe in case no
hook scripts exist there.

However, they are unnecessary because the run-parts command is already
guarded by the following check:

    test -d ${debhookdir}/${script}.d && run-parts ...

The only difference is that the run-parts command either runs for empty
directories (resulting in a no-op) or is skipped entirely.

The maintainer scripts will succeed without these dummy directories.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/builddeb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index fb686fd3266f..e823742e17c4 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -70,8 +70,6 @@ install_linux_image () {
 	# so do we; recent versions of dracut and initramfs-tools will obey this.
 	debhookdir=${KDEB_HOOKDIR:-/etc/kernel}
 	for script in postinst postrm preinst prerm; do
-		mkdir -p "${pdir}${debhookdir}/${script}.d"
-
 		mkdir -p "${pdir}/DEBIAN"
 		cat <<-EOF > "${pdir}/DEBIAN/${script}"
 		#!/bin/sh
-- 
2.43.0


