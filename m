Return-Path: <linux-kbuild+bounces-11406-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEJwM0ionWmgQwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11406-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 14:31:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F216187B76
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 14:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1020A31883FF
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 13:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5430139C65C;
	Tue, 24 Feb 2026 13:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amJ19gfy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E9139B4A3
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Feb 2026 13:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939515; cv=pass; b=mxLJoWmpemVDOm5KEO+NuH6A87B1cdADK9sRyNrFa9pYIPUXuZUJtIV1WC1uFUdqK5mYM56xxDaQ41fpP4/E4MV0Y0IFkC+qeYU3bO4vixlmvUGs3Voc/4hcrJC81hoDTvprJPEIEBh27MLps+1b8tzTGCR/RhovV8n+Xy8yKmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939515; c=relaxed/simple;
	bh=4B5oKnKjDlfXUuHy/T3lAUMN60/UQviL34TxIPODh6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CofOFPG5FCqVEQ9JJ0EY3EATYyyFxLJnp4GfpZSh6dIR+qxfzQkKT6NRYZa1UlTD4RHkrs2gNODxksgQ5Q2uHZodAbe7+D1fiJRqGEUfB3wqS5bMQe/eP6NWtmxRsrnD+bqatnWux1TiAIXT85PpCSGJVLPCpu1I6EFC/FrwCrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amJ19gfy; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bda34a9dbcso88980eec.2
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Feb 2026 05:25:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771939513; cv=none;
        d=google.com; s=arc-20240605;
        b=U1LZ8Hf6zNTfbd4tzsz25BxIYQ2clhpOk4UwLk4VniEwQfNNJqxaBFW8cSs2enh85H
         vJ32W+Lf4UqSdm9O/k0vjGgbOjYgbEVsJAwIZkl+USEWntcQMVxtWEeHLo8RN75b/wbl
         U05pmw9u23RpF+0fSoIWwnAdmkHi9JRc9OCP6trypm3IxABoIJE4jbnCSE+S0Ybo6Gas
         69sGagxsXh/y7FgH+mplfjbugnRV3cdp0wWE3yGPTfZSy10xttLNfSWbLZN6YonF0SMT
         0znF+w1ZXMD7lok7tW899cfBxy9eTOkQ/BRD5YsrTgZjGzm0JrCHACQ26j1asXb2JDGP
         sV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4B5oKnKjDlfXUuHy/T3lAUMN60/UQviL34TxIPODh6s=;
        fh=jF5Jw8lexr1ab76kKjFrPg2m3bb5TqJ7LlUTz64SXa8=;
        b=ZCN1hMIHAQhVSVx0/3pA/CmWvYWkbElufX6PBPkN0cKh9hSQHqK5pCCGjiHKY2nITH
         0YQqg+fuP+km+BZvWgMJzgAXuWLROgNq2wuXDwaRSdBUFGH3TJRZygujQeWC0gJrVw73
         Q5Bwy9dAzotV5OZA6BVZpPOVSNjQVQLGhPvNxLyVcdlVZ1cA/QLnaAPfNPXd6qVr1Nrk
         Tcb4bWSGWpOJ96r3iHG1eyK0cDvaaecf08nP6PF5GSUfMbh8wbaw28+nguu1boKM+18g
         2nma66QCGyWRDCGX4+LrrQk2bx5X3aMvpOrypx4uDx1jNg9tPkVLbzSPjqqQLsEgPdNt
         D6/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771939513; x=1772544313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4B5oKnKjDlfXUuHy/T3lAUMN60/UQviL34TxIPODh6s=;
        b=amJ19gfyTtAVoMxgQm0f3qImnKBOYS2LMhRYmZfxjNVo2ZknrkIJw/fwhJszjDR/tr
         4SwIc8L7tfoHSforCLzabX3OFWwl445LKXBcoc5aqR2wVorjsjfGyFFJOfjQk3EELnBA
         vMTY22X0uRG9UcTQ3I+bNKlcK5ZhQLGca0dZyejeHc8TIFjwdM4YR9h/bzwOwwr96WbB
         HUv5z04GvfZAU1sGIVkEU4M5oQozYWmLKwxseVvAx/Ik7MMRayqV5QrUa2gAqLx8AfB+
         +W/Rn8cPlf9FS5QTbDifhJTfjcJC/MsCJ1ERX3cv+ln6qCG+p/izQV4j6lw6+87fSzQe
         55sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771939513; x=1772544313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4B5oKnKjDlfXUuHy/T3lAUMN60/UQviL34TxIPODh6s=;
        b=GYJ3UrwG7bKikTcqYOs8xa0FcPmAZN6LjilfhoSYjh93RKcHvK6t2jjNs+KRqm3tzf
         9Y49GKE1049Em/dgBMHlk89uzX+4ISlz9LPYGVtxt8/eG7ar+9mNrCpWe/c6wEIlr+Ja
         bD1iLra0m5DVUHK1FGJjECu4OCzHQJ3Rx2zXQQ0BdM8Fs6EJuXk4T4jI1pXpkXN1KJhX
         sfVQv9RCILxkw9FLp5t5TLBD32lDOpIDAr/51YqCn/cg2mMPtZc6LQNpeWA+1aYpIqkL
         45seqV+f3+SpITEyN5yef2J5aKF5WkRZz978JMYm7LrQPQlIoJR/iQsKBdP850BgJ9fg
         U8rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL3Sx0xuCMdTUDt4/hXxTMffRk+cCKBv1xPRmWP66847MUdfAfACIgsjz2jW9HDHq7e7RqTglr7eMtHAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJo7PwY9C+K5d7Fn9fETOQJrtjj3Qg544xY/nhaB8tTR0upkzY
	ZjMW4fM9OTVX2xAYrCjoJSdomSvx7GMBzCRm2EPdke/8U9JkMxK7KsRr4yu5RQSvhl4lyjNJ7Xt
	RAAGnHHG32r4t2ytwJxrBC5jS1b5O2Pk=
X-Gm-Gg: AZuq6aJsxCsBU7Y7VjXpSEfHWWUmZmx+pFjxuN2O6hkyT/BPPQhAkQKeimTiMIgN/ah
	Uv+gDdkP7sL0mIOZL6ElWMhY7GP8QnAJDhe+5XvxFzNILoGSBI4UxPXzJSec/tFum3F16P3B5W6
	OA7/gBXTuh/Kg82FMUnAcaHb81ih2O4UhMxzattnRgL4CNznuSTpzQdmQ8fCjhG+z7+HBEYGPmv
	M/fQsJODpTxpzdonztvBW3xfFhpPcZ17flcuoE+SwmLmYla2qJKETaVFp+A/sv8YWtG4IvcwLMN
	9O9qr8njMCFKW9Hp87Rofg4zNRlcuOeFP4znCKfae3STUuQuvAu5bcKrSxm3yGLthKrgDXCkynG
	9Rbk9dNiz1jnV7uamWqqnWpqvuUqkvOXT5bT5umk=
X-Received: by 2002:a05:7022:985:b0:11b:65e:f33 with SMTP id
 a92af1059eb24-1276acaf097mr2227296c88.1.1771939513135; Tue, 24 Feb 2026
 05:25:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com>
In-Reply-To: <20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Feb 2026 14:24:59 +0100
X-Gm-Features: AaiRm509Z9-gzlIVSS9iwUGUQ6PSAeno5gaW8ZXoZH9h2w6NjyMBrQpssCA5U6U
Message-ID: <CANiq72keRQupX8UX7PQrLYgzzbdRquxV06SDzY9aubA_p+uGjw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Change Rust Binder crate name to rust_binder
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11406-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4F216187B76
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 10:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Currently the crate name of the Rust Binder driver is rust_binder_main,
> but I'd like it to be called rust_binder instead. This affects e.g.
> symbol names in stack traces.

We discussed allowing to customize crate names years ago, at least for
dashes vs. underscores, for matching C names more closely and perhaps
other needs.

Back then, we decided to keep things simple to avoid confusion (i.e. a
single identifier used everywhere the same way is simpler, at least
for humans) and to avoid having to deal with those dual names
everywhere (e.g. adding workarounds for rust-analyzer here).

I talked with Alice about what she needed here -- could we rename that
source file to just something like `binder`? That would avoid the need
to have a custom name, so everything would still match (symbols,
source file, object file...), and it would give you even shorter
names.

Cheers,
Miguel

