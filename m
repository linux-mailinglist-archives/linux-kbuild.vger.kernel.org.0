Return-Path: <linux-kbuild+bounces-11533-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFDOBawLp2kDcgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11533-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 17:26:20 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AF91F3C0C
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 17:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FF0831141F3
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Mar 2026 16:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1A34D990D;
	Tue,  3 Mar 2026 16:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RqbBUMfv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pC/2dueW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RqbBUMfv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pC/2dueW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613EF4D90AC
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Mar 2026 16:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772554943; cv=none; b=CcE6F+IVhiXYLzoRruGW1DlEG7SaJSWNoYGafTbPN5pNz90QkphvD0ANtThwvkVpym+YGdLEDcWtUxyhLC+mqNDUc9KlcTjK/oMdKKL2WUfG7sffQpcGbara/tNa2/bL8rU9FnwMSiAx8zXUgYeIMs4CLDL0zhYoSj6juRG1tBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772554943; c=relaxed/simple;
	bh=Jav/YoIlsv7jbMbdI/FZvHrI9b1Vg0QVCM2D66myDr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyQzuBwErb9PK3V7qfcUj0ZaEzxSvOQ1UVSAZ4hei1YI2paPxipYCPimX/NKyTMrPXLHTHdY9sxlUvdEOjHUtTboXM+F4RRQzGJZNm9dQsssEyQ6i5yI37G2Hp9KeRKkLjUeaBJk8ZBKjJ0CqA4LmgBZUJBE56rC55gTJAkk8kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RqbBUMfv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pC/2dueW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RqbBUMfv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pC/2dueW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 366873F8B1;
	Tue,  3 Mar 2026 16:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772554936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0CGUikm7J9gwffuIFGQaP7gMZPGjnTHZ2GitsgndHc=;
	b=RqbBUMfvvq7r1FUCRzTES1se+4Xoo06zXc3mL2bcfZEWLHASR6qlWuuTS+dcGb92R2vg5E
	KEqN9nVBdXhngpFA5L57FOjtQd9TtbUt5gHfLz5441LVig0cD7qs3OqzeqlonqZ2uvQC9n
	ceU3/N1EnKy2IIj54+Hb4kr5In1F/Xk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772554936;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0CGUikm7J9gwffuIFGQaP7gMZPGjnTHZ2GitsgndHc=;
	b=pC/2dueWNwel+FKwUsYIl6RenkHiRN1c1CjRC+bwEdexn4OANko4l2uMqWS14Cc78vBLn6
	jUmtdPSjrPvTEvAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772554936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0CGUikm7J9gwffuIFGQaP7gMZPGjnTHZ2GitsgndHc=;
	b=RqbBUMfvvq7r1FUCRzTES1se+4Xoo06zXc3mL2bcfZEWLHASR6qlWuuTS+dcGb92R2vg5E
	KEqN9nVBdXhngpFA5L57FOjtQd9TtbUt5gHfLz5441LVig0cD7qs3OqzeqlonqZ2uvQC9n
	ceU3/N1EnKy2IIj54+Hb4kr5In1F/Xk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772554936;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0CGUikm7J9gwffuIFGQaP7gMZPGjnTHZ2GitsgndHc=;
	b=pC/2dueWNwel+FKwUsYIl6RenkHiRN1c1CjRC+bwEdexn4OANko4l2uMqWS14Cc78vBLn6
	jUmtdPSjrPvTEvAQ==
Date: Tue, 3 Mar 2026 17:22:15 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH] kbuild: only clean objtool on mrproper
Message-ID: <aacKt_BSdCvQZ1BA@kitsune.suse.cz>
References: <20260225112633.6123-1-msuchanek@suse.de>
 <20260225200417.GE2755225@ax162>
 <aZ9aLWIAzsWfYNyf@kitsune.suse.cz>
 <vvccmql35pwtm7lga43lvrlumklddxxahb3c2hfwt4qyqsilhz@g3t7ce3gyyg2>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <vvccmql35pwtm7lga43lvrlumklddxxahb3c2hfwt4qyqsilhz@g3t7ce3gyyg2>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 71AF91F3C0C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11533-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[msuchanek@suse.de,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,suse.de:dkim,suse.de:email,kitsune.suse.cz:mid]
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 12:37:58PM -0800, Josh Poimboeuf wrote:
> On Wed, Feb 25, 2026 at 09:23:09PM +0100, Michal Suchánek wrote:
> > On Wed, Feb 25, 2026 at 01:04:17PM -0700, Nathan Chancellor wrote:
> > > On Wed, Feb 25, 2026 at 12:26:29PM +0100, Michal Suchanek wrote:
> > > > For packaging purposes I want to be able to grab the tool binaries
> > > > without the .o files
> > > > 
> > > > Fixes: 68b4fe32d737 ("kbuild: Add objtool to top-level clean target")
> > > > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > > 
> > > Wouldn't resolve_btfids need the same treatment?
> > 
> > No, make clean runs the clean target for resolve_btfids but the tool
> > remains.
> > 
> > > Why is objtool special here?
> > 
> > That's what I would like to know as well.
> > 
> > > Also, what's the use case? Running 'make clean' then copying what
> > > is left?
> > 
> > Yes, that's what my build script has been doing for at least a decade,
> > possibly mutiple decades when it was somebody else's build script.
> 
> Why is the build script doing that?

To clollect the generated files, primarily for building modules.

Thanks

Michal

