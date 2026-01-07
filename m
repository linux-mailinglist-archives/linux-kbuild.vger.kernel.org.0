Return-Path: <linux-kbuild+bounces-10440-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39964D000F8
	for <lists+linux-kbuild@lfdr.de>; Wed, 07 Jan 2026 21:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86CAA301690C
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jan 2026 20:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EEB323C8A0;
	Wed,  7 Jan 2026 20:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SK6Cj24t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KadNahrV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SK6Cj24t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KadNahrV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FA91A317D
	for <linux-kbuild@vger.kernel.org>; Wed,  7 Jan 2026 20:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767819172; cv=none; b=SrVBoDfbJQHgKck4GcglQAOJ+bJ4Pt5G+hqEdg82AeYo2hrX7MnznH1bNh67AgaKpw/lB4EvWi5oDs+rgvibSAqkMplROl0p3JsJfZosxYvl/51NLG2KLBUA07Ngz9QnZ4Gjw4DWYH297Rpn1g/VvA5eddpTk9qID227KWmmlhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767819172; c=relaxed/simple;
	bh=IzXIyfCjL24sUCGu3wQBRH5VRLFpZtih3d7tpwsV0fY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=jK2C6liOoMwTorappNx2B6C5PUAamB0v5roL8LnF/TeUMHQ22WALdIzo/BvcbEvw3akl6ZtzrBA9o9t/kDQ6kfqYXlPHlRoMPKd3k7V0ECQ6LSxMM2TdtcbLcrTewNKRn6Nz/5yZBdbrWuSiLvhmyKEJY4+ToPDH66VPODJ46bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SK6Cj24t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KadNahrV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SK6Cj24t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KadNahrV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 605513414E
	for <linux-kbuild@vger.kernel.org>; Wed,  7 Jan 2026 20:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767819166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iCld6ic94QyIu7+N0gg0vhOEU0ZoZE+25B4x0jHQsAY=;
	b=SK6Cj24t/nDoCM0zpAC++rhYykK3kjflYFJDd7rOEE1NfudSMzfdLfNbLpFdkuFwb6jOcC
	6HXwFqiXA/s+prdFvTs4Wsjpk002AtVZvyYBs6a7L9fs9RkB9gMdl94gBTJris00waNqJa
	IwOyU3OyCEUUxi6vlQElYVe8iUrXY10=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767819166;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iCld6ic94QyIu7+N0gg0vhOEU0ZoZE+25B4x0jHQsAY=;
	b=KadNahrVSOjT3K5wbL4QR9XWqHBJjO4+zkrG1HMnC9+5o/sxNoI4sOJGkTspClWWVj4McB
	BQ/4B63bMozkXvAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SK6Cj24t;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KadNahrV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767819166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iCld6ic94QyIu7+N0gg0vhOEU0ZoZE+25B4x0jHQsAY=;
	b=SK6Cj24t/nDoCM0zpAC++rhYykK3kjflYFJDd7rOEE1NfudSMzfdLfNbLpFdkuFwb6jOcC
	6HXwFqiXA/s+prdFvTs4Wsjpk002AtVZvyYBs6a7L9fs9RkB9gMdl94gBTJris00waNqJa
	IwOyU3OyCEUUxi6vlQElYVe8iUrXY10=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767819166;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iCld6ic94QyIu7+N0gg0vhOEU0ZoZE+25B4x0jHQsAY=;
	b=KadNahrVSOjT3K5wbL4QR9XWqHBJjO4+zkrG1HMnC9+5o/sxNoI4sOJGkTspClWWVj4McB
	BQ/4B63bMozkXvAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 48C0C3EA63
	for <linux-kbuild@vger.kernel.org>; Wed,  7 Jan 2026 20:52:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dwUOEJ7HXmlENwAAD6G6ig
	(envelope-from <ddiss@suse.de>)
	for <linux-kbuild@vger.kernel.org>; Wed, 07 Jan 2026 20:52:46 +0000
From: David Disseldorp <ddiss@suse.de>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH v2 0/2] scripts: headers_install: avoid some reprocessing
Date: Thu,  8 Jan 2026 07:39:41 +1100
Message-ID: <20260107205239.6390-1-ddiss@suse.de>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-kbuild@vger.kernel.org];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: 605513414E
X-Spam-Flag: NO
X-Spam-Score: -3.01

scripts/headers_install.sh is relatively inefficient: it parses/modifies
headers via unifdef and three sed invocations, with sed output
post-processed via grep in one case (user-space CONFIG_ leaks).

These patches attempt to improve simplicity and efficiency by merging
two sed calls and processing user-space CONFIG_ leak filters inline.

Output is unaffected, aside from one minor error string change:
 error: $INFILE: leak CONFIG_X to user-space
becomes...
 error: $INFILE:CONFIG_X leak to user-space

License and CONFIG leak checks have been manually tested via error
injection.

Changes since v1 RFC:
- accept $INFILE prefixes from e.g. make headers_install O=build_dir
  as reported by Oliver Sang / kernel test robot
- drop extra config filter variable and do it all inline in sed

David Disseldorp (2):
      scripts: headers_install: filter ignored configs via sed
      scripts: headers_install: avoid extra sed call for license check

 scripts/headers_install.sh | 74 ++++++++++++++++----------------------
 1 file changed, 31 insertions(+), 43 deletions(-)

