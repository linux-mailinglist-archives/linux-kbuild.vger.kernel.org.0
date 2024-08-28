Return-Path: <linux-kbuild+bounces-3273-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7749633D5
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 23:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78BEC2859A5
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 21:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30A41AD401;
	Wed, 28 Aug 2024 21:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WQWWbr8C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A291ACE0D
	for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724880537; cv=none; b=ShdHg9te8mZnd6/wQGDM1ZSq5HMLoOD8/UKdrTplV6tTT23uC4mReTNDc2t14vHBx8X72TpjOrmQS1dLTwEEnO+TzOxn3Omyo7ItvxmHie3f8F1XyLz+6h8Gz/+OEdP6kKpLx3d21Ej7/H76IyavjNVsW92uz3sUysfLl8H8WDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724880537; c=relaxed/simple;
	bh=Z0RTE2liLWBqiPCB9noGezQt18J5+g8y4LpW/JuykkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tmmg8udIUiJsMI8zwDrRtJ113FqqmdEnqpOyG5uWWpL3zPSRpdjw/ZmAj2O+Cq4gkGAY601k/D17lyNoNP2KZgsl5v5PxdRALZm0eC1iJzDe3dmXyxt2Aeu69XJaF+CZHImOM5/AfsAcAWowceDBk4tMnd12P31CitcKslQONi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WQWWbr8C; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20353e5de9cso58045ad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 14:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724880535; x=1725485335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MvCelnyORp38Fj//fQhDAaDLLqzQaXh3WxOWjiSyKsE=;
        b=WQWWbr8CnOA+QSiiYyVX45MRQAajH6YZcgNknImYFBmnpImxvD8H8S6UvnCFDirYgn
         J/zvB2FCdsrf+hg+lj2bEgFcy9P2FtkJWGmlZ0gmh6jI9NRJ8Q7fUUzdLt/hWtBVf+iZ
         nBpD6JD6HzXRoZopPb65mDiJ/z/IxELsLcgQaQ35CmiK9fp78I508l5ZgG7281Y4NzL3
         i5z0ZEX6mUE+0+QAAqKMgrZ3F4JXV7BBnA/O1othgxRHiOgTyQvMnJx+0xpBMuPiNMHN
         uKib7AVj8GyMABYJuBqlrhanFO2muSmXFNEyTGS1/O1fRGEWo6/DRdZqQWS3KeUehl05
         QyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724880535; x=1725485335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvCelnyORp38Fj//fQhDAaDLLqzQaXh3WxOWjiSyKsE=;
        b=nJWkS3tI5PpSLOqfLTcIA03tOpnAFiHC0/jh048VoznH817JSPsauAkzPkezr8rU5Y
         6/mXsjoNk/mo16g2dU15orM5uppFUUopKcrCZO1PlE5O8GdA0yvzQWpLK82ioDkRqpwh
         VvwdYJCft9OmOcRWjRB/yF7wdwW51eSYWSDgf9sb1upEFxt4KEMNg4J8z0EFLLHvdBB5
         qjIPgJ2p7fkBRz6lfmc8wQ79xUJ6JTp8oFjxw1eXxswfAKXQDa+wFBiu6DUJaqpJd3nO
         l8mITUnXn3h/jYfuxZKLcv3Mwk3FT3y8bjH/Ty3vGZ+gCuY4Rm+JsTp5A1DulSEZNfQh
         pUvA==
X-Forwarded-Encrypted: i=1; AJvYcCX+HSeFMOmZsfK4jOGSP+kduvvVdFxyBu9u89HVRKwD/v6vbD4F39Q8obJYPu8uAD3b6XkOcyRbXlJD2Qo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV9HYuXuieiSVqBrHJL/0pZZwwpio6M70htDX0R1PmmkXduB6w
	kxhYy2XUKw3yxWuTpRuRImXM47IKme36O7hqlZitfS6o0VBbwtpnoYQWXPUU9vcbCAqKz50+oCg
	Wfw==
X-Google-Smtp-Source: AGHT+IGjAs0BZE3JhQUS2OaJDCYVlg0EV/R1OKIfMRFLb6EzIbnQK3Px/0wJ3JAypIISh5NpUzlhfQ==
X-Received: by 2002:a17:902:cec7:b0:1fa:191c:fe4e with SMTP id d9443c01a7336-20510b518admr220295ad.21.1724880534966;
        Wed, 28 Aug 2024 14:28:54 -0700 (PDT)
Received: from google.com (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038560a301sm102665825ad.217.2024.08.28.14.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 14:28:54 -0700 (PDT)
Date: Wed, 28 Aug 2024 21:28:49 +0000
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
Subject: Re: [PATCH v2 01/19] tools: Add gendwarfksyms
Message-ID: <20240828212849.GA2130480@google.com>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-22-samitolvanen@google.com>
 <71505c05-b651-4740-b14a-a53084a16a61@suse.com>
 <CABCJKufveknkc_ribOBamC_MXRGounFkYBeRkKhppPSHijxtZg@mail.gmail.com>
 <80e7994d-f82e-4f2a-b233-d4f9d6900698@suse.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80e7994d-f82e-4f2a-b233-d4f9d6900698@suse.com>

On Wed, Aug 28, 2024 at 02:31:05PM +0200, Petr Pavlu wrote:
> On 8/26/24 20:47, Sami Tolvanen wrote:
> > How do you propose using the function? This loop goes through multiple
> > input files, should we need them, and we iterate through all the CUs
> > in process_modules.
> 
> I was thinking it could be possible to replace the code to traverse
> modules and their their CUs, that is functions process_modules() and
> process_module(), with dwfl_nextcu(). However, I now notice that more
> work is added in subsequent patches to process_modules() so this
> wouldn't quite work.
> 
> I would then only suggest to change some function names in the current
> code. Function process_modules() is a callback to process a single
> module and so it would be better to name it process_module(). The
> present function process_module() actually processes a compilation unit
> DIE so I would rename it to something like process_cu().

Sure, sounds reasonable. I'll rename these.

> On 8/15/24 19:39, Sami Tolvanen wrote:
> > +int process_module(Dwfl_Module *mod, Dwarf *dbg, Dwarf_Die *cudie)
> > +{
> > +	struct state state = { .mod = mod, .dbg = dbg };
> > +
> > +	return check(process_die_container(
> > +		&state, cudie, process_exported_symbols, match_all));
> > +}
> 
> Mostly a minor suggestion too.. Looking at the entire series, state.mod
> ends up unused and state.dbg is only used in process_cached() where it
> could be possibly replaced by doing dwarf_cu_getdwarf(die->cu)?

Ah yes, mod was was leftover from previous refactoring. I'll clean this
up.

> Removing these two members from the state struct would then allow to
> instantiate a new state in process_exported_symbols() for each processed
> symbol. That looks cleaner than changing state.sym and resetting some
> parts of the state as the function walks over the exported symbols.

Agreed, that makes sense.

Sami

