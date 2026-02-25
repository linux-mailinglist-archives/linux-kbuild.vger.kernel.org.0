Return-Path: <linux-kbuild+bounces-11432-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJhgHk5an2lRagQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11432-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 21:23:42 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D3E19D27D
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 21:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1757330265B5
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 20:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC762D73BE;
	Wed, 25 Feb 2026 20:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V/GG0chG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MrfTwOdO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V/GG0chG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MrfTwOdO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBA42D5923
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Feb 2026 20:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772050993; cv=none; b=Vg5EIq47yY6WC3TmSivvNFBGfz0tp4Yu3M2TFkiHpCfQWN3B+05NqMPcorDput6A3Q0w1pCjVk6lbks/+G6LLhsSRf/bTo44RJHZaEcFH2itBf4r8iRn+KQtcLQUpFIWuKYWg6qvd6HjWJGswTaUOqFcJpX2CE2MrmU90jPFows=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772050993; c=relaxed/simple;
	bh=DNWZesmN7cuxR28RapFwuVOtBtUkN29S8Yy4+vBhFPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bR3cYuL8em5w8bSVOs7lrfGuhSnKxoAz50eHxaDmidF77zMFrbk1BjUZBeMjqXgu/4ILwf5SOcDBd5PlE+zrQMjbfVMLJBwKB/HB/CHeqSGLlgtYaNIGpZb7FT4itdw1rhjgiBXu+rYW2/jauojSeXOLwGU9+ubdQYlQdJTDYpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V/GG0chG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MrfTwOdO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V/GG0chG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MrfTwOdO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 92DE35C451;
	Wed, 25 Feb 2026 20:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772050990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DiOXh2FCv0wKNLF2Mw6BLazB5HnaIYmi51pgAzUSLKc=;
	b=V/GG0chGi/mDBg0QTb0cq6sIUp5OR/C9vebMp7WcA5p8e1k7GF/oE1szch0u54ppWgYbEj
	jMMPah351ueYbMJR1WY358Ui8cczw0iO8ictgQkxRnIjx3SLjJvh9wCdyzHoKeNFo2u+Ya
	TibcbUgduVCm2+1/hFyamR0H1SMtVUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772050990;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DiOXh2FCv0wKNLF2Mw6BLazB5HnaIYmi51pgAzUSLKc=;
	b=MrfTwOdOyPi1TiCPGnEaG+0q5a+CBs1l4Lq+6D9u9S62chcbct0Zp+WggKyLXLnkMYxbfp
	2ORgxK826WyXoACA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772050990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DiOXh2FCv0wKNLF2Mw6BLazB5HnaIYmi51pgAzUSLKc=;
	b=V/GG0chGi/mDBg0QTb0cq6sIUp5OR/C9vebMp7WcA5p8e1k7GF/oE1szch0u54ppWgYbEj
	jMMPah351ueYbMJR1WY358Ui8cczw0iO8ictgQkxRnIjx3SLjJvh9wCdyzHoKeNFo2u+Ya
	TibcbUgduVCm2+1/hFyamR0H1SMtVUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772050990;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DiOXh2FCv0wKNLF2Mw6BLazB5HnaIYmi51pgAzUSLKc=;
	b=MrfTwOdOyPi1TiCPGnEaG+0q5a+CBs1l4Lq+6D9u9S62chcbct0Zp+WggKyLXLnkMYxbfp
	2ORgxK826WyXoACA==
Date: Wed, 25 Feb 2026 21:23:09 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kbuild@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH] kbuild: only clean objtool on mrproper
Message-ID: <aZ9aLWIAzsWfYNyf@kitsune.suse.cz>
References: <20260225112633.6123-1-msuchanek@suse.de>
 <20260225200417.GE2755225@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225200417.GE2755225@ax162>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11432-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[kitsune.suse.cz:mid,suse.de:email,suse.de:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D6D3E19D27D
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 01:04:17PM -0700, Nathan Chancellor wrote:
> On Wed, Feb 25, 2026 at 12:26:29PM +0100, Michal Suchanek wrote:
> > For packaging purposes I want to be able to grab the tool binaries
> > without the .o files
> > 
> > Fixes: 68b4fe32d737 ("kbuild: Add objtool to top-level clean target")
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> 
> Wouldn't resolve_btfids need the same treatment?

No, make clean runs the clean target for resolve_btfids but the tool
remains.

> Why is objtool special here?

That's what I would like to know as well.

> Also, what's the use case? Running 'make clean' then copying what
> is left?

Yes, that's what my build script has been doing for at least a decade,
possibly mutiple decades when it was somebody else's build script.

Thanks

Michal

> Josh, thoughts on this change?
> 
> > ---
> >  Makefile | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index e944c6e71e81..e9b8811a02f5 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1675,7 +1675,7 @@ vmlinuxclean:
> >  	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/link-vmlinux.sh clean
> >  	$(Q)$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) clean)
> >  
> > -clean: archclean vmlinuxclean resolve_btfids_clean objtool_clean
> > +clean: archclean vmlinuxclean resolve_btfids_clean
> >  
> >  # mrproper - Delete all generated files, including .config
> >  #
> > @@ -1686,7 +1686,7 @@ PHONY += $(mrproper-dirs) mrproper
> >  $(mrproper-dirs):
> >  	$(Q)$(MAKE) $(clean)=$(patsubst _mrproper_%,%,$@)
> >  
> > -mrproper: clean $(mrproper-dirs)
> > +mrproper: clean objtool_clean $(mrproper-dirs)
> >  	$(call cmd,rmfiles)
> >  	@find . $(RCS_FIND_IGNORE) \
> >  		\( -name '*.rmeta' \) \
> > -- 
> > 2.51.0
> > 

