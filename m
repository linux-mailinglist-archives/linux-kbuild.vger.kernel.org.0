Return-Path: <linux-kbuild+bounces-10846-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJxmJu3fc2kRzQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10846-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 21:54:05 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F78B7AC2D
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 21:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B522A30059AE
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 20:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF272D739B;
	Fri, 23 Jan 2026 20:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RlmIrAj0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A63E2EC0BF
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 20:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769201643; cv=none; b=CZ6ZQoYVJxdBcbY6VusEdTvPQDQ5rYg0mqlGWZsyrywfdnvYOVA9QUc7zcxeDuDBxK7Mdv4HjIzxH6t2myweFGURQ8O+WSHzDEHXk9gbDJT0zb5/D5ElGIQLAr1AF+O2knyjakydnhMi5bDJM1TvI8hqEfkNnkzfg3nYZqoxzKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769201643; c=relaxed/simple;
	bh=Ewah3Ho11/sHwleTeIaAh68/aLvMRfTAFxlfAxY5Euk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmBP7vlC9jI7HH7NGT5ATGdAZ4kvVczeeoUCEv5KBNjcoRZq3LL3ndLCp45gOd7UoBf4xAc3PYKhjYHDwlQFa1n0Kght7Am3TSG2hxFSM7CsO9rfZcfAXQ/0lmCQpyHOrfGPu7fGqcn6B9UurN3HUXv21qkZGfTwemCa8CDdRCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RlmIrAj0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F3CC19424;
	Fri, 23 Jan 2026 20:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769201642;
	bh=Ewah3Ho11/sHwleTeIaAh68/aLvMRfTAFxlfAxY5Euk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RlmIrAj0H2lqJIrzl0fldgGfPVBwjJdUqlF0fpEQjSTPtM6BlTZId4LODlgz0UY9g
	 IZzrcZhaBNIxogo5P/RFcnqIZhvk0aYdhWjCcRBuQh9VLaxtl4mxLCnQodwKNlS5S8
	 u/lppbsnU9jKHOe6lQWlk32Shy23EQ7rYvuD1d0jZimUUHTGkkcJll+FpVEwqk8Sfz
	 nReZiU8HvvpxmsKQd2PlzXhk2pMoghnA+EvPMThXLJCuaQxU1bRDZLIZk2yzqqEyUn
	 DIP4Fag94P/8pPYdKN2qXhUIL44y/oqp8+qSteFm+vUUStzpNYKCMD2TuaUeUOHFAL
	 6dFfhNXLU8UYg==
Date: Fri, 23 Jan 2026 13:53:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Song Liu <song@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Subject: Re: make olddefconfig surprises
Message-ID: <20260123205359.GA95167@ax162>
References: <CAPhsuW48m9pPbKsiiNDnagrtF2vLYwHSZWUASirhFKgUSVrzQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPhsuW48m9pPbKsiiNDnagrtF2vLYwHSZWUASirhFKgUSVrzQQ@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10846-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3F78B7AC2D
X-Rspamd-Action: no action

Hi Song,

On Fri, Jan 23, 2026 at 10:21:34AM -0800, Song Liu wrote:
> I was surprised by "make olddefconfig". Reporting here in case this is
> something worth fixing/changing.

Thanks for the write up!

> Here is what I see:
> 
> With make defconfig, CONFIG_DEVTMPFS is enabled:
> 
> $ make defconfig
> *** Default configuration is based on 'x86_64_defconfig'
> #
> # configuration written to .config
> #
> $ grep CONFIG_DEVTMPFS .config
> CONFIG_DEVTMPFS=y
> CONFIG_DEVTMPFS_MOUNT=y
> # CONFIG_DEVTMPFS_SAFE is not set

Right, as CONFIG_DEVTMPFS is explicitly enabled in x86_64_defconfig:

  $ scripts/config --file arch/x86/configs/x86_64_defconfig -s DEVTMPFS
  y

> But with make olddefconfig and an empty .config file,
> CONFIG_DEVTMPFS is disabled:
> 
> $ echo > .config
> $ make olddefconfig
> #
> # configuration written to .config
> #
> $ grep CONFIG_DEVTMPFS .config
> # CONFIG_DEVTMPFS is not set

The key here is "an empty .config file". olddefconfig is documented in
'make help':

  Same as oldconfig but sets new symbols to their default value without
  prompting

and oldconfig is documented as:

  Update current config utilising a provided .config as base

So if .config is present but empty, all symbols will be new and they
will be set to their default value from its Kconfig definition
(basically just alldefconfig at that point).

> In the meanwhile, CONFIG_DEVTMPFS is enabled in my /proc/config.gz
> and /boot/config*

I think /boot/config-$(uname -r) is only used as a potential
configuration base when no configuration is provided initially but it is
not examined at all for the sake of olddefconfig.

> I checked with a few folks. They were also surprised by this.
> 
> I think the logic of "make olddefconfig" is: With a .config, olddefconfig will
> not look at other defaults (x86_64_defconfig, /proc/config.gz, /boot/config*,
> etc.). Instead, olddefconfig only follows Kconfig files. If a config doesn't
> have "default=y" in Kconfig files, it will be disabled.

Correct, per the "sets new symbols to their default value" from the help
text above.

> This is confusing to users. For example, selftests users often have
> a config file in "tools/testing/selftests/*/config" showing which configs are
> needed for the tests to pass. The expectation is: default config with these
> changes will work. However, this is actually not the case. Many of these
> config files actually have "CONFIG_DEVTMPFS=y" to make it work.

I am a little confused by this and how it relates to olddefconfig? Is
this not just a problem with the config file in the selftests not having
every configuration that is needed if it expects CONFIG_DEVTMPFS=y but
does not have it listed? Or am I missing something else here? How are
those config files in selftests expected to be used? Are they merged
into existing configuration files with scripts/kconfig/merge_config.sh
or are they used as a .config then have olddefconfig run on them?

> So, the question is, shall we change the behavior of olddefconfig so
> that it still honors defaults in x86_64_defconfig?

Perhaps this could be clarified somehow in 'make help' or elsewhere in
the Kconfig documentation but this could be a misunderstanding of the
point of olddefconfig. It is just meant to transition an old/existing
configuration file to the current tree noninteractively. It won't
manipulate a configuration beyond that and I am not sure that it should,
especially since it gets a little confusing around what other
configuration files should be taken into account when changing values.

Cheers,
Nathan

