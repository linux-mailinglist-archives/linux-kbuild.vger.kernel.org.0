Return-Path: <linux-kbuild+bounces-9926-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE64C98409
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Dec 2025 17:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64D2B3A16A4
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 16:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6753731CA50;
	Mon,  1 Dec 2025 16:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIrPlRu+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07651FBEA6
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Dec 2025 16:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764606736; cv=none; b=joyz1NWtXEVaMgTz6f0L8VkbUD5h/i5wDKdUSYvozYmtLLQzFuj/72+5j3r0kpIsjfKxrUHXcbgNADyj7lL2jV4regWq7DyW+shhk7MRtoQMo2RZkjmaQ4Rz3kiZcYDqUt6wQj7GlCZAYxAyfURMGu53Kqdo1KzKDmVylMdD1I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764606736; c=relaxed/simple;
	bh=sw6lbfdaMYOrwnUAK6JJqbnSFVu5NtCzD19L3bQZnvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ca0Xq4dFywJq+regephLU6C8jwz95cn3jDT8FH5ziiGjYJXzpeJIr/Nbe02BM/+9UnH5/R7WlIY1v9HmqEfv28ukFMG1KP/bEtB3H8yoMmW1EvSawf/F1lS2dRm9wSBngrUaPk2QUw549TRyfk47n2h/w/1wE5Roo2jK2G1KjaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nIrPlRu+; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-bc144564e07so124524a12.3
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Dec 2025 08:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764606734; x=1765211534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sw6lbfdaMYOrwnUAK6JJqbnSFVu5NtCzD19L3bQZnvw=;
        b=nIrPlRu+/q7x/wK/sT062eP8PGC4iV4/ZI9+3KSmGiqU0ALe2wRM4EVGLq89Ja9HMF
         JwvTSWEQ6kCWs/sguNAFhvmd08aMUGdCWHd+IaqaygJRtRFhKQwJxFb05Hph/IekcSid
         skDcIsj/kh1Qdbx/kvi+LgihYOyJH0KGEm7tQoypdNQ6XJ9uqtb3av3dutzgbHx9nHXx
         FJTpZIxq5MoG6WUJ3Q1uQG+3xKPKQQoxb8DhwHWDG0I7FWrcRGIOIArGr8PjpfyKR2X/
         MojD54s+C0brKnyFvLeY3ejigCJi5PAHvm8zF0dojSag7NWygxrsznovgS/sntsAPyxQ
         caSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764606734; x=1765211534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sw6lbfdaMYOrwnUAK6JJqbnSFVu5NtCzD19L3bQZnvw=;
        b=r25Gu+mDfDsr1+xtVTUxyKWC/Tbw7PWCePKS+jQg0JKyY69gBb8F1rcXxVxXk64ifz
         opte0zJaaxbeULAR5zRFbktWz8i39wpryfEHvan6tRtafCLek1IbkF3I3GEz8JRRhxmi
         NdTDkthh7Ng+YHNgOgN8iAK420kb6YxorH666hj2+4zMiWYmBGrzGb8LahwbuD4W9xAi
         vK9doMvkBeci4EsxSCQwAWMDI3Mhm5bIwnaUUdnzS0JthKuDoq7pX9RNxBPHjS7/WkOs
         Zi5UFaI/kEtg5ayXxoj5Or1BhshRD/5gCO6Hh2NXsdr9EfPZyjChT6LTlwIXUz1JmJnR
         T3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVIYtbEyR394xLrHdDvOmJokSEFsGDTzjn+xUKfPswjPgJ0hSLx7eFNUwz9ib/qOYOKQ3luvEeM8Uh6CO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTFir6oLj4O37HZe1ZAWDMpYqdPnr3T+rZORLdH9VQWKxQTVG/
	lVcPNcPk/3VYsOslxmE1PIBef2FOA/iRBmdhl3vtiGJ5aGK2sKEmEQ7tXs1OrwbKqwVY1avFH8z
	cl6CAr4AMMlCS+GHj2EzoJKjyp9yWG+o=
X-Gm-Gg: ASbGnct2Xu46eRo3hJtzGXMzH+1jx7B0JH/8pDjc54UXtofyxRLMzv30yb8EZ/TgpwJ
	WC75JA4Yu0tYW0oagh7hGWdkXcsQRNwf/jONkxfPOL6SER2XKWQE/J0qLcO5w5L4SvfoOo5TqHv
	oeFdE/IbBcseEZdPPlzdoYuxmw7F0Qm7S1fDyG1wOvRYC2v278kL379sHtSBJRr30RAefJIK+Iy
	sAnleB9To7kYbcEP7jkHKQy/sF3DBv2ybILSbkwshI95Gyk8RUpjTZbk88KCKuX0H/rljHPfzSN
	RgkxmpKPVBlP75l9wlWcxRY0yzaYu+vcx/eJb7aJ1REzrdykkNRQeaNGnz4rXHcZhR4tnzJ5x0n
	67ippWuFtmYWqTA==
X-Google-Smtp-Source: AGHT+IFSaSNSYsK9skLd9L3+GD87nHsBSTQ18ZktTY/G96pIsxF9X+6Kz0gUfJMhuXFXa1pntC2ut2LHSu9bZOjPBzc=
X-Received: by 2002:a05:7301:e24:b0:2a4:3593:2c07 with SMTP id
 5a478bee46e88-2a7243ec7b9mr21871944eec.0.1764606733811; Mon, 01 Dec 2025
 08:32:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201021659.1729308-1-ojeda@kernel.org> <20251201091514.0bea544b@pumpkin>
In-Reply-To: <20251201091514.0bea544b@pumpkin>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 17:32:00 +0100
X-Gm-Features: AWmQ_bkmIhVv2rJrH-FGssiwc-d63OARlmBA3UX_0DtxkLH5hJJvHYQu-4zaClg
Message-ID: <CANiq72nvzDmhDvFoOx5eyGGmHkpNyJSy-c9mZK4yu_fDKfeS9w@mail.gmail.com>
Subject: Re: `KSYM_NAME_LEN` strikes again
To: david laight <david.laight@runbox.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	=?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 10:15=E2=80=AFAM david laight <david.laight@runbox.c=
om> wrote:
>
> Given that is even more unreadable than a typical C++ name is it actually=
 worth printing?
> Looking at it, perhaps some of the inner <...> could be replaced with a h=
ash
> (possibly with the last real name added) with the ability to look up the =
hash
> in a separate table if needed.

For printing, yeah, parts could be skipped. But if we are looking into
replacing parts of the mangling scheme, then at that point we could go
with the single hash (although, yes, at least seeing "something" could
perhaps clarify in some cases).

> I think that is equivalent to using a short name for a type?

Do you mean skipping the paths and/or the generics etc.?

(That expansion I showed is actually already a "short" version in at
least one way: it doesn't print add the actual crate hash, which e.g.
the GNU c++filt prints without `--no-verbose`, and typically appears
between brackets, e.g. `kernel[e6083e32b3c2ec6]::sync::lock...).

Cheers,
Miguel

