Return-Path: <linux-kbuild+bounces-9524-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D67C47EFC
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 17:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A782B188C3B6
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 16:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2BB27FD59;
	Mon, 10 Nov 2025 16:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSN6io5Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B29280035
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 16:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792087; cv=none; b=hxUlQGEl933r3pI8FTZoidDUgaSzUxY2gckaIUZ7bJfCn9dDuaOO5ZJhE69hqZi2FirJGAJ/Ffzu+obntvme29Z1i0+vLvrsmsI20K3wezEGw2eBrz/IMSZWsiXlrh4jeXwK9UMmsSZTxAkvRWVhencN2UBIFKRgWSUV0rD7qlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792087; c=relaxed/simple;
	bh=7KIXK0iuY9HU2BwzT2hpkkZ4LNFZPjAGMbfebt1Gwss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=afXhH4L2r4pUUmxg0sGNUOyqHQu6CGDDvj8DmfI/bLeTvd1MxsLi0V7ZhZg/8iFZFiHLTLeH7LVJI9uVb+1aACJeyiLlpK2lZKWuW//ZPQZQeu/siUf8I2jlG6P2xvo9mx/ge3PKe0I8m9xCgFja1mg6hf8di7IrLJGislS299g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSN6io5Q; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2960771ec71so3572805ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 08:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792083; x=1763396883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KIXK0iuY9HU2BwzT2hpkkZ4LNFZPjAGMbfebt1Gwss=;
        b=NSN6io5Qmv3vr11iAZqwp9cyOycPzcDRDVEcKrzJKZh56lFUDluqoRQx659Eu57PGR
         qB2n5VF6wJxyNrwuxbYqu1nL3GNzOCt8Z7ia2ln/fnwON8saW2OmjsaB47+IG2J2ChtX
         gxJiel0g8Em1B7bwrxtopMtKfoHC5EWmR4RjU1+Dr0fLl5emNFFUSfCtIjvBYj1wDLNi
         DGo7BlYrnLfUeoq2vyzF6RISAYZ9PCD27idCRLQVC6bYSaDCkpeijP7jichFpSlVSFO9
         +lnF7fkDwYVRN1xpMQWwNLOiwhgriHZe9IZABImshilq2xiZwM+29ipr7NWyJcVTERnc
         cAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792083; x=1763396883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7KIXK0iuY9HU2BwzT2hpkkZ4LNFZPjAGMbfebt1Gwss=;
        b=VdJsJ9oD6Z2FBZa7lzjMnTKgNj6HYqsjsD3yH7jLHGzpgHiS63qzOJ3xELzzwRIec9
         d/4q5pW7Nb9Gmy4koecFkgGuco/H2rOLLUSJ5jUKfQ8Fsx2YOy7d2LsDXe5ZHmr9uBde
         P/O32IT7IunBzdB4o99wRew+4rLVdcOZkcqzXwGcE03WhOT2GaWAB+v5KzSv5RBw19Hg
         EstIEyxU2D1O3eWSenjDv6cU5EAtxtWFPNjqh1EXZYq8h6ukiFEqwNCsuW/HUxvn+RUs
         PVfeiMIp5Ry+4McQ1AFhApbjHuvf0SmdEet8wX+KFQElwTz8P890/bJpfW3PPfNZD2HN
         j2YA==
X-Forwarded-Encrypted: i=1; AJvYcCV3L8EDIptd9OW/IxRvAUh+nbVsm+9I8esD+nLolnldIckcZEFHCQ4VlyqttDSIpFo34iE7e0u1X7nLtiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT+hdoMu0Sfmwt9dLv19TSmD5jV/g76GCKwe5iDGkxKjxkXDkR
	LqMOcGhCHl3PEkYLnbTQE+7h6S6raYEdmcx9gNpgKwQrj3MNGSZw+dO/b2zXVlH2wCJo1vnXAy6
	t75QABoFNf3sV/ysWkajabiNwlhoQ190=
X-Gm-Gg: ASbGncu4tLYa5fcDRWNsMZPS/F1MoSQ4pW8fCTUC7zw6DyYB4I/ZpXB+n67+mS7/ZzJ
	PDEvIto0H0mbaWSnnz0d0HF0/fpWdZSfsjC0Q1yaZroLo4sIWjvkrwO/oFA1aTMnvs75rwotVoe
	DGDP7CUQizDowYW/xoOIxh41dWtulCGbNkxRpy+k43mU5v/EosZwgYeJq7XbwXReEaWjEk4GHK+
	6+aHI6yCcZ+kF8lol9Ja+wW3e9/2W9hxIe1dmBJORvJ6GMY+h6PAlWTO0tmbp8xJecOVnp705sg
	zrimMItnLB2PcHvh8/Exf03qDyXy25I6PeVCUt3yQf31vJ8KYGDzQj/sWHG4auoo1TeNxyVXIhV
	qkI84Tac5Fh0X2Q==
X-Google-Smtp-Source: AGHT+IGEBFmVPMI5NICewEorUkL0ds7+z3bi+UEi4xsWzIwL5kT2S2mSCMP/63srdW6rOxPPTGD2icUW9ucKWI0bRKE=
X-Received: by 2002:a17:902:d48f:b0:295:54cd:d2e2 with SMTP id
 d9443c01a7336-297e4d096a4mr65754305ad.0.1762792082779; Mon, 10 Nov 2025
 08:28:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <874ir1zxng.fsf@trenco.lwn.net>
In-Reply-To: <874ir1zxng.fsf@trenco.lwn.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 17:27:48 +0100
X-Gm-Features: AWmQ_bkGZ7lpasgtIBPX75wmrrnwpcmnoNKRPRgat20Oz33yBel4ISwgnlmOOUc
Message-ID: <CANiq72==SimzoQARA5uprXs0-iKnBNS+EiKCz1L9V3K6LO1ftw@mail.gmail.com>
Subject: Re: [PATCH 00/18] `syn` support
To: Jonathan Corbet <corbet@lwn.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 4:59=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Just in case I'm not the only ignorant person who didn't immediately
> know what "syn" is and why we might want 57,000 lines of it in the
> kernel... :)

Thanks -- I will add something like that.

It has been such a long and recurrent topic in our discussions that I
guess I was writing from inside the Rust for Linux's bubble.

Just to give a bit more context, it is the most downloaded Rust crate
(according to crates.io). It (or something like it) is essentially a
necessity for writing complex macros without too much pain.

Cheers,
Miguel

