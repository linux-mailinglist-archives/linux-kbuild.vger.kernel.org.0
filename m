Return-Path: <linux-kbuild+bounces-12351-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDPpHElnymll8gUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12351-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 14:06:33 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0806535ACA9
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 14:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC6AC306B83D
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 11:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4663C945F;
	Mon, 30 Mar 2026 11:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BvzHEY4Z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB84C3C5DCD;
	Mon, 30 Mar 2026 11:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871860; cv=none; b=qEVfw3D+9Ugyd3wCKwSNwMEeH7VyDJrRejC6y3nlYXPbOvwwQKRGJWz7lV/jAzbxXZkUjo0uz+5SNcmEC3/gBJKVa6rX4rI6JP6rD+BMs8HlHTh73PS4gYMTgcsbLrpBoXg7snKQKZ29wGEGZc3B5Urklu9YFjK/iq66wz04Uu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871860; c=relaxed/simple;
	bh=pwAOYYlYk44C+BSWJwNdxQzA5RVn9yau43Y5GbUgPa8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YHaSnnfA/MF6VbOvViqtgIAI9ZsvvBSzZ6Dy9AjkLBCyzKacsDL2JxeLjV4rBg2FYbM3c7XFQbKs0nvPTNvCv4iHUFAXVb+G4nNxF0ELxTZequricQSwQuL4IeqAfafJ+Kt3lzCEa+pgHUa15y/0aodd7KZwVi2lKs2O7zaXfaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BvzHEY4Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460FEC4CEF7;
	Mon, 30 Mar 2026 11:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774871860;
	bh=pwAOYYlYk44C+BSWJwNdxQzA5RVn9yau43Y5GbUgPa8=;
	h=From:To:Cc:Subject:Date:From;
	b=BvzHEY4ZSv7lk5MEROu9psQU72YZrONY0DD+U5Nc9YlvQI8Zx8Nx/46NUWsEVu5QS
	 TayH77I6TGr6/SrkJQPPAite29c6hRxlPiz/YtaJ7kvjwOavC05ACsrtzR3ZJ9FrPE
	 N5Xx7uowfHt8BWz5sVS9LoLO6TuaAemh0rjwSsEEwWeHLvqkgzK0Ymw4ZEIyJlwwnR
	 VJPiUARNW9XEuAH9GmQjyDm36MBg2QVY92gZZLMQtvfCiYr4/kDcGsIwQooJa+Zu0a
	 Q9y1xGx1oPnlcmnOR8Ik6bvroxIHyYEArvC5DX0FmsstIAxk9RR1/6Cpj5qLAzs9QD
	 YSlWwrmFRkE0Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: forbid multiple entries with the same symbol in a choice
Date: Mon, 30 Mar 2026 20:57:35 +0900
Message-ID: <20260330115736.1559962-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12351-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[masahiroy@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0806535ACA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 6a859f1a19d1 ("powerpc: unify two CONFIG_POWERPC64_CPU entries
in the same choice block") removed the only occurrence of this tricky
use case.

Disallow this pattern in choice_check_sanity() and revert commit
4d46b5b623e0 ("kconfig: fix infinite loop in sym_calc_choice()").

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/parser.y | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 6d1bbee38f5d..5fb6f07b6ad2 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -159,14 +159,8 @@ config_stmt: config_entry_start config_option_list
 			yynerrs++;
 		}
 
-		/*
-		 * If the same symbol appears twice in a choice block, the list
-		 * node would be added twice, leading to a broken linked list.
-		 * list_empty() ensures that this symbol has not yet added.
-		 */
-		if (list_empty(&current_entry->sym->choice_link))
-			list_add_tail(&current_entry->sym->choice_link,
-				      &current_choice->choice_members);
+		list_add_tail(&current_entry->sym->choice_link,
+			      &current_choice->choice_members);
 	}
 
 	printd(DEBUG_PARSE, "%s:%d:endconfig\n", cur_filename, cur_lineno);
@@ -546,11 +540,10 @@ static int choice_check_sanity(const struct menu *menu)
 			ret = -1;
 		}
 
-		if (prop->menu != menu && prop->type == P_PROMPT &&
-		    prop->menu->parent != menu->parent) {
+		if (prop->menu != menu && prop->type == P_PROMPT) {
 			fprintf(stderr, "%s:%d: error: %s",
 				prop->filename, prop->lineno,
-				"choice value has a prompt outside its choice group\n");
+				"choice value must not have a prompt in another entry\n");
 			ret = -1;
 		}
 	}
-- 
2.43.0


