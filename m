Return-Path: <linux-kbuild+bounces-13916-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yLVwBvEuRWpb8QoAu9opvQ
	(envelope-from <linux-kbuild+bounces-13916-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Jul 2026 17:14:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A87D26EF292
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Jul 2026 17:14:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=OnD1l4rK;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13916-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13916-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30D8F3022F52
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Jul 2026 15:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB23407598;
	Wed,  1 Jul 2026 15:14:30 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960DC3FFAC1
	for <linux-kbuild@vger.kernel.org>; Wed,  1 Jul 2026 15:14:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782918870; cv=none; b=j3MLLgv8oluSe8PDRhXRskxg3iDBtwr2zGdCIgAkHPz4kFofo1j/hu4h+y9a0pZ3x2F4hAWlzJxlbmNYbDrqWKQv4ZVg+J7ifIoRdxDEh8OBuW7z4GboR3jP5J/CMgz/iHZDt4G9n5b8p4CiefxXV5nui7UMTm9M12bNjnzGmxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782918870; c=relaxed/simple;
	bh=usd6Og46zgL8OHwYEQAfxolvwYRP5G/TAyvCg/TextU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptYFeetrAUTg8kW86f+ocFVw8jtAyTHUa32x6ZH0k9HUOsLeTb1RkHC5Up5C3EmNuQonWY0ZGldxnkT6/NcY1XWRjTn8VBlmSrwaQUc3K8ViylxQirPFrJC78mcLd5TT3qhBq1I8U1deCnK/ck+YkWJV63YU/y9CVgieYP+d3BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OnD1l4rK; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493be1b9682so5957215e9.2
        for <linux-kbuild@vger.kernel.org>; Wed, 01 Jul 2026 08:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782918867; x=1783523667; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4uOOS0i9hpZWdGU1QnLKFN1aQHTMiBN/08DuR6TYPb0=;
        b=OnD1l4rK4mZyoVxa93LfsPS4E0YOaE4GkT/euRQ0MWfe4pBifO067RaEUeOiCuWmm+
         533D4X78VpJ63v2ujCsqXFAheGavUSXfWS2YdZ3aWmvPJpWaQkyCQwknOyByDy54RAsf
         DiNrgCyNGCBVD+P/yM3KiQgq7SDinGDzCIQH5BrH0h5XlborLavNps4apouMiDbRA8G4
         jydSYYN7A2QXHVkpgylH2VWFDfU4ndk9D38AfRgUBPHim79ESYzE79bAx8DLx5Y3ubjM
         0xONr2EQ+x6u18DdKd9ww6+307x10UsXksPn5IusnKkaPpI9qCHqeFfrDLYb8uLlXqBz
         J1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782918867; x=1783523667;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4uOOS0i9hpZWdGU1QnLKFN1aQHTMiBN/08DuR6TYPb0=;
        b=EohypicF7XMnSB6IUvsmfX2jVPDXEN0jz36R4Wm0hPhjGj17X3fRfdfTQS377pg0y6
         iq3UEIDwsqSwtGI8eb6IY9w+zGg1RscaQMX054FfwiG6iSYzEo0Map2TWOKCgCFMjjBV
         0MCwYInEtiklPaC+ArBpfCng7x/p/AJ4kFS5yn/V9gR8OIEnerzOnAETn1W07Rr4a+Q7
         smDUmGl3/BrpLfs1eTe4NKO6AH0uuAqG86B6XNCN+lQRJ9sBsQfbza8cxH0Cw3MZ2T9K
         6JO4+9i0XUDUV7/jYOHvVX/RIMJqwkSxYnRNUZR/aWgVqwdTJoiODc/o+u3oC9hyZx1Q
         4DjA==
X-Forwarded-Encrypted: i=1; AFNElJ+ddWYESPmLv6wqPjpxM9r2tKnG5YXNgcOW/BJ8k8dpkxa39XyGAeIZOG3V3ievgZAMvW+qDSt34W38e8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgSxp8l+zCr8SLED+GATdDgGGpyXefYCo9UpflMGXZDDudznYL
	+/HbtEj9p7CqAg8Q9a6duqmPAX3HcM4Zrfv6KFIRU4xdQ4qI3T/YWG46PQUfRpZ0d7s=
X-Gm-Gg: AfdE7cnXsaFh9MvcFxexvk7/m46vqYmVrcvtelpDSQK7Z6nmhP8tiIg6eO94DvZOxwb
	Gj0wszHxbYiIiBCayusDH8D28IMvWIXEvcZhAG9IVykuklvyRJM7Kw0Dwn2fMtQbqM0WhY3KHAk
	1E1TWxezGchGC4w2ae36evbol7f15f+e0de8aQXrlu/PsqScO0ZprVBmUnABP73+ypEe0lTVsbF
	q2RjVdY6x50Gad4CubKJDd+OXlhn0rIYszprbbmeWIJOEWUWc8SHTL1N2Am7BDUg5M6RVJtL/ys
	0o0R3xy7Nm4n4ytyar9hUhBKqQT6sDZT3nBuTk3HhsartsBmGCyUf3FsQac2yemyqK7kn8ptwiI
	CAqyk208iw0IU/2spDM9D3UrEzsZc1a+bFhwZ/NJrZfKMWjFsYyO5jhElS4SnNU6vz0I62tOTOY
	V/b2WCThl3c0R/fiA=
X-Received: by 2002:a05:600c:35d0:b0:493:c3cb:409e with SMTP id 5b1f17b1804b1-493c3cb42d9mr20649135e9.15.1782918867006;
        Wed, 01 Jul 2026 08:14:27 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be810be8sm78287565e9.9.2026.07.01.08.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 08:14:26 -0700 (PDT)
Date: Wed, 1 Jul 2026 17:14:24 +0200
From: Petr Mladek <pmladek@suse.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Zelin Deng <zelin.deng@linux.alibaba.com>,
	Miroslav Benes <mbenes@suse.cz>, shuah@kernel.org,
	linux-kselftest@vger.kernel.org, live-patching@vger.kernel.org,
	mpdesouza@suse.com, Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] selftests: livepatch: unset sub_make_done in case top
 level Makefile be overwritten
Message-ID: <akUu0DEYrhd9cLCL@pathway.suse.cz>
References: <20260525083721.27857-1-zelin.deng@linux.alibaba.com>
 <alpine.LSU.2.21.2606191638540.26638@pobox.suse.cz>
 <ccfed9b6-9a73-4299-b305-da7b593a52fd@linux.alibaba.com>
 <akPTcJjrIAI1ZNyH@pathway.suse.cz>
 <20260630181125-a7a41726-4270-4bb7-92fe-17ec28cbe176@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630181125-a7a41726-4270-4bb7-92fe-17ec28cbe176@linutronix.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13916-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pmladek@suse.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:zelin.deng@linux.alibaba.com,m:mbenes@suse.cz,m:shuah@kernel.org,m:linux-kselftest@vger.kernel.org,m:live-patching@vger.kernel.org,m:mpdesouza@suse.com,m:nathan@kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmladek@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,suse.com:dkim,suse.com:email,suse.com:from_mime,pathway.suse.cz:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A87D26EF292

On Tue 2026-06-30 18:12:46, Thomas Weißschuh wrote:
> Hi Zelin,
> 
> On Tue, Jun 30, 2026 at 04:32:16PM +0200, Petr Mladek wrote:
> > Added some people involved in "filechk_makefile" feature into Cc.
> > 
> > For the new people, see the whole thread at
> > https://lore.kernel.org/all/20260525083721.27857-1-zelin.deng@linux.alibaba.com/
> 
> Thanks for the report and forwarding it.
> 
> > On Sun 2026-06-21 22:36:24, Zelin Deng wrote:
> > > 
> > > 在 2026/6/19 22:42, Miroslav Benes 写道:
> > > > On Mon, 25 May 2026, Zelin Deng wrote:
> > > Here're how I reproduce the issue:
> > > 
> > > 1. pull linux-next, reset to HEAD, for example
> > > 3ce97bd3c4f18608335e709c24d6a40e7036cab8 (tag next-20260619)
> > > 
> > > 2. at linux-next tree: make all -j$(nproc) && make modules_install
> > > headers_install -j$(nproc) && make install && reboot
> > > 
> > > 3. at linux-next tree: make kselftest-all
> > > 
> > > 4. top level Makefile in linux-next has been overwritten by
> > > 
> > >     export KBUILD_OUTPUT = .
> > >     export KBUILD_EXTMOD = /home/shiyu.dzl/linux-next
> > >     export KBUILD_EXTMOD_OUTPUT = /home/shiyu.dzl/linux-next
> > >     include /home/shiyu.dzl/linux-next/Makefile
> > > 
> > > it is a stub generated by filechk_makefile.
> > 
> > It seems that "filechk_makefile" has reached mainline in v7.1-rc1,
> > see the commit c9bb03ac2c66bc5aa81b ("kbuild: reduce output spam when
> > building out of tree").
> > 
> > The commit message says:
> > 
> > <paste>
> >     The Makefile is now created even if the build is aborted due to an
> >     unclean working tree. That should not make a difference in practice.
> >  </paste>
> > 
> > It seems that is actually makes a difference in the livepatch selftest
> > case.
> > 
> > Sigh, the Makefile rules are a maze to me. It is possible that
> > we do something wrong in
> > tools/testing/selftests/livepatch/test_modules/Makefile. Namely
> > with:
> > 
> > ifneq ("$(wildcard $(KDIR))", "")
> > 	$(Q)$(MAKE) -C $(KDIR) modules KBUILD_EXTMOD=$(TESTMODS_DIR)
> > endif
> > 
> > But I see "$(MAKE) -C ..." called in many other makefiles.
> > 
> > Best Regards,
> > Petr
> > 
> > > I'm not quite sure that it could be related to my toolchain (like make
> > > version ?), I briefed analysis the root cause on my environment (KDIR
> > > '/lib/modules/7.1.0-next-20260619/build' which actually a symbol link to my
> > > kernel source -> '/home/shiyu.dzl/linux-next'):
> > > 
> > >   1. sub_make_done leaks via environment. The top-level Makefile sets export
> > > sub_make_done := 1 after its first-pass initialization.
> > >   Because it is exported, every child make process inherits it.
> > >   2. livepatch test_modules re-invokes the top-level Makefile. The call
> > > chain is: top-level Makefile → kselftest-% pattern rule →
> > >   tools/testing/selftests/ → livepatch test_modules/Makefile → $(MAKE) -C
> > > $(KDIR) modules KBUILD_EXTMOD=..., which re-enters the top-level Makefile to
> > >   build an external module.
> > >   3. The inherited sub_make_done=1 skips critical initialization. The
> > > top-level Makefile's first-pass block (ifneq ($(sub_make_done),1)) is
> > >   skipped entirely. This block is responsible for correctly parsing
> > > command-line variables and setting up KBUILD_EXTMOD-related paths.
> > >   4. Path mismatch triggers false out-of-tree detection. With the
> > > initialization skipped, srcroot and CURDIR end up with mismatched values
> > > (e.g.,
> > >   absolute vs. relative). The comparison (ifeq ($(srcroot),$(CURDIR)))
> > > fails, so building_out_of_srctree is incorrectly set to 1.
> > >   5. outputmakefile overwrites the source tree's Makefile. Because
> > > building_out_of_srctree is set, the filechk_makefile rule fires and replaces
> > > the
> > >   real top-level Makefile with a generated stub containing KBUILD_OUTPUT,
> > > KBUILD_EXTMOD, and an include directive.
> > > 
> > >   Why make -C tools/testing/selftests/ all is unaffected: it enters the
> > > selftests directory directly without ever executing the top-level Makefile
> > >   first, so sub_make_done is never exported into the environment. When
> > > livepatch test_modules later invokes $(MAKE) -C $(KDIR), the top-level
> > > Makefile
> > >   runs its full initialization normally.
> 
> Can you try this:
> 
> diff --git a/Makefile b/Makefile
> index b9c5792c79e0..f717a4dc96d6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1591,10 +1591,10 @@ tools/%: FORCE
>  
>  PHONY += kselftest
>  kselftest: headers
> -	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> +	$(Q)unset sub_make_done; $(MAKE) -C $(srctree)/tools/testing/selftests run_tests
>  
>  kselftest-%: headers FORCE
> -	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests $*
> +	$(Q)unset sub_make_done; $(MAKE) -C $(srctree)/tools/testing/selftests $*
>  
>  PHONY += kselftest-merge
>  kselftest-merge:

Heh, this is exactly the same change which Zelin Deng proposed as
well, see
https://lore.kernel.org/all/20260525083721.27857-1-zelin.deng@linux.alibaba.com/

> The same is done for cmd_install.

I guess that this is related to the commit 14ccc638b02f9ec ("kbuild:
cancel sub_make_done for the install target to fix DKMS"). Which
is related to the commit bcf637f54f6d2515d ("kbuild: parse C= and M=
before changing the working directory").

Honestly, it all looks like a wild magic to me. I would need much
better understanding of the Makefile maze to get on top of it.

But it seems that it is a reasonable fix after all. It solves the
original problem. It does not break my workflow. So, I tend to add:

Acked-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

