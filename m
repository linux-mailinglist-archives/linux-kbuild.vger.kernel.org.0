Return-Path: <linux-kbuild+bounces-12405-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eB0kChj0y2lwMwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12405-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:19:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C43D36C7C1
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CEAF8300185C
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 16:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBABA3DEAE6;
	Tue, 31 Mar 2026 16:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RP4MBAdD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89693D8110;
	Tue, 31 Mar 2026 16:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973157; cv=none; b=YiNFmEWqeltOE0NPXTBdut7P5VnPvK2zOSRRxRghELWS2uFJLaJCuuxcZIsPh5CnsftR7r0aGqKyqkxlQ0R1D18Dk6sOCTHDJMt7gtf7e5xQai4AC/K4p7g/B9GUGxYXw83o3Aqx/0d15sZfoRLwyqucFlE7w/Z3jY0SJkntlz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973157; c=relaxed/simple;
	bh=GdVL5YkhiBlfrbkgoasYODaIsvdKuLBZEppm175CMj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWad7FQkHaajy7am6rlzxsSFwlv2fHU9eZPwblIq4Nc7FLV6r8Tz8nDabugLeoFNERgkZ6Ex8vKbk8rq8lvUYvBwnwHPHzlzT8nxtlEwkcbv6ok4SvrMVsyk1HFJe9+ETHxw9k45F1bVWm5CDiGW6zvS0+xHa7Iqo6Wl7R3I+II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RP4MBAdD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C57C19424;
	Tue, 31 Mar 2026 16:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774973157;
	bh=GdVL5YkhiBlfrbkgoasYODaIsvdKuLBZEppm175CMj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RP4MBAdDzMeDh9UTHnKCnkGbRlZml7jXVBMilcY0ydty9GRPI8Rp6UPCoH2uCvS7A
	 9f3R2IaHiiZeD1UqWWA+kFN24UaZcBFG2J4Aa0rgtx9Ph2qVk6fjgMp+5DibwDshna
	 3jIz4fo4kIzH6XZSMnzLMd8P4FvIiTtdg4g2LvYRMCmjTvuSjCybdeikwqlZmU6FfI
	 E3qBRw/5DdwCgkHspw0SwS2nCoj303JtZPBaPlDCcNtuY7e6+yx+3xHvztIJphXwDU
	 1IyxP3bb3sfaSb86RGwzlqr9bZSReKG+InnEiZ5BDAv8b+zkN2ORu/8Xjywy2iQcsR
	 enrc7ZUCvYMpQ==
Date: Tue, 31 Mar 2026 18:04:54 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Luis Augenstein <luis.augenstein@tngtech.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com
Subject: Re: [PATCH 02/15] scripts/sbom: integrate script in make process
Message-ID: <acvwpv7ISJoYSttX@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Luis Augenstein <luis.augenstein@tngtech.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com
References: <20260210205424.11195-1-luis.augenstein@tngtech.com>
 <20260210205424.11195-3-luis.augenstein@tngtech.com>
 <20260330095011.GA1458050@ax162>
 <9120907b-9568-4f0e-9757-c9e3b8d530f4@tngtech.com>
 <2026033111-bolt-verse-4505@gregkh>
 <20260331153009.GA1103611@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331153009.GA1103611@ax162>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12405-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sbom.py:url]
X-Rspamd-Queue-Id: 2C43D36C7C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 05:30:09PM +0200, Nathan Chancellor wrote:
> On Tue, Mar 31, 2026 at 07:15:35AM +0200, Greg KH wrote:
> > On Mon, Mar 30, 2026 at 10:32:00PM +0200, Luis Augenstein wrote:
> > > Hi Nathan,
> > > 
> > > thanks a lot for your recommendations.
> > > 
> > > > Does sbom-roots.txt need to be cleaned up as well?
> > > 
> > > This file is only required to pass the roots into the python script.
> > > We could also use a tmp file. Then we don't need to worry about clean
> > > up. Together with your other suggested changes something like this
> > > should work:
> > > 
> > > # Script to generate .spdx.json SBOM documents describing the build
> > > #
> > > ---------------------------------------------------------------------------
> > > 
> > > ifdef building_out_of_srctree
> > > sbom_targets := sbom-source.spdx.json
> > > endif
> > > sbom_targets += sbom-build.spdx.json sbom-output.spdx.json
> > > quiet_cmd_sbom = GEN     $(notdir $(sbom_targets))
> > >       cmd_sbom = roots_file=$$(mktemp); \
> 
> I think I would rather have a named file in objtree instead of one in
> /tmp, as we want all output to remain in the build folder.

+1

The common way in kbuild is using '$(tmp-target)'.

> 
> > >                  printf "%s\n" "$(KBUILD_IMAGE)" >"$$roots_file"; \
> > >                  $(if $(CONFIG_MODULES),sed 's/\.o$$/.ko/'
> > > $(objtree)/modules.order >> "$$roots_file";) \
> > >                  $(PYTHON3) $(srctree)/scripts/sbom/sbom.py \
> > >                      --src-tree $(abspath $(srctree)) \
> > >                      --obj-tree $(abspath $(objtree)) \
> > >                      --roots-file "$$roots_file" \
> > >                      --output-directory $(abspath $(objtree)) \
> > >                      --generate-spdx \
> > >                      --package-license "GPL-2.0 WITH Linux-syscall-note" \
> > >                      --package-version "$(KERNELVERSION)" \
> > >                      --write-output-on-error;
> > >                  rm -f "$$roots_file"
> 
> The cmd macro uses 'set -e', so consider moving this up and making it
> 
>     trap  "rm -rf $$roots_file" EXIT; \
> 
> like try-run in scripts/Makefile.compiler does to ensure it is always
> cleaned up.

hm, well.  Yes, this should do as expected, but please be aware that
this also kills the $(delete-on-interrupt) which is part of $(cmd) and
removes $@ in case of error or interruption by installing a trap --
which will be overwritten.  See also below.

I think it might become a bit cleaner if the roots file is a separate
target and the 'sbom' target simply depends on it.  But we can defer
that.

> 
> > > PHONY += sbom
> > > sbom: $(notdir $(KBUILD_IMAGE)) include/generated/autoconf.h $(if
> > > $(CONFIG_MODULES),modules modules.order)
> > > 	$(call cmd,sbom)
> > > 
> > > Note, I will also add the --write-output-on-error flag by default such
> > > that the .spdx.json documents are generated as much as possible even if
> > > some build commands are unknown to the parser.
> 
> Seems reasonable to me.

If sbom.py is unable to parse the build commands, does it exit with a
non-zero exit code, correct?  As 'cmd_sbom' is run within a 'set -e'
shell environment, the $(delete-on-interrupt) will delete $@, thus there
should be _no_ output on error, regardless of --write-output-on-error.
So, it might make sense to kill $(delete-on-interrupt) by intention; but
that doesn't feel good to me, as the intention of 'cmd' will be
intransparently.

Kind regards,
Nicolas

