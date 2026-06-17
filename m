Return-Path: <linux-kbuild+bounces-13808-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kagzEtAVM2ox9QUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13808-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 23:46:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE43969C916
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 23:46:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=oiYF93Jb;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13808-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13808-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E87C304C350
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 21:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1788B37DEAB;
	Wed, 17 Jun 2026 21:46:42 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA283399CE2
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Jun 2026 21:46:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781732802; cv=none; b=WmNLqtZ5rJJnCIcOdX886DhbxZtgsovCxBe4HPt9V7nfFxeYfsw2cWCz0Ni2oWXslMRe1Q7HGvzxqgt5oIKfSlRJONWUTJJ/kOBkyF/E+HMbd3aTkZXidgtyfsZNaRIHt+JmVLeyyXYzO6RkHykT+9i4hgq6yc19WMMkivV3W9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781732802; c=relaxed/simple;
	bh=B3YNCCU3Rk8SaouEBFlE0myl4qXDShsUV7b0iDM/Dzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7Hlie6EgUkKoqsGhiZu2uG/ILmEZggxO9RncEaO4HpzTLX0kOwMH5RJ/XoJykO5IMG8l9C71goviHADwyCJhK80E18vfX4wXcXxuOBeY8aWL50eV0pQExBD8kKQmI4nEEeC65JpK23mETyhdoFGYnA2uIH79cqV1lhjs2Ten2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oiYF93Jb; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c168baac83so1232925ad.2
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Jun 2026 14:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781732800; x=1782337600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ldvcow43iF9SpjScIRNlK9Yg1AzDJ3co3e/z/l84bQU=;
        b=oiYF93JbmA0PU1yFiQReIuFpirK9f1vC43rbMcdPappKm87WMXEYBFuR0Qi5JXX0t7
         rwZMOA+RiQjL1bXBMTAcie+aUyAwOlt72PeG2IfrmPq8vNzQyv0hbOt2z0kNUCv2sAdJ
         G5A9+LXQHnFDas7/rY0l86ODKXnzrTkUHfBpop+AfEM4XFGawnFTki3HswCkOS54N30G
         NyJ3AvKSU/HT9i1T8mGx01+Phs/cKSowa4eKCwR50Gr9cgR5EqpZolgQCD0njpcKxJiw
         XNVuomSr3qhqw316qHkgHYY97V6n2Fo4LUoM4v1p8vgdNUW3Mr4o4XH7pk0IFK3dWmSB
         fLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781732800; x=1782337600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ldvcow43iF9SpjScIRNlK9Yg1AzDJ3co3e/z/l84bQU=;
        b=D9mrGqAOSLUzqN40Xw3sAG5h0/s1DqG8F4mxhpbYGSp0xWJStwBP+oMt8b7aLlMiTD
         BBHW1MgWKhlm+tLHwxrRtNm4vgTb7x9RXJJxXrkwuOoKrZZnkBeg04a9VhdgHBKnafb+
         nb6V9sKMGem8z8L8qwb1j1mhFuWlfTbzKnTiCV9k6JnBDnQZxBJZ5QxkEm5hIfdELyN+
         hXlyR5HQ+4z3OTw+qjWSYrDJVdPgwXekEXynaxh2Kd3sPYLRs4sGAR/WnbRhflD8I/6u
         ey7UnWs2JEy6QMXc5VmLvPWr19cu1YuR/wbPEI3VGv/BN66t5Tlj4c3lhwz4XOYrrJVl
         2O4g==
X-Forwarded-Encrypted: i=1; AFNElJ+A6iPHerFFIVK1t330md5scljbs8lDH3GWnQPbu59bAkX4XIi0k+avl/ujWvq0e34fgGINreEtpYb82mI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx1z2iw1znCjTbhL2eG9QHf9vgvDdw8u3pUdDWnY00XVRd04jn
	2BVvgICwkf8hUHW86qMUj+0Cqrx5FpR7BJcXZouh2Pr/IcneYGUF3thJnbQ5AhUq
X-Gm-Gg: AfdE7clUX/OmbmJC6ZLpIEsxSKgXzQYK5FxFObYbMVFqpNe1qrycxT9A/6PvD0KMnHq
	WXikggKVgZa1CUgzXfMgbvIfW8+AsXyZZXoLow8QQmF7nghBtwvHI/F1UzOWbPnve4lTIeI1qIU
	M4ymTapP/gWTwmfX7RrnsQKc2an38PQwjDkYCQrLs/ab6pPi7XOay8ytyKoUnTQx4Y6ctJB14vp
	vEizHpS/XybC8hY0mGL0mVDgJxXrPHeJ5/BPNUL64MLK/SiuBWZul5tdR/jBh3qFA0Nm74t66YI
	6ilXIjOd4bM1/SCusVtriwEr2za0tq/Jr5bhPIr56ynRRCFR979R4xVgFy+rKudXWOQ+0crf57q
	uwe8CTMrz5vDZ6zj+LIJ4c/wfX+TzQcmZHydtKoxKImokmXFx3jyu7z2X0Z88M0AVUPbnNjbhD4
	j4y8xSnBNdCxBxGPeJ
X-Received: by 2002:a17:903:2b0f:b0:2c6:6424:c79f with SMTP id d9443c01a7336-2c6bbf98e47mr59486285ad.8.1781732800024;
        Wed, 17 Jun 2026 14:46:40 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:857b:d001:f2a2:fc3a:85db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433558449sm181860165ad.78.2026.06.17.14.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 14:46:39 -0700 (PDT)
Date: Thu, 18 Jun 2026 04:46:35 +0700
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH] modpost: release allocation when early return no suffix
 .o in read_symbols()
Message-ID: <20260617214635.GA4766@soyboi>
References: <20260610052550.187006-1-robertusdchris@gmail.com>
 <178167011232.2064238.5669414796099955471.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178167011232.2064238.5669414796099955471.b4-review@b4>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13808-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[robertusdchris@gmail.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kernel-mentees@lists.linuxfoundation.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robertusdchris@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[soyboi:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE43969C916

Hello Nathan,

On Tue, Jun 16, 2026 at 09:21:52PM -0700, Nathan Chancellor wrote:
> On Wed, 10 Jun 2026 12:25:50 +0700, Robertus Diawan Chris <robertusdchris@gmail.com> wrote:
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index abbcd3fc1394..8e231544f9f3 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -1585,6 +1585,7 @@ static void read_symbols(const char *modname)
> >
> >  	if (!strends(modname, ".o")) {
> >  		error("%s: filename must be suffixed with .o\n", modname);
> > +		parse_elf_finish(&info);
> >  		return;
> >  	}
> >
>
> Thanks for the patch! While this change appears to be correct, would
> moving the strends() if block before the parse_elf() one resolve this as
> well?

Yes, moving the strends() if block before the parse_elf() also resolve
this too. The reason I didn't do that because I am still not sure if
changing the order will have any effect. I already take a look at the
code and it looks like strends() if block and the parse_elf() didn't
depends on each other, but just in case I missed something, I decided
not to change the execution order and just add parse_elf_finish().

> I think I would prefer going that route because neither check really
> depends on the other and we have to think less about unwinding
> with the checks flipped.

Now that you already confirm that neither check depends on each other, I
am more confident to take this approach.

> Furthermore, modpost is a relatively short running host utility, so
> I don't really think it is worth optimizing for resource leaks like
> this.

I want to confirm something first, do you mind if I send v2 patch with
the change of moving strends() if block before parse_elf() in
read_symbols()? I mean, if you feel like this is unnecessary, I will
drop this patch. I don't mind either way.

Thank you for the feedback.

Best regards,
Robertus Diawan Chris

