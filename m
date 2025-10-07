Return-Path: <linux-kbuild+bounces-9028-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BFFBC04A4
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 07:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5F03A4F316E
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 05:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E90221723;
	Tue,  7 Oct 2025 05:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PBW36SqP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hQqmZ/WK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PBW36SqP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hQqmZ/WK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F89214A79
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Oct 2025 05:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759816665; cv=none; b=fqbEeHHDujKO0wWnJYq3M48vAGopYd99hqYKDG43mYtVWTc7P1hKd6uwploBAS3rVChH5oU0Pw9fSiSc//8iLBlWTTAmmqtz9Dbgl5cneHHCl9rsd7LW2is3XoBH+/Z6tTQHUwOkN9rfOFTUkmh1DwL5o1VmrtE/I1L/XahmlUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759816665; c=relaxed/simple;
	bh=thgL8anedbQ31UUOvdot1mNJUvANmYhxrwsqrt+NECs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cL+QG+r950fO+9V5XxwpE5YcXIZUpWyk5SirFMNF4YcjthnuzUr2TpeAmpX1dcs3NSI2CZswWObPmguItzNrKyzpio2jiNEfH5JWDdbEh6Rw2ovZ+IQ+mehY0ugmEKHpOAUKAZiVYALPkI2dnPvYIAMNoWj1aWK09zBSUm2hcAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PBW36SqP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hQqmZ/WK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PBW36SqP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hQqmZ/WK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 779E41F78B;
	Tue,  7 Oct 2025 05:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759816661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xCCWL01rQ2yCNtNw6oiQRp5KINUOZvEi0/eQeQDsoHs=;
	b=PBW36SqPWM1Sc3w5sSYvPMd4jz805WkK0oEW39rPJLkA8FJie+T4/tfrAfP0goBhuiVKFZ
	ntQUHLlgrose6ct7DUuq+QVGrfGyqCGtWj60t9Ytr0nX7T8T2Tc7XECODDuwhwZweu6xiP
	y3CDIkhKOL27P3VF1sqxKpSNTulPjGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759816661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xCCWL01rQ2yCNtNw6oiQRp5KINUOZvEi0/eQeQDsoHs=;
	b=hQqmZ/WKwGWCzQDwFefcLj4tVOnolPnkzYJg1kzDQ/NQFjEgH0NUhtBTHYmOK9ocxbkZHY
	k4mwH5WdkBRqWYCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PBW36SqP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="hQqmZ/WK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759816661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xCCWL01rQ2yCNtNw6oiQRp5KINUOZvEi0/eQeQDsoHs=;
	b=PBW36SqPWM1Sc3w5sSYvPMd4jz805WkK0oEW39rPJLkA8FJie+T4/tfrAfP0goBhuiVKFZ
	ntQUHLlgrose6ct7DUuq+QVGrfGyqCGtWj60t9Ytr0nX7T8T2Tc7XECODDuwhwZweu6xiP
	y3CDIkhKOL27P3VF1sqxKpSNTulPjGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759816661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xCCWL01rQ2yCNtNw6oiQRp5KINUOZvEi0/eQeQDsoHs=;
	b=hQqmZ/WKwGWCzQDwFefcLj4tVOnolPnkzYJg1kzDQ/NQFjEgH0NUhtBTHYmOK9ocxbkZHY
	k4mwH5WdkBRqWYCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DD91C13AAC;
	Tue,  7 Oct 2025 05:57:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TGEeJdKr5GhMDgAAD6G6ig
	(envelope-from <ddiss@suse.de>); Tue, 07 Oct 2025 05:57:38 +0000
Date: Tue, 7 Oct 2025 16:57:32 +1100
From: David Disseldorp <ddiss@suse.de>
To: Christoph Hellwig <hch@infradead.org>
Cc: dima@arista.com, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH RFC] gen_init_cpio: Do fsync() only on regular files
Message-ID: <20251007165732.66949558.ddiss@suse.de>
In-Reply-To: <aOSZo8h6l2XNin3C@infradead.org>
References: <20251007-gen_init_cpio-pipe-v1-1-d782674d4926@arista.com>
	<aOSZo8h6l2XNin3C@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 779E41F78B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

On Mon, 6 Oct 2025 21:40:03 -0700, Christoph Hellwig wrote:

> On Tue, Oct 07, 2025 at 12:55:03AM +0100, Dmitry Safonov via B4 Relay wrote:
> > From: Dmitry Safonov <dima@arista.com>
> > 
> > Here at Arista gen_init_cpio is used in testing in order to create
> > an initramfs for specific tests. Most notably, there is a test that does
> > essentially a fork-bomb in kdump/panic kernel, replacing build-time
> > generated init script: instead of doing makedumpfile, it does call
> > shell tests.  
> 
> Why is is using fsync at all?  Seems like this was added in
> 
> commit ae18b94099b04264b32e33b057114024bc72c993
> Author: David Disseldorp <ddiss@suse.de>
> Date:   Tue Aug 19 13:05:45 2025 +1000
> 
>     gen_init_cpio: support -o <output_file> parameter
> 
> without any good explanation.  In general doing a per-file fsync
> is going to horrible wreck performance, and given that no one is
> interested in partial initramfs archives also rather pointless.

I should have explained why in the commit, sorry. The intention was to
catch any FS I/O errors during output archive writeback. fsync() is
called only once as the final I/O.

