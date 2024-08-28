Return-Path: <linux-kbuild+bounces-3278-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6008F963496
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2024 00:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6C42B22E6A
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 22:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6941AC442;
	Wed, 28 Aug 2024 22:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pE9egSTs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F1014A4D4
	for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 22:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724883564; cv=none; b=mIS9BZRLimuwrF70rlU7Hx4EcSWzCgYKJIzFqzzXHJn7pIqhSm7JBJozjlwfZFljMjAzp0rZ8ffgBJVSKeH11D6mMdmDYtAWZ/YSaMJXdz33Ly8bR3TFdEtUjJKxNsLzcc5QEP+edMP17GiScqudi7zcjJ7cCaen20UTyRIoawE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724883564; c=relaxed/simple;
	bh=G0cbini76O7/ZHNrLwHGmXDcm4O4bH6OGrwCSMUuIWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoW1P1K+7QMCZ7wrFoX14cYpGDBoYqFK1x77vu1Ni0k5FIeEAXu7BXjPDy7mHvnr4nbWVmVM7dtS61SZqyhz58yOKLd8RTYcJlgtDw2gDa3QoRdZYj0II5hW39nhHWhyoHbWaIhNoPhl6m8L0orzHJHzCbGOm9awmx/ZTRnYy+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pE9egSTs; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20260346ca1so72885ad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 15:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724883563; x=1725488363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UATx3qyhtRIMlpWJXb2/u6ihrZGsial6qHPPVJHPjTk=;
        b=pE9egSTsf+/6r2x/pZRZeQ6J6RbfRQoFnqOBX+QHFaWZOAG8fCgKtyu0SoAaXWAnSi
         aen3XYT/QzctyZo5M/a4CnIR37ilak68si5RNh3BRmhqHRxHJetk0Cpbl5WlbmMMncuL
         menz3oKokKwsZRJb1u3x0EGnWdj+tN9whjwkP81jY/Pe9kGmFbd4QLcRgHs9cA1EJ08f
         pi/wEMo20yH4A6gZkKWaDHkEDeYRihYLJH/HyhBs/2evEl6Som7mDYk0C1JHlh8+5GGt
         dqPmfZwzoSIZXv28AJmQabQ9S5We0nJqQkk+MGxQrdbTKaRGxO6W+ZxIeKMtVoysuqAl
         kM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724883563; x=1725488363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UATx3qyhtRIMlpWJXb2/u6ihrZGsial6qHPPVJHPjTk=;
        b=c9qDeKgfOiDMx5ZMFAEfUBiFhSMFoRZkkaOW4gybJsln9bx4FFnEbbtkpymY3wCvqh
         eDZ6r3G6sRf5SU2OwD6/OvsM+GW+X7Yb7zi+FbvwTOnWd/CN276ipT0CkTgpjEemLCWL
         DLJKsAqfdv3QThpuF+wwXQeXDwq9g9Nt6HH+rRP36AqhX1cKuhWOQGaffDo0n1beNe6W
         ZvVjXYiPA83VCqIxvHPx3onXjsUwgekMp3pqzNrCDn/EOWgPEbxzfeb4PoTAzv60q2YH
         VoasF5fhAJg8Ow7qXABkdxpWSiZUDTPGxlEVdFxVRA2jDOlEKoirJ76LltBlU0toCevP
         laXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdkRd9VMVVsT62PnPq+TDFTO6ZF6LYfHKaqMnXQooVoVia2n9mU3B1KzTPScikMipje8zwhnjfm15ywKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YziwpVR8kRb8Pr5kG+qcNMJGTtcTvr3Yp0BV+PvL7WYKr7mGef8
	Ez+f9vKWekDUq/0Py2THsH/ghHSD7dqIoIICbMaYAKWLZtUvFJgWciIU86A3sQ==
X-Google-Smtp-Source: AGHT+IEI/yiKkuTOXDYkfKDkA+6/kHl9UL9XvWD754F+DO7KJmsGY1NptaRQNoNDHY+hiQv7NdJOEg==
X-Received: by 2002:a17:902:e849:b0:1e0:c571:d652 with SMTP id d9443c01a7336-20510a7f2e1mr425515ad.1.1724883562507;
        Wed, 28 Aug 2024 15:19:22 -0700 (PDT)
Received: from google.com (83.92.168.34.bc.googleusercontent.com. [34.168.92.83])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342e0a10sm10594254b3a.108.2024.08.28.15.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 15:19:21 -0700 (PDT)
Date: Wed, 28 Aug 2024 22:19:18 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 05/19] gendwarfksyms: Expand base_type
Message-ID: <20240828221918.GF2130480@google.com>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-26-samitolvanen@google.com>
 <742f7226-9c66-4cfb-ba31-222dfb54fc34@suse.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <742f7226-9c66-4cfb-ba31-222dfb54fc34@suse.com>

On Wed, Aug 28, 2024 at 02:46:03PM +0200, Petr Pavlu wrote:
> > +static int process_fmt(struct state *state, const char *fmt, ...)
> 
> Nit: The state parameter is unused by a number of these process_*()
> functions, including the leaf process(). I suggest removing it so it
> doesn't need to be passed around unnecessarily.

Good point, I'll clean this up.

> > +	char buf[MAX_FMT_BUFFER_SIZE];
> > +	va_list args;
> > +	int res;
> > +
> > +	va_start(args, fmt);
> > +
> > +	res = checkp(vsnprintf(buf, sizeof(buf), fmt, args));
> > +	if (res >= MAX_FMT_BUFFER_SIZE - 1) {
> 
> This check looks off by one, though on the safe side:
> res >= sizeof(buf)

True, I'll fix this too.

> > +		if (dwarf_tag(&scopes[i]) == DW_TAG_compile_unit)
> > +			continue;
> > +
> > +		name = get_name(&scopes[i]);
> > +		name = name ?: "<unnamed>";
> > +		check(process(state, name));
> > +		if (i > 0)
> > +			check(process(state, "::"));
> 
> Failed check(process()) calls here return immediately and so would leak
> scopes. However, I see this is fixed in the following patch
> "gendwarfksyms: Add a cache for processed DIEs" so it's ok.

Yeah, I noticed this as well. I think Masahiro's suggestion to just
exit immediately on errors cleans up this situation a bit.

Sami

