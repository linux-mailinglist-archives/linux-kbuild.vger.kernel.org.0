Return-Path: <linux-kbuild+bounces-6118-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 061EFA5F0DB
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 11:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07DA93B8E4F
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 10:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE70265CB3;
	Thu, 13 Mar 2025 10:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q7yMcPVA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32E326563B;
	Thu, 13 Mar 2025 10:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861568; cv=none; b=Dk7axlR2EsnRF/iAWcZPFLKG49HBW4e35IevicLFeNsUo9db5LxLHSpCYj49C7lT0YQyG5SHi1ciOL/EGcA7w13e3cAWazGael/5wbkMxFKBp8fZX9S2DDF1uHEYUHTbMu1U1YpIJ80YlgNhLru2s9EItAXo3Ij03EtL6rNVJ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861568; c=relaxed/simple;
	bh=U9PzbgMPPCEo8rkenjE4N5/boHVyql7FIvHZpkB76hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DK9NRPq9boQz1CG524WRzezG2XycGm9xwK5g8G6Ac+Ant4K2DZtVsV1+068+XMwgPfrbSbNBI+cujwpL74S5hx61PL0oE3InDiWO77UKyZWfT9hx0ieWltRnSD478HmrDASw9k1ezwXnoEJ0Mfkpn1S+o5/d22su+JtOV6tiu9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q7yMcPVA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06369C4CEDD;
	Thu, 13 Mar 2025 10:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741861568;
	bh=U9PzbgMPPCEo8rkenjE4N5/boHVyql7FIvHZpkB76hQ=;
	h=From:To:Cc:Subject:Date:From;
	b=q7yMcPVA3gevjbMqh7NOsnmw3MSTQajo42b4EemVYqHyUUdDVR+KOhzFgtVT9C4tW
	 X1KM9GEp4Vyq+TgrIjxgvC8JeqId0Q1bUPedL/00+bfKV1mHYkVxLPQCKCItObLUKK
	 gpwJMCL9xF4h4V1137CiHb2Ufmw6QILY+7aQlxGJaWsTrTn3lTvk6cfY/tu/L/2YO4
	 TXx4hBEVokprfstXAJ77pELFLrhmOak55zzjZwWQ0/e/hlV1axKOEF8CHmzw+Kjhgp
	 7xFH5hFz43+f0KtxOVsjXmCJrgmrLHTAXlc2RUFgzA00e/ZrcEA6jBwlG6AFkZJd/C
	 A9whG6JkwHEGw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb+git@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: do not generate .tmp_vmlinux*.map when CONFIG_VMLINUX_MAP=y
Date: Thu, 13 Mar 2025 19:26:03 +0900
Message-ID: <20250313102604.1491732-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 5cc124720461 ("kbuild: add CONFIG_VMLINUX_MAP expert option")
mentioned that "the .map file can be rather large (several MB), and
that's a waste of space when one isn't interested in these things."

If that is the case, generating map files for the intermediate
tmp_vmlinux* files is also a waste of space. It is unlikely that
anyone would be interested in the .tmp_vmlinux.map* files.

This commit stops passing the -Map= option when linking the .tmp_vmlinux*
intermediates.

I also hard-coded the file name 'vmlinux.map' instead of ${output}.map
because a later commit will introduce vmlinux.unstripped but I want to
keep the name of the map file.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/link-vmlinux.sh | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index e55026128e05..7cbbfa3efbca 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -98,8 +98,8 @@ vmlinux_link()
 		ldflags="${ldflags} ${wl}--strip-debug"
 	fi
 
-	if is_enabled CONFIG_VMLINUX_MAP; then
-		ldflags="${ldflags} ${wl}-Map=${output}.map"
+	if [ -n "${generate_map}" ];  then
+		ldflags="${ldflags} ${wl}-Map=vmlinux.map"
 	fi
 
 	${ld} ${ldflags} -o ${output}					\
@@ -211,6 +211,7 @@ fi
 btf_vmlinux_bin_o=
 kallsymso=
 strip_debug=
+generate_map=
 
 if is_enabled CONFIG_KALLSYMS; then
 	true > .tmp_vmlinux0.syms
@@ -279,6 +280,10 @@ fi
 
 strip_debug=
 
+if is_enabled CONFIG_VMLINUX_MAP; then
+	generate_map=1
+fi
+
 vmlinux_link "${VMLINUX}"
 
 # fill in BTF IDs
-- 
2.43.0


