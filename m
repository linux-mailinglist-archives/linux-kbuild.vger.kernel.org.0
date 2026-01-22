Return-Path: <linux-kbuild+bounces-10821-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id r49mKI6BcmmrlgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10821-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 20:59:10 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA476D4D7
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 20:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3CF930045AB
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 19:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4643859FA;
	Thu, 22 Jan 2026 19:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbdS9FZ+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7833535CBCD;
	Thu, 22 Jan 2026 19:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769111948; cv=none; b=N1TzjlBF3xPi14+S9YuVE4RCjwkq6Ij4On6udcIch2KY086Sh5r9SZVvF26xdVMT5p4kVnVOEI9SLe0QgiGRH0hASsv09iC7Xcf56S/Y1BthqyvRERDTX2utRVjTUYxqEYk4zYezS92lzwDHhumQoM3m66zDzU5ZO764dY0JnxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769111948; c=relaxed/simple;
	bh=L3yAFFCMEDFluDFnsvrLzuilg9f4Ft1ohPrL6t/krlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hV65zlwns+WexmZsVpXuegD/Bhp9T8N4ItMKKCchCTfSmEFa7P9x7k8HpVMNmnFCBmSxPHmKAtEi2yIbgOQer5RIIoMizNHUMIfqsPc9ExhFrKQKmDhfOyFN3rmvbWzzSj7eeP+q/YcIPCi609ZSSl+mz5Uq1R4cZwSQzGcLzeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbdS9FZ+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E03C116D0;
	Thu, 22 Jan 2026 19:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769111948;
	bh=L3yAFFCMEDFluDFnsvrLzuilg9f4Ft1ohPrL6t/krlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lbdS9FZ+JqtZCbzkj8qXV0rZCnDPslDRoWvAxauwv8RMES3Hv1cQJITpkMErUCP8a
	 sp3mD9G0ION5+bWKJAqUALZeOUBDGFJa8H1KN9Ay4eKpEUYch9pi6r93aSdMlOMecP
	 t9YKcMkenHU1WooMNHxnbQhPrg5cs3kM89aEzVFFNICp4cMTUjVph8cp/dCBZRfvbT
	 QWHYJP32lGBHk/aMh2tUTXwr9jgTnnM6ZBQWNn8kRq6YXgSW2M2gIf/OvVaVrn+HlJ
	 YdVYyqAZx9Id9dz1xChx7T7L+gYP+OWFkFowGZj+l4gi06WpotoFDNzM4bfuzKVSU3
	 n+JMkThblqYBA==
Date: Thu, 22 Jan 2026 20:57:39 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Guillaume Tucker <gtucker@gtucker.io>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v4 1/2] scripts: add tool to run containerized builds
Message-ID: <aXKBM9mmf3VPUgyO@levanger>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
	Guillaume Tucker <gtucker@gtucker.io>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
References: <cover.1769090419.git.gtucker@gtucker.io>
 <9b8da20157e409e8fa3134d2101678779e157256.1769090419.git.gtucker@gtucker.io>
 <20260122172928.1d922490@nimda>
 <611ce02f-2b48-4338-b37f-1df39e02da03@gtucker.io>
 <20260122184939.GA3461196@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122184939.GA3461196@ax162>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10821-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0CA476D4D7
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 11:49:39AM -0700, Nathan Chancellor wrote:
> On Thu, Jan 22, 2026 at 03:59:54PM +0100, Guillaume Tucker wrote:
> > --- a/scripts/container
> > +++ b/scripts/container
> > @@ -120,7 +120,7 @@ class Runtimes:
> >                  if not runtime.is_present():
> >                      raise ValueError(f"runtime not found: {name}")
> >                  return runtime
> > -        raise ValueError(f"unknown runtime: {runtime}")
> > +        raise ValueError(f"unknown runtime: {name}")
> >  
> >      @classmethod
> >      def find(cls):
> > 
> > 
> > Nathan, would you be OK with folding this in or should I send a v5?
> 
> I can fold that in, thanks.
> 
> I will carry forward Nicolas's ack and testing tags from v3, as this
> revision is not substantially different from what he looked at and
> tested.

thanks!

Kind regards,
Nicolas

