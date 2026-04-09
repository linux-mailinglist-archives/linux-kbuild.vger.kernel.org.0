Return-Path: <linux-kbuild+bounces-12736-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDWJGznk12kVUQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12736-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Apr 2026 19:39:05 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D7C3CE3AB
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Apr 2026 19:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88AAB300BCA3
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Apr 2026 17:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0EF2327C00;
	Thu,  9 Apr 2026 17:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A05BsJIm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7912DCBF8
	for <linux-kbuild@vger.kernel.org>; Thu,  9 Apr 2026 17:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775756342; cv=pass; b=EHvUhdFSEDgelaykE7LRBRdABcfNSZ0hSjnaU6js4OZRzGiKcJxUeZUeDMM7er7ZOuAHg3dYpyAZMtkDTjygQmDAPmuIrvCsP5JfehpkJsp4WLzqEClEtBuqLdtddsRGnL8V+ZiALcb3w4I3kPC/rd0xZbWr2Za67riWmuuZDC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775756342; c=relaxed/simple;
	bh=kXiuStpmFby0rJIkMa9TqERydeVdg/Q6N4kyZGXGsVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TD8mjZdi5H8IIPKqy8sgjfmcw7cBJtpv8ver55AFE/PqadR4IPEfu06nmi/hSZshIa6mxBZeinO8EBIptq1heGPGlhJ9lLA5SYXQZjNRUUY6LmVv92ExxhNKmw/dKQNPB8aHTWB9f3aHU+Nz9XMtXKO2ZB8BqSNh9KkUjhRmXFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A05BsJIm; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-124a7216c9cso70582c88.0
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Apr 2026 10:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775756341; cv=none;
        d=google.com; s=arc-20240605;
        b=as1ytuTvIHze0VdWQONZIfXMFPnUifi901XeT4npsKv6NOgF+fvIdzguU3OwEMfs/f
         GsDfs22LRqLWn2EEPq7f+rQ8wqy8FqXjlUCbohq9w1uWa5EO0Ru4x2CpxDMhruzhrmup
         eiorHLdU10oz00Hgq3C0Ar6I6wXzm1S1bdyMvggeLcmnj9e536Y4Rdd9ajRB+ksUkdBa
         BXF2zPpR4j4lSz3dfm/dHExNlqWi+Uo2UxL+w/ou3287RLCeEwrIemQGE4OxqlEynVxq
         FiNbPPF9hhCjfMF5tqwh762Pt46RvijKKfAdzGiuRSfxPnWD304ey5tWul6mGxAvAzNB
         6yxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kXiuStpmFby0rJIkMa9TqERydeVdg/Q6N4kyZGXGsVk=;
        fh=L4iKYEzdPsBUz7PUPbZexaoKn6wgP/3ZBQ+OqjN91Uc=;
        b=IHB64XTMAncTKnRTpgkYZHBGrRl18BebXagCiGAFf9fQR0oIqkWXSYZR3ibH2GHl3J
         GAbcc+iKHX/8DiNPVMil8LWbQr+84siyqsBQYMrifPDLjADofIsJGkPT1Kz4SCtto1sB
         oTg+ipVDAdeSXmFsjMrvO71ljHM+gtOOhh1CVcX/Vwvgpy+xXyhxmssNhyPok7823k0S
         yZa62jHyzF2jdCOLTDsrXF9sGb+CocJeE9cPtGz3lTFci/6lcGbRjV2UJ1q9/SIE/OsY
         kjbi2Um06qRdW2BZiV2+TTNkdKcZ/XSnLudAJ5LUct+hlyoUFcHxKAPGy5baDdod7tR/
         1Dqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775756341; x=1776361141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXiuStpmFby0rJIkMa9TqERydeVdg/Q6N4kyZGXGsVk=;
        b=A05BsJImQ3M7iykL+WFn4TvSGNrcx9M8EnGHfaAf3RLNp4wDcxdGZYHWzEBH5B2j41
         j2rBarqjzv1n9ip3sBYWHfvZhEOUTote0uQ9FJEiWW0GkYDbov7euoViBZX58t/uy5aX
         hWmhVR7wpG0cbrAD5R6Xnqi+KhrFk2XkcLA0NpM9bCtO0Z3Idf4LEKu9ibqAH+rnAwpX
         SFTgw5nQgY2AhoshC7CLtob0rwcloygN+D/kIUf4F8gUYM9Cer7eYaUp5rsyylOtD75K
         Ddbbcg/2LbNVOJ+Ndab9eS58TD72UvLF6gR8cfN+wBxfavD4y7ESa1AFCZzeznJfb3Ya
         A3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775756341; x=1776361141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXiuStpmFby0rJIkMa9TqERydeVdg/Q6N4kyZGXGsVk=;
        b=UMdGSeAYk7WlEfo8UXvXMYN70rLjP00SJR04gMb8LxR4uP27FT5u8A4EsZGPilCOXP
         0kpNqLUNbn4nlSEEry3AbyAQZGudyiIwKyDyGHJs4wkOKaHUMpuSvQMq2P9lFnVnNBSN
         W4oHyrzQSdsTkAt/8sOQJFBhCyQFoOgv86RG/fGbS4qInjPncNe7Y5tHaIUVszOAacaV
         ONBMa+JnySjzzEE9tEG6R5liT7fevGuEuebcnFcwnzMNXTCI1/LBQiH44wPh7RN1B9zy
         taf16ZiR992dem8jwij7ve3SA8rFZWi7eMdXnp3UYc4jHRzGabRZ9luwIJ5w3ROaLkPe
         MzMg==
X-Forwarded-Encrypted: i=1; AJvYcCVpX/v8Ucq1cN33Vruz5ycegpaFNqnyAyk1TeYukCOXnYfQnFeJlsa/oAXRjrh1R4khGiHwJUYRWTtZ8AY=@vger.kernel.org
X-Gm-Message-State: AOJu0YytQScSzxRiWHX2U1i/ZJ0Sk8BK1amAasp6j7odGCWANlxQG7yQ
	UHf3g0E6hKhx1xY46UtwksQa9qJFVPpRX20C2/wK5O5tjEX/hHa+DNpMdgCqsD0GWky7ywQoyq9
	a1nXxGhxbqjxCYlVX9h8+i5dYShW1inc=
X-Gm-Gg: AeBDietWkegAN4fbiFlbljRpzZSGXtQJ5QZX8ybFIF4h+vPTgDE1F2xlrQJ9NCxtdvr
	rAjg5pNrvpU2TKwbula92ygBsDqksO5krNsO0bAXRqmJ7hKOM0TR7CBWc2D5go4yONVEYrA3Hep
	bqJwIrZJR7jv2wd4lEVw9ZmcnmRYDxvZK91RznE3c18jo0hj+0+Kl10R0Lw++E+Hqvd4f4BP9Dd
	QmIOwk9XPdfuACDXSeL5o/poaPWx7u+lwV1MvC48DOK2phNgIOnl9f7N1LJR5lr5Zx37qDq85cI
	0rIFz3Vmwwa3S8LvvV8ekLCca/nQPEwv5W/aA0XdJts6eIJxlPVGDD55Q9ypkCj5fkLE34aCWbO
	LaOnnHvmczjBywGN6XrFzSmtNLnaAROxDGg==
X-Received: by 2002:a05:693c:3015:b0:2d3:4252:b13d with SMTP id
 5a478bee46e88-2d34252b4a1mr1713519eec.5.1775756340426; Thu, 09 Apr 2026
 10:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331-autofdo-v2-1-eb5c5964820d@google.com>
 <CANiq72nLAqkMbiNcExVnYZxLN1g7tr4EZpUj_pwvWrjR+zaoLA@mail.gmail.com>
 <20260407164526.GA2309039@ax162> <adVLhdo-a6_aU87C@levanger> <CAF1bQ=TxmN4q1mw8YL_62wnEsNbz4tCy8uHwS2GOX39o=7=hsA@mail.gmail.com>
In-Reply-To: <CAF1bQ=TxmN4q1mw8YL_62wnEsNbz4tCy8uHwS2GOX39o=7=hsA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Apr 2026 19:38:46 +0200
X-Gm-Features: AQROBzB3jbVd2uNuk1LVxkbJj0FAiE_s0SvkCz96sTWkHQaNAGaks9EjL7LhyXY
Message-ID: <CANiq72n0PYg0sUa6fT2YWoO6RyrSkpb++B2QHHVhgaZxZiUTsg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: rust: add AutoFDO support
To: Rong Xu <xur@google.com>
Cc: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Han Shen <shenhan@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12736-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E5D7C3CE3AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 9, 2026 at 7:26=E2=80=AFPM Rong Xu <xur@google.com> wrote:
>
> This patch LGTM. Thanks to everyone for improving AutoFDO support.
>
> Reviewed-by: Rong Xu <xur@google.com>

Thanks Rong (your review was already there :)

So I guess that means you prefer that we (e.g. Rust) picks it.

Cheers,
Miguel

