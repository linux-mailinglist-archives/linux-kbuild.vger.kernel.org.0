Return-Path: <linux-kbuild+bounces-9493-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD22C45EF5
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 11:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56CCC3B76CF
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13F9306B01;
	Mon, 10 Nov 2025 10:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="14uCg/K0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBDA2F362F
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 10:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770462; cv=none; b=mRpuQEdUPgzXmHNZQZS+qjyOKiutScKArb0hy6vM8mP6pY6bJ6gE89dLlfz13lXi5LEnDnzCT1yndbZt6u/Cbla113d6QeXJRdS/NzxnUHZfB/iW6CIC/O5s2vkpU/nUiBJQBkQUVvwNeAIRTTX3JWDsrMWFvhmEqwxXz7NIN5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770462; c=relaxed/simple;
	bh=qOc2Yc90dsMYkDqxDQPjAtDHWYmR39nkh+FTIYhuNTo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F2PSSw1PQfUFe7wyx8axT1OHo9YDk8+m2+6ZROs4rb3vDyNfEG3+05L/AGJdc2LSQ3aJqvH6PvXQE1DFMtG7tZ+Sh7SvrsqUwFXheUYjPdDH37xTzgwEgp7k2eYDz9hg/9uRHGlNh03BcurVrS7ydFZZtNM8RfIMddrxF3gGpow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=14uCg/K0; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-640b06fa998so3170530a12.2
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 02:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762770458; x=1763375258; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Egm6bH8haTO66pWlj9ItuOdMEFY5snjzdOZKIxF5pdA=;
        b=14uCg/K05sXC7gfX4vga9G2yabPKBdqsO4KoHzBNH60iLvtW6bzLwitFjNBTVJlXoX
         3MC/R8xNtWBssqSDJEKj995QqFgQznCHfSOPd17WK90k7amx8MT1mUHZNUnLdpr33tmv
         tLB154QCX93MF9M5pq39XEh4/RQONltfx7HYlu3rSFWJdYD+19pjpp07deqgsVydT57x
         +nl6dj+A2ggIdFLBL0wUpBdMwW0OfUfo03ecFmhgb7Pb1e+BQVZ5Qv5nTXuAECufCOLM
         ugoSntFqvY/AKRVKHIi3YV7h950/zTeduP+4IQU5VMhKKeXage53x/QPWJuTixDKC81X
         Ikhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770458; x=1763375258;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Egm6bH8haTO66pWlj9ItuOdMEFY5snjzdOZKIxF5pdA=;
        b=EGKe8V2vF8/DUSJLs0HmWyT7HWfV+7YDo+Afx3gcns1XDfejuefmbqxrkx+Fpe7Y/e
         QKqGP7SQ8noAVEw8S6HWbg7On+N9iZ/l6eYXfmzBHHaQnsZQYVdwzIHmG1xJrOQ2ZzTx
         LJlA2J44qUcePpfsGeNUN0Tae/A4A1kOfeVmoO2kR/H8KLRwS7+kcpYgHMqmd3VRCf5K
         /GztUFGQj+t1ccYdab4kv/t623S9FTWiMniNmaijJpppoSOeO9DxkM1JSyelZkWCQZPr
         Rlyv7jsFHVpqilaQlMMjmBaa5FdDtBQQfPfb+dZrN9fpZqFLsxgK5fUivZubKJroD3Bq
         DGIA==
X-Forwarded-Encrypted: i=1; AJvYcCVqjCZRGpN58zfs1DwP7Kqibl+d47BIMJjhOH2gQ7qQwI93qwi/vEJAOJtLdz6/h1ClGvIMvIUw7AKP1zE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTPqFWEw62wyw/JfXYRtCFw6n6R2em2KO2JxQLLtCddefpiQyv
	4Tjd8Ngvsjlw2nuzcF+K1+qXIUynJbz/jRwOkCSMj06SZz4/RXL1l+AUQNgSeJZvHuR5cVvRmlH
	g0OjtvpOA9REHqd7qtQ==
X-Google-Smtp-Source: AGHT+IGusiuHZLT3Jzp+Pn6pR0ClVUPAC/bjvfmAH1j2yaYh3CBjTcnQebjmD6hy9yf32AJb1ySOZAn3SaTPK0g=
X-Received: from edhr13.prod.google.com ([2002:a50:8d8d:0:b0:634:4a04:b8ff])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:84f:b0:640:c95c:be17 with SMTP id 4fb4d7f45d1cf-6415e6e759emr6717600a12.16.1762770458616;
 Mon, 10 Nov 2025 02:27:38 -0800 (PST)
Date: Mon, 10 Nov 2025 10:27:37 +0000
In-Reply-To: <20251110095025.1475896-3-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-3-ojeda@kernel.org>
Message-ID: <aRG-GU_I3MjT46dQ@google.com>
Subject: Re: [PATCH 02/18] rust: kbuild: introduce `core-flags` and `core-skip_flags`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 10, 2025 at 10:50:07AM +0100, Miguel Ojeda wrote:
> In the next commits we are introducing `*-{cfgs,skip_flags,flags}`
> variables for other crates.
> 
> Thus do so here for `core`, which simplifies a bit the `Makefile`
> (including the next commit) and makes it more consistent.
> 
> This means we stop passing `-Wrustdoc::unescaped_backticks` to `rustc`
> and `-Wunreachable_pub` to `rustdoc`, i.e. we skip more, which is fine
> since it shouldn't have an effect.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

