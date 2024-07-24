Return-Path: <linux-kbuild+bounces-2641-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8B193AFF9
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 12:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41BF9B21C76
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 10:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C2015572D;
	Wed, 24 Jul 2024 10:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="cA8VTP8K";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="icUEI4kH";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="C5uXpPD1";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="dmtKxbME"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78495695
	for <linux-kbuild@vger.kernel.org>; Wed, 24 Jul 2024 10:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721818270; cv=none; b=sAglJbqG5mPxRaUAG5Pu0Mb1Ek0DIhgobsq639ZC+Fr/6JSCRTV0yqWAyQMHgwKaI3atIQRx5ay3dS4+6N/ig9fykJZ7NK74x1nDEpanHqyNrrxXRziLFfB2iOFsZoHA7u/7xOg02IU2WQBEkm6D7gZL3FZiIhrWsXOl82wIu+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721818270; c=relaxed/simple;
	bh=97LZsVtUg4Oh1FL4R5Fzl551F1I68maFEBJO1779OxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgkZSQsj0CNJlv6AavkQOrMWMna66gULGedK/bpcnwUFlrv5X3vNY2+PsmbwNfz3RxBMQFghVqqwjGZyS0up/g9PviNuhIojr9WRyjxTklAb7byxG9RoPP+bMcIlhoZmKa4zeaIOOWxXaMpPi7DffQBdwkzUhBfFnABVpn9Wf8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=cA8VTP8K; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=icUEI4kH; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=C5uXpPD1; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=dmtKxbME; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D02F81F79A;
	Wed, 24 Jul 2024 10:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1721818267;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svJS/8EYxdTBX55YQjVS++deWy+ppwT7MTXRnqRwCiQ=;
	b=cA8VTP8KIYbuQyUNNb/uj/4Blve4Az09+yT7UzfXpi/kVSfOzCV52Rll8LlX8inFkpJrU/
	FdnpsCgb2qdwJBLO0milr877aAV9/dcYMHh5kaWjgJm5TTRtXELda0cbMuFgQqAwzb5Xa7
	l+U37SPhF00UZOFarnrxlMm3WgSBmGA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1721818267;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svJS/8EYxdTBX55YQjVS++deWy+ppwT7MTXRnqRwCiQ=;
	b=icUEI4kHD9dWYY4JdgFeVtleqAuFiXV4O8WRW/En81xFXDHVopp8BhFaFtbK6SNOTosYv/
	W62U+4urN8wx8LCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=C5uXpPD1;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=dmtKxbME
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1721818265;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svJS/8EYxdTBX55YQjVS++deWy+ppwT7MTXRnqRwCiQ=;
	b=C5uXpPD1NP8xSez/7D/xBOWuZXCtWYWrE9F1nw34PqelmbyVucT1pKKB7U/AFxbh6qf2bm
	bCwjXeAbQx6WAEJKd+LlC4RkOfl/k2q/lkqfqGL9YYf1Sm44SuzEYv+o0gokqzMDH/dUgy
	57G+bM4JPlKXqPCuunM70G2nB7tUKTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1721818265;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svJS/8EYxdTBX55YQjVS++deWy+ppwT7MTXRnqRwCiQ=;
	b=dmtKxbMElET8rfW0cSh1JHsAWrzQOTinistEfnCsfMUSsxZ671brsgrGpQwas+al5UsqK+
	GTKag1rc8/f9NLAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 818851324F;
	Wed, 24 Jul 2024 10:51:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PYWZG5ncoGZkawAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Wed, 24 Jul 2024 10:51:05 +0000
Date: Wed, 24 Jul 2024 12:50:58 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Rafael Aquini <aquini@redhat.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: Fix C locale setup
Message-ID: <20240724105058.GA937292@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20240724084655.930706-1-pvorel@suse.cz>
 <CAK7LNASwTmrtgROXW_CVWX2Bjb9q=uMu7TxYkBQ6MBBTuJ_PVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASwTmrtgROXW_CVWX2Bjb9q=uMu7TxYkBQ6MBBTuJ_PVw@mail.gmail.com>
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: D02F81F79A
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[somehost:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:dkim,suse.cz:email,suse.cz:replyto];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCPT_COUNT_THREE(0.00)[3];
	REPLYTO_EQ_FROM(0.00)[]

Hi Masahiro,

> On Wed, Jul 24, 2024 at 5:47 PM Petr Vorel <pvorel@suse.cz> wrote:

> > semicolon separation in LC_ALL is wrong. Either variable needs to be
> > exported before as a separate commit or set as part of the commit in the
> > beginning. Used second variant.

> > This fixes broken build on user's locale setup which makes 'date' binary
> > to produce invalid characters in rpm changelog (e.g. cs_CZ.UTF-8 'čec'):

> > $ make binrpm-pkg
> >   GEN     rpmbuild/SPECS/kernel.spec
> > rpmbuild -bb rpmbuild/SPECS/kernel.spec --define='_topdirlinux/rpmbuild' \
> >     --target x86_64-linux --build-in-place --noprep --define='_smp_mflags \
> >     %{nil}' $(rpm -q rpm >/dev/null 2>&1 || echo --nodeps)
> > Building target platforms: x86_64-linux
> > Building for target x86_64-linux
> > error: bad date in %changelog: St čec 24 2024 user <user@somehost>
> > make[2]: *** [scripts/Makefile.package:71: binrpm-pkg] Error 1
> > make[1]: *** [linux/Makefile:1546: binrpm-pkg] Error 2
> > make: *** [Makefile:224: __sub-make] Error 2

> > Fixes: 301c10908e42 ("kbuild: rpm-pkg: introduce a simple changelog section for kernel.spec")
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> >  scripts/package/mkspec | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)

> > diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> > index ead54d67a024..4dc1466dfc81 100755
> > --- a/scripts/package/mkspec
> > +++ b/scripts/package/mkspec
> > @@ -50,6 +50,6 @@ fi
> >  cat << EOF

> >  %changelog
> > -* $(LC_ALL=C; date +'%a %b %d %Y') ${name} <${email}>
> > +* $(LC_ALL=C date +'%a %b %d %Y') ${name} <${email}>
> >  - Custom built Linux kernel.
> >  EOF
> > --
> > 2.43.0




> Ah, right. Thanks.



> I also noticed this mistake in Rafaels' initial submission, then
> I suggested the correct code without the semicolon:

> https://lore.kernel.org/linux-kbuild/CAK7LNAQba5CDetpwevSoaOLJ21s1tO9ZHh=7gJpPCNK0AnHfJw@mail.gmail.com/



> He tried to modify the code on his way over again,
> then I missed that he had restored the semicolon.
> I should have taken the code diff.
> :-(

Thank you for an explanation, quick review and merge!

Kind regards,
Petr

