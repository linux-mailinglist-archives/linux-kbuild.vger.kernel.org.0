Return-Path: <linux-kbuild+bounces-3122-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9E3958E41
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 20:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 182642866CD
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 18:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A901C5793;
	Tue, 20 Aug 2024 18:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HA08n9ZI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B41D1C4638
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Aug 2024 18:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724179692; cv=none; b=ZnNFSYJizS4F+Uot+97yMJe6YHScIY0hd26mi/lPxywfC8eFz8JQq5gyau86+il7Q77LD5kPgUEbxMNgVoJ8ihUTfps2HdFzTSRKFdDIDpaKcPFGIJrYhJUIyMXLNcXZ7KvpqGsvZIHtV6fMxiqWKaATEoSk/AZtqMFo4tbv8go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724179692; c=relaxed/simple;
	bh=9IntjtaXg9k+kUVEV9axZKmA4rC298YdyXwRG+HAIh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8zTMffSjn8zJI4F0ppoOspleNSn8O+kDzYly42vTHevHyQJDQIREzvg3rZ1A4I6wCrb2M4yndrqNEtaCLOLStceDnzKyuAvc59XwwwkmvMjSXr8LETXRpBYlvnX0ZcN9mVnRHlZx4liEMBO26nwZCzZ5ngkASBvLQbvY3ay7fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HA08n9ZI; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-454b1e08393so63721cf.0
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Aug 2024 11:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724179690; x=1724784490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kqyu9H3Z/7xJHVyMUShvAD4YuvpcJRXIyTBe+BDA0AQ=;
        b=HA08n9ZIQJLmCrRV8+Ce1gYw50AGfpOYxhfwP9BbcEhjGr8MXkoEHvQekbQb39cN1l
         CpNpq1aufeU/9WDCyZn8VJtQ6YLSB3ny5c2b/Us/q50dO877oJSjH3Ub4dHcnq7PCMtZ
         vPX3vGcPYzrsgbDNPqcTrtFYhNiNK1xIjV9P7b6WfYGqiuDgmbT0Bwcs25Xh3s2KvMIU
         ppsee8V2rjFSrT6FUWEFvfx1glD/WMJesNP+YDHRBWNlakvr5TEpMLhtjIYbBu2m2gmf
         BP0UQuYe67hxjenYfi2AusZuE0SLIKgBI3c5WyPsk3fzNyfJYksvAl8mETg9x1gtFRls
         RZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724179690; x=1724784490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kqyu9H3Z/7xJHVyMUShvAD4YuvpcJRXIyTBe+BDA0AQ=;
        b=AMybTyFcYuMQ7zWHsliduzY1PzmjST2OQ25o/M0trojzzVRpu02FEFEIFwhmegOdrE
         j7yHWf6YoZvl8H4NPEy83H3cfpWHqNXvdd6eT9ufcsh7qcbObInuxNauKsBmE8bvpSib
         ZPJjgqc7weRmuFZznTQGvRGB7oPFYFgc3YQN/2toiX4EIOXuGY+xx7dmQ5vVpTMJd/dt
         wGYwCeFtROfQbVadOXU3Q/kgLX2RVvMtEPlnKSqa6jo4sQsBkbc8kOH2uwhKrzwx13xb
         x5sBD4ooc9QbK3d8Gee8To6xD22JzlX3HLxb1OkYx5Q0W1WR9UisDNV1jixTnFsW9qQM
         DAAg==
X-Forwarded-Encrypted: i=1; AJvYcCVwSTGdILT4BiXLCAEwaHLeOrspv/6LqOisEFrPn8Uej6MFz9CGSBJt4A+Q2KTLZ8BtP67EiAYPSWQ6AFY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxva3idJUpt/wTa5aGsQDzek1DqWsoGvm66HXHaDzTcIQvJ0z2D
	FFDVcNmseHJrSxo4dUCRSDraJu07H/JHvcWnUASMbGILLUuE9emjbCHTins62GwI5zyRPry+0dg
	Dj2GRmYwj4VdPshov9P+r06bKTPtlYbCHuW1s
X-Google-Smtp-Source: AGHT+IEaaaVbWTiloHDIiXOmckXCXgvScfO2Sv9V70rY2jP8blHGtm/LE4cy6bWAnQvIHakKwQ31ZmSJ833RTPp+SXA=
X-Received: by 2002:ac8:7dc5:0:b0:447:d97f:9765 with SMTP id
 d75a77b69052e-454e642e2ccmr3218081cf.16.1724179690110; Tue, 20 Aug 2024
 11:48:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-37-samitolvanen@google.com> <2024081600-grub-deskwork-4bae@gregkh>
 <CABCJKuedc3aCO2Or+_YBSzK_zp9zB8nFwjr-tK95EBM3La1AmA@mail.gmail.com>
 <2024081705-overarch-deceptive-6689@gregkh> <ef6f7294-0afe-46af-8714-ed4a4aaee558@proton.me>
 <20240819193851.GA4809@google.com> <a76f9422-4001-416a-a31b-37ab7dcb17f4@proton.me>
In-Reply-To: <a76f9422-4001-416a-a31b-37ab7dcb17f4@proton.me>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 20 Aug 2024 18:47:31 +0000
Message-ID: <CABCJKudAF0=29js8SDcYY5r6kM7RBveTrZH9RyECNGqkcqy=nw@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
To: Benno Lossin <benno.lossin@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 10:17=E2=80=AFPM Benno Lossin <benno.lossin@proton.=
me> wrote:
>
> On 19.08.24 21:38, Sami Tolvanen wrote:
> >
> > This definitely looks cleaner than unions in Rust, but how would this
> > scheme be visible in DWARF? You might also need to expand the annotatio=
n
> > to allow replacing one reserved field with multiple smaller ones withou=
t
> > using structs.
>
> Hmm that's a good question, I have no idea how DWARF works. The way you
> do it in this patch is just by the name of the field, right?

Correct, it just looks at the name of the union fields.

> If Rust's DWARF output contains exact types names (I just checked this,
> I *think* that this is the case, but I have never used/seen DWARF
> before), we might be able to just create a `KAbiReserved<T, R>` type
> that you search for instead of the attribute. The usage would then be
> like this:
>
>     #[repr(C)]
>     pub struct Struct1 {
>         a: u64,
>         _reserved: KAbiReserved<(), u64>,
>     }
>
> And then when adding a new field, you would do this:
>
>     #[repr(C)]
>     pub struct Struct1 {
>         a: u64,
>         b: KAbiReserved<Struct2, u64>,
>     }
>
>     /* Struct2 as above */
>
> The way `KAbiReserved` is implemented is via a `union` (maybe a bit
> ironic, considering what I said in my other replies, but in this case,
> we would provide a safe abstraction over this `union`, thus avoiding
> exposing users of this type to `unsafe`):
>
>     #[repr(C)]
>     pub union KAbiReserved<T, R> {
>         value: T,
>         _reserved: R,
>     }

I like this approach even better, assuming any remaining issues with
ownership etc. can be sorted out. This would also look identical to
the C version in DWARF if you rename _reserved in the union to
__kabi_reserved. Of course, we can always change gendwarfksyms to
support a different scheme for Rust code if a better solution comes
along later.

Sami

