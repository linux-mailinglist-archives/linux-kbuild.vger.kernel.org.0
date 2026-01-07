Return-Path: <linux-kbuild+bounces-10441-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AF9D000FB
	for <lists+linux-kbuild@lfdr.de>; Wed, 07 Jan 2026 21:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D9543015E00
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jan 2026 20:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F4A23C8A0;
	Wed,  7 Jan 2026 20:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YCbVRpvQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jocM9Wfg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zmfgSLgq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D4mkYat2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8401A317D
	for <linux-kbuild@vger.kernel.org>; Wed,  7 Jan 2026 20:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767819175; cv=none; b=FtbWxkvzNLgxVms3eKIoBgC9zvv7x6uNznZelazla6dremVrJP/LW8NNbixlZd3/m6MU/mrgRGyaP4Spuf1VJ6BD9Xwlj7Ha4R90HlIAO1rot7zvaz/1Lq2X/SBWbzhfriL333Wuxeryqtk5PWva8G8bzciAt7i2pVJMry8f3j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767819175; c=relaxed/simple;
	bh=j3cNhFmqU3QQq70kN7d/403Uemxv6oAv6T+Z+CM968w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OtY8SoWOGh9MGSlRLiETwBzao+4UKXjIUz9hqPABK3MG4oJeR2TxHGwbe/gUvMmMYKhYyf7IbDAT5bbP4yvq4mmnTFPIRLIpUh8TqIA7AjawEeG1Bv1EzjmN+hZ+PPVF8z4p3s2WT1ZSH7Z3sO97OOC7Xk9sQ6Nv9GIU1Wo8AY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YCbVRpvQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jocM9Wfg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zmfgSLgq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=D4mkYat2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 439605C322;
	Wed,  7 Jan 2026 20:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767819171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R2ipmyBGpChtc5I5NV+pnWZmAPSU6N3RypPEq+myQW4=;
	b=YCbVRpvQGEI0yjVPik2ojbyD5Aldftn93/FErTx2XGOJescfRZ/Jpv6H+UxBTpfwCbf+IY
	huA0INkv6B5ifOqA7WylUizrSH432jWUkDFURtMuNEiAy6MD4o3AejbzBxqEq7Yc6LUMeE
	QfZFjGSZqJWcGvBw933HZHY2fpNkjDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767819171;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R2ipmyBGpChtc5I5NV+pnWZmAPSU6N3RypPEq+myQW4=;
	b=jocM9WfgPffz54zEfD5JSc1q8w5cS1TYiZmqywVXY18biyyJrKQ2+5b+88z2oOdDsYs0mQ
	ssaVp6eq3/vC05CA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zmfgSLgq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=D4mkYat2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767819170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R2ipmyBGpChtc5I5NV+pnWZmAPSU6N3RypPEq+myQW4=;
	b=zmfgSLgqq1m5JzUmJ1SwOkI7t8is7Jv/a3AsirUv6MRA+GnV4j5ELItfkkBquaXKQjIOCc
	cPfkWf30krH+0MZzrVzWSq5PT+8OKPU+O9pU9fqV+Eq+MiVrugtXSPnfHpWSysf5Zi083m
	Vr6duow3EMEqY6EY8lqt3CFZgN70HUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767819170;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R2ipmyBGpChtc5I5NV+pnWZmAPSU6N3RypPEq+myQW4=;
	b=D4mkYat2eI9Tu7budBtcSHI43jkjFNBOPP8OV7kxwtn6sFm+FvYYayu8ZrXZlgEJQ1ahvn
	NMKSpa0m826I7kBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 273933EA63;
	Wed,  7 Jan 2026 20:52:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MPQjCKLHXmlENwAAD6G6ig
	(envelope-from <ddiss@suse.de>); Wed, 07 Jan 2026 20:52:50 +0000
From: David Disseldorp <ddiss@suse.de>
To: linux-kbuild@vger.kernel.org
Cc: David Disseldorp <ddiss@suse.de>
Subject: [PATCH v2 1/2] scripts: headers_install: filter ignored configs via sed
Date: Thu,  8 Jan 2026 07:39:42 +1100
Message-ID: <20260107205239.6390-2-ddiss@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260107205239.6390-1-ddiss@suse.de>
References: <20260107205239.6390-1-ddiss@suse.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 439605C322
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

The sed script currently prints any CONFIG_ entries carried in installed
headers. A subsequent shell script parses this output to check whether
the found CONFIG_ values should be ignored or not.

Drop the unnecessary sed output post-processing and instead skip over
ignored CONFIG_ values as part of initial processing.

INFILE may carry a prefix for e.g. make headers_install O=build_dir .
Therefore, don't anchor the <file-name>:<CONFIG-option> match against
the beginning of INFILE.

Signed-off-by: David Disseldorp <ddiss@suse.de>
---
 scripts/headers_install.sh | 55 +++++++++++++-------------------------
 1 file changed, 19 insertions(+), 36 deletions(-)

diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 0e4e939efc940..2181abd1c9b70 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -42,7 +42,7 @@ scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE
 [ $? -gt 1 ] && exit 1
 
 # Remove /* ... */ style comments, and find CONFIG_ references in code
-configs=$(sed -e '
+sed -e '
 :comment
 	s:/\*[^*][^*]*:/*:
 	s:/\*\*\**\([^/]\):/*\1:
@@ -53,48 +53,31 @@ configs=$(sed -e '
 	N
 	b comment
 :print
+	# The entries in the following list do not result in an error.
+	# Please do not add a new entry. This list is only for existing ones.
+	# The list will be reduced gradually, and deleted eventually.
+	#
+	# The format is s@<file-name>:<CONFIG-option>\n@@ in each line.
+	s@arch/arc/include/uapi/asm/swab.h:CONFIG_ARC_HAS_SWAPE\n@@
+	s@arch/arm/include/uapi/asm/ptrace.h:CONFIG_CPU_ENDIAN_BE8\n@@
+	s@arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_NO\n@@
+	s@arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_SUPPORT\n@@
+	s@arch/x86/include/uapi/asm/auxvec.h:CONFIG_IA32_EMULATION\n@@
+	s@arch/x86/include/uapi/asm/auxvec.h:CONFIG_X86_64\n@@
+
+	# Jump if any of the above filters applied, otherwise error out.
+	t check
+	s@^\(.*\)\n.*@error: \1 leak to user-space@
 	P
-	D
+	Q2
 :check
-	s:^\(CONFIG_[[:alnum:]_]*\):\1\n:
+	s@^\(CONFIG_[[:alnum:]_]*\)@'"$INFILE"':\1\n@
 	t print
 	s:^[[:alnum:]_][[:alnum:]_]*::
 	s:^[^[:alnum:]_][^[:alnum:]_]*::
 	t check
 	d
-' $OUTFILE)
-
-# The entries in the following list do not result in an error.
-# Please do not add a new entry. This list is only for existing ones.
-# The list will be reduced gradually, and deleted eventually. (hopefully)
-#
-# The format is <file-name>:<CONFIG-option> in each line.
-config_leak_ignores="
-arch/arc/include/uapi/asm/swab.h:CONFIG_ARC_HAS_SWAPE
-arch/arm/include/uapi/asm/ptrace.h:CONFIG_CPU_ENDIAN_BE8
-arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_NO
-arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_SUPPORT
-arch/x86/include/uapi/asm/auxvec.h:CONFIG_IA32_EMULATION
-arch/x86/include/uapi/asm/auxvec.h:CONFIG_X86_64
-"
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


