Return-Path: <linux-kbuild+bounces-120-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBCE7F5206
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 22:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 065432815B1
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 21:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A13B1BDC8;
	Wed, 22 Nov 2023 21:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J+TAF2Qv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDB411A4
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Nov 2023 13:04:22 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-548c6efc020so3553a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Nov 2023 13:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700687061; x=1701291861; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mINXLXrq9/oLpdA6Yk/sy1UPcvyskcwNgTwzkZ9kBzs=;
        b=J+TAF2QvDW3tT3S/KbM5WIA5UU9ZgLW5iQGHLxF4J5F1x6f754B9ezoqHNp/Fly6/n
         6hGqdg+URMLDZMEaL6u3ogItVvNfbxQIrF4diW/kUN9+n5xBBBQ9ru9n3K5PVL6xtGwa
         OkyvjSNxvG9AcrcADjJrS7gZK52BJz2aDG3hnBz0f6dafGIVIipgOSbkqJTID015QBzM
         1YPQKEAhqYl4F0OaBukGlGjeUArlneb0HAJLKBNUNnLjtpMxeMRnj7S3A6O7Lx7ZiUcl
         Gux2U7WCJjhEdv5etZDzgmBFL2BdfuEkshalGei3QH+R5WCPiWbL5VfqOhifYuJJxbs+
         9Aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700687061; x=1701291861;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mINXLXrq9/oLpdA6Yk/sy1UPcvyskcwNgTwzkZ9kBzs=;
        b=KvzUc9RmF63slj4VdvXf0BIRy3KMVUVfsMqLhR3G82VBdYacuApcrt88NAtnfTpYXl
         OFRjsqLIwP0j3/lqxf6GG+z6z8s10RCOB08Tf3dqRaRlL+TREUMSk/7OB/blzvl/gpz/
         x9jl8Wzx4Hcp04Vp++HZxs3QyA9flLvKmEW7Tr0hxTWqkosJQgrIouTj0faVcCNQnAPf
         3muDYdOUPANR4ilozZIulz7Mtw3qiDkMi3FVRPV81PdyCQWz6PzuDM+VTc5JcSkM/I9V
         664vfQ432ByhTomtGti0Q3kZEJSCc6pe1VA5xnAfkvFlR570eCubMjd4JEtE6BX0dTQq
         0niw==
X-Gm-Message-State: AOJu0YxcUHZul4dXo9wqKo0npwF+Ya2E5fG6dHSIEEn1BesylPyzaQW/
	Epa5oIEcWJrt2I5zAgYhUFvF4Vnq5pgCn21EmCfqzA==
X-Google-Smtp-Source: AGHT+IEGm9MLKZeGbPnej8xX4u8eiSlbh1Mqb8POBm36fW5cFOc334Fc5wDrn2GxrY0UsMNCzK9qE0nvCl+hpFusPUw=
X-Received: by 2002:a05:6402:d67:b0:548:c1b1:96b2 with SMTP id
 ec39-20020a0564020d6700b00548c1b196b2mr225540edb.6.1700687061263; Wed, 22 Nov
 2023 13:04:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231118025748.2778044-1-mmaurer@google.com> <CAK7LNAQt8fy5+vSwpd1aXfzjzeZ5hiyW7EW9SW7pbG2eTJZAOA@mail.gmail.com>
In-Reply-To: <CAK7LNAQt8fy5+vSwpd1aXfzjzeZ5hiyW7EW9SW7pbG2eTJZAOA@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 22 Nov 2023 13:04:09 -0800
Message-ID: <CAGSQo00hyCTVsqHtrzKBBPvuH38z5yRm_4jzdi00C0RV+8APwQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] MODVERSIONS + RUST Redux
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Luis Chamberlain <mcgrof@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Laura Abbott <laura@labbott.name>
Content-Type: text/plain; charset="UTF-8"

> So, even if you enable CONFIG_MODVERSIONS,
> nothing is checked for Rust.
> Genksyms computes a CRC from "int foo", and
> the module subsystem confirms it is a "int"
> variable.
>
> We know this check always succeeds.
>
> Why is this useful?
The reason this is immediately useful is that it allows us to have Rust
in use with a kernel where C modules are able to benefit from MODVERSIONS
checking. The check would effectively be a no-op for now, as you have correctly
determined, but we could refine it to make it more restrictive later.
Since the
existing C approach errs on the side of "it could work" rather than "it will
work", I thought being more permissive was the correct initial solution.

If we want to err on the other side (modversions passes, so we're pretty sure
it will work), I could add to the last patch support for using .rmeta files as
the CRC source for Rust symbols. This would essentially say that the interface
for the entire compilation unit has to stay the same rather than just that one
function. We could potentially loosen this requirement in the future.

With regards to future directions that likely won't work for loosening it:
Unfortunately, the .rmeta format itself is not stable, so I wouldn't want to
teach genksyms to open it up and split out the pieces for specific functions.
Extending genksyms to parse Rust would also not solve the situation -
layouts are allowed to differ across compiler versions or even (in rare
cases) seemingly unrelated code changes.

Future directions that might work for loosening it:
* Generating crcs from debuginfo + compiler + flags
* Adding a feature to the rust compiler to dump this information. This
is likely to
  get pushback because Rust's current stance is that there is no ability to load
  object code built against a different library.

Would setting up Rust symbols so that they have a crc built out of .rmeta be
sufficient for you to consider this useful? If not, can you help me understand
what level of precision would be required?

