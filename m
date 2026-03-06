Return-Path: <linux-kbuild+bounces-11617-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM2OIosDq2nDZQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11617-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 17:40:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8A1225466
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 17:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F3ED300616A
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Mar 2026 16:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7EB33123D;
	Fri,  6 Mar 2026 16:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcJnLIkQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CAA367F2C;
	Fri,  6 Mar 2026 16:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772814803; cv=none; b=jhHlSfVfe0RnC7DFQEtMdqtJeVDKAOivUj4WZ6iiHQyl1M1o1NiQvDbkvt2xTOuTxSRDjbkprk3PMV0jGlBEMlrw744xp7yQtIrHVEydCu9Auf/cTUNSh3Xh+ADbjgZ38kekoYC+wiRqAtndRM5Oh3sl/YHllE4oAIyBWTYRxwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772814803; c=relaxed/simple;
	bh=5DC8x9M4HvTzU9/g1k76jDOL3YSsKgNelTLy7lmqsMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RKqVRYKXiYxGXk1OaITbd8C0Tr8IgOvMuH191NFp8bbv2lPCgPfKfk+xLVFxIbau4SOH3X0zMDxA5fweVxMCRMHQYWWUSADd+8wA4y3s9BCaqnnHZcDl3XFdA4GBZ+M2SJAKWCrSowSEmYDDFfbpsAWudz/hrY3w+9JD0lGIAEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcJnLIkQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F3CC2BC87;
	Fri,  6 Mar 2026 16:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772814802;
	bh=5DC8x9M4HvTzU9/g1k76jDOL3YSsKgNelTLy7lmqsMU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KcJnLIkQ7Cdo6hVBgWA/5A6k8FbAq4HOHaHHAfyRMGwB0PiVbvF2ChxqccbUe5AQ9
	 P2Y7tmvH1gN8KU4qYDA6IE1hnevfHJkTl/I4JUrDZqKryNteKZS4XOMX5Z/0ArA3Lg
	 RO+/wSON1S/E2Zj2K4mkfs3zWHreVnwclGTbOKp+Dflg5XJoZbM3x9sQ9tJ/wZNHMy
	 OKP2pHDa2ceYaIKKjFszG8QtVOmIB6735OUhOG3gmhHsMv4I7Qp9ZFWCFz3VMm2MsR
	 P9tg854wL5r+8ssUxkCLn6bS2brhvCGp11itUENaPTMGavTzu9KoFdAH6vf9sRgX1F
	 1SCrcDqbv7p8g==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dodji Seketeli <dodji@seketeli.org>,
	John Moon <john@jmoon.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	libabigail@sourceware.org,
	stable@vger.kernel.org
Subject: [PATCH 1/3] check-uapi: link into shared objects
Date: Fri,  6 Mar 2026 17:33:07 +0100
Message-Id: <20260306163309.2015837-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260306163309.2015837-1-arnd@kernel.org>
References: <20260306163309.2015837-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EF8A1225466
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11617-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.984];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arndb.de:email]
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

While testing ABI changes across all architectures, I found that abidiff
sometimes produces nonsensical output. Further debugging identified
missing or broken libelf support for architecture specific relocations
in ET_REL binaries as the source of the problem[1].

Change the script to no longer produce a relocatable object file but
instead create a shared library for each header. This makes abidiff
work for all of the architectures in upstream linux kernels.

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=33869
Cc: stable@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/check-uapi.sh | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/check-uapi.sh b/scripts/check-uapi.sh
index 955581735cb3..9fa45cbdecc2 100755
--- a/scripts/check-uapi.sh
+++ b/scripts/check-uapi.sh
@@ -178,8 +178,11 @@ do_compile() {
 	local -r inc_dir="$1"
 	local -r header="$2"
 	local -r out="$3"
-	printf "int main(void) { return 0; }\n" | \
-		"$CC" -c \
+	printf "int f(void) { return 0; }\n" | \
+		"$CC" \
+		  -shared \
+		  -nostdlib \
+		  -fPIC \
 		  -o "$out" \
 		  -x c \
 		  -O0 \
-- 
2.39.5


