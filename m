Return-Path: <linux-kbuild+bounces-3277-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FBB963431
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 23:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30FE21F24963
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 21:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0760D1AD9C2;
	Wed, 28 Aug 2024 21:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v+V4kCIM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C2C1AD418
	for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 21:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724882335; cv=none; b=OX5J8GQbabYZ2phkVarp3BQkJl95tB5mFzUnPetR8MZIus5kZrNgMBRASIXC48n4vTLqSy1FWFw1CBS7iRxOat4Q1Ow7F7rEIeGm7YBOSQdCaLs4rhmZChEH81wQ6orvPwV+rRe8KveVN05kFCWysYCnvZQefjTKF5+p+dY6Qck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724882335; c=relaxed/simple;
	bh=o+gAn/ilZ3C56975j8rPvUkgN8dfBSz6M6D5Wf/lSRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBxN1ftAuwI5VA+DJFwAHFhCR3VMg1kf1dKl4Ddc/f9WxJkdChDBEowCTXzTlPqill2KT3rbHszJPSWdg2l9AsPPsYrmijQokc/cZsr8nKL85Ci2fZfF8C8zvCO2Wyclo54Z1yiSFyrtzdAGXGsZqgNWKBYj29WhmEeYL1iDoa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v+V4kCIM; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20260346ca1so70035ad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 14:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724882334; x=1725487134; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nnGSwXCYQc4Hwc+sfrpcLFkK6Wt2k6zs0AyOgifdXGg=;
        b=v+V4kCIMaDH5LZGtMEqJHuPmAHofgBF4kgzrNaRoL7jJ50gC6axGbUpQKImEJYK1oU
         MZdCnnBcTr7MomTjEriinbhpLMaZlRiRnvNWTyNf7QQfREgJygui0Ju+pN95ngpp9tjH
         rOYDQTqFaagJFBwbGyH9jwhsb7SG+yh4P/U9jrSSPc4gDvEnRl3nmVz+8WZLdiQw36Ge
         +EJbo8D4UskccJHKoMZDtmW7nVxwTu+YL0ukoJAL/t5awf//J9zZ3i44VW+zcn7t6m2I
         KgfjFyCc3TpLZqMszFA2tPr9cfrt7hYy4jqLoWFDUGzPBfKyy/R2xp/vFTFWya32Aqhs
         61Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724882334; x=1725487134;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nnGSwXCYQc4Hwc+sfrpcLFkK6Wt2k6zs0AyOgifdXGg=;
        b=EVXxKvSR0ugEEZEUGN45dcURrDkH9xyIJVqEhi0bom+t+vR8OTUlnyD4ZUTTZ5uu6q
         J5YyKcvhWpdAhvkOw5nDLIqR27G7yLOz1A9mAI2xcdYR3Xacnq1vYKiZcNaaS+MDwvW1
         A50utL6yRcTTq/2fBxhLn8Kae0077XlVTdhGTONAuU7awBP4VCyK4LRbd88FTGqNucdL
         FMJi2cOidtQZK9r+DyyvbB5R5LxzAhSrEjNL59L22OObZcywBLlNa+hS3dCSmfS2PBGu
         80LgAwgSMVcr1FQBrw4CZbghpzZZ7t/VXr2PexH/wt30Jtc2gLl42XVDXR3FScJZzF0f
         vczg==
X-Forwarded-Encrypted: i=1; AJvYcCW8tYZPIfrc8uxax39XtZ8mbh72Lo/m9pwIZ7qBb8c6ftVK/JM1Gp6h9mN462rrVaHW56tEOySfXIycsvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTnItZ4MyV6q08/EAXDmVsVmB2M1g4mCG2v9ylHkvxyTtODxIO
	kfD237LkC22GcS6yJcpTR0ZqsADKU12eCHySbdVEffhEhvzo+yA6GNJhEuCCbQ==
X-Google-Smtp-Source: AGHT+IGVfzjHYyRASEld6yxxMpC9vJZBxYqjU0CXEpHxInbohWJsi3m/XdXyujxzXPDjs/QQJYYJow==
X-Received: by 2002:a17:903:604:b0:202:883:c0d with SMTP id d9443c01a7336-2050d2366demr1037415ad.24.1724882333453;
        Wed, 28 Aug 2024 14:58:53 -0700 (PDT)
Received: from google.com (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038560dfaesm103172195ad.223.2024.08.28.14.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 14:58:52 -0700 (PDT)
Date: Wed, 28 Aug 2024 21:58:48 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 04/19] gendwarfksyms: Add support for type pointers
Message-ID: <20240828215848.GE2130480@google.com>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-25-samitolvanen@google.com>
 <CAK7LNATb8zbwEVgM+_=CaYSysov6YBMbKjy8+t8CrRA_72jxuQ@mail.gmail.com>
 <CAK7LNAQBO-VA8G9uumwH5m9idQofY1ZR+hnNfL7y4P3m16xFNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQBO-VA8G9uumwH5m9idQofY1ZR+hnNfL7y4P3m16xFNQ@mail.gmail.com>

On Wed, Aug 28, 2024 at 04:15:03PM +0900, Masahiro Yamada wrote:
> On Wed, Aug 28, 2024 at 3:50 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Fri, Aug 16, 2024 at 2:39 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> > >
> > > The compiler may choose not to emit type information in DWARF for
> > > external symbols. Clang, for example, does this for symbols not
> > > defined in the current TU.
> > >
> > > To provide a way to work around this issue, add support for
> > > __gendwarfksyms_ptr_<symbol> pointers that force the compiler to emit
> > > the necessary type information in DWARF also for the missing symbols.
> > >
> > > Example usage:
> > >
> > >   #define GENDWARFKSYMS_PTR(sym) \
> > >       static typeof(sym) *__gendwarfksyms_ptr_##sym __used  \
> > >           __section(".discard.gendwarfksyms") = &sym;
> > >
> > >   extern int external_symbol(void);
> > >   GENDWARFKSYMS_PTR(external_symbol);
> > >
> > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> >
> >
> >
> >
> > Commit ddb5cdbafaaad6b99d7007ae1740403124502d03
> > had a similar idea; it has a reference to each
> > export symbol, including the ones defined in different TUs,
> > but in assembly code.
> >
> > Didn't it suffice your need?
> >
> 
> 
> Presumably, this is an unfortunate duplication, but I do not have an
> idea to avoid it.
> 
> The symbol reference in assembly code works in *.S as well as *.c.
> 
> The C reference will pull-in the debug info, but it will not work in *.S

Correct. I'm not a huge fan of the extra reference either, but I don't
see a cleaner way to ensure we always have all the types in DWARF.

Sami

