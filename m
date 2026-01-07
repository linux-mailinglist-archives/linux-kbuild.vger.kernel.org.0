Return-Path: <linux-kbuild+bounces-10442-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F0DD000FE
	for <lists+linux-kbuild@lfdr.de>; Wed, 07 Jan 2026 21:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78F6330056DB
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jan 2026 20:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786B023C8A0;
	Wed,  7 Jan 2026 20:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1Hq8JMm6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+yyOKjwa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1Hq8JMm6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+yyOKjwa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0161A317D
	for <linux-kbuild@vger.kernel.org>; Wed,  7 Jan 2026 20:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767819178; cv=none; b=B6KfljoaCAJVU0TsPWq72uhtspj72PNXRxDFoR5/0CQ6d+D42y5gleB5nMhljwjBzsqcJpv1Fu1x5h0BrOH/VnhRke/7HzcrhgRYX5hawiE9Vp8MSOCk6xMDnQZh3jrduP+MjG+A0zM3lVRq69nxr+1+dykX3cuYWK91c5BzP88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767819178; c=relaxed/simple;
	bh=A4cPRX9gr5UKaAXNfbDYTHmRpvlGHB7Lo7vhZe1VMQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s91dXkxK8jXp1jqZ+whD/V+mvUJq/ehz+qq9oiYx9zRkTCdp2wthTht4bmPPfjPQh95pYAXmRcODxWMWmqnqvy3NpJeSAPj+uKl/D2qL7rUSO2oi9Zh/VSssIhhgjnEZ639fQZ31chLzejcLH0yRiNk1xTdm1B3ukcWkGKa0w4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1Hq8JMm6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+yyOKjwa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1Hq8JMm6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+yyOKjwa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 15FE33414D;
	Wed,  7 Jan 2026 20:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767819173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2rv4JBB9MtZ1ifVX9Q20vu+BIlEB2eSu3TUwTvjXbqY=;
	b=1Hq8JMm6cNFo5eaKSQqheO3jATYr/R+PxfRKEr7k+qw6OpxqqqP/KLxINK0DG5x5sQHtuw
	edV6CKbXmEb39j80YaMsjIIIaf1RRF8IiZeXwVLCZEVLSCfe+igZKpHe0C86mqFll9fV3k
	qGcp+taSJNXk10+T5UaXoEZKZIncS3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767819173;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2rv4JBB9MtZ1ifVX9Q20vu+BIlEB2eSu3TUwTvjXbqY=;
	b=+yyOKjwaobA2KJNLgoAu43wgh7bvgQisA25GRtWzB44emDREJdcUWpWVAFhI1VuRBBBE0e
	s+VSzETCAkn/BLBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767819173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2rv4JBB9MtZ1ifVX9Q20vu+BIlEB2eSu3TUwTvjXbqY=;
	b=1Hq8JMm6cNFo5eaKSQqheO3jATYr/R+PxfRKEr7k+qw6OpxqqqP/KLxINK0DG5x5sQHtuw
	edV6CKbXmEb39j80YaMsjIIIaf1RRF8IiZeXwVLCZEVLSCfe+igZKpHe0C86mqFll9fV3k
	qGcp+taSJNXk10+T5UaXoEZKZIncS3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767819173;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2rv4JBB9MtZ1ifVX9Q20vu+BIlEB2eSu3TUwTvjXbqY=;
	b=+yyOKjwaobA2KJNLgoAu43wgh7bvgQisA25GRtWzB44emDREJdcUWpWVAFhI1VuRBBBE0e
	s+VSzETCAkn/BLBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EDCAD3EA63;
	Wed,  7 Jan 2026 20:52:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8OShOKTHXmlENwAAD6G6ig
	(envelope-from <ddiss@suse.de>); Wed, 07 Jan 2026 20:52:52 +0000
From: David Disseldorp <ddiss@suse.de>
To: linux-kbuild@vger.kernel.org
Cc: David Disseldorp <ddiss@suse.de>
Subject: [PATCH v2 2/2] scripts: headers_install: avoid extra sed call for license check
Date: Thu,  8 Jan 2026 07:39:43 +1100
Message-ID: <20260107205239.6390-3-ddiss@suse.de>
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
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.976];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]

headers_install runs a sed script to check that any GPL variant
SPDX-License-Identifier line carries a "WITH Linux-syscall-note".
A subsequent sed invocation then handles removal of a few things that
aren't desired in installed headers (e.g. __attribute_const__).

Combine these two sed scripts to avoid re-processing the same file.
License check errors, as opposed to write errors, are indicated via a
special sed exit status of 9.

Signed-off-by: David Disseldorp <ddiss@suse.de>
---
 scripts/headers_install.sh | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 2181abd1c9b70..ef952cbbb8fde 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -23,20 +23,25 @@ TMPFILE=$OUTFILE.tmp
 
 trap 'rm -f $OUTFILE $TMPFILE' EXIT
 
-# SPDX-License-Identifier with GPL variants must have "WITH Linux-syscall-note"
-if [ -n "$(sed -n -e "/SPDX-License-Identifier:.*GPL-/{/WITH Linux-syscall-note/!p}" $INFILE)" ]; then
-	echo "error: $INFILE: missing \"WITH Linux-syscall-note\" for SPDX-License-Identifier" >&2
-	exit 1
-fi
-
+# returns 9 if GPL SPDX-License-Identifier omits "WITH Linux-syscall-note"
 sed -E -e '
+	/SPDX-License-Identifier:.*GPL-/{/WITH Linux-syscall-note/! Q9}
 	s/([[:space:](])(__user|__force|__iomem)[[:space:]]/\1/g
 	s/__attribute_const__([[:space:]]|$)/\1/g
 	s@^#include <linux/compiler.h>@@
 	s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
 	s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
 	s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
-' $INFILE > $TMPFILE || exit 1
+' $INFILE > $TMPFILE
+case $? in
+9)
+	echo "error: $INFILE: missing \"WITH Linux-syscall-note\" for SPDX-License-Identifier" >&2
+	exit 1
+	;;
+1)
+	exit 1
+	;;
+esac
 
 scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE
 [ $? -gt 1 ] && exit 1
-- 
2.51.0


