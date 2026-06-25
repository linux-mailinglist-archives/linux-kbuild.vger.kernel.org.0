Return-Path: <linux-kbuild+bounces-13880-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lFrsAQWkPGoSqAgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13880-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jun 2026 05:44:05 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B516C29BA
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jun 2026 05:44:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=gPzY6VKu;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13880-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13880-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05FAD301FF9C
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jun 2026 03:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802C3235C01;
	Thu, 25 Jun 2026 03:44:02 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5BA176238
	for <linux-kbuild@vger.kernel.org>; Thu, 25 Jun 2026 03:44:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782359042; cv=none; b=Faw+pee8aSrgPly/ASqBpqmXYJ3T2W4RwtDUhzZeYi2riOySuqM3vuM5meyWAuYlp5B1bo/Bi98WQykRWLjjuXOrlt1977neXNKrIauVjI9k+nFuvWBRakdKXZqIfO6uQpA5BrGKZoSnUQFZ+Z4x9tUK1QWsI2mRGn8fLWGMPVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782359042; c=relaxed/simple;
	bh=2AdLViWfr4V0q+1e0jznj1uCND9qofKYabVnyQ+Dpwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PuLELpFd2wu1svjZRpfDOO4KoMwZezr9uNrGqzetncG2sUeXLvrD9C76ftuewYW9tZgrYYfAqDLy0FEhRTMI2hh3C9JE0/opjue6AZ/+3a/Hf9UhycPnoQnWxxrG8H0RVoUkHMeeQMNEAyyEMuD7xtXrQSpW6lS878yFav+hHPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gPzY6VKu; arc=none smtp.client-ip=209.85.210.180
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-842848fd613so1440895b3a.3
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2026 20:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782359040; x=1782963840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Cjx0I0UC3Z5WDh6QUy1vZP1wVIN/q2Te5FqMtXeQu8=;
        b=gPzY6VKu1I7ueNzuaQpkCvftwmZ2dD2z0u13Bx5MKmC/beqqMAPmxHVbQBbNKNvLaR
         qSGQ4M8HZtKkwg9dLy8rvlQavseRVMfp81CeIqVmY6Xyx/EXQD3YPT+u4f9/5ZwPYopZ
         YAZLaGUOHBFVI1oRDpvpJqKdsvmvFpswg7hUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782359040; x=1782963840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Cjx0I0UC3Z5WDh6QUy1vZP1wVIN/q2Te5FqMtXeQu8=;
        b=WmSd8OEo6NFfUeoNlTyOfOaMY73+nb70xCveUPwRHxB9P/kLiFYoc/v5UqAysN8/sF
         0B6esg+ZnoigWS1EcB1FsU9ukZ2fQz768hVQMwUw23YqpAFaxWL9FYwRELANrIivsW0A
         NVQ4YH+lUygG5J7I6ucKZ6YTN9nS8Tr4HJ8akhPE07GOtaSRQyJWym0Jkc3ImFL91a2a
         VKhiRNervYtWEoPH1yX2cQyIsyIW9XqHmfP5wPnJUs4zTcb1HHthdSfjOYpGZV/1ESxN
         tcIEQ2Nmq7XozY9eMAk7CO1JAbgeKJPBX/TZuLuvz/C/z5JtxApBkfTNLisoBil7NvFE
         s/Ag==
X-Forwarded-Encrypted: i=1; AFNElJ+1zKncYJ2mkY0XtIBtsQqFJhBzVWeUmGTwAA9VD9f11m3jYfefEo4JUJKNT7Vii84dTGkXVCmpN2n6L7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmJx+EmwnCm+Aa1vr4R/u4DRKR7GuAu6lyRZwk2+LGsJCgR1aB
	PMmAsdXwsEFjQ4NJSt26G1VltnWa9OM88xSTOe21whxniaZGi8TCf3sFmUKdUNdBgg==
X-Gm-Gg: AfdE7cmTcAa5lcAOlOBviI4EcxhOqKLAk2CCiehM/wEX2xBUCuQGt1jFj36AxcmcGFZ
	D+atLxqHQrQCJt477NZXhQT2nhDl434M8lHfe189mqZPT8NAPBy3K96PnK44f7hA/c4BIaLrtBe
	iD/Bz7o+ZFOWhQKgiRrRCS++K4rP/Ty1Mop5r45IvX5JASa/0FwaQdAjndOqiyx1gCbCzXH0tWq
	JAgnQZZrpgVzW1bjIaCJUKQtxzQ2ZVjh/kODbdw+BdGOOayU2kFZ8QPZw8KLaMNk0BRRQPxMQYT
	wYDdM1suQsv0v/UBJt5R38evXfoakZ551gBufOeICDhp7LPh6e5hzyNM1JkbXFF+YWYrd9UgayO
	dpiraqOM+LSp3vQwMUFn0SVEKYFGnLe6nPUq6SLJNX9HFke2gkPqpIuUmv0jdN95rVuwAOLIVHI
	LOK5OoVtO9CAf/lSNFMIsLoHyE0JWpWnkBbop8phvLBPBjvG23nA==
X-Received: by 2002:a05:6a00:e8c:b0:845:3fea:966 with SMTP id d2e1a72fcca58-845b39e6e2dmr1057870b3a.15.1782359040467;
        Wed, 24 Jun 2026 20:44:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:d3e:64a4:a0ef:faf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc773sm3742306b3a.11.2026.06.24.20.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 20:43:59 -0700 (PDT)
Date: Thu, 25 Jun 2026 12:43:56 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Jones <andrew.jones@linux.dev>, andriy.shevchenko@linux.intel.com, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nathan@kernel.org, nsc@kernel.org, rdunlap@infradead.org, 
	tfiga@chromium.org
Subject: Re: [PATCH v4] kconfig: add kconfig-sym-check static checker
Message-ID: <ajyjpt10bHS3ERLv@google.com>
References: <ajo4DVWoSaEZtBDa@google.com>
 <h3gyuwk2f53msfeuk3urxsfhrcsevb2rqszfh7x3laiwl2bma6@5edux2cyact7>
 <ajtM3i49HcYAF3wX@google.com>
 <ajtPk6gz8bd4bsxy@google.com>
 <7e416a8a-d7f0-4dc6-b279-f7848b89df31@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e416a8a-d7f0-4dc6-b279-f7848b89df31@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13880-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julianbraha@gmail.com,m:senozhatsky@chromium.org,m:andrew.jones@linux.dev,m:andriy.shevchenko@linux.intel.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:rdunlap@infradead.org,m:tfiga@chromium.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[senozhatsky@chromium.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,chromium.org:dkim,chromium.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54B516C29BA

On (26/06/24 13:28), Julian Braha wrote:
> On 6/24/26 04:34, Sergey Senozhatsky wrote:
> > OK, maybe they are not similar, as Julian pointed out.  Makes
> > we wonder is there any benefit in moving this functionality
> > into kconfig (which is the tool that deals with Kconfig files).
> 
> Agreed, it would be ideal if the check could be part of the kconfig
> interpeter.
> 
> However...

Right...  There's always a "however" :)

> Linux does a funky thing with its architecture handling in kconfig:
> it looks up the architecture from a makefile variable and uses that to
> resolve a kconfig file import in 'arch/Kconfig'.
> 
> This means e.g. when evaluating the kconfig on an x86 machine, all of
> the config options in the RISC-V kconfig are never reached, thus never
> parsed, and never added to the symbol table. As far as the interpeter is
> aware, any reference to, say, RISCV_SBI is a dead reference on x86.
> 
> Yet, options throughout the kernel can reference arch-specific options.
> Try searching in menuconfig for the RISCV-only option HVC_RISCV_SBI on
> x86, and you'll successfully find it, because it's defined in 'drivers/'
> (not downstream of arch/Kconfig). Then try searching for its dependency,
> RISCV_SBI. Apparently it doesn't exist? In my opinion, this should also
> be considered a bug in the frontend...
> 
> All this is to say, until architectures are restructured in kconfig,
> alarming on unknown options would output 99% noise.

Agreed, let's keep it simple.  Thank you!

