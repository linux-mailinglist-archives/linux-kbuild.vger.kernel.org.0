Return-Path: <linux-kbuild+bounces-11771-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFmzKpkGsGlregIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11771-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 12:55:05 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CEB24BC18
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 12:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D8121303AFE0
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 11:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7755738910E;
	Tue, 10 Mar 2026 11:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNzlY0PR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FE63876AA;
	Tue, 10 Mar 2026 11:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142634; cv=none; b=trDHdOTDtN3myzhwlkD+TZ7mZ61yZB/Yy4pUzXpcgA1nEncO/9MR30XB/9Jcf0ucsZrIHyezrJZ3RTvHXzO0qvNwb9YIRPOKjGPGKEWGvEASdmmaWZQll6fXurnAuQWtyMr3+3S4frh5wCK1J4oE4O3kYtfTXXjIOAWMVQA71Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142634; c=relaxed/simple;
	bh=0bj5d9f6ym9FJ+OReOB54vFmb0AkNLiq2D2tBlOvEwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tMIvciBtBcQ+yHzcrHMcKvFzE2CPVirVres/V2MUnkylAcwx8/HsZUSeN81qLEUuSu1vM0mdFqjWfcIrO3sUstYZZBYyX1nPLQHZTvXhJXgmol7wJqWSrOiA+PiINtM6YQTLdGlAk7TrNU7KiQjOvCPMSCzQs9CM0krcNH/LK/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNzlY0PR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BDAC2BC86;
	Tue, 10 Mar 2026 11:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773142634;
	bh=0bj5d9f6ym9FJ+OReOB54vFmb0AkNLiq2D2tBlOvEwk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kNzlY0PRK+dkPvh3y+g/Dr1+Kh2jUWlrJ86kOKKX4KXvOJzH/GHSkQV9BG1mNJfpB
	 XhIt2iZQWZVnIXgzLnLayy3xRXTQVshk5WakbRR9uZwNMm3DGUwA3EcqQFBxRgM/6y
	 eMr62+M6lael8/pxQNLZJus3XU5ujfQgXAAidELK9MM2pqB6HuH958w8smx5cLjKPU
	 bm/oyGubmPhqVpdiewNYG/4W5CMZobV66Pd04WX953Q6e76QsTSSehwprhkcNDhKuw
	 //WEpG17FEczWRpy4bX8v+7cwXwWu9/GzKSxx/1xH7smH1LpcnJnNoQH8+bXaCy7lx
	 iOSehKoMRapnw==
From: Daniel Gomez <da.gomez@kernel.org>
Date: Tue, 10 Mar 2026 12:36:24 +0100
Subject: [PATCH 2/3] scripts: kconfig: merge_config.sh: fix indentation
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-fixes-merge-config-v1-2-beaeeaded6bd@samsung.com>
References: <20260310-fixes-merge-config-v1-0-beaeeaded6bd@samsung.com>
In-Reply-To: <20260310-fixes-merge-config-v1-0-beaeeaded6bd@samsung.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Anders Roxell <anders.roxell@linaro.org>, 
 Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005; i=da.gomez@samsung.com;
 h=from:subject:message-id; bh=d5vITWBHq6v9qCIXJuZ30MqhqknOFbXBTslC4NVtlyc=;
 b=owEBbQKS/ZANAwAIAUCeo8QfGVH7AcsmYgBpsAJhaQRn76KhPBrrai3CoYFnwfwcl6O/QSgNq
 ZW683PfIuWJAjMEAAEIAB0WIQTvdRrhHw9z4bnGPFNAnqPEHxlR+wUCabACYQAKCRBAnqPEHxlR
 +5cVEACA/gfduascW8mWJW0ktK8ASwKZlRzE3LrQ6937Xs398fhyUhj2Nb1SdT7E5E0b3PuJ0AR
 xj51BdCvw0ryTi2DQj2wURoGAVtS5gt/yNncg0oy4tXG4U64yrXMziW19REROUCVXqU9k3LUfOR
 iyrhblTOSlvdQaxYo8Y00ukj5JIyBAOIuz6O0UY96/fTiTm1SmkLErzQ9FvTJmKdzu0s0zCXk6/
 3NGUXt9dPjPwNK8ga1QzAZSHolbiBfoHkBw7kIAecPwIh6BCrP9SUlXjj5GSe2DORsrW2Hx3AvI
 3+gZ+PpW98OXM7NdsucsTG0MhjgA0T4i5WG0qozPVLUsSwWKKoEqCFO2Hi5GmcD4BfVfHz7h3If
 CuQXg2RHUZvbdrGarJT8hZ+pgRD1P6L9UFuT/5y3KVzXJ6VHeW02ynmUioHy9Md0Gjzg4h3Qxv/
 lgcieGeBowy1x2MU4XKBlwZuPsLNmfbTj0Xpi7m8cnvWl25/gCIZFkqxaV9MlWgWHvvPGjbJl6T
 /ceXOzVTPJ6EUANR03wdBNQJzjZZjKha9f5ZS2n+WixmINamlOlOsg/h4l3uqW+hdal+1PeGeg2
 ygsY3rpPtF59UjZipuOmfvqPeJ3WIXIyrGM+gEVkteejiyF9uI0I7RR9I4eqHXosajUAyJFNDxP
 gWZf63HJeQHc0mw==
X-Developer-Key: i=da.gomez@samsung.com; a=openpgp;
 fpr=B2A7A9CFDD03B540FF58B27185F56EA4E9E8138F
X-Rspamd-Queue-Id: C6CEB24BC18
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11771-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[da.gomez@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Daniel Gomez <da.gomez@samsung.com>

Replace spaces with tabs for consistency with the rest of the script.

Fixes: 5fa9b82cbcfc5 ("scripts: kconfig: merge_config.sh: refactor from shell/sed/grep to awk")

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 scripts/kconfig/merge_config.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 5177bde69c1d..95f090b88e8d 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -196,7 +196,7 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 
 	# First pass: read merge file, store all lines and index
 	FILENAME == ARGV[1] {
-	        mergefile = FILENAME
+		mergefile = FILENAME
 		merge_lines[FNR] = $0
 		merge_total = FNR
 		cfg = get_cfg($0)
@@ -217,7 +217,7 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 			next
 		}
 
-	        prev_val = $0
+		prev_val = $0
 		new_val = merge_cfg[cfg]
 
 		# BUILTIN: do not demote y to m

-- 
2.53.0


