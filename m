Return-Path: <linux-kbuild+bounces-9564-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDB6C4E16A
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 14:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 629871895854
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 13:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F5C3246E6;
	Tue, 11 Nov 2025 13:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tIYsieNx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7pJm5ETb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tIYsieNx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7pJm5ETb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E8C32827D
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762867242; cv=none; b=tw8hQBlr6vejQleD2TkormjmxmGk60e5hQlcYrXOdyjJ+8Yf8KQ3LyX+pxuvhUvSb9eBYFHxOaE0DryqkGmV5DFAEIZI1Nlo4xoW65rpFl7RcO2egOWi8OD8WTykE9uG/OVi3SAgYk66zI6xKGKqfMhcgSLjwAwBnGQ627AYmPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762867242; c=relaxed/simple;
	bh=3ep6OsqSpUuEtyE6UBrUTc+0Obd00IoVo4HYq5vBnPU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=WQkeqI9KkXE9PVWWn73fMb1st+r+GJ5heqxW2agEkSi376pa0z8DOL7Psr9A+TSSO7k9oR9IWRjG46WK5REQGJS5kRwsUrVjZH8xpAml9wpEkkNlL6KOoTeVP48psQAquORDblazPEDxs7mLB+BV0te0CzZLbT8+dFcqqLX20+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tIYsieNx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7pJm5ETb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tIYsieNx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7pJm5ETb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9600F21FBD
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 13:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762867238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=G8Ka9izLvs0IZvR77ROMrBPq7nm3buNUISXndBSJX/k=;
	b=tIYsieNxEQeo6z54+g/9Z36qm9QZl6ERRjSXbu9BktvCPV4LH1XI2zPHs9N6dt5XztjrCe
	7/oTTIqI1FIVbCYQmbxONZjkk++7vECdMNtXQJHfhKY8Ti2qnW9mQkmCbjcEySTgDYua/f
	XcbqEVmFV/L1JsgOY+BSGYuAfuXDQfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762867238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=G8Ka9izLvs0IZvR77ROMrBPq7nm3buNUISXndBSJX/k=;
	b=7pJm5ETbnAJ18KNYSOGBrSoX9L9peTKLzLrVTD0BzWa5dfSWtYW3kQU4K20L+phYzj5m3C
	DnKO10pclTPSoADg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tIYsieNx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7pJm5ETb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762867238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=G8Ka9izLvs0IZvR77ROMrBPq7nm3buNUISXndBSJX/k=;
	b=tIYsieNxEQeo6z54+g/9Z36qm9QZl6ERRjSXbu9BktvCPV4LH1XI2zPHs9N6dt5XztjrCe
	7/oTTIqI1FIVbCYQmbxONZjkk++7vECdMNtXQJHfhKY8Ti2qnW9mQkmCbjcEySTgDYua/f
	XcbqEVmFV/L1JsgOY+BSGYuAfuXDQfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762867238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=G8Ka9izLvs0IZvR77ROMrBPq7nm3buNUISXndBSJX/k=;
	b=7pJm5ETbnAJ18KNYSOGBrSoX9L9peTKLzLrVTD0BzWa5dfSWtYW3kQU4K20L+phYzj5m3C
	DnKO10pclTPSoADg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD80B14993
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 13:20:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PgapGSU4E2lpWAAAD6G6ig
	(envelope-from <ddiss@suse.de>)
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 13:20:37 +0000
From: David Disseldorp <ddiss@suse.de>
To: linux-kbuild@vger.kernel.org
Subject: [RFC PATCH 0/3] scripts: headers_install: avoid some reprocessing
Date: Wed, 12 Nov 2025 00:16:19 +1100
Message-ID: <20251111132021.22809-1-ddiss@suse.de>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 9600F21FBD
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-kbuild@vger.kernel.org];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

scripts/headers_install.sh is relatively inefficient: it parses/modifies
headers via unifdef and three sed invocations, with sed output
post-processed via grep in one case (user-space CONFIG_ leaks).

These patches attempt to improve efficiency by merging two sed calls
and processing user-space CONFIG_ leak filters inline.

Unfortunately my parallel / sync headers_install benchmarks didn't show
meaningful performance improvements, hence the RFC tag.

Output is unaffected. License and CONFIG leak checks have been manually
tested via error injection.

David Disseldorp (3):
      scripts: headers_install: move config_leak_ignores assignment
      scripts: headers_install: filter ignored configs via sed
      scripts: headers_install: avoid license check fork

 scripts/headers_install.sh | 85 ++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 45 deletions(-)

