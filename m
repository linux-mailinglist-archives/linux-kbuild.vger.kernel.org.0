Return-Path: <linux-kbuild+bounces-13871-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qYeyGcFOO2quVwgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13871-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 05:28:01 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF436BB17A
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 05:28:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=a4JBmkPa;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13871-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13871-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2895301F4AC
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 03:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14EF83090D4;
	Wed, 24 Jun 2026 03:27:39 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C802217993
	for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2026 03:27:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782271659; cv=none; b=Awwq+eHsXlmRSc6luj2h7cmqJOj2WqfSmZ2+uYkeoEwMsZ63m8v3zQAF0OmtnSbloOHJgCwEXW2ZmVR5jL2PVmvJjLpZNXTDNsqYknq1hloIkNOyGcPHn6dwn5rDR86AHOf2kmJ8cl2FcCMWvSdlnu/JcWgxM/CT31dBR0tACiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782271659; c=relaxed/simple;
	bh=hq14hoYc+WxcCUNXwXgIWqs179mGOE4AllvrS4eJajk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMDrlXYuNrh39PTu7VzjqjWjBPPmDfL+OPor8RUGHeB/XuY1Bq0eJ0BofVWE3vO0mwMx93itnbfFHcImnAConfXFdxF3idvb7jk+c8ZQacqbd18NUGpcl7EEAeHp+yyJrWWFd2qXPcUvW3AYgUoZpTUNq+lwgXAVASyKQkgjmu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a4JBmkPa; arc=none smtp.client-ip=209.85.210.176
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84594492c26so557934b3a.2
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Jun 2026 20:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782271657; x=1782876457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=brj9kpSGtsl2l3UJU7R/FgxceX9KVBkZA4BfbF+fAgI=;
        b=a4JBmkPaBFrHOT09SzHfmPJfk7uudVHJ9miTooTD8599AY1henTlyhKMdrZWLDxlRq
         1Sag0guNB5n+A/0GhZ4g1FXIavpykbHS7nk+Mbk7Gn9JrtUuIqJVqrqWATSxlVS4b65m
         L46/6JJB8aJuGageSzmFoKg0ySTsYIe+9X4ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782271657; x=1782876457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brj9kpSGtsl2l3UJU7R/FgxceX9KVBkZA4BfbF+fAgI=;
        b=hsjYZ7kVKTDS3nSyMMCB8A6TxYjih6rYORalvTMk1GkvrCbePBCnENxXvSDU9tZcVf
         kwrMtcX4rBWAUw8+6nKynCerZk2/HIZLeQc+eJXZ6il/XjcxmUhEhluxpqc1MxD/wUE9
         GRQrINgs7TnCiOA/XQ88E5yQUXTMOINFyow6OPLNBGoqoOBtIGCHkieikHhUyi0b4pkz
         NuJE+BV1mJBXRZV7rWCg+/+86QnMUnn1lU1q6h85O2+HB250ptPLIrKJ9aYzW97oTZfW
         91j8c7JunxwOzN8D4BFgOxa5O8MQ/gfrI0ng+pOiYzPW8bY9tiI4Ps5vD+72OhLrug+B
         iZUw==
X-Forwarded-Encrypted: i=1; AFNElJ/vkOBI9WCLZP1yGzDw6xS09HngJlb66JtyoiFhKC0ZRZzbMxL+dCTWfkTa39Hk+uR4JajxLXzcbSOB3YM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTbqmLG9yeDuiymexPUR4PoMnizcSYEEwfldfQlyvfWZzGb6vT
	D19EUtgAhQFrUblhfMK1MO3PpM9x9eURUpT4Pam+bEbZjD/DI9yeGkTnQlQCBVOC7w==
X-Gm-Gg: AfdE7ckL02ck89Gy1/SUujdYi53N3hCXj3q37JqB7puTOB1+FSxW1F2jIDjtsa6vsZF
	0F1vLETMM8PjRORVnF4I1Kf11cH1CR9mMor+llFspHmwN50t76ZY6Bz9kFDMiP6+gPyJp6ndMMQ
	VO04Q22xHYlkcaTCVz4cRJiiPVZVDtCqY3cS/XDEKYjHS9iLFD0c2G/fJR/B9luutqALUunf6u3
	fEaj5rtCh0dyCWAyhnIfHsbeDF2okTZNH2bcDERYK4dvCQMMO7F3eBn1DkVbfJJeMBQupuIVqeK
	Uo0tLZJLiM8Oe9fLPp66DLxt8vGBWXRJ4xvqsluB6Fi8sWh7mPOAugJ6/7FF1cuud8S0Me3Au1t
	ULVzOUxgY28CAGjx1M6H8AfhsPwNiFG7lHQXPzYRSionSX1zEfVGPEUFZFj6iB/w8adjYR4JLqH
	2UMbahnuq4PAxPzALZk4Q+9QB7swm9GK+Yjy+PLZGOeVHuPKOWoHRp
X-Received: by 2002:a05:6a00:4385:b0:845:4211:9a35 with SMTP id d2e1a72fcca58-845952d8a0amr6359636b3a.34.1782271657056;
        Tue, 23 Jun 2026 20:27:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:1287:5d13:b2d6:c6ab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a4002bf0sm634342b3a.25.2026.06.23.20.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 20:27:36 -0700 (PDT)
Date: Wed, 24 Jun 2026 12:27:32 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	andriy.shevchenko@linux.intel.com, julianbraha@gmail.com, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nathan@kernel.org, nsc@kernel.org, rdunlap@infradead.org, 
	tfiga@chromium.org
Subject: Re: [PATCH v4] kconfig: add kconfig-sym-check static checker
Message-ID: <ajtM3i49HcYAF3wX@google.com>
References: <ajo4DVWoSaEZtBDa@google.com>
 <h3gyuwk2f53msfeuk3urxsfhrcsevb2rqszfh7x3laiwl2bma6@5edux2cyact7>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <h3gyuwk2f53msfeuk3urxsfhrcsevb2rqszfh7x3laiwl2bma6@5edux2cyact7>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[chromium.org,linux.intel.com,gmail.com,vger.kernel.org,kernel.org,infradead.org];
	TAGGED_FROM(0.00)[bounces-13871-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.jones@linux.dev,m:senozhatsky@chromium.org,m:andriy.shevchenko@linux.intel.com,m:julianbraha@gmail.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:rdunlap@infradead.org,m:tfiga@chromium.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[senozhatsky@chromium.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCF436BB17A

Hi,

On (26/06/23 10:18), Andrew Jones wrote:
> > .config:1606:warning: unknown symbol: SENSORS_APDS990X
> > .config:2498:warning: unknown symbol: APPLICOM
> > make[3]: *** [scripts/kconfig/Makefile:85: syncconfig] Error 1
> > make[2]: *** [Makefile:760: syncconfig] Error 2
> 
> Thanks, Sergey. I wasn't aware of this. Is there a way to combine that
> with some "make all" type target in order to find all the dangling
> symbols that the static checker finds?

That's how we wanted it to work.  We've got beaten by
symbols renames/removals in the past.

A demo:

- Add a dangling symbol

% echo "CONFIG_DISABLE_BUGS=y" >> .config

- Now run make (KCONFIG_WARN_UNKNOWN_SYMBOLS/KCONFIG_WERROR are env
  variables)

% KCONFIG_WARN_UNKNOWN_SYMBOLS=1 KCONFIG_WERROR=1 make oldconfig

.config:4693:warning: unknown symbol: DISABLE_BUGS
make[2]: *** [scripts/kconfig/Makefile:85: oldconfig] Error 1
make[1]: *** [/media/dev/linux/Makefile:760: oldconfig] Error 2
make: *** [Makefile:248: __sub-make] Error 2

And make fails.

kconfig reads the symbols for (pretty much?) all the targets, it
needs to make sure that nothing is missing (SAT), that there are
no conflicts and so on.  Detecting unrecognized .config symbols
on the kconfig level is a low hanging fruit, in this regard.

