Return-Path: <linux-kbuild+bounces-3281-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05080963536
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2024 01:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4FE3281873
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 23:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEC91AE021;
	Wed, 28 Aug 2024 23:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H4Mzj55Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936101AD40E
	for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 23:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724886568; cv=none; b=K7+mgXyoGnY4YfmjHbDehDFFYg8QUcbfdYBpj5gRXvkRaQDo/pVoAlAnISygFKo9XYhHgq8xtTuV0tOq58TdKW8UvcadBjZ3lVVE025cHGeJNKCjU8atUUYjrYw7TN0ABZNTxYdqU/cag/vdHMbh7sSLULEX584byaziZi5FfGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724886568; c=relaxed/simple;
	bh=RZmcXzwnrRhYwDoAQj1Jxhe7OhhEeGVabMOYn+OKJEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ii66V/5J5uIvRdRojg/pZ0gDO6GTtEnZBKlie4tFycush9DI9F/qnYrMty7bU+1g6BSYpHHxz9mteoaXpbNWB+WSYLNc4kMlIqkJu1NwYJZT3t0V6IHzI6Fpe4lSfdUB10gOhXjePSk+6jAzJchtI6j1C6KCVQtOCWYedwaoDXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H4Mzj55Y; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20353e5de9cso72085ad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 16:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724886565; x=1725491365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bF9tb8hwDYR6xa7gB1x7sZNbhUYJUgSYOVOAb5zjrCw=;
        b=H4Mzj55Y4gMWJjD1yLPZX94RAzWQmOtv7QN7sKScGjy84ZXuLZl7MRRSW+5n14ADLp
         1mv1DSXKXTcK9T4lsvGpZsPosjeUN3M+jNiiBszsGLZTfRzDKl/VC8U0hvjOuRLwfQBP
         Hm1h5BOIZfPcb7Mrk0/8ENbwdZEijPzrw/qWtU9d8Q8P8np7DcjyDIzVMn+eCsVS9rqY
         XgrsEuQX3KS7KTat6SaZ1TNqgHSjKoMKtpXROs9+3lDy47NoTCfcQzh7c6oUYckFX8Ah
         l5fYnYM+0oqAS41V5b59z6BSEwP7RvB186VBIGi5eNx23qGQO5LcFTdj4w+3vvCA4Vih
         kNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724886565; x=1725491365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF9tb8hwDYR6xa7gB1x7sZNbhUYJUgSYOVOAb5zjrCw=;
        b=eAIZOaywbDVRjdsj6R7Iy8x5kOZ5QZWKt4fNH2awCMs+CH4UFtSE3hqCqwbys9CFWd
         Rv/TcCuBJ4EKEAGlaI2jt5Zf7sa94zFSNmpzJ0Ht/QfPEjhoL7FkRToVQ/5pttbi7dY/
         Ud2BpnTISa/CK9CkNhiEUgHiPO7ItJihLUTTv6RZB3S46oy4S412LuI57+ychQYLnbLh
         3JROhVh/P+Ru5L3Ccl6kT35oM56zlKXFGsIG+PcDK9JE+bgRam8aUytHne96Ta8OTAia
         PYPyCP944LYqVZf41Ocps58j8zXuFmEznmf0UwRM0YkrNch+hmYIRRZQ6U4sqCFxxBR3
         PtOg==
X-Forwarded-Encrypted: i=1; AJvYcCUtysBe9rbg+Sx2/UPsscVcznXOsvxYC8JQAEEUPSbOJdZgwV0WwSwiHM0CtB676kSv4Gw4UQdGyhXB5Ic=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJKFthzePHxoqvCNydeH2ntMoY8ETtgk3Hco6O38TF+41v92UX
	klMMMXdm/d+qtxX5EmZzrjrBzjedgq9hh1+mJUBJcaPL0er9foD1cxW2ZJM3dw==
X-Google-Smtp-Source: AGHT+IGefsWlldxzVDyfJdh6ODHqSR4DIkOY4bryKmhorJbglzA63HVpwHsAO+Qawqv6PlgLxud4xg==
X-Received: by 2002:a17:902:ce8a:b0:200:7d11:e8e3 with SMTP id d9443c01a7336-2050d1f0c57mr1140385ad.14.1724886564314;
        Wed, 28 Aug 2024 16:09:24 -0700 (PDT)
Received: from google.com (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a5b56sm5350b3a.57.2024.08.28.16.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 16:09:23 -0700 (PDT)
Date: Wed, 28 Aug 2024 23:09:19 +0000
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
Subject: Re: [PATCH v2 02/19] gendwarfksyms: Add symbol list handling
Message-ID: <20240828230919.GI2130480@google.com>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-23-samitolvanen@google.com>
 <95db3178-a2ce-421e-8024-afd7fa3359a3@suse.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95db3178-a2ce-421e-8024-afd7fa3359a3@suse.com>

On Wed, Aug 28, 2024 at 02:35:29PM +0200, Petr Pavlu wrote:
> On 8/15/24 19:39, Sami Tolvanen wrote:
> > diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> > index 65a29d0bd8f4..71cfab0553da 100644
> > --- a/scripts/gendwarfksyms/dwarf.c
> > +++ b/scripts/gendwarfksyms/dwarf.c
> > @@ -5,6 +5,48 @@
> > [...]
> > +
> > +static bool is_export_symbol(struct state *state, Dwarf_Die *die)
> > +{
> > +	Dwarf_Die *source = die;
> > +	Dwarf_Die origin;
> > +
> > +	state->sym = NULL;
> > +
> > +	/* If the DIE has an abstract origin, use it for type information. */
> > +	if (get_ref_die_attr(die, DW_AT_abstract_origin, &origin))
> > +		source = &origin;
> > +
> > +	state->sym = symbol_get(get_name(die));
> > +
> > +	/* Look up using the origin name if there are no matches. */
> > +	if (!state->sym && source != die)
> > +		state->sym = symbol_get(get_name(source));
> > +
> > +	state->die = *source;
> > +	return !!state->sym;
> > +}
> 
> Sorry, I don't want to comment much on function names.. but I realized
> the name of is_export_symbol() isn't really great. The "is_" prefix
> strongly indicates that it is only a query function, yet it changes the
> state. It makes its caller process_exported_symbols() hard to understand
> on the first read.

I see your point. How would you make this more obvious? get_ doesn't
seem entirely accurate either. match_ perhaps?

Sami

