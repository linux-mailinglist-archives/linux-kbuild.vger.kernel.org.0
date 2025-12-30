Return-Path: <linux-kbuild+bounces-10360-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4E5CE8DA7
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 08:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C3083001E01
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 07:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7142F12C3;
	Tue, 30 Dec 2025 07:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="q7rGyAoc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9rZ+Gw0f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0798A23D7DE;
	Tue, 30 Dec 2025 07:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767078575; cv=none; b=NypWSjE+2UIQBC4W5sLgX5wJ8yC0uQNMbEi4p8IwKqMB/kgUgynT+fsf7fudNaFLdqG+TxNw8dg22g5eqXd5+ZXSS1wWIAx7TOiJXh72J7Y31P7XcjCO0FfavwsRqhKO/ChYkfzzHDeT6LU9Z3L9y3nFUxP0HI9mYJ37vpsE4mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767078575; c=relaxed/simple;
	bh=IivRrwJ/QQ1qM9idmiSnDpJrtD51f9wI7sMi5h4F7OU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bbgH9iUSa1BGgCem7oSIYL3gLbLym2bPBCrS66HCsDAVn/n4pHdPMVHnSD881v3esZ/dXZsDafL10X3b41elWWU4R+OibllFxOWIcXT/L1cDsf0Aa8Un4xkqjuqiFByMD/HVyMgA9kKJEz/REDgsQ6ZtxO93cDFeifuOxO4bB9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=q7rGyAoc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9rZ+Gw0f; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767078572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tfg8gdXm6/DfXAg25GDEsNM2qWQ1jPNdTROUtFtGLkY=;
	b=q7rGyAocNyC55P8nBLipy5jQKfZ2W/xH8jnkOWhig3nwwdv3+f8H4fUp+L7TOzvC9rT3Go
	sTI60LHOJdtUKgP/xy1IqveUGg36BkjMEdywqKXVsqDboFhuFWhYnP2CaQGyQ+7on0ivat
	J5hVVRhKP7sSKbCxeM9XZBpChsbqRp+0CiR7+4rklHhJs4A71TSCzxxyC/NqkcvK82DL22
	8LJGwzZnSsgVgyL6DUovKzb2Dlzv5oQBbwQZtD9ZaJlhknaMYRTyczQpRRaWLhr9IduYKZ
	32jxJfsC12OzaaIyIKO3ni1DhTYPHXhiZ0gaXv8s+S8pOpH3H1s7R8dcyaXb8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767078572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tfg8gdXm6/DfXAg25GDEsNM2qWQ1jPNdTROUtFtGLkY=;
	b=9rZ+Gw0fg8EUPW+Cc/a5GSmffgBpytTQGklbfPEtFPrTji0a1j2xtvEs+wVxsRLLfwaAyB
	Llt5imlobHNr5TAw==
Date: Tue, 30 Dec 2025 08:09:29 +0100
Subject: [PATCH] kbuild: uapi: Drop check_config()
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-uapi-check_config-v1-1-00ecec109f39@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAKh6U2kC/x3MQQqAIBBA0avErBtI06iuEhFiYw2BhlIE4d2Tl
 m/x/wuJIlOCsXoh0s2Jgy8QdQV2N34j5LUYZCO1kHLAy5yMdid7LDZ4xxv2xqiW2k73qoPSnZE
 cP/9zmnP+AAKkT3BjAAAA
X-Change-ID: 20251229-uapi-check_config-8aa43e365846
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767078571; l=1307;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=IivRrwJ/QQ1qM9idmiSnDpJrtD51f9wI7sMi5h4F7OU=;
 b=Dw9mhzc/DF7VIrYDGznO51VowWBIhEUltCeSwjBoQAZLmoaTrPgDgaAk5Uk55CTTOlmY3EvWD
 rLgZq5AayU4B4mlm+rJ91nyJ//00BqqAimLraV0RMfS6WHofIkaVAvM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

headers_install.sh already tests for CONFIG symbols. It does so in a
more comprehensive way, by only checking for references in code and
also running even if CONFIG_UAPI_HEADER_TEST is disabled.
And check_config() has been disabled any case.

Drop the pointless check.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 usr/include/headers_check.pl | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.pl
index af5a513eaa00..6cd6eb652c8d 100755
--- a/usr/include/headers_check.pl
+++ b/usr/include/headers_check.pl
@@ -40,7 +40,6 @@ foreach my $file (@files) {
 		&check_include();
 		&check_asm_types();
 		&check_declarations();
-		# Dropped for now. Too much noise &check_config();
 	}
 	close $fh;
 }
@@ -77,13 +76,6 @@ sub check_declarations
 	}
 }
 
-sub check_config
-{
-	if ($line =~ m/[^a-zA-Z0-9_]+CONFIG_([a-zA-Z0-9_]+)[^a-zA-Z0-9_]/) {
-		printf STDERR "$filename:$lineno: leaks CONFIG_$1 to userspace where it is not valid\n";
-	}
-}
-
 my $linux_asm_types;
 sub check_asm_types
 {

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251229-uapi-check_config-8aa43e365846

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


