Return-Path: <linux-kbuild+bounces-7453-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F29AD55AE
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 14:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4132B3A74A7
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 12:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47A027E1CA;
	Wed, 11 Jun 2025 12:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hD0bPaDP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB42271446;
	Wed, 11 Jun 2025 12:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749645376; cv=none; b=uePetfEqEUoX3+GqoYMedv7C+01eGzFBVpoiZ73rrF+jayXtvgZpKxsc+ITA9a9SXf85R1W3C7ZACXfKFHSKf94ban61EK3eibgzYLP2xkoz7XKar9J0WZhxrgL+cPcYsanFCPGn05bewrwLmzmiK76lKk21tap50tDxyeYoc4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749645376; c=relaxed/simple;
	bh=0XnR8Lem/R3Y4dXx0m18cILw78TbdOHiurrdv9QCcUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EMvriMV4c8kkWk7rFmp0VBFJrYwRSQ4/Q3i15YWfVRPFU9MR2eFf6yvEX4lmRClJh1RFo7XRVpuV2ss9xw4mJ2F//TVCtdwFkysFZu/GCQ8cI8GvU+YVedF1+RSpKP17X11C3ZBchtp2VVDTx5XG+2Wv15WkxaXug9MZM/FyBsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hD0bPaDP; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3131aa07b50so60992a91.1;
        Wed, 11 Jun 2025 05:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749645374; x=1750250174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XnR8Lem/R3Y4dXx0m18cILw78TbdOHiurrdv9QCcUQ=;
        b=hD0bPaDPCtO8ywJd9VcZm/k1z3X52hG0jKva+vAMZIPBL3c2OBqHSgLmDP6nN9KV5j
         0dOHEVkvp7gY0QnGHLux2C259UfADT0/gDqzaqCHa2I8ePapp+NosJ+nMpB+3PRYotNR
         3edEQ6UjXElgQYmEuH9DMEuJrTCoPPmSFwtIC5csSrGgxU/vI+DUdCrkvjo9cEMND1Of
         4QFh8UKTHQMBWncscR8Fe9e38yVtM5s9h0Cc2ZQAzNdfEwG/K7cGeYwlbIDzocHwHsoq
         B0v7t2DGaQ2EDal6CBQ2t9Tpp/fk5OImSintvH1AHcjXqCvTq0i5RjMozufmKYjQ4axH
         75ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749645374; x=1750250174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XnR8Lem/R3Y4dXx0m18cILw78TbdOHiurrdv9QCcUQ=;
        b=TizmSTlAyfhkhmRxc4hcj6zcVk17r33PbgW8YYcuUqOo45E7SxWPB3bGkgGAL7O/Ww
         licdkaDvXpH4UQE/3h4+QbzC3RYBz892QI0GSFdjHcMDuW6C/bBnUjOropNosV0Ruldf
         4plp3NnY9/l7JRONs0nJL5WkCNgoqPSXG/OScM56Q9fO+CSXM6SkEFpp6gNrUJPKldRw
         oNa4oqGTeZHgXRkHPFmkXLSR0Z8hcM/2oBZxrmP/wzJUsgih9dBQ65qc5OpDf7pUw/CH
         UQEj0wI/pbspKcqzAo+RsuHuEy7IHr2z0TqlT33ZycnoDYTRzTwvP8lHfnzzpU7wxxd6
         2CLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUInCjXL7uGO17/t3ufBqQl52Q3bJaV/v1njySrUf5jqnZ/dZVpCR17Qf6KnGFZWQovQ86M4U7AY/d6ytvK@vger.kernel.org, AJvYcCVN7hBn9jOh2RMrqQkhN8xxjkrz6700zXc5kbGe5Eu4FJSTFfyuGtprZi52pRJCHwZ4l4YC4tGvXDAR05Q=@vger.kernel.org, AJvYcCVfcUowGP7O6WrQa582tDY49ubGDa3S1Ci5HLbbCveR0GGLejI6RP33ZbPTdEuiYqx4M1jeQhz4qpYUqOKmQg==@vger.kernel.org, AJvYcCWnMdBIfitaIIyt/ioj5Nj+TVmp5iJpbnKCz/LYliAncBY8+hs8zHfPfpPnifDWqocY/X7pPhrJTL3jDBqd8+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzinLRgDt7yiBGU0dlwd7rjUlSOBJkcgFJHj+xITlvIgWY4ViYw
	3Am8BDl6v0Ewgi5VrQowAtYWuvIhzkpFSLzskIZWLrx7vc9mrs8iLKcL3538+T68LfXVS1Ekxqz
	BMmQKKhMTj74oNJhkyM71SyBZ88Q//wg=
X-Gm-Gg: ASbGncs9f74L1jSNvKWtJeFYInd24+2/KeWpFzO8EuqFatkhW1nyR2Hyot5uvlaSI4A
	iinM1MfJEEgg4lNdswIXWaaRr4VUZetzv6ZeXa29MhmL3pDXLfKY8AWeX+Y2pPbRiMbZsCfn9gW
	9gF18qSeclghYoDvwJy4S41vpVeS15Lv/kx75NwcbKz4g=
X-Google-Smtp-Source: AGHT+IFG8iincxKNf+DxPInAEi3b+a5hffChXWbI2W9nY1GNEh8dmmC/cTxv8+gQuD3OyvEZrlG5cMZ4IvzhaPhR00c=
X-Received: by 2002:a17:90b:582c:b0:311:b0ec:135e with SMTP id
 98e67ed59e1d1-313af148f9cmr1634620a91.2.1749645374250; Wed, 11 Jun 2025
 05:36:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-module-params-v3-v12-0-c04d80c8a2b1@kernel.org>
 <20250506-module-params-v3-v12-2-c04d80c8a2b1@kernel.org> <D9PW1NI2S6FV.8LA53J87VCML@kernel.org>
 <87plfazi13.fsf@kernel.org> <87wm9ixy8n.fsf@kernel.org>
In-Reply-To: <87wm9ixy8n.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Jun 2025 14:36:01 +0200
X-Gm-Features: AX0GCFvW5MhrNazpN5I8u4mMovKi-96UfIawIUZ__HxBPPTRLkCvltnIlin2IFk
Message-ID: <CANiq72kJtA3L3ja9ff7GuNUD8YW=Zd9bMycjMupgSaaaU_uufw@mail.gmail.com>
Subject: Re: [PATCH v12 2/3] rust: add parameter support to the `module!` macro
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 2:24=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> So either we need to `#[allow(missing_docs)]` or just add the line back. =
What do you prefer?

Do you mean if you remove the `concat!` too, right?

It would need to be `expect`, but I think even an
`expect(missing_docs)` is not really useful vs. having some docs.

But another question is: if the docs are not useful, should an item be
hidden to begin with?

(By the way, that one is `rustc`, not Clippy)

Cheers,
Miguel

