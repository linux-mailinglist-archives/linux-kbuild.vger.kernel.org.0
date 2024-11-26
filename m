Return-Path: <linux-kbuild+bounces-4865-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1179D94A9
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 10:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 010B3282C07
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 09:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055C71BB6B3;
	Tue, 26 Nov 2024 09:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WPe9DJ4g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F291BD4F7
	for <linux-kbuild@vger.kernel.org>; Tue, 26 Nov 2024 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732613849; cv=none; b=Ohx+oKndN1uTFYgENDCEuKMGahTjEe5toLwoV7oFdzA3HaV1Spdyd2bz6FO+tbDFwObhAfptPD9+ixfSeKixxY1D7pMYVvuuUbsmOBBG7rfrNsezru2caPxG4QlmgvJv24HEFdmDZ/YguxZLwo1dajvZ3dqNhgiISPApV5NUJsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732613849; c=relaxed/simple;
	bh=Zz1N+l6E70WWiNX/9XD8+LoKg4IlcjQah9g89ADPBs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSz+m0lpRHrVs2n5OX7FKjzr2abKPpXo1xfyOVtcyNdyvE3Cn3vynJekMJuuA2P8C6wQVhKPZKafL9oWODBhTGZOm5VY0vHIHrnzQeQ7VVOR19cxlRLEk4XbErwEW555mSE3xOfTI8OZr6hzkwMP6r/WKhUldqgrSElv7qfh2lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WPe9DJ4g; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-382423f4082so3846411f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Nov 2024 01:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732613845; x=1733218645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2p/ybNbBpC5vQLx8bPdGGCOJ0xWaPNm6a3S5LA53V8=;
        b=WPe9DJ4gF2Tp7nX8/+z3fC/IjGA+fkw0rL1w/2+aB08f/B9Si7yR66lQiF+qorf9EQ
         Cy+Mp31096/ixsVAf8T1K7HGZlQDWzRQRu5aWVa7ZXDocL9atgJZEweMqded76IHmFTc
         RlUnkRpMo+LOLjH4DSsHZp54gfEFmpac24+hgg3LbiTfW4fittIGfz4qkY+PH+Y7b4Oa
         /n/FsGotSvJx1lKdMIjCsCZgC4raTOccEJQd9UNsaQYhWagoEsTjRI2QRCfvB+PTKpRD
         CX+LqrJndQdSLFJndGc4sNfGj/yYeDuttTrTOeZNSwtv6HG8BXnnqQ6B3vMt+Q3yeA90
         fg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732613845; x=1733218645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2p/ybNbBpC5vQLx8bPdGGCOJ0xWaPNm6a3S5LA53V8=;
        b=ak9FqSSfiTs+C10ohoAOM2R7+iPqP26yOFgdPj0qPvJj6M5ADkosk7sk3JIJjtMsIo
         wcKskYK3EaaFi1bnqj1p8mlDXEpkzFPwC2JyS9IUmzHAzxFyXtePnoAeuX5SfwrLH08u
         hkmyytxamaCrop0/qPGuHbcS+zzxjGa+K5qy9Mt6L/6A6Hg9BRlDWt2BcVaCCp4Q4xyI
         2OY4Te6zz7UzLJiAOHdszM1vQ2iQqTVRqnPVU7LKbnQKnF2npSU5xlfl5X755qjFAdf4
         qRgxqBMgnkJ+39jFW7lKjM+lFvCuxdH6tmUBbgqrkf/JuK5bh5g+EJt2p4USURjPXwtf
         AgoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOIkxt0KtIP9SHPVkr6NZCFt26SPcRmdwSrfDRTrx9rk4kxe02i8AZaGNJHpgr5eIBJm/rNcgBFJBS28A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa5eQgjddrcri7pPfbnht0PCFxCz30x8YKLPi8XcrssPIpGGQ2
	xRwYRLXio57Np8KEqRU8EAXWtSOgz4JBZ1TI/4LvZmkNviLZP6Yt64Env39akT8cJHfdBPtfoCL
	PVcpZJz3brAULeOXKH9CovEQZVa2DgtZ+5LGD
X-Gm-Gg: ASbGncs/8OEFf+pDUxPRCYAuA0NlYLyPkr/h84+zdfNX4fCuS97HHgP+GtjXAsyYvto
	/Ch1Zmx4+iXdKr9lX1BP+pTVyc+NnpVc3dVljl+LwfN7p1aQAEksh0wHZF3s42Q==
X-Google-Smtp-Source: AGHT+IH8A0G5C+cZTzzzIP3ak0uqe9oHKIgIRpU4gmY54XBEkS7vQyL1q7QM0+P76QmbcWawrl24eZatP6rR2eV9ysc=
X-Received: by 2002:a05:6000:2d01:b0:382:346b:3675 with SMTP id
 ffacd0b85a97d-38260bcbc58mr12390804f8f.46.1732613845454; Tue, 26 Nov 2024
 01:37:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801-kcfi-v2-0-c93caed3d121@google.com> <20241126091934.GP39245@noisy.programming.kicks-ass.net>
In-Reply-To: <20241126091934.GP39245@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 26 Nov 2024 10:37:13 +0100
Message-ID: <CAH5fLghmqO8jAuZm5NUOP8Sf1Nzqdk6PXknozSF0oCE00z2pgw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Rust KCFI support
To: Peter Zijlstra <peterz@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	scott.d.constable@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 10:19=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Thu, Aug 01, 2024 at 01:35:16PM +0000, Alice Ryhl wrote:
> > The control flow integrity (kCFI) sanitizer is an important sanitizer
> > that is often used in production. This patch series makes it possible t=
o
> > use kCFI and Rust together.
>
> So about this -- there's a proposal for a modification to kCFI here:
>
>   https://github.com/llvm/llvm-project/pull/117121
>
> And Sami notes that this would break this Rust thing. Assuming all the
> relevant crabs are present on this thread, could you please comment?

Thanks for sharing this link. I'll leave a comment.

Alice

