Return-Path: <linux-kbuild+bounces-9246-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B19E3BFA0EC
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 07:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 78FE84E7029
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 05:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FA32EBBAC;
	Wed, 22 Oct 2025 05:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="O94QeRJr";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="oxZDgQlG";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ebWQXXqi";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="kSkE0J/C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522052E11AA
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Oct 2025 05:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761111071; cv=none; b=iMUrY5d1KHxh56O+FeOu8jy/yeGdGBf8e/t+K0ns/uLteiFpw13C6UQxIA/uY+7ogWU+hZx6gUJP7ezUZ7SWU4349Q7uYEmmIVS2UTDtW5VpTYOWxPiVyEZy3AX+KDW/0EDbeVlSOW+PLshP0vpKRKv0yIqvOb1M0nulqIjizGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761111071; c=relaxed/simple;
	bh=5tcN783f7HaNom2WcRQGJob1tDo2oYWcWoqzIoXkmWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3kdYy5SOA/pZF9i41C1LSH2TBJiUyrfG2Iuj6A44BDksYRCZb76yftPWYakuPJl6/0x42mSnsrTmOk37TZvBNz9oFpMAa9K4hEqKoK0oLre4cX4yR9PFn0NTCwpgF6FhtCqLX/h4BC5KNbGaEO5flnXmRTQs0LFaGB8eqWpnzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=O94QeRJr; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=oxZDgQlG; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ebWQXXqi; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=kSkE0J/C; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3BEB0211B0;
	Wed, 22 Oct 2025 05:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1761111063;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BPINCnZGKmmWuN4tXy9v9RmrnezbwORXlnxe+zmBWfU=;
	b=O94QeRJrQZoeh99L6Y0QjqqpMIF+W/a1Z72Cp6ZsQRewBrMydDkpriG99/lJfT7de/U2gV
	mWjA6LaR3SdLxT6G21UcjWyQ55nK2wGyNYl6ZPzhxToq2zFefKgvWUPwgqHZPA1EpW8KXv
	+U3XZiG/1AhMqNBJcPvjMOfl1o/LNOY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1761111063;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BPINCnZGKmmWuN4tXy9v9RmrnezbwORXlnxe+zmBWfU=;
	b=oxZDgQlGGv1spXvBvzqdi2PdoHOgf4/DtmNnjw5kOMO0NwBHz1Mxgnv52kZDhoLtFLCUfb
	Aj6UK5+IkEEVCADw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1761111059;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BPINCnZGKmmWuN4tXy9v9RmrnezbwORXlnxe+zmBWfU=;
	b=ebWQXXqimVBa/JflWyaZtTNUYbKoM7EmngliuIhulsfBskzWRLhjq2wpx3mNV149eWXavH
	ovW/Q3hRSu608nFpWlVBumN4h67TrWd8tTD0MYM0Q8MIzyBgJsBwm68sY+N7mxjyAcoyXY
	S67+JnflNMKROIfuFIqZvJhtuO+aSro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1761111059;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BPINCnZGKmmWuN4tXy9v9RmrnezbwORXlnxe+zmBWfU=;
	b=kSkE0J/CNog7SVWqjfJtSw3qrjT/oKJZCi/+3HfLlLut1w/mAURZnJ2sQsTWhuQO01jzbC
	vMANTEgpu/yXBtDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2117A13995;
	Wed, 22 Oct 2025 05:30:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JOnxBxNs+GgiKAAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Wed, 22 Oct 2025 05:30:59 +0000
Date: Wed, 22 Oct 2025 07:30:42 +0200
From: David Sterba <dsterba@suse.cz>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/2] Kbuild: enable -fms-extensions, make btrfs the first
 user
Message-ID: <20251022053042.GQ13776@suse.cz>
Reply-To: dsterba@suse.cz
References: <20251020142228.1819871-1-linux@rasmusvillemoes.dk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020142228.1819871-1-linux@rasmusvillemoes.dk>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spamd-Result: default: False [-2.50 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[lkml];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,suse.com,vger.kernel.org,kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:mid,suse.cz:replyto];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.50
X-Spam-Level: 

On Mon, Oct 20, 2025 at 04:22:26PM +0200, Rasmus Villemoes wrote:
> Since -fms-extensions once again came up as potentially useful, Linus
> suggested that we bite the bullet and enable it.
> 
> https://lore.kernel.org/lkml/CAHk-=wjeZwww6Zswn6F_iZTpUihTSNKYppLqj36iQDDhfntuEw@mail.gmail.com/
> 
> So that's what patch 1 does, and patch 2 puts it to use in the btrfs
> case.
> 
> Compile-tested only, with gcc (15.2.1) and clang (20.1.8).
> 
> Rasmus Villemoes (2):
>   Kbuild: enable -fms-extensions
>   btrfs: send: make use of -fms-extensions for defining struct fs_path

For the btrfs part

Acked-by: David Sterba <dsterba@suse.com>

I think it makes more sense to take the patches via the kbuild tree so
it's in linux-next for build coverage and eventual tweaks to the Kbuild
files. Or I can take the patches into btrfs for-next.

