Return-Path: <linux-kbuild+bounces-9172-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8EDBDE012
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 12:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C166406310
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 10:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58936320CCD;
	Wed, 15 Oct 2025 10:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G7SMLg1e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y0n9vlEs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G7SMLg1e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y0n9vlEs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EACB320A22
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Oct 2025 10:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760524081; cv=none; b=EBvTRyFv8x9oed3hzKu76cow6XCHIp9ID09VdkvpO2dYYkdISWneN0OTT8rZNCKMDX/bIZEnhbYLGx4EcWWWSxgveTaLb5PJwh1DaO+Lx43RVYUm87gsXfRJPWQ6QpFb5JBcIE9eXZkj+um4fcEiBBG80NXQ+qHgczxAFxtX+FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760524081; c=relaxed/simple;
	bh=4Y+rK3waD27Ns/3SjnQLtyZCHG943vrF/owGFlPAOkM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XdkXQaCLMMLjtM9oZQ5KvutE2hQE8YNUt7tlimFtDi+nLWb/r8apCRs/MyuB/nmpVhIF/k+rjoYrt9sqORaVfsj45SAGWmoIriQk4J520jgwAYX5NEdtk3dgiox1O6S8Pz38dvSoKo8Xm+kcNUlV0nG0/ZP8HJ8RhxRBwl50TmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G7SMLg1e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y0n9vlEs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G7SMLg1e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y0n9vlEs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 170811F449;
	Wed, 15 Oct 2025 10:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760524077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I5lLXud9Ow60qGQKFtTUwjUe29Qztpjypau4gyNgsBc=;
	b=G7SMLg1enDEGZbp3wFyHZHWbVvlVwJmd3rdmqqhL0wtxfKxSTgA+qseHFNlb5auYvOqSzE
	GIzV8QkSXB9zOtQxrqDKidWTlRExj5Fkee7gHJmaz2JSaGuQbRBwgYVDqOlb3Es65j4HSk
	siO05raRHpqzwyQ3XoXyui+eH5XGlq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760524077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I5lLXud9Ow60qGQKFtTUwjUe29Qztpjypau4gyNgsBc=;
	b=y0n9vlEsnh9j0ie2dIx8Sjkekrx6q9VcfG7W9syiqsXH+sCT/VfjHpTAZOcufFCMiyE/+U
	YXhBXa83s29FmVDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=G7SMLg1e;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=y0n9vlEs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760524077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I5lLXud9Ow60qGQKFtTUwjUe29Qztpjypau4gyNgsBc=;
	b=G7SMLg1enDEGZbp3wFyHZHWbVvlVwJmd3rdmqqhL0wtxfKxSTgA+qseHFNlb5auYvOqSzE
	GIzV8QkSXB9zOtQxrqDKidWTlRExj5Fkee7gHJmaz2JSaGuQbRBwgYVDqOlb3Es65j4HSk
	siO05raRHpqzwyQ3XoXyui+eH5XGlq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760524077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I5lLXud9Ow60qGQKFtTUwjUe29Qztpjypau4gyNgsBc=;
	b=y0n9vlEsnh9j0ie2dIx8Sjkekrx6q9VcfG7W9syiqsXH+sCT/VfjHpTAZOcufFCMiyE/+U
	YXhBXa83s29FmVDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4893213A29;
	Wed, 15 Oct 2025 10:27:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8+d1ACt372gPFgAAD6G6ig
	(envelope-from <ddiss@suse.de>); Wed, 15 Oct 2025 10:27:55 +0000
Date: Wed, 15 Oct 2025 21:27:42 +1100
From: David Disseldorp <ddiss@suse.de>
To: GangYan <gang.yan@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] gen_initramfs.sh: add the positive check for timestamp
Message-ID: <20251015212742.366d14a1.ddiss@suse.de>
In-Reply-To: <aO907xsN6VV5IxM7@yangang-ThinkPad-T14-Gen-1>
References: <aO907xsN6VV5IxM7@yangang-ThinkPad-T14-Gen-1>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 170811F449
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Wed, 15 Oct 2025 18:18:23 +0800, GangYan wrote:

> > This change doesn't seem unreasonable, but I think failing when an
> > unsupported date is explicitly provided is an improvement over silent
> > fallback to time() based initramfs mtimes.
> > A change to the kbuild.rst KBUILD_BUILD_TIMESTAMP documentation would be
> > worthwhile. Could you add a note regarding initramfs and pre-epoch times
> > there?  
> Sure, I will send a new one.

Thanks.

> Would you mind add your "Suggested-by" tag in the new patch?

Sure, I don't mind.

Cheers, David

