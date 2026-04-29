Return-Path: <linux-kbuild+bounces-12937-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LMwD0FV8mnGpgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12937-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 21:00:17 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8BF4996C2
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 21:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CBC4300609E
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 19:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7D63FF8AE;
	Wed, 29 Apr 2026 18:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/PQcRzC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3791A5B84;
	Wed, 29 Apr 2026 18:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777489198; cv=none; b=pdbPgpFhKVeEDKrBda2UntsqUMNpdwloIoFONDlbVVk3Wl6xWiTmRft4VXdDJ4QUD8xvvGDyPMOVgUbb44sIq0F8T+/5HKIefcUQ2g2icUhaD8cUIWkysD0la/GdLoAVdS+zv1jZZA912j78Ed1GUit9oWmRWn7PAG9sKqb93jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777489198; c=relaxed/simple;
	bh=MNR3XaJLx9Wo2kIoCeJUUiQMr7r3o01Z/VONKeDCEDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VshAU2g+EG/z1fWOw5oy16xcspukCUCXUIND+hy5D/v19sOFD/AloQ3bVSkT+SOsppIBQZrbkJBKkQgqUoc6U9m7ru4qOl6jmIaL+eOBovhidzrSRT1Z8nmDhDfDC9qQpGjDfCKMuBOENi2/BSoFLWAMhTDHo4qDI0PUQaXplT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/PQcRzC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A867BC19425;
	Wed, 29 Apr 2026 18:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777489198;
	bh=MNR3XaJLx9Wo2kIoCeJUUiQMr7r3o01Z/VONKeDCEDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b/PQcRzC7tBFitqST9hOP1crpRNdVX4f71EMDC9Lr4kP8uQQ1aXBASYQ6plDkQaKq
	 L828+g8ULXj12dKEjjm1+bl/b6u+wvfsH3alXy7AewFukvaTlZKCAL4JjTMkKGdHri
	 mvDhv+0iUPeIVy7oUo2k+EnJ8v2R325JHiD08iRLsf/6wNl18uc8g0RvZ1gbYZEou0
	 sA+UusFN3UhrhnnX9UIoC4vUA5uIeQ48ylQjdUQXRvd4qcwVvXLc4wsD1a7r4OS/ow
	 3oKUU9+Ef/ucm5ui5qCX8mLNABapt3BTUobl8KpHGK2dIsvTwhMZ+8tKEdczNEuQ9w
	 RoMF/76Icd9Iw==
Date: Wed, 29 Apr 2026 11:59:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Julian Braha <julianbraha@gmail.com>, akpm@linux-foundation.org,
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
	masahiroy@kernel.org, nsc@kernel.org, ojeda@kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] scripts: add kconfirm
Message-ID: <20260429185952.GA3547488@ax162>
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-2-julianbraha@gmail.com>
 <87mrynmuuu.fsf@trenco.lwn.net>
 <20260428183101.GA3304253@ax162>
 <877bpqlx7o.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877bpqlx7o.fsf@trenco.lwn.net>
X-Rspamd-Queue-Id: CC8BF4996C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12937-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,kernel.org,arndb.de,linuxfoundation.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 01:08:11PM -0600, Jonathan Corbet wrote:
> Nathan Chancellor <nathan@kernel.org> writes:
> 
> > On Tue, Apr 28, 2026 at 01:01:29AM -0600, Jonathan Corbet wrote:
> >> Also, a nit, but I would really suggest putting it under tools/ rather
> >> than in the scripts/ dumping ground.
> >
> > As if tools/ isn't its own dumping ground? :)
> 
> It is more structured and more amenable to useful MAINTAINERS entries.

Perhaps on the structured aspect but I don't see how tools/ differs from
scripts/ with regards to MAINTAINERS entries. Yeah, Kbuild has a
scripts/ catch all but you could still add a top level folder and add
that to whatever MAINTAINERS entry you want.

> > While I can understand the desire to avoid adding more random stuff to
> > scripts/, it sets a confusing precedent because tools/ is not a part of
> > Kbuild, so I would not expect tools that would run within Kbuild to live
> > there (which this one appears to do). While there are obvious exceptions
> > such as objtool and resolve_btfids,
> 
> ...and the docs build system...

Which is a recent change, no?

> > I would like to avoid adding new
> > ones, which aligns with the comment added by Masahiro's commit
> > 6e6ef2da3a28 ("Makefile: add comment to discourage tools/* addition for
> > kernel builds"). Maybe this could be mitigated with a tools/kbuild/
> > directory or something but not sure. Just some additional input.
> 
> I don't understand that reticence.  As we build up more tools, why not
> organize them in a directory tree, perhaps called "tools", where we can
> track who's responsible for the various subtrees?

Well, the only reason I bring that up is that it will make life harder
on the Kbuild people to do treewide audits and reviews of Kbuild usage
when certain areas in tools/ use Kbuild while others don't. Obviously,
we can adapt should the general consensus want tools to live in tools/.

-- 
Cheers,
Nathan

