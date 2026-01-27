Return-Path: <linux-kbuild+bounces-10897-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rJVGCnTgeGkXtwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10897-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 16:57:40 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E4C973DF
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 16:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B51683035991
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 15:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C2235BDCF;
	Tue, 27 Jan 2026 15:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxqmTrcr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220E42D9EE7
	for <linux-kbuild@vger.kernel.org>; Tue, 27 Jan 2026 15:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526350; cv=pass; b=jo22wc5QOo1FQSJ6X5zNO9o89MI7bedaxb4QcK0Znx4vnshd5OoHDESHoyNg42Hr4tyGSfO4VkSHzRm9htbleIylh651OeHYL0CqbAgRnDAXCACp7iaw1hXk1c7Y1xj7+OdJi68j60on6AvtxOXW5vHj8Bgfd3NmFbD4BP2jujI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526350; c=relaxed/simple;
	bh=IlGVy755bb544O918n3VdtulmR1lEGxJsGi3iwR5QMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oy3XG3sxhrK8osq4pTv/HkEJJ9g0SbMeUvt80vVM96I11sraER0Mgu+cNUv/8XAMSMr1Q0GsMjellmUpDTKC8FHSXYBsFKDpcFCdZj2fG7N9DZ0U/PL6xFlpgRhWlSfkaN8XJ9IpCuDfDjfokhrlfqdT+gWRVjagszdqGZqo9hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxqmTrcr; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b1769fda0eso640364eec.3
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Jan 2026 07:05:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769526348; cv=none;
        d=google.com; s=arc-20240605;
        b=M+FfHcjfNP0nohezM/VuNI3aqrsvgrllxwAIyU6qnlBA6AIso9WdwwaEDsmSCR3it4
         jZeMbpC7dG99e1lmydioviOt0OAuXrr14yfizdrko3CNxOK2+WISejQkVtxaCp9Y8b5N
         LrJPHNl+BfdURVpyQ09vOli9rPuMPGrf3w0+WWk60LpwK4iMzGCcTAuEAP5LurtaWB3f
         H8st6GWgCLlH0enk9dH/a4Ph0sWIlE/WE0TK3Eo5aYEwimWgQNDNTBCehnB59nUiFVYp
         yWPWDsyBJXOXdTZpYTyvEZPGjxZiDZ1Pyw49F7BufsE/NUPoDV+sKGfKMWnqE8E4K76X
         sAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ypwr1/BdhU0FvM5egDV7iw7KIf86xx7TOrhaiOwiwsw=;
        fh=nx6zNGnUjDRIguAfZzxJ7tZocCCatYVVhHqcFygfJQE=;
        b=EXUPajLA3BuQVIufNRFmJQtnCLDq1L5FNVr6EaIgJ8YjZflLRTLNEfJMLQuSpaLr1H
         vcJMc8O84g1iEybe7Bavuq+CcxgDHZbR8RymobtmIpWADvbbPUC+RkqSqwnr6Nn3Te5F
         kXP8wqW4SMr5zmOdfivdrs1jjR2iEUXyHmqogjdmZ353+dIN9f2DexHaN+tuYDrA+Fde
         8BHmF0v57VA+wMXqKGGgO71IDJOQZB7AiHipW/oArWMYaDUBZaYGiXZ5023so4tpOELJ
         k+ATkJ0Re3of0XIEcPHWdCJakHUbz9sYV67BO+K4Wukcap+lIGdiriyDiIkZVgRbMBqk
         FQXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769526348; x=1770131148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypwr1/BdhU0FvM5egDV7iw7KIf86xx7TOrhaiOwiwsw=;
        b=DxqmTrcrPEpydX5Qf5r6I9fxAj4Wq+6pLCFx+Avj8LlqFf3vCpuKSS1TRYy+MiwdsA
         gBFKI4bk63+42aoit3pY2QVdzqHtC3zsq0akN7ULmhTD0KRnNyljnStzshLy2FWix+5f
         WEpS30daMJ8zYWRAaEpk6M2viy1w1ReOCRdr+CX10tNVddNtjHK0yY6lLV2kzy7RcNP0
         bpypfFur7MidmTrPm8opA2oI3NB9Ajxiw7dRvc/lp9aPFTKcWFAUOv/3Sms1/72Y2Quf
         ptqsHN8hGzLLuhF9XeCxOPcJ3FephXdIIn4D/mr19jGDZd9Oy91uL0NXtEt1DmRopHsj
         JjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526348; x=1770131148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ypwr1/BdhU0FvM5egDV7iw7KIf86xx7TOrhaiOwiwsw=;
        b=tqwh1Dl8YBltFDKt0f929+PKMNqQiOetLVOK6bGWld+s6ScHGvHMVwlmAENpFLctLu
         6ntWGTdNc1UZjgFhFSwLm0tcthof7sWaZ6BUvTLhDXiMarAhpBory7waV94Zw9EE076Y
         zi1w9op9J9uXs0ujOrQk11iriy7EAOrQT9vwLm72Y16rtJM38qST2jVMXyvZLYfod0iy
         YM1SgNeL21sLgQDIK62wtTdiOqIFZ0hgIan65tWVRnyQu8yV/hlB0AI6zG10byKc96zu
         5HnJ+lziUCkk8PE3yPjpcI5n/CocCLNJM+PWMb5HHQf0c3SEAbzw1g17OmSt5sdAhfd5
         nkyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJHWYIg9PP0RQeVFWvlRpiTRKcv3jm6OYUp630XZw7hTAbHbW0qRPp2+bB1zOkc0F0wintrKVvjeKKo7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFQEV3qS5WwrJ9d2xKiOI6VJMTdO2L6ikqE1JDH8+nc4hqnR5X
	m9tFc5nhS/UHL/1b25+ksZfXvbCYVUYucWJURXXV82Z6Z2wUNbree9BbHxyyzCGkY0qSeXCbDOk
	nPjc87DUR3dQHonF0kLElS8Cj7UHrUuE=
X-Gm-Gg: AZuq6aJNGqo6H70OAII6rOo/KfxrMBMffEWhnOqHMMHFwEryVofR2Qs31Por76tVq/R
	Om4OmxM022RIJUKwSNcoeYXLZTDQdQb8CUnC3muWt1XBU7t4Xz58rr5u80hUu6YW8NDM1Zz+STi
	c4ZpaOZ5f940tJJqtdGalHAyehLbdSI6+/al5XhFrRwOxsY0mGseZx6JxKSpQoNuUxl4hkjwaKj
	RjITgSatrQxd/dgX014tVAp84yoMbz9ACuMKrse2xZUxlqstk2V5zI3Nuct8pjmkkFtYX3wK66X
	DZlGOaKfDc8M6A4BXMCDriLnkaDKVKP2JkbiX4riGuK7cM34qzl/gNSfWlXuifGHgIPTCCYW9h0
	Ag0189JFovDHaZladzlcdAa4=
X-Received: by 2002:a05:7300:ac81:b0:2b7:2eac:40e with SMTP id
 5a478bee46e88-2b78da4269dmr612946eec.9.1769526348022; Tue, 27 Jan 2026
 07:05:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-rust-analyzer-pin-init-duplication-v3-0-118c48c35e88@kernel.org>
 <20260127-rust-analyzer-pin-init-duplication-v3-2-118c48c35e88@kernel.org>
In-Reply-To: <20260127-rust-analyzer-pin-init-duplication-v3-2-118c48c35e88@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Jan 2026 16:05:35 +0100
X-Gm-Features: AZwV_QgnpuIRL23qPbH8_PSC7FJjoRSuZ9zAdTG_0oB4nhMWxStw5A8VGRIfETs
Message-ID: <CANiq72kYE3zvZ2tdo3U0vBv6z8Oi3CuPtwAi+SzNZrKzQfzfrg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] scripts: generate_rust_analyzer.py: reduce cfg plumbing
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10897-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 49E4C973DF
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 2:56=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> - rust/Makefile: pass `pin_init{,_internal}-cfgs` from rust/Makefile to
>   scripts/generate_rust_analyzer.py.
> - scripts/generate_rust_analyzer.py: centralize `cfg` lookup in
>   `append_crate` to avoid having to do so for each crate. Remove
>   hardcoded `cfg`s for `pin-init{,-internal}` now that these are passed
>   from `rust/Makefile`.
>
> Reviewed-by: Jesung Yang <y.j3ms.n@gmail.com>
> Acked-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

I may still take #1 this cycle, but this one you will need either way
next cycle, so:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

By the way, the commit messages (in the kernel, I know e.g. some GNU
projects do it differently) are not typically bullet points, i.e. they
usually tell a story and make the points relate to each other, so e.g.
it could say that what the first bullet point mentions is needed for
the second etc.

(I am mentioning this sort of thing since you will be taking commits
from others etc.)

Thanks!

Cheers,
Miguel

