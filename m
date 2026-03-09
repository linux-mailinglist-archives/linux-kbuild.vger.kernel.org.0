Return-Path: <linux-kbuild+bounces-11692-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBnoD3N9rmlGFQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11692-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 08:57:39 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 978DF2351FC
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 08:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 445A230056C6
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 07:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8011F36896D;
	Mon,  9 Mar 2026 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAIpuPAy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5F73644C5;
	Mon,  9 Mar 2026 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043004; cv=none; b=OoAybckeg6o7WD8Bx1htjONOGxYvZgOlVtVDedfbyziFfTv6gnefJYYBN5VeUjydzTNuUNtBEL66FTkhazIIgGXhuw89Vbx6nerSxiE+3n7BohRgt3Gt0gGgAyg1dSL2Zv+AJvFHs4vcJJg+UEQAwR1r5Ka5wuVOwIM4cmIoCaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043004; c=relaxed/simple;
	bh=oxiQm3ysSjB86HMugJmEV+Zbw1IEqAlst55ORUBqRjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hHOHYbq66Jm03Q3yhP/49lVG4e3HSc79EuzE4T+jG5hc1Z93MQYbgHLCikK+Y04OydAurcdkxlDcUNCo6kkaW34J18lVom60wAX83GEm3UhZgBsDRqV840xSJ//IC5uWXhbMYoQPm9LaF+FQ0UrxEqz/DKH3lafDv5KFf1Gqkuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAIpuPAy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA84BC4CEF7;
	Mon,  9 Mar 2026 07:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773043003;
	bh=oxiQm3ysSjB86HMugJmEV+Zbw1IEqAlst55ORUBqRjM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GAIpuPAy/NrjX2GFj6cGB+KcsudSWCgms0x7go69KWek7dZCWcbAC7bKBLDWRpgzr
	 MjedT5/CaFvJ108aXhZ/A+fPyHXUjyLxXRZBD6lVbsIU98V538YDw4t1XF7Fz6eJ+A
	 qrFKk0GNyGJULKClAjOEyw9KwKVu5eQcyAHDEkBEkv2uWZehS1NWCBu64lVNinLIya
	 Ry8ghlTX8SqBJYm6/ZF3VK2WMfrXGRM9ASTpBKqnYVJdQ7j08YDQpTyopJUDrcurAd
	 rbZPb/rCEy7qXuqEEsAxBYHFRni9nclFBczXxZKhKjiiufAPwG3RGyV68IsGnKD4Tk
	 IjKgSCINrgpTg==
From: Nicolas Schier <nsc@kernel.org>
Date: Mon, 09 Mar 2026 08:56:29 +0100
Subject: [PATCH 1/2] kbuild: Mark usr_gen_init_cpio as no-dot-config-target
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-move-gen_init_cpio-to-scripts-v1-1-0c5059b1ec5b@kernel.org>
References: <20260309-move-gen_init_cpio-to-scripts-v1-0-0c5059b1ec5b@kernel.org>
In-Reply-To: <20260309-move-gen_init_cpio-to-scripts-v1-0-0c5059b1ec5b@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Askar Safin <safinaskar@gmail.com>
X-Mailer: b4 0.15-dev-363b9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=oxiQm3ysSjB86HMugJmEV+Zbw1IEqAlst55ORUBqRjM=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBprn0zpDPjQqrNcMa7i8agXD/UCtmCyUynDRiq2
 mEeF/AB8w6JAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCaa59MwAKCRAHUgpwFiYS
 aZgED/0VQRcVtY9kLjf5KspmCrBdDAsBAM9it12R3PcHgs4DeCVYdBJUO8qP7OTtOlK3nq9wxzu
 ywPZHYY/W0p6B/SYnfHbkWS0+DkEsOTBkELuTm55mYXcZ85Af6/eFrT4UGh63oCWkR6FuwquxRN
 A5AFKJHhsifPZiRDFnKX0eb/wFMH34aRSR1Z5FYlYZ671z6BQZov+2Rdn6cuDp0bKreBqJY2aT1
 gXCB9Uu1QE8+G3gPfPQD++wLMw7J5kKzpxVU0tKfDjEgMUI0J+y049I5wTKnhUjGNzU/pzNpSRK
 /OMu0WFuZ1F/lv+B7/s7nx6UlfVy5E4sMpHbOXfyGkx/pKto5cj6ki3bvMuq+omKmjHNB1nBumF
 7AH7VZPpiRXJV8QIgCxaJurN81Lle3taOAvNAS0R2zyo6g6JWB4OnHAUIC3pcZiTWYQ/uhJpJ7W
 pY2ghYia9vLMGwuMFzCC0hkektn4pOYc+RTTnVuF4M9ORQtW6cg1un2LGW5RCStHPLCOvoKA4E5
 NtJyRxl4iIixWUEYiEvKpIT95JGceBZlb1H9gvceKoCV/jCYN9wiXVdDUnFM2HYO57l0iLnCkjE
 hshSFjMZoRT2WMVh3MFpnbieFbDm40BPwIDi0OGDGzeOBTWSwXUMoNdhc/pXPFR6vZx3NhLBbYn
 kvoZ6kYn5uhacHA==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
X-Rspamd-Queue-Id: 978DF2351FC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11692-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Let usr/gen_init_cpio be built also if there is no kernel configuration.

Askar Safin reported that gen_init_cpio may be of use before any kernel
configuration is available.  Add usr_gen_init_cpio to list of targets
that do not require a .config file.

Reported-by: Askar Safin <safinaskar@gmail.com>
Closes: https://lore.kernel.org/all/20260220191150.244006-1-safinaskar@gmail.com
Fixes: f8e05c10631e ("kbuild: Add top-level target for building gen_init_cpio")
Signed-off-by: Nicolas Schier <nsc@kernel.org>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index e944c6e71e81..0e788ce45457 100644
--- a/Makefile
+++ b/Makefile
@@ -296,6 +296,7 @@ no-dot-config-targets := $(clean-targets) \
 			 $(version_h) headers headers_% archheaders archscripts \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
 			 outputmakefile rustavailable rustfmt rustfmtcheck \
+			 usr_gen_init_cpio \
 			 run-command
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
 			  image_name

-- 
2.51.0


