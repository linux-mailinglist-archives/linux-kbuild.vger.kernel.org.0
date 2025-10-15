Return-Path: <linux-kbuild+bounces-9156-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 674F9BDCA07
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 07:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA68919A3B93
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 05:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8698B303A18;
	Wed, 15 Oct 2025 05:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zwqSTQ7V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vq/uPXeR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tzHnOkzR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QB1gX0xP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C922FDC5D
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Oct 2025 05:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760506964; cv=none; b=iRNbsymtCj9E1NaNpcUwHveXn5xwGJYVUw1C9R073EECg/RBl+qwlW2/JH7muIn9gtaM5lY3T09TbEZfsbJCf8RMxzBwh1WZrGhp6s8nG1YE0kR8l2DCX840lbrEE7s6X18rmSH5HmUxGDLFjS5TLNbHVbMzkIiETn/ad87TGkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760506964; c=relaxed/simple;
	bh=1YFXgGseaBRthawggZBq6q7MkEZK3LhFVDJbbo/s/Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZ/IGwdXBoPR5hSzxkyDsFNUA2g3VG/83MlSHlzoX9+/849hdOK4LuipgCv5pNQWqLghKGIOsAQAkUYkla1gftWJ1xA/MV0r+3UyNhtStX4KoWnMXf4Or4vRJ9zNtdrb/K40xDXvCEUAkrvWl5xhKlO1KRSpuJxP11Ysqf02gFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zwqSTQ7V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vq/uPXeR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tzHnOkzR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QB1gX0xP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4F90F336A1;
	Wed, 15 Oct 2025 05:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760506960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1YFXgGseaBRthawggZBq6q7MkEZK3LhFVDJbbo/s/Gk=;
	b=zwqSTQ7Vr3ZVnZBNj2zQnhqBlDFStHOvpBpfQJzypF5MvhUD+a4pTmsgE8fIPUbEI9aWY2
	4dt4D2WzRy9siKHz2gyX0BVhiJ6anq4ErJFs7D/5dfOLNn/sDaQxPxBSnMvYfUmg/ph/WE
	2V9MGtCiMc7yILDi/nR6nKqoAFfjKoc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760506960;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1YFXgGseaBRthawggZBq6q7MkEZK3LhFVDJbbo/s/Gk=;
	b=vq/uPXeRjMVUKlSNSGkrCa/RatjFZ2OVjKr/hfuVNZtL2AWTTsfbr4tLDZs4mOxTTq7PE6
	N7aWJnUkRsOAZCBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tzHnOkzR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QB1gX0xP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760506959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1YFXgGseaBRthawggZBq6q7MkEZK3LhFVDJbbo/s/Gk=;
	b=tzHnOkzRYJK9kD36uYx/jxJ88kuodFtO1vztNtFHfC3vQOhYV5nEgL7cHqqhknVcOyLvvS
	WhFx/qcoI0jJ/lEWfsQHI9KJOP2VrlmNLT3uuYBVcJCUxL7+3tamEn49NdcptAUA7coQGg
	jEIMMrZ0GT/ZHwxY/AFD3MXEEm5o8Z8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760506959;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1YFXgGseaBRthawggZBq6q7MkEZK3LhFVDJbbo/s/Gk=;
	b=QB1gX0xPaUxBbbP4c5sXU0jNXp3pHy5HuTSUTtYoTa5davXiqp9DPfWdzHEsIKja+CNkkL
	gcIOWSXcNjLeEaBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E898136F7;
	Wed, 15 Oct 2025 05:42:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MUsdEk0072ifUwAAD6G6ig
	(envelope-from <ddiss@suse.de>); Wed, 15 Oct 2025 05:42:37 +0000
Date: Wed, 15 Oct 2025 16:42:23 +1100
From: David Disseldorp <ddiss@suse.de>
To: Gang Yan <yangang@kylinos.cn>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] gen_initramfs.sh: add the positive check for timestamp
Message-ID: <20251015164223.2190a747.ddiss@suse.de>
In-Reply-To: <20251015021831.355966-1-yangang@kylinos.cn>
References: <20251015021831.355966-1-yangang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4F90F336A1
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.35 / 50.00];
	BAYES_HAM(-2.84)[99.31%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,gen_initramfs.sh:url]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.35
X-Spam-Level: 

Hi,

On Wed, 15 Oct 2025 10:18:31 +0800, Gang Yan wrote:

> The gen_initramfs.sh script has already checked that 'date' returned
> somthing, but it did not verify the content of the return. This patch
> adds a check to ensure the correctness of the timestamp obtained via the
> 'date -d'.

This change doesn't seem unreasonable, but I think failing when an
unsupported date is explicitly provided is an improvement over silent
fallback to time() based initramfs mtimes.
A change to the kbuild.rst KBUILD_BUILD_TIMESTAMP documentation would be
worthwhile. Could you add a note regarding initramfs and pre-epoch times
there?

Thanks, David

