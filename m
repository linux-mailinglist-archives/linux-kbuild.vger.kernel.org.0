Return-Path: <linux-kbuild+bounces-11490-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2J1qJBPNomkj5gQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11490-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Feb 2026 12:10:11 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB9C1C27D5
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Feb 2026 12:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB86B3016EFD
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Feb 2026 11:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF4E389E02;
	Sat, 28 Feb 2026 11:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="he+9r9oU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14AE2857CC;
	Sat, 28 Feb 2026 11:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772276899; cv=none; b=uVza2ZGMciuIeR6eZ0syoS6xfEK67ojZpIUHSuUdZy/BKqAftmXlfpQMCJd/LPMolN7wZYPWHWrTNqU1DdPFObaQIshUE9NKDTg7ewHgX55zlf9/T9aV3VwYKae05xHgYdfWEJb4pXNYYsbNHNAntfm26pxNTaNmIOa1S3cJAO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772276899; c=relaxed/simple;
	bh=cj+uB9iWQKjnvIgtf9VcdUBIoGqJZsYxujbsNl9X+Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oity74DW5lX4PQq2wZWlSi7ohlZb2MkPfwOpNm07Xn2uwF4L5h1d9umcahX7KUwR3oCGpPOZw6WpvpElGRj5O/143EI7aw5RC77HVml9ZiSRlvTDFUbfA/u4Flms3SpLAlh64r/BNG81opUuzFIdywXTqzsae2YZg/PJEOMZCrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=he+9r9oU; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xsscHip4dCdmr5IZSPcgdwtNxNMKm418IeeKDj4ChVU=; b=he+9r9oUxEfld2ipnq/QlVUxh0
	PU4r88DmHXquioH5j0Ao//QuM3AQRYt0BFV5Ld5yn+qFRCc+DA2GNcDYOyBDMig3to7LTmHjxa/7d
	tQMAcPy/f2JsBfx0P24qREH1irsZ5/c+kwJyWPZfjuSBHuNjZR54LRfwaXrM6Cn4tbJfx1cN9Viym
	fNtompsx8riYo3D1fPccs66tuMWfGHgRutdk/6GroFDeh2wKE2HjAUdyITw+IE4QTqT785nyCBue+
	FftYyTcFXisVxa3dZhU/LOmqGr7uQr9m98gE+zbIKG2KZdKX/lCQ/tsEcLgUviGBl7B4OWUJIwD6P
	ZZwbcAMA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIBC-0000000686g-30ow;
	Sat, 28 Feb 2026 11:08:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A48DB3007C4; Sat, 28 Feb 2026 12:08:13 +0100 (CET)
Date: Sat, 28 Feb 2026 12:08:13 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Michal Suchanek <msuchanek@suse.de>,
	Rainer Fiebig <jrf@mailbox.org>
Subject: Re: [PATCH] kbuild: Leave objtool binary around with 'make clean'
Message-ID: <20260228110813.GN1282955@noisy.programming.kicks-ass.net>
References: <20260227-avoid-objtool-binary-removal-clean-v1-1-122f3e55eae9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-avoid-objtool-binary-removal-clean-v1-1-122f3e55eae9@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11490-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:email,infradead.org:dkim,mailbox.org:email,suse.de:email]
X-Rspamd-Queue-Id: EBB9C1C27D5
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 10:40:48PM -0700, Nathan Chancellor wrote:
> The difference between 'make clean' and 'make mrproper' is documented in
> 'make help' as:
> 
>   clean     - Remove most generated files but keep the config and
>               enough build support to build external modules
>   mrproper  - Remove all generated files + config + various backup files
> 
> After commit 68b4fe32d737 ("kbuild: Add objtool to top-level clean
> target"), running 'make clean' then attempting to build an external
> module with the resulting build directory fails with
> 
>   $ make ARCH=x86_64 O=build clean
> 
>   $ make -C build M=... MO=...
>   ...
>   /bin/sh: line 1: .../build/tools/objtool/objtool: No such file or directory
> 
> as 'make clean' removes the objtool binary.
> 
> Split the objtool clean target into mrproper and clean like Kbuild does
> and remove all generated artifacts with 'make clean' except for the
> objtool binary, which is removed with 'make mrproper'.
> 
> Cc: stable@vger.kernel.org
> Fixes: 68b4fe32d737 ("kbuild: Add objtool to top-level clean target")
> Reported-by: Michal Suchanek <msuchanek@suse.de>
> Closes: https://lore.kernel.org/20260225112633.6123-1-msuchanek@suse.de/
> Reported-by: Rainer Fiebig <jrf@mailbox.org>
> Closes: https://lore.kernel.org/62d12399-76e5-3d40-126a-7490b4795b17@mailbox.org/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I realize that this will technically decend into tools/objtool twice
> during cleaning when running mrproper but I don't think it is the end of
> the world for a much simpler implementation.
> 
> I can take this via kbuild-fixes with a proper Ack or it can go through
> -tip, does not matter to me.

Feel free to take though kbuild-fixes:

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

