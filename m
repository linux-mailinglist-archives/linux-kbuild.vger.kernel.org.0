Return-Path: <linux-kbuild+bounces-2215-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B4390DE15
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 23:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68C6B2847CB
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 21:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5876016CD3C;
	Tue, 18 Jun 2024 21:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LwkttVTI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BDF1741C7
	for <linux-kbuild@vger.kernel.org>; Tue, 18 Jun 2024 21:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718745596; cv=none; b=cENNJk9u5SRBACjKwUeT8+WAaYvTcjDdgbostdXIASfLpDM3o7w+sId9eQN7g8bP+sV0c28aUJpAHeq82+PWaiUGFLmDXfjxb2074tZ3UkkNrRr1NYV6nNMmTb0JOnZAcZEKz9eBHUuJXQM3xtm19kzbGotcO1zmjXqXQZJ1hfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718745596; c=relaxed/simple;
	bh=Gp65oFcJHk79zm6jGkHE3iKZLC9l4N5bay4Ton5RAkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ok6hB2r/eY5YKCG5CqpOQx5JCHGT0//z0KJf19uQEdQSePtpATu37tDkVzw2IXf+k93AeJkQ8RiajxoESBISGRJouqdn2Odc++3uYIMbK8fdhIQj3HDVp633JqbtUsJkLXvcg3CPFOn/+oKL9sa1c0UNrHATfme2IMZ8ey57pkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LwkttVTI; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-70df2135439so1058228a12.1
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Jun 2024 14:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718745594; x=1719350394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=50YSa4Ao9uogaf7E1ijDuiJSBHVaTQT8KJlzelZTT/A=;
        b=LwkttVTImLPCW3/wpbhz4VhC49V0EPWg1VVLkHbwFlEXSLvhmpdgW5Kat5d73rED+n
         IhJqnelZbgXX1rD23hm2VwROQDn8gMIHH7Ai5uXF8rTRcjT78wnKOtQU6l5SVTNC7O1u
         5uTMC30CrmtVs+ZkCsV5cqiTn/RMTFgaDrA/AAhqGOk7xebnTiRJc33DmZyf5+nW++Fx
         opUGNb230qLaP7KfDYb/cx353a+KSBCOfMTK1lM+hpZ0S3mZBCEpKS4VrtYgx9E4J4A6
         JhsKKBJ3yuj/mLiaD9fh2qEI1R4iHJ6KC075qH1F7VFT9ctp3dA0IKFFJXbaF8GB+fTQ
         cZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718745594; x=1719350394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50YSa4Ao9uogaf7E1ijDuiJSBHVaTQT8KJlzelZTT/A=;
        b=EioEc/y1tTojp28o/T9D14jPer4f0vgjBLFeYjC+pRDzoJiBDmU4hCVm4ccyLEuC/5
         Ifm+ruL7NCf7LRA1oDPSl03maXgxuqTWFoS21yVt4raJr/Xe/ONRRRt2NWI4crYMJCUw
         qdJG1eeeYgHaHqUgg/8aG5SzAIvI5cs/e4aFgWcUoKvBX6Xs5XTI8hVdOe3vXXMcgGfX
         HluTLCRhZq8hOtVoATlqjCneytSDoct7GiM18gzFjk4W+D9V9g0xK/WxdmixKe/WwIxN
         +sgX/DOhh6UeZxYYSAMWus58H7ohS8gF+yam9FO0c4okvh1ulCYC6jF+17OuZGZfjrJx
         NbyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtELYl1M3hE73XXaVPWEKY7TVEnLFn5p2ZyeBEeiswAZ8cisn+XCVrl6SCGoMW39E9qZqA8saavLybS4adVjODFnHTkvpbuz05aU5V
X-Gm-Message-State: AOJu0YyjbK0FcCMDAUe4139nbrJ2O0eJUj4QqNkSKbe0frrAKjT8reA0
	7MrPzuWHv+9/oAjne8pqq6GGM0rVPDtG7to2d0ZBigTPIGkOIsJQ56X8opx7mA==
X-Google-Smtp-Source: AGHT+IFC6LosG5J95Q/vdHU1XCPYWAnw91UYD1rLAPhQ60B8axl3RfeB1tNNTT7aB4UYI73ab2iYuQ==
X-Received: by 2002:a17:902:eb44:b0:1f7:5a6c:ae3e with SMTP id d9443c01a7336-1f9aa3ec4a1mr7767585ad.33.1718745593732;
        Tue, 18 Jun 2024 14:19:53 -0700 (PDT)
Received: from google.com ([2620:0:1000:2510:5dfa:e7d1:8470:826c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f48951sm101769505ad.280.2024.06.18.14.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 14:19:53 -0700 (PDT)
Date: Tue, 18 Jun 2024 14:19:47 -0700
From: Sami Tolvanen <samitolvanen@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 00/15] Implement MODVERSIONS for Rust
Message-ID: <20240618211947.GD1611012@google.com>
References: <20240617175818.58219-17-samitolvanen@google.com>
 <ZnHjO7x9nszs9pUC@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnHjO7x9nszs9pUC@bombadil.infradead.org>

Hi Luis,

On Tue, Jun 18, 2024 at 12:42:51PM -0700, Luis Chamberlain wrote:
> On Mon, Jun 17, 2024 at 05:58:19PM +0000, Sami Tolvanen wrote:
> > The first 12 patches of this series add a small tool for computing
> > symbol versions from DWARF, called gendwarfksyms. When passed a list
> > of exported symbols, the tool generates an expanded type string
> > for each symbol, and computes symbol CRCs similarly to genksyms.
> 
> So this is too word centric Rust, let's think about this generically.
> We still ahve a symbol limitation even in the C world then, and this
> solution can solve that problem also for other reasons for *whatever*
> reason we devise to-come-up-with-in-the-future for augmenting symbols.
> Today Rust, tomorrow, who knows.

If you're referring to the symbol hashing in the __versions table,
that's not specific to Rust. Rust just happens to be the only source of
long symbol names right now.

> > gendwarfksyms is written in C and uses libdw to process DWARF, mainly
> > because of the existing support for C host tools that use elfutils
> > (e.g., objtool).
> 
> I agree with Masahiro, that testing this with vmlinux would be eye
> opening to what challenges we really have ahead. So, to help with this
> let's try to re-think about this  from another perspective.
>
> Yes, old userspace should not break, but you can add yet another option
> to let you opt-in to a new world order of how these crc are mapped to
> hashed repersentations of the symbols. This would allow us to:

We did run into an issue with depmod in our testing, where it needs to
be taught about hashed names to avoid 'unknown symbol' warnings. I'm not
sure if this is acceptable, so I would like to hear feedback about the
viability of the hashing scheme in general.

If old userspace can't have any regressions because of long symbol
names, I suspect we'll have to go back to omitting long symbols from
struct modversion_info and adding a v2 of the __versions table with no
symbol name length limitations. Happy to hear your thoughts.

> a) Ensure correctness for all users / tools, so that proper plumbing is
>    really done. By considering all symbols you increase your scope of
>    awareness of anything that could really break.
> 
> b) Remove the "Rust" nature about this
> 
> c) Rust modules just becomes a *user* of this approach

I believe the only Rust nature here is the last patch that enables
gendwarfksyms only for Rust. Otherwise, there shouldn't be anything
strictly Rust specific.

> It gets me wondering, given Kris is also working on allowing traces to
> map symbols to module names, how does this fit into that world [0]?

AFAIK long symbol names are only a problem for struct modversion_info,
which uses a relatively short name buffer, so I'm hoping other efforts
won't be affected.

> As for a) the reason I'm thinking about having the ability to test a
> full real kernel and moules with this is, without that, how are you sure
> you have the full scope of the changes needed?

Sure, I can look into hooking this up for the entire kernel and seeing
what breaks, in addition the issues Masahiro pointed out, of course.

Sami

