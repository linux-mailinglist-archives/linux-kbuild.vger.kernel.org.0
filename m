Return-Path: <linux-kbuild+bounces-13575-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dzsnGWdrImrIWwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13575-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 08:23:35 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B00645783
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 08:23:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jVkSkg2N;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13575-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13575-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F922300F5DB
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 06:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47B83FF1D9;
	Fri,  5 Jun 2026 06:22:11 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AE218DB2A;
	Fri,  5 Jun 2026 06:22:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640531; cv=none; b=aBA/EPPneRsfRixSzk5jUM0Mcg5VL4EP/oyYAuMqt510zRZgTQsVnlC8Ux5tpQaEE0B2rdnRTjnyf1AVc7vIqv/HfPMDB0mILbzvUQokq3k8fOHl/TsEnR25DmpbZzKYKp1IuhBvPpFdMnAfZNN4m0ys7te90Ox57OCqHY3vgIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640531; c=relaxed/simple;
	bh=vQFK66rMEI1PV6CMooqKl5jkDsaP/GGoqTE5S3NgyfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5O7VWfI7W1+TNSxSGFD/C/s/G3sZCMA0ve1AiaCUc1DJWcqe8MSE3fzXDsg8q8zTAvp6UMCqEzJXMv0cBOLltXlKJBenOMVNt+D8Urca59Rau+q5lgtUmEgyRs5YxeOUhAHhSuNk/iZb0k8x7227SW7FkmnQZ+E3IyK5jpZWmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVkSkg2N; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337A51F00893;
	Fri,  5 Jun 2026 06:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780640530;
	bh=2W23r6osoJ/yGhxBCZerUZfQcvrlRprhltSC/0F7k6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jVkSkg2Nc1zz0SRsVm6QFa/xCMx8FZjABPn/Mzwfhmv8R8+U/GpTKcIyZXM6gEuik
	 dfBUAVrwF1N2Zou6I/tV5Pps16z/K1Iuc+O7+XJhYReG+hS/9Yvpg0yiQR41sgvDZB
	 Cd6Kx+ey1L90yI2o7XpO8HgbdpoU2EIzdngFKjcn0XygHuoCwqriK+BQyvZ4sKnjch
	 DYX5NvuqTttrj/PTbvHjsXIg3R5KIKyqbngJuvInMca+Mxm2bzdTfEwaI5/rhfVcj8
	 cR1hKxHT7IHivcrUYA+cYqMZFmQUzfmX5bGzbzOvmJJVtsaZmejZkdQXxa+ObD1pzy
	 Kzk6cnokkR24g==
Date: Thu, 4 Jun 2026 23:22:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Wentao Guan <guanwentao@uniontech.com>
Cc: nsc <nsc@kernel.org>, tamird <tamird@kernel.org>,
	linux-kbuild <linux-kbuild@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH] kbuild: try readelf first in gen_symversions
Message-ID: <20260605062206.GA661512@ax162>
References: <20260603161732.52477-1-guanwentao@uniontech.com>
 <20260604013858.GB1329739@ax162>
 <tencent_5A209D3D5BB5B16325067261@qq.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_5A209D3D5BB5B16325067261@qq.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:guanwentao@uniontech.com,m:nsc@kernel.org,m:tamird@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:petr.pavlu@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13575-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,uniontech.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0B00645783

On Thu, Jun 04, 2026 at 11:44:29AM +0800, Wentao Guan wrote:
> Hello,
> 
> > On Thu, Jun 04, 2026 at 12:17:32AM +0800, Wentao Guan wrote:
> > > Use readelf to dig out if <file>.o contain a __export_symbol_*.
> > >
> > > Instead of nm, readelf is more faster, and significantly improve speed
> > > when enable CONFIG_MODVERSIONS.
> > >
> > > Build x86_64_defconfigs in 2C4T cloud server with CONFIG_MODVERSIONS=y:
> > > With patch:
> > > real    17m21.019s
> > > user    61m48.388s
> > > sys     4m27.709s
> > > Without patch:
> > > real    17m39.435s
> > > user    62m24.686s
> > > sys     5m3.200s
> > >
> > > Link: https://lore.kernel.org/all/tencent_2FA16E0A18D6D0C0703F5D49@qq.com/
> > > Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
> > > ---
> > >  scripts/Makefile.build | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > > index 3498d25b15e85..54a91bc144cce 100644
> > > --- a/scripts/Makefile.build
> > > +++ b/scripts/Makefile.build
> > > @@ -233,7 +233,7 @@ ifdef CONFIG_MODVERSIONS
> > >  #   be compiled and linked to the kernel and/or modules.
> > > 
> > >  gen_symversions = \
> > > - if $(NM) $@ 2>/dev/null | grep -q ' __export_symbol_'; then \
> > > + if $(READELF) -sW $@ 2>/dev/null | grep -q ' __export_symbol_'; then \
> > 
> > This breaks modversioning for Clang LTO builds, as llvm-nm can read LLVM
> > bitcode but llvm-readelf cannot, it expects strictly ELF.
> Oh, is it worth to use the following logic to detect LLVM or LLVM-LTO or not ?
> +ifeq ($(LLVM),)

This should probably be CONFIG_LTO_CLANG with flipped branches but...

> +  SYM_CHECK = $(READELF) -sW
> +else
> +  SYM_CHECK = $(NM)
> +endif 
>  gen_symversions =								\
> -	if $(NM) $@ 2>/dev/null | grep -q ' __export_symbol_'; then		\
> +	if $(SYM_CHECK) $@ 2>/dev/null | grep -q ' __export_symbol_'; then	\
> 

> > that it stops looking for a match after the first export symbol is
> > found?
> Small, there are my test result in make x86_64_defconfig + enable CONFIG_MODVERSIONS:
> 1. readelf
> if $(READELF) $@ 2>/dev/null | grep -q ' __export_symbol_';
> real    10m44.359s
> user    37m43.596s
> sys     3m2.424s
> 2. nm
> if $(NM) $@ 2>/dev/null | grep -q ' __export_symbol_';
> real    11m8.008s
> user    38m51.644s
> sys     3m29.798s
> 3. nm + grep -m1 -q
> if $(NM) $@ 2>/dev/null | grep -m1 -q ' __export_symbol_';
> real    10m56.891s
> user    38m8.136s
> sys     3m28.096s

'-m1' appears to get us 50% (12s) of the speed up of 'readelf' (24s) in
your environment while sticking with 'nm'. I would be more inclined to
take that change since it is small and correct, rather than switching on
NM or READELF, as I don't think it is worth the additional complexity.
FWIW, on one of my test machines with 8 cores and 16 threads, the
difference is much less noticeable. I think that is going to be in line
with most developer and build farm hardware, rather than a 2C/4T machine
like you mention in the initial commit message.

GCC 16.1.0 + binutils 2.46:

  Benchmark 1: $(NM)
    Time (mean ± σ):     75.203 s ±  0.283 s    [User: 659.465 s, System: 185.605 s]
    Range (min … max):   74.898 s … 75.457 s    3 runs

  Benchmark 2: $(READELF) -sW
    Time (mean ± σ):     73.055 s ±  0.465 s    [User: 642.365 s, System: 175.908 s]
    Range (min … max):   72.523 s … 73.385 s    3 runs

  Summary
    $(READELF) -sW ran
      1.03 ± 0.01 times faster than $(NM)

LLVM 22:

  Benchmark 1: $(NM)
    Time (mean ± σ):     75.030 s ±  0.736 s    [User: 659.603 s, System: 185.257 s]
    Range (min … max):   74.207 s … 75.623 s    3 runs

  Benchmark 2: $(READELF) -sW
    Time (mean ± σ):     73.405 s ±  0.457 s    [User: 642.512 s, System: 176.440 s]
    Range (min … max):   72.878 s … 73.679 s    3 runs

  Summary
    $(READELF) -sW ran
      1.02 ± 0.01 times faster than $(NM)

-- 
Cheers,
Nathan

