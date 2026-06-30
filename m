Return-Path: <linux-kbuild+bounces-13913-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T9j1LkoPRGpRnwoAu9opvQ
	(envelope-from <linux-kbuild+bounces-13913-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 20:47:38 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A956E74D8
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 20:47:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YojHFuKy;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13913-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13913-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A8343049282
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 18:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802AE3DEAFB;
	Tue, 30 Jun 2026 18:42:46 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5393E1227;
	Tue, 30 Jun 2026 18:42:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782844966; cv=none; b=opCItgFApZ9Mldl7thpQMJXYR990fvpi1cqVXNnihh/GOh3qHl+tmje+ha6QhDD/Ey7yxlc+epybf+f2OCIKwQWHsA6jfwogdH+h3ljkFzsjOCracYLGWpDWyf2/iDDfLKdix5vGGzrl6udo+qbCKXx7qH7qNx+Qb1yhOIdqvBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782844966; c=relaxed/simple;
	bh=h/yPpWx9QpGyU05Nsl765TyNDYLBv548P+mz4VTC2uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWoLh7Y6ETG0x9wHfLjs2Poh5txrcRzzG4kdr6fhaf6g4RdVeYS96IBGGHXaLhAAXJBppIOvU+VYotXzDMC4LRgRZDTh7kM3ZjKJztB9kqoe6YUKm3Ec7Am7cLcBXMyc3jIsJeMhN5oF/WDZ7ljgoikO2wKvHq/izoTFZn58OuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YojHFuKy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9BE1F000E9;
	Tue, 30 Jun 2026 18:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782844965;
	bh=9tFG00Hk8/WgrJ//6NehQxW9q4u1YSlGYONG4duVbVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YojHFuKy2opr20Fz7eIB8TNmkD0HhoHtpnM0mBWPScJdB5GMP/GylvTkbc8gFbNxG
	 u1bFBmVNeQJ0BMg+vV5DB89w5rpfOskvgAqpX97BYaRLlzBernfycWKXPrkltYUUnr
	 xEQeCdBrzNaczH06IeYHs20FA5OEWcZ68RSgvQYiXMFmWyqhwkJBHvH/lWM/LVD8rV
	 P/KdXpxUSeWeCcuGeQ7QCcqTEMVGIi1ss6/iM+7gBgeUV7/RZa7Cr/y3POJbvnFA5C
	 YDdkX4qjHPLk6YCWnqNZjd6T1DVepIFypFPWnJZiYtOIsayygE0IeQewhXb13lGHB8
	 2KXnoL0MjLLEQ==
Date: Tue, 30 Jun 2026 11:42:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: "Joy H.J. Lee" <rkr0k0r@gmail.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, masahiroy@kernel.org
Subject: Re: [PATCH] tools/compiler: match glibc 2.42 definition of
 __attribute_const__
Message-ID: <20260630184241.GA327950@ax162>
References: <20260630145840.2717960-1-rkr0k0r@gmail.com>
 <20260630184106.7bb3f22f@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630184106.7bb3f22f@pumpkin>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:rkr0k0r@gmail.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:masahiroy@kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13913-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ax162:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18A956E74D8

On Tue, Jun 30, 2026 at 06:41:06PM +0100, David Laight wrote:
> On Tue, 30 Jun 2026 23:58:40 +0900
> "Joy H.J. Lee" <rkr0k0r@gmail.com> wrote:
> 
> > glibc 2.42 added __attribute_const__ to sys/cdefs.h:
> > 
> >     # define __attribute_const__ __attribute__ ((__const__))
> > 
> > GCC 15 warns when a macro is redefined to a different replacement list
> > (-Wbuiltin-macro-redefined). Since host tool Makefiles (resolve_btfids,
> > objtool) pass -Werror, this conflict becomes fatal when building with
> > glibc 2.42 and GCC 15.
> > 
> > Per C11 §6.10.3, identical replacement lists are accepted silently.
> > Match the glibc definition exactly, including the space before "((", so
> > the redefinition is accepted without warning.
> > 
> > Signed-off-by: Joy H.J. Lee <rkr0k0r@gmail.com>
> > ---
> >  tools/include/linux/compiler.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/include/linux/compiler.h b/tools/include/linux/compiler.h
> > index f40bd2b04..f2f54b038 100644
> > --- a/tools/include/linux/compiler.h
> > +++ b/tools/include/linux/compiler.h
> > @@ -119,7 +119,7 @@
> >  #define __read_mostly
> >  
> >  #ifndef __attribute_const__
> > -# define __attribute_const__
> > +# define __attribute_const__ __attribute__ ((__const__))
> 
> That doesn't look right, you are completely changing the value
> when it isn't already defined.

That's the point, no? If compiler.h is included before sys/cdefs.h, you
would get an instance of -Wbuiltin-macro-redefined like described in the
commit message. I am sure this is fine, we unconditionally define it in
compiler_attributes.h.

For the record, I have not seen an error like the commit message
describes in any of my build tests or environment. It would be good to
know under what circumstances this actually happens (or is this just
some contrivied issue or AI hallucination?).

Lastly, I don't think this should go through Kbuild, we don't touch
tools/. Perhaps this should go through Andrew Morton?

> >  #endif
> >  
> >  #ifndef __maybe_unused
> 

-- 
Cheers,
Nathan

