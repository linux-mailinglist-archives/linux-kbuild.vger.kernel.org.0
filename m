Return-Path: <linux-kbuild+bounces-9670-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 50894C6AA95
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Nov 2025 17:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 190B435C012
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Nov 2025 16:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332E436CDF5;
	Tue, 18 Nov 2025 16:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NbiHbK8s"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169FF36C5AB
	for <linux-kbuild@vger.kernel.org>; Tue, 18 Nov 2025 16:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483214; cv=none; b=A5b7uUvQik4aYYlUFVXJ8pT7YrKFvUHzRZx/SAsTUXjGpzOYhqJadBqe+hV+Jrf09eXZOLvUNZvwltTX4xVM1742FU0GPh8GAWXxx4d6m4NhCEI+AnJ4nK20kKfBIflr96RszNaL5oRhruVhA/thDvVBtZ6txAxbVtmSWJ+UreM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483214; c=relaxed/simple;
	bh=FwtecA3cou5swpKk+7V9h8LfHIUHPkUFVZFloQEb+dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ff78Tj8YOGWQ5hCFYv3pLdp4XFuq0Utg0ev21vNkIq+6Lgw1yX4ui2dq3YdT/erb/EuW6txx6RejIV2yHt1JT9BV8xl1I3ZZSrbR2s9fAcEnEj7HlhLQPpM2bdz0JH4+JayrT+AsbHjeJgL0az853Ko5S1WVyd+1mqOSZ5sEwYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NbiHbK8s; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-295c64cb951so242925ad.0
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Nov 2025 08:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763483211; x=1764088011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwtecA3cou5swpKk+7V9h8LfHIUHPkUFVZFloQEb+dQ=;
        b=NbiHbK8sCl+nRR1cXVIWdYqN0I3VLsKCKKWXS0wPLrvekyqFENCVxrsZSfo47wLxTw
         z//TfUqJslTZvJ7bQSfH33MtR3xV+GmKEdC6onwso6GT5UW+RIoIrZf4en+KgLGz5Nct
         2wSjImMNMkayjuFvq0UGue3kgZ/m9LFxk6tWEzSS3SHOSoVEldvwX3LjdMWSfznyiuTD
         /YyB00J6YMdyn7K77TfxB1eB1otkKcXWVI1j0ixgMAUqQb9sw0JgDuuBGzZhIhTw52Uj
         54tEhDKt4ruVyIVDYVg48gLevDM0KSo+NBDP63zbu5OVjHSE5rJBlAAWXkC1vVkZvp+L
         7mcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483211; x=1764088011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FwtecA3cou5swpKk+7V9h8LfHIUHPkUFVZFloQEb+dQ=;
        b=NF+9Kpa5At3+jaj2ZBmzVe3M1bPCHbZv4aikfbg++/jPoF4wlZX3EPJtQVxCwmihv2
         UkYWyijB2gvY32Ug//09ui7two1Y2MhXPljycBsu1lsW44txnncU5xUyz35bX4ovSvna
         nsejiu1675OZVLyvpPr4PjiRWa0uZWvibm/VFkVAyH41e1bkoU017gXIlp8A0VmNfPvT
         ciL9wpGxQWyAKmSLdSGqr69cDojkI9BBtejFpC2ZkN26mjCOdfCrInmPbK3JYGl0eRql
         M9NzPdzYR1mBRFw+HGp/GlH6h4St26Afed9veajb9uq7zbgHxUoS0ZqiEkKIuLJFDPcW
         KZpg==
X-Forwarded-Encrypted: i=1; AJvYcCUQew9IIv9XE3CK+jVOCahj+xOfQ7aIKSasOhdxTDBlERvluKRzn2UwR23Z3zScB28hDkGA2fIBqs4MxJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YycfvGnf/o+cFfBaHTqhBhV52IanXaH8gHNm/YGQiUjnUICunHm
	4FvtzlsDB2HKIgOGWxg6jzu1zVw2K8sNveZ9Savjyxxr3DCUDIjI/Aw4MSGD4ysyx3gcVGGEKsb
	WFtvl4rvyGy0gQKa4sfAZy4ABVuwjr0dHCksTjazl
X-Gm-Gg: ASbGnctMC8qviAw++1UEIH2JnO6AcIYMHQ+nVtNPD13P2Bxd18SdbjwCaOozJ4cRNWn
	ZNqEKwgOt9O5poItpPL1fpYMGFugFBXyiNGmmBlDme73rrSySBsECA5Fw5zLxDspmx4vnACrDr4
	DoI8faoT1ntti9gQ60fBY4h+XJNVFN7SkChRt36rRQlnCZR3nuPGkMj5VqzECvFUbcYyLD214OE
	XLs7BHDAUvfBwxFA2KExl35gaPdwGoKAXSYv2t6nGN/3p2y0KCFOv3uYXYckGb5xLCyUPv8IgMC
	xS0=
X-Google-Smtp-Source: AGHT+IEttx3J/mC4gE4KpQ4cPRjj+rRjuHjvkWN8RJrR+j19dbMNf6uYkFpkl0xwq9jCxBWF224ugSC9ScsaeVYU4f0=
X-Received: by 2002:a05:7022:4387:b0:119:e56b:c1e1 with SMTP id
 a92af1059eb24-11c88f6e153mr87381c88.12.1763483210529; Tue, 18 Nov 2025
 08:26:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110131913.1789896-1-ojeda@kernel.org> <20251118145741.1042013-1-gprocida@google.com>
In-Reply-To: <20251118145741.1042013-1-gprocida@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 18 Nov 2025 08:26:13 -0800
X-Gm-Features: AWmQ_bkpM4OnhqoM9DwukpapoYV-fxdR_ddUQfMp-wv3ty5dsyWJZ2MH8TZJaP0
Message-ID: <CABCJKuc0ZwN23MX4mV=vVne1giR=iWKSvqFg1oKMqxUcnOWiCg@mail.gmail.com>
Subject: Re: [PATCH v2] gendwarfksyms: Skip files with no exports
To: Giuliano Procida <gprocida@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Giuliano,

On Tue, Nov 18, 2025 at 6:58=E2=80=AFAM Giuliano Procida <gprocida@google.c=
om> wrote:
>
> Hi.
>
> > Thus do the last one: don't attempt to process files if we have no symb=
ol
> > versions to calculate.
>
> This results in the -T foo option being ignored in the case there were
> no symbols. I think it would be better, consistent with the
> documentation and expectations, for the file to be produced empty.

The kernel build doesn't produce empty symtypes files because symbol
versioning is skipped for (non-Rust) object files that have no
exports, and before rustc 1.91, we never ran gendwarfksyms for Rust
object files that didn't have exports.

> This means that just the for loop should be skipped, say by adding the
> condition there with &&.

No, I think the current behavior is correct, we shouldn't produce empty fil=
es.

> If you disagree, then please update the documentation to match the new
> behaviour.

I re-read the documentation and it doesn't really state how the -T
flag behaves if the tool is used to process a file with no exports.
While this doesn't impact kernel builds, a patch to clarify the
documentation is always welcome!

Sami

