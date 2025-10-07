Return-Path: <linux-kbuild+bounces-9031-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D391FBC0536
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 08:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 913F24E93CC
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 06:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C1B220F29;
	Tue,  7 Oct 2025 06:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="smR4dAGf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="60g1EBQl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P4sTyD9y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dsCJRQGX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF43C1E1E1B
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Oct 2025 06:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759818431; cv=none; b=LLvXtN1zk13R4CAO6MoTNQml4x8AjEnTus1qFz5aPsqMBSj1VfDCAoEuQkh3SA+k1O4gz4HQLc2nlve+dzPov1HZifYOttwC+SdjXl4EVA4dOne2WW0WsZNb9yc7YGozKmFSIrCD9TXRZiI8HKhtnn8hCBoK9Z2/M/gJliSjFVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759818431; c=relaxed/simple;
	bh=mLtgu1121hWMoWk2CeoHxVbBZEGu9LesxuoK9aIfCsI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QDE6BHL0NypP7TjwiNyEmUqwS/1raGAg0veLW0R2t8Ybezq5HpXUMjEuid0NIpjnwBQCg3MHCOKozQrMPK+qXrhw2PZ6+i9suUEWW/YIt2OZsuXus6pMB6WXLee6dtsHhxwAr+8Ozkp/96XH4xv+e+Cn3szhUtGnLMsqHXB0dJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=smR4dAGf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=60g1EBQl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P4sTyD9y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dsCJRQGX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CE1891F78B;
	Tue,  7 Oct 2025 06:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759818427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jortXDB7JK6GmIdf4P86Bkb//IghcT6jdZQ5sTZwfsg=;
	b=smR4dAGf/+M5YYkwef2mql8YbqzxoxQc1JGCmuOIybd54gZtdqc3j2PMqCEh8cuvMFMbxC
	3JijA79Ix2ydKZPH/jpg7ev8BhG89KbZjnLJ7cIWiOBE84SGO3kQZEDsE43ISalrPKIxgF
	DVIfB9oWM0AdifIXONBgYbpR6ZmYnJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759818427;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jortXDB7JK6GmIdf4P86Bkb//IghcT6jdZQ5sTZwfsg=;
	b=60g1EBQl4g2aAa4aLzGryEPTlYBbs+FN8zK2HS5lPL29ke/ymWueTY4K+HTht/HwOcppMP
	U2lJeMl2pOY7MkDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=P4sTyD9y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dsCJRQGX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759818426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jortXDB7JK6GmIdf4P86Bkb//IghcT6jdZQ5sTZwfsg=;
	b=P4sTyD9y5OjsGh+lmv92XKASdLcsZ2WL29jCqCVC1S3bC09uiu7VbP9t346BIzP9LGA9YK
	UEKQbYht9guw1v30fnReQSY+jh9snVJ0iYLaNL8ITLlSjRmFjBD3dwXwQfzJSH+Bctm2MI
	kZ3/YMc9CAzskh9jiQchohkk3nd1yhU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759818426;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jortXDB7JK6GmIdf4P86Bkb//IghcT6jdZQ5sTZwfsg=;
	b=dsCJRQGXpz7OcOkvECs1+/ntizn0MmeUZ0OmzxIlZAcHWSqWgiOxiwwsWboERkD+O5GVZk
	0RHqWzDenuhWU9CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4932B13AAC;
	Tue,  7 Oct 2025 06:27:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KFjbALiy5Gi+FQAAD6G6ig
	(envelope-from <ddiss@suse.de>); Tue, 07 Oct 2025 06:27:04 +0000
Date: Tue, 7 Oct 2025 17:25:56 +1100
From: David Disseldorp <ddiss@suse.de>
To: Christoph Hellwig <hch@infradead.org>
Cc: dima@arista.com, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH RFC] gen_init_cpio: Do fsync() only on regular files
Message-ID: <20251007172556.3e57b0c8.ddiss@suse.de>
In-Reply-To: <aOStTfvOR-C7l1se@infradead.org>
References: <20251007-gen_init_cpio-pipe-v1-1-d782674d4926@arista.com>
	<aOSZo8h6l2XNin3C@infradead.org>
	<20251007165732.66949558.ddiss@suse.de>
	<aOStTfvOR-C7l1se@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: CE1891F78B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.51

On Mon, 6 Oct 2025 23:03:57 -0700, Christoph Hellwig wrote:

> On Tue, Oct 07, 2025 at 04:57:32PM +1100, David Disseldorp wrote:
> > I should have explained why in the commit, sorry. The intention was to
> > catch any FS I/O errors during output archive writeback. fsync() is
> > called only once as the final I/O.  
> 
> I don't parse this.  What does 'as the final I/O' mean?

fsync() is called once after all buffered writes and copy_file_range()
calls for the initramfs archive have completed.

> If you want
> to catch writeback errors, a single syncfs should be enough.

gen_init_cpio should only be concerned that the output archive file is
flushed to storage, rather than the entire filesystem. Why would syncfs
be more suitable?

