Return-Path: <linux-kbuild+bounces-9399-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C43CC31950
	for <lists+linux-kbuild@lfdr.de>; Tue, 04 Nov 2025 15:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 170C418925DC
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Nov 2025 14:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC0632E73E;
	Tue,  4 Nov 2025 14:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="celNCeFq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626953314C4
	for <linux-kbuild@vger.kernel.org>; Tue,  4 Nov 2025 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762266957; cv=none; b=a685+beGskBoBQo6t0izGCzI7pP9ero01PWR3W1YmMqAVcPoQWT31UkrcengxY3w/o2NM/gG8uSQGgFdas4VGb5bbrG9+xaqriB2jIat5fo0XmgbgGdnuAgWuNEXAW/c6OoQGQtSr5K1qlzcImbsbbGEByTW7G9jQW2dY/dL6DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762266957; c=relaxed/simple;
	bh=GX2GI3xXEF4HI3q0KcvqQ4jEGISNdcm25fBO522FbcI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kneM4a9951WyLSE6cv6B7ARQapL4RuSe40T1yScaJ/7HfUNUiF2fkyNS0s6YVkcDMbLXdGvyj4WGOm+K4mJjS1fcpwZ4yTQBcCncWlr6ygkJas87TpMFZQLzwdbLm/2KSCzzs4wT1UYZ84RLl+MINCX+yw5KHMrEPoEYL6HVIIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=celNCeFq; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47754c0796cso8850375e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Nov 2025 06:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762266954; x=1762871754; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IOVCXPPctiOeHSzFXrhZ8UdAWinRs+tNL6RnLupq0q4=;
        b=celNCeFqoNdguOSwp+HXD2MW1ZH/Ls4ALDcRfRBNJIb4fH6Oqmw7/X9TKKCT6N3OZ+
         5wwdNVyeDpBz8R1hzOdnRSNDHGIlatzaeSZO9WTPqhkdo/r3YMx5svQ0EOO4wHQ6ge5w
         u8p73ppfns3Q0m/sRBqYGObL3Lmzd4QNZwrbBns6E7lAaUUBIw1rtHghrWV22RqCh0Hd
         jQ6zaFv/Yehxn4V9L65e6KAYscDnwRIQLf39Spypa1fUY9Q4O0P+csRsC+cdI0H2/cVi
         1XaEmpP3c8fiL6Eytq4H753ZANweMuGAmNTr1H/kwIXkQqm8N39HmYIa/rZPsgLd93un
         agrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762266954; x=1762871754;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IOVCXPPctiOeHSzFXrhZ8UdAWinRs+tNL6RnLupq0q4=;
        b=jwBA1Smdj6a4qolpzYV8ouw8vTh2ShNzovfaOHGgWqjnQSYjUw3vxrlBSbyTd2i3cx
         Xgrd18osSr3NGLmsdSwC3U9kASB+kaFpP8JeCWHG9yn6M29w26Va8fMphnQ40DkYvDyz
         5yTpab2Y1ON0PIg7uKM1hqMmNapcDnDcnaPgnlWcJguBH7xP3k15Qus3IBBIJWGd/0Z5
         +dkZt5uY00lfa6z+hv7ZF8PE1jN1QOGKpraMrF6FUnrCr9dAm8Zkn2K3nlb7kdKpu0qD
         ZXGBwNIG2phwdtLPwGOHV50cv4zmhwIN/ze/bAQrlzd5APPdWMOqmvwcioDUEo6D1JFS
         x4AA==
X-Forwarded-Encrypted: i=1; AJvYcCUjWDKdymFrDteTakEJWPIFkXeBv4sZs7H+u5T1mv7g0YiLktlIpPgoGOp7/YLboSmGGkS7/t8VAF3rfcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPGp9VW2ENbiHSZGa2BzGZ82SdXbsQwN/hH8PFY17podgV8/Ef
	uxMVhfBeyLx3jm7mor/LdTXib6NK3zNCUtPh3UE088q6xKoNaQUOuM1+Av4AaiBEofR+0w/GgNF
	TaaJ6Ej1i4jvWoAt/Yw==
X-Google-Smtp-Source: AGHT+IHUIVO/JrZ+sifdGbE2HNDP12NCBQ4Gy+soRUB62GGdW8nKY8+xMnZfZi9CwRQeoxr1/8RQh5TlG7DGBL0=
X-Received: from wmg26.prod.google.com ([2002:a05:600c:22da:b0:477:1347:d406])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8207:b0:477:55de:4ad with SMTP id 5b1f17b1804b1-47755de06bfmr24595865e9.30.1762266953468;
 Tue, 04 Nov 2025 06:35:53 -0800 (PST)
Date: Tue, 4 Nov 2025 14:35:52 +0000
In-Reply-To: <DDZZ1ZWIPH8P.3M7H00GIMJUXV@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251104-b4-as-flattened-v2-1-b042d8715a8d@nvidia.com>
 <aQoJUAdFFBpQiEZU@google.com> <DDZZ1ZWIPH8P.3M7H00GIMJUXV@nvidia.com>
Message-ID: <aQoPSH1jyv9DWhsH@google.com>
Subject: Re: [PATCH v2] rust: enable slice_flatten feature and provide it
 through an extension trait
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Nov 04, 2025 at 11:15:03PM +0900, Alexandre Courbot wrote:
> On Tue Nov 4, 2025 at 11:10 PM JST, Alice Ryhl wrote:
> > On Tue, Nov 04, 2025 at 12:53:18PM +0900, Alexandre Courbot wrote:
> >> In Rust 1.80, the previously unstable `slice::flatten` family of methods
> >> have been stabilized and renamed to `slice::as_flattened`.
> >> 
> >> This creates an issue as we want to use `as_flattened`, but need to
> >> support the MSRV (which at the moment is Rust 1.78) where it is named
> >> `flatten`.
> >> 
> >> Solve this by enabling the `slice_flatten` feature, and providing an
> >> `as_flattened` implementation through an extension trait for compiler
> >> versions where it is not available.
> >> 
> >> This lets code use `as_flattened` portably by just adding
> >> 
> >>     #[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
> >>     use kernel::slice::AsFlattened;
> >> 
> >> This extension trait can be removed once the MSRV passes 1.80.
> >> 
> >> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> >> Link: https://lore.kernel.org/all/CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com/
> >> Acked-by: Danilo Krummrich <dakr@kernel.org>
> >> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >> ---
> >> This patch was part of the Nova GSP boot series [1], but since it
> >> requires attention from the core Rust team (and possibly the build
> >> maintainers?) and is otherwise buried under Nova patches, I am taking
> >> the freedom to send it separately for visibility.
> >> 
> >> For v2, the methods are aligned with the final names of the standard
> >> library, and the extension trait is only visible when needed. This
> >> simplifies both the patch, and the extra labor for user code.
> >> 
> >> [1] https://lore.kernel.org/all/20251029-gsp_boot-v7-0-34227afad347@nvidia.com/
> >> [2] https://lore.kernel.org/all/CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com/
> >
> > With the below concern verified, you may add:
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 
> Thanks! You may want to check the v3 that I just posted [1] which also
> addressed your comment about having the extensions trait in the prelude.
> 
> [1] https://lore.kernel.org/rust-for-linux/20251104-b4-as-flattened-v3-1-6cb9c26b45cd@nvidia.com/T/#u

Looks good thanks.

Alice

