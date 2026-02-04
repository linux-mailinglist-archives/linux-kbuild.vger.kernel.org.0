Return-Path: <linux-kbuild+bounces-11030-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KhBLucdg2nWhwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11030-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 11:22:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 607AEE46CE
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 11:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62BDD30090B4
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 10:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B515D3D904F;
	Wed,  4 Feb 2026 10:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="biDB2fTD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EACA2FD1C5;
	Wed,  4 Feb 2026 10:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200548; cv=none; b=taTVTxIX9h9Z3TOJMCNhgaKolq7Dbmcef8UiskJPhiEf4qDasEWj6K4vwg7rlsJxk4uyQaaOeuGvgK9ogzKXE80X6AjWnMx2iedoBV6CgJdiQq2WrhhoQapiCKscMvK9+fWPfQKhjsstI+Cuzm7D2l5u8BU4dhY2+EQhDH/5+kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200548; c=relaxed/simple;
	bh=FuuUMY5kTlX4oAjmUdlYn8Nb+GmKyjMCwEvnO1uffuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGBrH9vsTEy/2KzPYzd86z6405t9vsQWq8aD0jphly1RC0tpxR2VnQtqLN0VLzLIyVMMdhdU83ycb4RMUR8n1eruBOzxswS7IE22PF0q7ST4ZCzZNOBMGYwVUtVZCkU+UMPyW4ipvIafooRVxM9PpOYR2fckWLbeyg7Ikm/V7ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=biDB2fTD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B69C19422;
	Wed,  4 Feb 2026 10:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770200548;
	bh=FuuUMY5kTlX4oAjmUdlYn8Nb+GmKyjMCwEvnO1uffuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=biDB2fTDUN0MWsvbNEv/Y0xVLLwDTdNng/UlogpiG3P4Y9Eyy2p7uVn2lm/NYyIl5
	 bQjCORNd8csIJcC1vRO4sNgpiz88YR1ym+XkdJjkuBHitl4itY0pHl7WAi8K58W6hp
	 qS9Ch4GJ2aBdvQ7QG7F4HU2bSHzhTx79a++jImcQwfcEmAtb4iP0oZmkmcqH3Whxng
	 QY7+sIx9A5Q2ckB0rTISM69q2uiDT/709zuGzR2abdSxLWxk2Gdqi6VEGka8wTux+d
	 QzUlqiNd4N7KTpxTtyFGBvlDnIdkUSBEpWwHOL6pe4m40dILc7AcojBhkfyXsGfDO4
	 Oj+8RnI9Ghc6w==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vna1i-00000004r7W-1nx3;
	Wed, 04 Feb 2026 11:22:26 +0100
Date: Wed, 4 Feb 2026 11:22:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Rong Zhang <i@rong.moe>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] kbuild: Do not run kernel-doc when building external
 modules
Message-ID: <aYMUc5FVbROqtY6s@foz.lan>
References: <20260130-kbuild-skip-kernel-doc-extmod-v1-1-58443d60131a@kernel.org>
 <176987242178.1743608.5094531752561489739.b4-ty@kernel.org>
 <CAK7LNARR9bZQ9t9emcVzmL+P7xYemu=8s8v_LshQ0-m_zEE9mA@mail.gmail.com>
 <20260204073903.GA1632007@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260204073903.GA1632007@ax162>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11030-lists,linux-kbuild=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,huawei];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 607AEE46CE
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 12:39:03AM -0700, Nathan Chancellor wrote:
> Hi Masahiro,
> 
> Good to see you around.
> 
> On Wed, Feb 04, 2026 at 04:02:10PM +0900, Masahiro Yamada wrote:
> > On Sun, Feb 1, 2026 at 12:15 AM Nicolas Schier <nsc@kernel.org> wrote:
> > >
> > > On Fri, 30 Jan 2026 14:37:47 -0700, Nathan Chancellor wrote:
> > > > After commit 778b8ebe5192 ("docs: Move the python libraries to
> > > > tools/lib/python"), building an external module with any value of W=
> > > > against the output of install-extmod-build fails with:
> > > >
> > > >   $ make -C /usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build M=$PWD W=1
> > > >   make: Entering directory '/usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build'
> > > >   make[1]: Entering directory '...'
> > > >     CC [M] ...
> > > >   Traceback (most recent call last):
> > > >     File "/usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build/scripts/kernel-doc.py", line 339, in <module>
> > > >       main()
> > > >       ~~~~^^
> > > >     File "/usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build/scripts/kernel-doc.py", line 295, in main
> > > >       from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
> > > >       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > >   ModuleNotFoundError: No module named 'kdoc'
> > > >
> > > > [...]
> > >
> > > Applied to kbuild/linux.git (kbuild-fixes-unstable), thanks!
> > 
> > 
> > I believe this is a wrong direction to go.
> > 
> > Since kernel-doc is a part of Kbuild,
> > all dependent libraries should exist under scripts/.
> 
> Is this around the recent moves such as 778b8ebe5192? I guess Kbuild was
> never consulted on that change and I missed eba6ffd126cd, despite being
> CC'd, so that is on me.
> 
> I did wonder if it was worth it to package these files in a previous
> change but Mauro seemed somewhat opposed to it (but maybe I
> misinterpreted something):
> 
>   https://lore.kernel.org/20260130063056.72fbe458@foz.lan/

Not really opposed. The point is that, on a normal run, kernel-doc
is executed with -none, to check if are there a trouble with the
kernel-doc markup (there's a kconfig option for such purpose).
Also, it is not the only tool that it is executed on such case,
on a normal build. See docs/Makefile (*):

    ifneq ($(MAKECMDGOALS),cleandocs)
    # Check for broken documentation file references
    ifeq ($(CONFIG_WARN_MISSING_DOCUMENTS),y)
    $(shell $(srctree)/tools/docs/documentation-file-ref-check --warn)
    endif

    # Check for broken ABI files
    ifeq ($(CONFIG_WARN_ABI_ERRORS),y)
    $(shell $(srctree)/tools/docs/get_abi.py --dir $(srctree)/Documentation/ABI validate)
    endif
    endif

(*) The only difference is that kernel-doc call is currently sitting
    at scripts/Makefile.build. Perhaps it could make sense to move
    it to docs/Makefile.

-

I think it is not worth running any such documentation-validation-tools
when doing OOT driver builds, as their goal is to ensure a good
quality of documentation within the Kernel, and OOT drivers usually
have a lot more problems than just documentation, but it is up to you.
I'm ok with either solution.
 
> Perhaps tools/docs could be moved to scripts/docs and tools/lib/python
> could be moved to just lib/python to have everything live logically
> outside of tools/ and make it easier to package?

The idea of moving it out of scripts is because scripts became
a no-man's land, with lots of mixed stuff. From my side, I don't
care much about its location, provided that the path is very short.

-

That's said, if you want htmldocs/mandocs/... targets to work
with OOT builds, you don't really need kernel-doc executable, 
as Sphinx uses kdoc libraries directly. Yet, you need a lot
more:

1) tools executed by docs/Makefile:

    tools/docs/sphinx-build-wrapper
    tools/docs/sphinx-pre-install

2) Sphinx config and extensions:

    Documentation/conf.py
    Documentation/sphinx/
    Documentation/sphinx-includes/
    Documentation/sphinx-static/

3) Libraries used by sphinx-build-wrapper and sphinx extensions:

    tools/lib/python/jobserver.py
    tools/lib/python/abi/
    tools/lib/python/feat/
    tools/lib/python/kdoc/

You can also install optional command line tools, which
are helpful to run the code inside abi/feat/kdoc outside
Sphinx build:

    tools/docs/kernel-doc
    tools/docs/get_abi.py
    tools/docs/get_feat.py
    tools/docs/parse-headers.py
  
Regards,
Mauro

