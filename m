Return-Path: <linux-kbuild+bounces-11293-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCkiCnsnjmlrAAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11293-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 20:18:19 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2E1130A39
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 20:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D8203039F73
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 19:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC1127EC80;
	Thu, 12 Feb 2026 19:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONYQfrs9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AFD29293D
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Feb 2026 19:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770923895; cv=none; b=iqHDUhCI8LqVyoL4KnB3udMInixqiDqvvOgrnfX7f6YO9yZOkLh90OyGmVA8zK2pL1RYUxg3l4Et9n9YNn6b4Nt4tJd6Gc4BcOxBkMMJn9PiACzZcWjoO9Req8QDoEMhCuXhCWdjf9JBGKesXQtBvE50RCxL0gkSGypkFD1BvNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770923895; c=relaxed/simple;
	bh=Dwo6JeQuN03rtqKJJ6ttZV+PoZ7zgPamRHnYZdq+qas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMYzXy8pnnLtzUR7Az9nmvkEZ2Ww1hS1k0mW/GHo6hg35ZyjWgOe+p+J/mP4xZsX9l7Js136ti+uymUFizyfvE6kN4ls+x2sw+704iBKQz9xdbHICTpcALZ4YKnK2IyMZQppPmARH5qhYoIT1y8oshUmN7NbKDylIXUmyNjYhqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONYQfrs9; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b88593aa4dcso11489866b.3
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Feb 2026 11:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770923892; x=1771528692; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L7fegrrYVrLK7MrY18kiCOAGYiUmZMy3K/iLr1h/Lck=;
        b=ONYQfrs97QEnUk0iNYpINVMY4gqFWQy6/VuZlGkgi3s1SUL1fj8BBKXt/OvjYktDPP
         9LwmL3M7AVXEZQxN1/R9eoLcHt77093FonUmGaJf8oZt1tIMyfS0R3T0kDvfxmugV4/9
         7Z8ymh8uIykc/aZIr87A9xYpiAq/LHMrGnSdEyrLXiMGZiQn3/OhFqANY3DYBdZqq/ar
         6z1eFpG8XalE1dFrM/lYfhTHQo6R7Zdtv7tFM0KAeAFBoehMqFcF2td1KsY3lhWJUZlO
         HGby2HIKk2Id4dGef13cPrUQxLBkpuwBpu4c8Y1MJ6aSeQNAVTbZE6Ajm2hcEwjTOFvQ
         S9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770923892; x=1771528692;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7fegrrYVrLK7MrY18kiCOAGYiUmZMy3K/iLr1h/Lck=;
        b=Iccv2DRNzCQgUlxCqCE89I306CrwQjmXh2TbkQTVrMt6DJIbYD/nT4EoI6efpAl77c
         Ulaav5CtjvzbPDTnmI+aZVZgWce5hLU7ulRPOLgjll/DzGQLGhNAoIbnY8g+M2UJUYaJ
         n4K+tcCMA5WXjdi/FtHlX06r8QHQZrwN2iQcMAatbwgbYWpoipc/gysmdhwXbjLLQey4
         ahpuUqiVb1uQIqeVwpl3I30cMjAyTs5VhhM7EjRIDwvhaA7+ym7B4feRoTl9e04N6EiZ
         0Hn9eLwcpSSylVCy2ugZzmNt3RvkTl2A7giaUEkz9ylrHtSneLPDGJ39BC+8rUxs6DHX
         i2AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCq8mXK/emtUY29VHQm1IrGvAxFH+N/n7IUTkQeA+0F1KWBkjuGECt9mHtFOiUc5LXpkmzchidA514Tuk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl9X3MaKO+1kPV2Cb/LjigKHKcvbNKyzv3aWD2erejMB4TVF/I
	r+/JZwuSQWXlYfd2l9NMUeD7gIQIZbNpC4emsHfGPlxnF4yknISwIoMc
X-Gm-Gg: AZuq6aLlPUb2juOxTNk3kcrFudiekZG4VevQ4xs9K2nicqdAqy4EqiuoAZCEQOrJnH4
	PIei+YaihIcP8jSxP0suRCCkVAEUVad4833LriJSnlCwgQurW/ly2WnNNxkOKr9jPitLNAltT00
	CIx9mrGb8nTeAHETVQyh1JQyW5WwjkumVcbbXnhMV9y5vc4c/tCg4QAjiUk6M+2oj0L0eISns2z
	TdA4OsztgHXnSQ8o0RJghup5G2a8j19xu609fKvCL14CcsyWBppsn1mZtiJ09pqNr9PH4mROrG1
	yTpkjMOjCOruaSpAD8ECrPJXiM1L4h4duV5E3L2i3/Zqbhq9fDsEl8GqXcpQQTQAaJOTSK5xJUW
	Yt1+yiyE41rKMBpuXctaY4WurLffCv8ljokdCHX3C2Dgb35dt97QMiYr+LCu87aKCezMIAIHnRO
	bnfRXaApX9GR7qbKR2PannjjKAurlp7f+FFgdP2d6WlRZy6EADeePmU1pDkJ5jLEjLVTPSqZD2a
	3alDJZ6DgozaJQY0Li707Ld7tpWmvkFt3wK
X-Received: by 2002:a17:907:cd05:b0:b73:9280:2e7 with SMTP id a640c23a62f3a-b8facdcd808mr4941966b.34.1770923892195;
        Thu, 12 Feb 2026 11:18:12 -0800 (PST)
Received: from ddolgov-thinkpadt14sgen1.rmtde.csb (dslb-002-207-075-089.002.207.pools.vodafone-ip.de. [2.207.75.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f7a48890esm162938666b.65.2026.02.12.11.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 11:18:11 -0800 (PST)
Date: Thu, 12 Feb 2026 20:18:09 +0100
From: Dmitry Dolgov <9erthalion6@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-perf-users@vger.kernel.org, Ian Rogers <irogers@google.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v1] tools build: Fix rust cross compilation
Message-ID: <jqbrvllvq4w53qkbvk444gtwldsv5zvxpqaxmjsl2qnk6vnt44@ouojmbn4af3i>
References: <20260212185810.648364-1-9erthalion6@gmail.com>
 <CANiq72nmzYkHpLTwWxn71TKKTPxWprjPHxBau7Yat32P0zE3pA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nmzYkHpLTwWxn71TKKTPxWprjPHxBau7Yat32P0zE3pA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11293-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[9erthalion6@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C2E1130A39
X-Rspamd-Action: no action

> On Thu, Feb 12, 2026 at 08:13:25PM +0100, Miguel Ojeda wrote:
> On Thu, Feb 12, 2026 at 7:58 PM Dmitrii Dolgov <9erthalion6@gmail.com> wrote:
> >
> > Note that CROSS_COMPILE might be different from what rust compiler
> > expects, since it may omit the target vendor value, e.g.
> > "aarch64-linux-gnu" instead of "aarch64-unknown-linux-gnu". Thus provide
> > an explicit RUST_TARGET_ARCH, and if not specified, try to match
> > the CROSS_COMPILE value.
> 
> I would suggest explicitly doing the mapping automatically, rather
> than guessing or requesting users to provide one more variable, like
> we do for the non-tools side.
> 
> Perhaps using a "table" like we do for LLVM and `bindgen` -- see for
> instance `scripts/Makefile.clang`.

Thanks, will try this out.

