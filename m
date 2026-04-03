Return-Path: <linux-kbuild+bounces-12630-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIyyCHeRz2lqxQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12630-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 12:07:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4F7393281
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 12:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7AADE3035782
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2026 10:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7163382F0D;
	Fri,  3 Apr 2026 10:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSDI/J47"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB9E3876CC
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Apr 2026 10:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210760; cv=pass; b=V27JDIbYQwAzdRwQ0LPOeSiwkma71iVDbRSfSQ901ln4OwwAQZqrOabDLJqzWUr9aoJvohnHQuwV1MB5S9EsoUHEYaQd2SV9FKxpomoV5FvfTSNcE8z+3BEcsZhe7c8R5IBHiA8VbO4/9NqzMFVgNnkrXePoHYivdKHRZ49Jcjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210760; c=relaxed/simple;
	bh=TkNHPhEzkYABSHJOXb7SAdPNsQYeQkyZZ0VQuJR8jrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xl5SS4qz/ruo3OYXR8vEnpT6bCGFqS9YNCS5RoE+UptQMf6mWs4RGlo7ZUn9hhiJkSXAQamPszJLFjQ4aliFQLHLZgHEk4f5YibelrwWxwe8U9Koh+PN/81qMsxcCAMgXCHf/JPPx62gkNIPMJCMHXPBHxmhXsmE0bZmckerlzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSDI/J47; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38bd95f5784so2891121fa.2
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Apr 2026 03:05:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775210753; cv=none;
        d=google.com; s=arc-20240605;
        b=QvEw8HrMGtiTEgr89F4hlWcoUNGvmCW7hXYY0jukZk3Z7RN7sS1KAIzQxSgryXZ896
         zNlA3C8XW/6HJC+FIoyBNIa3IbX0U51PL+Iy88Xtk2qMSw1P+A6L46IclTKeHVzNcbsc
         /lU4i06gVvb3F20jnT+DfEoj7t+Y/R9lRmQ1ctU4OH+FsVSrRKHlYttxL5lAAwg0d8yW
         9bTgcwVEjqRPFz9CGS9C2nrSKEaNqMuRkVFkefavVcH6qTecUYLPzQ93o29yIZAGemG4
         YSuMffo3F+GPT85DWkSKy0+s+j0fJHH6Fti9uMoo0zC/zQoFictG5hM3RMsUyXprLCNR
         5d0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YLbD9NBLa2cA8RkwMY9FXgR3GMGSqJQ4FhLm9zSjhgk=;
        fh=nTwKvHIRpGjPOCI8YS6ukx05A9zC+pMVOlm+Gftm7eM=;
        b=TxyopWYagxH2ZrAkeRYl+/LP3HNkTqnk6yn8oIekld4Tg/R0lrCQ3YqEmdNr2mpLH2
         vE1OfBD+4JxC9WxHEJz4ZuzsIKndUoHK7n6cBy9AOpQv7F9C76V3as8/5yopgnnhfPuh
         CUBRmqruKvb7tsJjBGwrSfROULLRor1GLFnOmgVWbpl9JSlExKpvCMyY+ul4CQtUMger
         GBOc5xbtJ9Kbb/PR7Qd9yq92vAFpDZvRaEM9y9lCM+Wkh6J9aXMmT0zL/ODkPYdyifvs
         OII+APKbTVNWCnX28kmTHpoSp8Z6H/rzrkHxVzRD1NrUWa6sYwTF9cCsqIAzTGMycpKC
         jxkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775210753; x=1775815553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLbD9NBLa2cA8RkwMY9FXgR3GMGSqJQ4FhLm9zSjhgk=;
        b=CSDI/J47bzw5ypL572cmdS0hUB6wuUXqxQ9ilVaJGFV+8pj8YU+Dw9c6azuiR3iXrq
         3M5FGa/1vTv8jEXmFwQ8PSY2rdxZLZIhDz5DwtBA/M8C70hxbsNYg2vDz1vbN18R4wyy
         XaRf+Ab7Tpduntv4jpw9t3HJ3fcRsgOnyql+i+Xihz6ZNlnbASufMc2aHl90CIdoOTSd
         4jTL5iX4MW13wmJQUvKCqs4DQKgWTjg7GN4V44SZJvxmm/5m0Y+xShAzp1DzSCzvgybq
         x6jNhnSDK+CdjoBh7Md9G9mb6dPxWJgIx8hck+6VZ7N0rCOd+r9hXOh8iNv1Qsh1nL70
         pzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210753; x=1775815553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YLbD9NBLa2cA8RkwMY9FXgR3GMGSqJQ4FhLm9zSjhgk=;
        b=mulNZQJdoo/qb1ZUWusTNlsCiVgGBvYOD0J8cVCjw0Eg30svX4QRked+X8rrPdqTR3
         qkPV1+Aw+gy27di+XF5DbOMrhkCD6F3zbBkKEWd7CWfAEJmPMELkV2lqh1MBw0BUmbPz
         2gVllDhJI1XBX2FRYboSpnT9tx8hW7ALU3x9SrdBE033PLjEgKGyeZLA1zWtq0vSaCWh
         DnzftI+dbO/P+0YqAuFn/U4dVIcvoROvpFXDzhjvWO/gg3hHBjdGDXWkdO+rUYUlOVo2
         le9+NX1AXQO3g46ByXy0Dsgm6oiOkXx2CWAbyfAzYFm8fbshQqFSoxLVLu8ba7NoE/Jk
         xKBA==
X-Forwarded-Encrypted: i=1; AJvYcCWTSK1GU0GKnwYsa/RuPHTyvbsWLKrlzStHtjmsTRa4iHGDzfdHrKNR9LShHrZAMpvr9o0XhhK//FrQ6kg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/r7nRsR03q/mhhLmkctW+4pn3225FmCxXulX9+spgBBQ2INmo
	vADwxq3AJKTLJhTj2q+NiHEQH7NgRGbtpSuxfKzqvXfKPoy+LAH3xNQXOb61h+FyIphZXdjt80U
	LchHJCcg4CocQ9X3jK0zCEy28dsChQhI=
X-Gm-Gg: AeBDietaU4DXFigf8hY1HZtrV3fUc0OAfHvDXghbnvRs1kCpcXcMOSTC0HLaDjJ9sB4
	AEs5yp0/NugHQFBlmiteiT7t6t5iWh/2kqfKVHN57xZHMyL1HXq7JMQlc2mRy+ur8huiZJ6KUNN
	enAW8f8ALGh6UqHuG4N2cdcDMYfQD/jq0m/eSe24Ho59VrWv7X4WNf6HT6I4wwwaV0PFoO0/Dbe
	EFLawn6XxHtjWC01NlqpS1eJ43+3H6gTxTnw9kZy+qwvoTi5N9yJsolNslaR0rAhyJJLFaNzLTT
	Qz4D+r1TiZz3RRiW/jtLgdB2tWpmsQ5xnSuEaf8gxACkock/gbHJdTQcUES/95tlGuEFR/GvmRL
	v98xQmg2o3zP2A7l63UESTBc=
X-Received: by 2002:a05:6512:1393:b0:59e:5796:f6a with SMTP id
 2adb3069b0e04-5a337593b79mr427224e87.7.1775210752684; Fri, 03 Apr 2026
 03:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com>
In-Reply-To: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 12:05:33 +0200
X-Gm-Features: AQROBzAnNIt6naIfeMeK2ac4VVmYdgIa33310K-kkQ3XQGTeDriWEK03F-TXqlA
Message-ID: <CANiq72ng_gJpgbT9vV2=-t2k60fKvC89r22fk+_=ewRTqtHR9A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Change Rust Binder crate name to rust_binder
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12630-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,linuxfoundation.org,google.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BC4F7393281
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 12:55=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Currently the crate name of the Rust Binder driver is rust_binder_main,
> but I'd like it to be called rust_binder instead, matching the .ko file.
> This affects e.g. symbol names in stack traces.
>
> Thus, allow use of the #![crate_name] annotation, and set it for Rust
> Binder.

Applied to `rust-next` -- thanks everyone!

    [ Applied Python type hints. - Miguel ]

Cheers,
Miguel

