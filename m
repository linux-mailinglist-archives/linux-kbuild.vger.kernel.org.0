Return-Path: <linux-kbuild+bounces-8278-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7186B1966D
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Aug 2025 23:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BD7D174A37
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Aug 2025 21:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA1F2153C7;
	Sun,  3 Aug 2025 21:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nyJ4uD1U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RRD6ShYD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ycE1tBeM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0etC1fmS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45296F9D6
	for <linux-kbuild@vger.kernel.org>; Sun,  3 Aug 2025 21:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754256324; cv=none; b=Q1kSobNsULtmeh+g7GmnEc3FQHd6efoHcqR6Ae7t90kIKcvRKdAkR+dVusgYWAfjhksgxi+XVl6vLXD+g6zu0xUy1BqJd+IovHxYPTIfqJwU3kQAt9E6n/axkubnjI8QjAhrYXKFG2PgjjHRLXYIGjtqgOJiyj/AM4yW2yDvKoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754256324; c=relaxed/simple;
	bh=NDSBVNNhnbiedMJPNgp7FYjBwi5iqfqXB+iNdGQ2pZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DAhNlj7iD3r0FILNY1Inmlcczed7IkjmhGv+36K4SS4otmwAuK+7nU6FuDZLtNznfNk5rYWhWDuIDBrKisdn2qj7Xx+SrZzRf094e/aCXTHIyQY/N/Wn2hOGxiQ/Nz2KhpqDxVHOMkGUhkA7iRVWL8lFGh27MAwkfwYqy6VBkXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nyJ4uD1U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RRD6ShYD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ycE1tBeM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0etC1fmS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D8D971F38C;
	Sun,  3 Aug 2025 21:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754256310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9r14+C9nZoM24lXZWnxFLhFvSEd9YstREm8ANAEt9FE=;
	b=nyJ4uD1UF/ErUA7gXmU6tL2hTSQFyGl0mHQjSFg5s4uD10FU13Q4BtQncTctfLFPPnwkfC
	qOvh8so62kASYu74nR+HtOQz6oImTI+C59OwLG7kaAhv1ov9xHK3stYALIYONBxBCYs0oB
	36D7TJuWbA3K59i0SlRE3W+bf3pYdk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754256310;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9r14+C9nZoM24lXZWnxFLhFvSEd9YstREm8ANAEt9FE=;
	b=RRD6ShYD5YJM5ap5VeO670qi7YHD1DhVanB9KsSC1StDVeyvn7vBMimizE/HNBpFfh+9UF
	R3OQo8q9vop66jAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ycE1tBeM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0etC1fmS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754256309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9r14+C9nZoM24lXZWnxFLhFvSEd9YstREm8ANAEt9FE=;
	b=ycE1tBeM+IbbftrgzUBQPLPGSXX7+no7Uq/soH8Of+ucPnwV7s5/G3J8d7PV7N5Lt5w8ya
	gHNLxR5Pbmy0IIfb2rccSh/4LvrriUoMTlH/IoOtREHMX+8oDIDi3J7QtkomZztzlJydwE
	ZY+fl/UKe9Y6KOYCbUoxo0Or3SPPMZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754256309;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9r14+C9nZoM24lXZWnxFLhFvSEd9YstREm8ANAEt9FE=;
	b=0etC1fmSmRpCNGt6yQhBdSXZLwNJjd3qGEG61M6s0eeJt4BY4wxFxecOWarxqCi/MmPH8P
	QRuhl89HUOoQv4AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF555133D1;
	Sun,  3 Aug 2025 21:25:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qhQcKbXTj2iEQAAAD6G6ig
	(envelope-from <ddiss@suse.de>); Sun, 03 Aug 2025 21:25:09 +0000
From: David Disseldorp <ddiss@suse.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Subject: [RFC PATCH 0/5] gen_init_cpio: add copy_file_range support
Date: Mon,  4 Aug 2025 07:11:14 +1000
Message-ID: <20250803212457.2286-1-ddiss@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: D8D971F38C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

This patchset adds copy_file_range() support to gen_init_cpio.

I've flagged it as RFC for a few reasons:
- more testing is needed
- it might not be useful for others
  + see message regarding reflink alignment requirements in PATCH 3/5
- I should probably provide some benchmark results to justify

David Disseldorp (5):
      gen_init_cpio: write to fd instead of stdout stream
      gen_init_cpio: support -o <output_path> parameter
      gen_init_cpio: attempt copy_file_range for file data
      gen_init_cpio: avoid duplicate strlen calls
      gen_initramfs.sh: use gen_init_cpio -o parameter

 usr/gen_init_cpio.c  | 192 +++++++++++++++++++++++++++----------------
 usr/gen_initramfs.sh |   7 +-
 2 files changed, 126 insertions(+), 73 deletions(-)


