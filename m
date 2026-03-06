Return-Path: <linux-kbuild+bounces-11619-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG7OBuQBq2msZQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11619-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 17:33:40 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F00224F65
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 17:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C61730379FC
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Mar 2026 16:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15743E716A;
	Fri,  6 Mar 2026 16:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UL2TgpIJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15143ACF0C
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Mar 2026 16:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772814807; cv=none; b=c+DeH8z7ZaZX6suQb95k8tKUNh0jOo64yzqHsevE/ZhXKzs4CpUY8UgYONC7E+Bw3qrasM81EZay6E+7kqzGfkXltaZp6kxjFp37dJhG0e1mYUQxtbaBI5PvcPGDay8ZsBV5k8GW7IHptf8X6xufY2GdmjU2WSCfHuIfleHkjGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772814807; c=relaxed/simple;
	bh=OsGIverTqbfLboR3Rb0dxLX69WlmezNlUPs+M/gaqTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VEdQbWS1k4AabK2zVpnD4Y54QDf4RGFwcuzUUah7TdsdeFAnms+uaT+PtlFmTgwmCT8rTg6zKU7dLnm0c6c0Cozjl1iyCnqhMv5coC69DmZkI9oRHJOnWr0Tn8VKcQjcJqwavXLp5r1yT4Dh0fcfDLowkMk9eZh1tvg7Fyp0DyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UL2TgpIJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761D9C2BC86;
	Fri,  6 Mar 2026 16:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772814807;
	bh=OsGIverTqbfLboR3Rb0dxLX69WlmezNlUPs+M/gaqTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UL2TgpIJCnuAHQ2ATmAKjs+sBFvYX+X8n86mKjtYnYnJPFh6OK3vVgeE4ZxwRyKjM
	 hBU0hEd4MW82Rq2W9VhJrRwg82zkBkVwc7dsGL6Alhvd7LDvJ5XX1+T8crZF7s2cF/
	 SZMdjOOzrb2tI9rTm+uMkh8LgXklFn0YLkYZV0pxH1lwAsm+zq438rUIewc9LtHJe9
	 ADpaYdrNqr7/Z3iPIct21lJocC2xRJ9dT/T/XSozo6UNxWudL8hDI/jvgVdpIYLQgR
	 jfFK6kmx0krFoXTJjKnz3Y4Tz5DUp81qYcNhkGSg/aGjRsPkBU1h0as58C4jksnwnj
	 nozB/jCav55PA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dodji Seketeli <dodji@seketeli.org>,
	John Moon <john@jmoon.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	libabigail@sourceware.org
Subject: [PATCH 3/3] check-uapi: use dummy libc includes
Date: Fri,  6 Mar 2026 17:33:09 +0100
Message-Id: <20260306163309.2015837-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260306163309.2015837-1-arnd@kernel.org>
References: <20260306163309.2015837-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C0F00224F65
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11619-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.934];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

Based on Thomas Weißschuh's series to kernel headers to no longer require
an installed libc when build testing the uapi headers, the same can now
be done for the scripts/check-uapi.sh script.

The only required change here is to add the  usr/dummy-include include
path.

Link: https://lore.kernel.org/lkml/20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net/ [1]
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/check-uapi.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/check-uapi.sh b/scripts/check-uapi.sh
index e4d120eb09e3..c8beec58871c 100755
--- a/scripts/check-uapi.sh
+++ b/scripts/check-uapi.sh
@@ -191,6 +191,7 @@ do_compile() {
 		  -fno-eliminate-unused-debug-types \
 		  -g \
 		  "-I${inc_dir}" \
+		  "-Iusr/dummy-include" \
 		  -include "$header" \
 		  -
 }
-- 
2.39.5


