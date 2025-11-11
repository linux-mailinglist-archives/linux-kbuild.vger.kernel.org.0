Return-Path: <linux-kbuild+bounces-9566-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9BDC4E173
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 14:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6D5E3AA32B
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 13:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78DA331219;
	Tue, 11 Nov 2025 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L7mSBt2N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p7tUeJYt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L7mSBt2N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p7tUeJYt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2047D33AD84
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 13:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762867272; cv=none; b=h9J4Oqw84y5YT3nSCr1QuMhxAqV2wBcwktCPlC/dhDQXhkCh9dc/x/ljHBe4U9D12ydOkyRoYH1y6bGP/6TNFoDO/XAMOnShg60vXbwk4OV0Bz2A9Y6LrbxrvPuvzh79mZR5PI2WSx59bfNoF0rcgXlKy4y2zGOkiIlh+QIExGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762867272; c=relaxed/simple;
	bh=OAhGI+/FknV6qmyLqBpbzLmqIrTwwj6PvfyDhDcOMAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k38P4E+9MyW1ewJFgxEJygIJU2GPVql+WfGAfGPMJzrgUoo98KBdfSF0LTlvvuwr1GEgoWX7JfC32H6FX2GyjAT1bAMpnUrQjLwkL74ikvs92NasOIjTp3T5PJl4gM3wnSMVjxz3suPBDpPW4Uekq0o1y94HfuXwSrEjWem5m4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L7mSBt2N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p7tUeJYt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L7mSBt2N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p7tUeJYt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 57DA41F7A6;
	Tue, 11 Nov 2025 13:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762867269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NogFP4N0MLshdtNi5nInjdei5wUj8X5EVrXp4B1Ig1I=;
	b=L7mSBt2NtW4lKf7FsKMNQ6+ZS9xOhXGJbBrb6hV19IYf8HNYspmUMXfkc7vOgzozG23OvA
	1e9aAkRVEcJawgYwgMwQABQWRprKx+WKwcChKnZdmG6Bsq65o20A48B3Ik7hHd7sSVhh/B
	wFbAMUp9Kq023LOB1ipqQ8hpjMQQ8ec=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762867269;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NogFP4N0MLshdtNi5nInjdei5wUj8X5EVrXp4B1Ig1I=;
	b=p7tUeJYtBK1svCqq9ElxW1IhEoW4zdhyECuYf/PD9Qo0Mi5KoFMDbd+OGDjV44oLRd6Ulx
	LNhQZWYrc3qV7KBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=L7mSBt2N;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=p7tUeJYt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762867269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NogFP4N0MLshdtNi5nInjdei5wUj8X5EVrXp4B1Ig1I=;
	b=L7mSBt2NtW4lKf7FsKMNQ6+ZS9xOhXGJbBrb6hV19IYf8HNYspmUMXfkc7vOgzozG23OvA
	1e9aAkRVEcJawgYwgMwQABQWRprKx+WKwcChKnZdmG6Bsq65o20A48B3Ik7hHd7sSVhh/B
	wFbAMUp9Kq023LOB1ipqQ8hpjMQQ8ec=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762867269;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NogFP4N0MLshdtNi5nInjdei5wUj8X5EVrXp4B1Ig1I=;
	b=p7tUeJYtBK1svCqq9ElxW1IhEoW4zdhyECuYf/PD9Qo0Mi5KoFMDbd+OGDjV44oLRd6Ulx
	LNhQZWYrc3qV7KBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 36CFB14994;
	Tue, 11 Nov 2025 13:21:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qAxKOEM4E2lpWAAAD6G6ig
	(envelope-from <ddiss@suse.de>); Tue, 11 Nov 2025 13:21:07 +0000
From: David Disseldorp <ddiss@suse.de>
To: linux-kbuild@vger.kernel.org
Cc: David Disseldorp <ddiss@suse.de>
Subject: [RFC PATCH 2/3] scripts: headers_install: filter ignored configs via sed
Date: Wed, 12 Nov 2025 00:16:21 +1100
Message-ID: <20251111132021.22809-3-ddiss@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251111132021.22809-1-ddiss@suse.de>
References: <20251111132021.22809-1-ddiss@suse.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 57DA41F7A6
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Spam-Score: -3.01

The sed script currently prints any CONFIG_ entries carried in installed
headers. A subsequent shell script parses this output to check whether
the found CONFIG_ values should be ignored or not.

Drop the unnecessary sed output post-processing and instead skip over
ignored CONFIG_ values as part of initial processing.

Signed-off-by: David Disseldorp <ddiss@suse.de>
---
 scripts/headers_install.sh | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index d64b01806a05e..f46e91aa416cf 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -54,11 +54,16 @@ arch/x86/include/uapi/asm/auxvec.h:CONFIG_IA32_EMULATION
 arch/x86/include/uapi/asm/auxvec.h:CONFIG_X86_64
 "
 
+# generate sed regex to filter out ignored configs.
+# A subsequent 't' branches if any of these filters match.
+sed_filter_ignores=$(echo "$config_leak_ignores" \
+	| sed -ne "s@$INFILE:\(.*\)"'@\ts:^\1\\n::@p')
+
 scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE
 [ $? -gt 1 ] && exit 1
 
 # Remove /* ... */ style comments, and find CONFIG_ references in code
-configs=$(sed -e '
+sed -e '
 :comment
 	s:/\*[^*][^*]*:/*:
 	s:/\*\*\**\([^/]\):/*\1:
@@ -68,9 +73,12 @@ configs=$(sed -e '
 	/\/\*/! b check
 	N
 	b comment
-:print
+:print'"
+	$sed_filter_ignores
+	t check
+	s@^\(.*\)\n.*@error: $INFILE leak \1 to user-space@
 	P
-	D
+	Q2"'
 :check
 	s:^\(CONFIG_[[:alnum:]_]*\):\1\n:
 	t print
@@ -78,25 +86,7 @@ configs=$(sed -e '
 	s:^[^[:alnum:]_][^[:alnum:]_]*::
 	t check
 	d
-' $OUTFILE)
-
-for c in $configs
-do
-	leak_error=1
-
-	for ignore in $config_leak_ignores
-	do
-		if echo "$INFILE:$c" | grep -q "$ignore$"; then
-			leak_error=
-			break
-		fi
-	done
-
-	if [ "$leak_error" = 1 ]; then
-		echo "error: $INFILE: leak $c to user-space" >&2
-		exit 1
-	fi
-done
+' $OUTFILE >&2 || exit 1
 
 rm -f $TMPFILE
 trap - EXIT
-- 
2.51.0


