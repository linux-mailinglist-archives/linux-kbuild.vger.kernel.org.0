Return-Path: <linux-kbuild+bounces-10925-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id j89uBjlSe2nRDwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10925-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 13:27:37 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC6FB00D0
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 13:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 304C43011A76
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 12:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DF62F5A1A;
	Thu, 29 Jan 2026 12:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KMFxfHmJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="suTHmGqo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KMFxfHmJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="suTHmGqo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A788D1EB5FD
	for <linux-kbuild@vger.kernel.org>; Thu, 29 Jan 2026 12:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769689653; cv=none; b=s/miG3vT6qoJjKRU654Lb1LXwSQj5xqCCxBd/UUEgH4x6l05wGWFHpnDPQ0TebMMvl8taRKtk2oqB+LQnr2qTyhK+iXEwtfEm/j7g5gyU8Up4FdgH5b9b7oAtSqWYGvzY85U3yEd/vB6TjDqk4XxFrj7/J5Q+uJejerBsvQcPVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769689653; c=relaxed/simple;
	bh=6CKo0zG3aAW9qOTFCUKKEY4aWELSNcw2AmSECcf7DcE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kvf6eKbfRjKVgoYJzf0RoGdFKDKJLyIv13ZKCdPUfZMTBDnD2jlmqhIaT/PTtkhYwaeqI/3Chg2/DRSm0yKOKGU2Rx8Mxc3hpAJ683BsTfIeQER0jvyt4eQ2/Uh7zUMLl5az2caV1OI9qj4MuXEn9GZ/V+tdZR9wLsSU0ilZCzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KMFxfHmJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=suTHmGqo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KMFxfHmJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=suTHmGqo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D65B05BCDC;
	Thu, 29 Jan 2026 12:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769689649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7cmPWbNzkFOz9wANNtYOshTh4ExLZHTrhi1b1Q/4iQ=;
	b=KMFxfHmJCxmDC7OsHTHL8YBTILaBmJyRLZ99JkQx1pvh5B0Xv9WD0fTGFNfopno/V7g3z3
	afWSRBJTBfTxK8ZUFBIeYCa+9tTAs+c27jlxSjFQoR2mss+qFahsitBgJ13PRtA8Glq8ik
	X4fBG2yfvxCT6P5Vhkv5pdOdCInT7lw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769689649;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7cmPWbNzkFOz9wANNtYOshTh4ExLZHTrhi1b1Q/4iQ=;
	b=suTHmGqo89zpc+XtZWVT2jYhNHYUoo5zru8viK7t0U/QqYOMzYggixq8SSr8ubUpT0yKGR
	wHsdukSl8JIoEZCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KMFxfHmJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=suTHmGqo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769689649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7cmPWbNzkFOz9wANNtYOshTh4ExLZHTrhi1b1Q/4iQ=;
	b=KMFxfHmJCxmDC7OsHTHL8YBTILaBmJyRLZ99JkQx1pvh5B0Xv9WD0fTGFNfopno/V7g3z3
	afWSRBJTBfTxK8ZUFBIeYCa+9tTAs+c27jlxSjFQoR2mss+qFahsitBgJ13PRtA8Glq8ik
	X4fBG2yfvxCT6P5Vhkv5pdOdCInT7lw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769689649;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7cmPWbNzkFOz9wANNtYOshTh4ExLZHTrhi1b1Q/4iQ=;
	b=suTHmGqo89zpc+XtZWVT2jYhNHYUoo5zru8viK7t0U/QqYOMzYggixq8SSr8ubUpT0yKGR
	wHsdukSl8JIoEZCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EF143EA61;
	Thu, 29 Jan 2026 12:27:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7SQsBjBSe2nuXQAAD6G6ig
	(envelope-from <ddiss@suse.de>); Thu, 29 Jan 2026 12:27:28 +0000
Date: Thu, 29 Jan 2026 23:27:10 +1100
From: David Disseldorp <ddiss@suse.de>
To: Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 2/2] scripts: headers_install: avoid extra sed call
 for license check
Message-ID: <20260129232710.31078980.ddiss@suse.de>
In-Reply-To: <aXC52UIHjmsNJG4B@derry.ads.avm.de>
References: <20260107205239.6390-1-ddiss@suse.de>
	<20260107205239.6390-3-ddiss@suse.de>
	<aXC52UIHjmsNJG4B@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10925-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ddiss@suse.de,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7CC6FB00D0
X-Rspamd-Action: no action

Thanks for the review Nicolas...

On Wed, 21 Jan 2026 12:34:49 +0100, Nicolas Schier wrote:

> [Cc+=nathan]
> 
> On Thu, Jan 08, 2026 at 07:39:43AM +1100, David Disseldorp wrote:
> > headers_install runs a sed script to check that any GPL variant
> > SPDX-License-Identifier line carries a "WITH Linux-syscall-note".
> > A subsequent sed invocation then handles removal of a few things that
> > aren't desired in installed headers (e.g. __attribute_const__).
> > 
> > Combine these two sed scripts to avoid re-processing the same file.
> > License check errors, as opposed to write errors, are indicated via a
> > special sed exit status of 9.
> > 
> > Signed-off-by: David Disseldorp <ddiss@suse.de>
> > ---
> >  scripts/headers_install.sh | 19 ++++++++++++-------
> >  1 file changed, 12 insertions(+), 7 deletions(-)
> > 
> > diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
> > index 2181abd1c9b70..ef952cbbb8fde 100755
> > --- a/scripts/headers_install.sh
> > +++ b/scripts/headers_install.sh
> > @@ -23,20 +23,25 @@ TMPFILE=$OUTFILE.tmp
> >  
> >  trap 'rm -f $OUTFILE $TMPFILE' EXIT
> >  
> > -# SPDX-License-Identifier with GPL variants must have "WITH Linux-syscall-note"
> > -if [ -n "$(sed -n -e "/SPDX-License-Identifier:.*GPL-/{/WITH Linux-syscall-note/!p}" $INFILE)" ]; then
> > -	echo "error: $INFILE: missing \"WITH Linux-syscall-note\" for SPDX-License-Identifier" >&2
> > -	exit 1
> > -fi
> > -
> > +# returns 9 if GPL SPDX-License-Identifier omits "WITH Linux-syscall-note"
> >  sed -E -e '
> > +	/SPDX-License-Identifier:.*GPL-/{/WITH Linux-syscall-note/! Q9}  
> 
> thanks, I like the idea of combining the sed calls.  According to the
> manual 'Q' (or 'q' with argument) is a GNU extension (non-POSIX).
> 
> May we expect GNU sed on all system running headers_install?

Good catch. 
I suspect there might already be some GNU sed specific code, based on
LKL's explicit use of gsed for builds on BSD hosts:
https://github.com/lkl/linux/commit/84f39699a6d1013d1866b8637977804e515d8d7e
I don't have any proof for mainline though (yet).

> >  	s/([[:space:](])(__user|__force|__iomem)[[:space:]]/\1/g
> >  	s/__attribute_const__([[:space:]]|$)/\1/g
> >  	s@^#include <linux/compiler.h>@@
> >  	s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
> >  	s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
> >  	s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
> > -' $INFILE > $TMPFILE || exit 1
> > +' $INFILE > $TMPFILE
> > +case $? in
> > +9)
> > +	echo "error: $INFILE: missing \"WITH Linux-syscall-note\" for SPDX-License-Identifier" >&2
> > +	exit 1
> > +	;;
> > +1)
> > +	exit 1
> > +	;;
> > +esac  
> 
> This silently ignores all other exit codes.  What about this:
> 
> 9)
> ...
> 	;;
> 0)	;;
> *)
> 	exit 1
> 	;;
> esac

Ack, I see that 2 and 4 returns are also possible. Your fix looks good
to me.
I'll squash it in and resend if I find any other GNU sed specific code.
Otherwise this change can probably be dropped.

Cheers, David

