Return-Path: <linux-kbuild+bounces-13372-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO0rHaA8F2qg9wcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13372-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 20:49:04 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AFC5E934D
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 20:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28FBF301AF60
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 18:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3EC3BB4A;
	Wed, 27 May 2026 18:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNn+hnzf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A15254AFF;
	Wed, 27 May 2026 18:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779907646; cv=none; b=Q3ef9NNn742g1QZQf4KFXKIW6kY8i0zepapOUOLft9Qcsl8UHkilPcWMk8vI+OMSEBo10a6ds+PFHJ8VytTgRm5TahyhlHEwoaQFesepDuOH4F+aSH38xthDUSnsnzZvUQ/y3GMrKy6zxxficdC8mTxQgggL6d3W+XI4gCjtoqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779907646; c=relaxed/simple;
	bh=oQpCe0uGj3OBquUbAbn7iUlrhQGUI6Gpp+26g5W4iLE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MMskpxJankbuGofBS+bFiteOk/qabiZN6AnoWN9sVIvLXbBB4JypSEa8kwrXKO6VHY2rKALt7SVwaSPWmijqNvRywh856lNHh3jiYsZofh9h6wRdcqxsfhfHn3dG1K/65MwdGTt9stThqM5Qys9bCMA1snt0EOAufJ8T1VYIGMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNn+hnzf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E12B1F000E9;
	Wed, 27 May 2026 18:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779907645;
	bh=zNKdKhH7xIGI7HF5U52Cf95RYaJurNZo5C94X67AV2U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=kNn+hnzf8/cTStHUqlAZ3SzKCludSC+c9toKSJ0iRME+hCRUcmvp68QvXkLNVZVk3
	 AWQvpYw/jmX15w5E/UMaqtctW2LB5+hZP9eEg+4kEYtDm7Vu3Q8Z9dBNjiT2KC6CZu
	 KxGofWenRd1ZTKnq52nmpWYP+AUgebisyCM4ue7r8rpWaTN38VdEUvzvAmUUGdf11B
	 C8/L8MRVm08tACFwpM83yY4QO7ZLhMagkIVmqmXgpsm1BS6sBC//61PSVlWWRZ1Kzx
	 uIxaZRtzA7FAetpsH7QC9d9Ao3/UZ9bNmJ6TDuQKXqgFuufDCz0ITPZOEnlG1ArkbJ
	 5Cf/A4KV54iBQ==
Date: Wed, 27 May 2026 14:47:22 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux trace kernel
 <linux-trace-kernel@vger.kernel.org>, linux-kbuild
 <linux-kbuild@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Masatake YAMATO
 <yamato@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal
 Marek <mmarek@suse.cz>, Yang Bai <hamo.by@gmail.com>
Subject: Re: [PATCH v2] scripts: Have make TAGS not include structure
 members
Message-ID: <20260527144722.40109437@fedora>
In-Reply-To: <20260527162914.GH3102624@noisy.programming.kicks-ass.net>
References: <20260527121144.08a1f676@fedora>
	<20260527162914.GH3102624@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13372-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux-foundation.org,kernel.org,redhat.com,linux-m68k.org,suse.cz,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,infradead.org:email]
X-Rspamd-Queue-Id: C3AFC5E934D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 18:29:14 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> Yeah, I often use member tags.
> 
> The tags file have a 'kind' field, what you want is for emacs to order
> on kind and prefer 'f' over 'm'.
> 
> The alternative is switching to use emacs-lsp, that way the editor knows
> the kind of symbol you want. If you're on a function call, it should
> only consider 'f' tags. Whereas if the cursor is on a member deref, it
> should only consider 'm'.

OK, so in addition to my procrastination of sending out this patch, I
finally changed my .emacs file to have "Meta-." call
xref-find-definitions instead of find-tags.

The xref-find-definitions gives a list of all the tags it finds and you
can search for the function. In the example of "dev_name", I simply
searched for "dev_name(" and it found the function immediately.

As "find-tags" has been deprecated back in 2016 (10 years ago!), and
xref-find-definitions doesn't suffer as much as 'find-tags' does with
respect to member tags. I'll simply drop this patch.

I can also finally archive the conversation I have in my INBOX! ;-)

-- Steve

