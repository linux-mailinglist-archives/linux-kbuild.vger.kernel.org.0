Return-Path: <linux-kbuild+bounces-11784-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOOsH3Q3sGlAhQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11784-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 16:23:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 66419253475
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 16:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D8B7306E215
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 15:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDFA1318BA8;
	Tue, 10 Mar 2026 15:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fu5+DH4v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B034E31717C
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 15:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773156038; cv=none; b=g5j2ytL6qfl4rXDTektytjUeUiqO22wS5Er1qJunpBryLeDqwQQpyNFI4XailT9aJEBFaT297OVbRUE18hjW4uOvNPdkzPZgS77cnMasIGn8f1O4+cPUq8CkyHfCalkghFNg83FICxKkQCyNBiBMDuHjYV2MmCkDlr9ZMBDJyLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773156038; c=relaxed/simple;
	bh=SYZPVJ10Kwp6XnWS5i6rBpPqQl0W9tJjyaomlFn7Qtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sa8I/Z7V2KVmy24DO/XC1Z1dnHk3x6/RjJ88U5l9rR6I/aBvGD9Mu7cDjLPcjZPvXh074xKwxYtXt3sNx8TMMnfV3i9MONAfLM9AKe1IWIpX9206kE31cBI8/clEb1dO1ZS7zfgG9xZG5hQgNXzQ7sEO4ljmerVZSDnlTCSS5r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fu5+DH4v; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439c9bdc1eeso3520275f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 08:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773156035; x=1773760835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L2/koJdZK95rU0leujZRvjliJH2foHXtNc8nZYKdbVs=;
        b=fu5+DH4vdS5//oTEXY5n42LxB6JFULdB9TnqKe2hiAN3MCIp3QD3XBH2MPwTYGpBtL
         ZLUqOO4RwGX1Io8C42RUAJbFo4YpF5CVl6izWTXZPzsw0x0UHSzCmyVm+YNnDT2KpnsL
         gxFx8i54q7qjPTSViVAnWNR6FcTP0sx6zMX3UA8y/qa4LNnP1EWfTDbCGeO7q46zNU4l
         PU0y9gLIntkPPkovTH74JM29GdJahk7p7SE0JN/scj1yHdIaLbbPdrgNyNgxuGjF/U5q
         MFGm8D7IjSut3qaLBre7JjPzMD8DPbnLDna/P2j+cPTc0tbGaOySUZZ93c+civQpXDRa
         xuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773156035; x=1773760835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2/koJdZK95rU0leujZRvjliJH2foHXtNc8nZYKdbVs=;
        b=SfH9YRS7ZiWGOL1+kuqPsIOTIshkHRaQSDQ/Vfd0Y1bzTcq0buuVP1Bh78rhCwoD6D
         toI+92EJd+3G6xVit5KRg60k0SFXKU/NE0jOcqyXnLsxLcpbXi31dyjbvIn9/54xJiDi
         i6yresQ3p//Jbd0IzB0JBuCe5I1hkp+LwnICUD7AYkJbGx2hMxMg9385pKHBah+o1Psf
         ckO0wqXc5zzyHxEdn44w+glRzNcHiK2EaJhTUx5VLmMQwR2qy5avgPQzeexAmYj+NiY2
         7pFuQn1jowgPnoqt/rkMRq1uWVDXoFDganZlxbpO2opngPRaYNlr9sqsKhvPRTOpBsKX
         nfoA==
X-Forwarded-Encrypted: i=1; AJvYcCV814j0y4yytKY5MjNKHk1Bw77loVxXHV+gtTc+5OIuCii/J/laC/Q7vEaBgT31xy3bRy2inMx++QP8t0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFaH68pYCjv2Dv06wQPCjWEW7Mwynbw3kwRWWfY9C+E5ufwCYN
	7QMha985eaRiQxIEn5z+QpNDV1ZrN7FEScfcTT595KdfdEC+rvpzDc0h+wCmc8Z/FP4=
X-Gm-Gg: ATEYQzyLTQtLijwPORf3zieme+vb+a/HEY0t1Y1CJeObzFw3wlYInei0nQzMbXECbZi
	v/qTPsNXPuJM8II7JOV/f1WOUyAjNDOPo/1/upUDZxaqzYSxban71SmUKqAY7IUKiZmHnAq4pdD
	fijzUSOdZkvlSNWeqUgsiAg7lkp6BjqFsdQqk5h91fMwrIRjknrxJ0vWaJcaXS+2gFJkhjU/a1S
	GNM/UESFPm3ygUW6b7tUsgw+mN6dfRucFtGsB0LKoOWLQrMN5OmP7dx4Dj2W/TGJomJaYGCD2vY
	RlWN7OxvFqaT8+LG4s5uIeBvzq0MMvTdJJ3ZrlBu9c8TY/GZT4wO6m9wPzDP8s5YM3wPPxld2s6
	csqjS+6q42q+LRAzGw9Uf5z7btfCNABgc/d+OJfgwH66fd8+toaKmApKAmGcmfYw44fJJVCiicL
	FlTtd+Hy3auglc7sWyZjVpM0FcVA==
X-Received: by 2002:a05:6000:2505:b0:439:b26a:216f with SMTP id ffacd0b85a97d-439da87c0bdmr28137929f8f.56.1773156034926;
        Tue, 10 Mar 2026 08:20:34 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97abasm33722231f8f.10.2026.03.10.08.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:20:34 -0700 (PDT)
Date: Tue, 10 Mar 2026 16:20:32 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Richard Weinberger <richard@nod.at>,
	Juergen Gross <jgross@suse.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Vlastimil Babka <vbabka@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] kallsyms: embed source file:line info in kernel
 stack traces
Message-ID: <abA2wOsJtK-g2NxY@pathway.suse.cz>
References: <20260303182103.3523438-1-sashal@kernel.org>
 <20260303182103.3523438-2-sashal@kernel.org>
 <aasClESfxETxliLB@pathway.suse.cz>
 <aasLhbZmvcQ8sA9P@laps>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aasLhbZmvcQ8sA9P@laps>
X-Rspamd-Queue-Id: 66419253475
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11784-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmladek@suse.com,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,pathway.suse.cz:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri 2026-03-06 12:14:45, Sasha Levin wrote:
> On Fri, Mar 06, 2026 at 05:36:36PM +0100, Petr Mladek wrote:
> > On Tue 2026-03-03 13:21:01, Sasha Levin wrote:
> > > Add CONFIG_KALLSYMS_LINEINFO, which embeds a compact address-to-line
> > > lookup table in the kernel image so stack traces directly print source
> > > file and line number information:
> > > 
> > > --- a/include/linux/kallsyms.h
> > > +++ b/include/linux/kallsyms.h
> > > @@ -16,10 +16,19 @@
> > >  #include <asm/sections.h>
> > > 
> > >  #define KSYM_NAME_LEN 512
> > > +
> > > +#ifdef CONFIG_KALLSYMS_LINEINFO
> > > +/* Extra space for " (path/to/file.c:12345)" suffix */
> > > +#define KSYM_LINEINFO_LEN 128
> > > +#else
> > > +#define KSYM_LINEINFO_LEN 0
> > > +#endif
> > > +
> > >  #define KSYM_SYMBOL_LEN (sizeof("%s+%#lx/%#lx [%s %s]") + \
> > 
> > I guess that this is used also in ftrace where there formatting
> > is delayed. We might want:
> > 
> >  #define KSYM_SYMBOL_LEN (sizeof("%s+%#lx/%#lx [%s %s] (%s:%u)") + \
> 
> KSYM_LINEINFO_LEN already covers the full expansion of the path and line
> number, not just the literal format characters. ftrace stores raw addresses and
> formats via %pS at print time into a KSYM_SYMBOL_LEN-sized buffer, so there
> shouldn't be an issue here.

I was curious why the sizeof("%s+%#lx/%#lx [%s %s]") was there.
It did not make much sense to count some "random" part of the
format string.

I expected that it was related to the ftrace delayed formatting.
But they are written to the tracing buffer, see trace_vbprintk().

But I believe that it does not need to be counted. It seems to be some
cargo-cult programming. The size has been counted first by the commit
d069cf94ca296b7fb ("kallsyms for new modules") back in v2.6.12-rc2,
see
https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=d069cf94ca296b7fb4c7e362e8f27e2c8aca70f1
And it seems that it was not needed there.

That said, we could not simply remove it witout revisiting the rest of
the computation. Especilly, we need to make sure that it counts all
extra characters, like spaces, brackets, and the trailing '\0'.

Ideally, we should replace the unsafe sprintf() with snprintf() in
all users. (>> TODO ;-)

> > >  			(KSYM_NAME_LEN - 1) + \
> > >  			2*(BITS_PER_LONG*3/10) + (MODULE_NAME_LEN - 1) + \
> > > -			(BUILD_ID_SIZE_MAX * 2) + 1)
> > > +			(BUILD_ID_SIZE_MAX * 2) + 1 + \
> > > +			KSYM_LINEINFO_LEN)
> > > 
> > >  struct cred;
> > >  struct module;

Best Regards,
Petr

