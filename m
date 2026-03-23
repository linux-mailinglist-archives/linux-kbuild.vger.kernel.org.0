Return-Path: <linux-kbuild+bounces-12141-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INtWDZ6ywGm5KAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12141-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 04:25:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A707A2EC2F3
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 04:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3D35300BCBF
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 03:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147232192FA;
	Mon, 23 Mar 2026 03:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WiCVebup"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D170314A8B
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 03:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774236315; cv=pass; b=dtOs/0MYekzvjLz2jBiSoEutgfxdIsiJ9WGwXk3qpAKaSJfQvp9vSrmW8xUY8wBX/hNrWgfgFPEzUwcmsYP8mpzXq6AIv5IydlBJfSSYRiQp0ZVIZRonE6pan7HfMZnxUWuPIooB2wJmHp5wLdeoIsmiEWmtN61z6YytUDjnIvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774236315; c=relaxed/simple;
	bh=6L7OuggG1xx/psBeZawamh6lKLmj+yBN2DAvG0qZTM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GwM4tigXf1p43M0y2SwflstFoBGVdalKmPiOAsj7HxAakx5kPQ2HLryi1AapscgPwiaaA6em2My4qVhQBuNmad0VTrHpGX5HvhX5wnB/wYCil8orx++YgLe7J0HXyhdXSuJGvLNDzBYTyeMOEoWOANV1RFe9rIRgpLGBn9cF2sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WiCVebup; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12a6b260693so195814c88.2
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Mar 2026 20:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774236313; cv=none;
        d=google.com; s=arc-20240605;
        b=U1y/1Sbd8mOWVcqFMWfuSWMMN0e2yKCSyXtETWdeSSXUioorOeFyGM/GopNV3BWaD/
         E7cdRLtPdQEv2BUwdCNLzlJKfSYG9hcq5dC/eBAq3u2xKnq/Wsqo2zE+ZvDbS5TQeqdL
         yRVapb1kMlkVuOBsrKj/NsCvuIIXUZi74HnrmyQtEgooyuy4W7msrL3rd7X0bv9+C4Nx
         FS7f8IBxgEbIl7zu2RkbwmHPy9rl1r43bghFqi6EFlc+PLXkvSvrUHQsl0DaLHZ8R+aT
         zmWYBSyubFfs9wPINtaoPFp+T1KGgjX7O1An7OLZC7B+5WtO4aMduI3ck08QOcVhUNfO
         Wwgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6L7OuggG1xx/psBeZawamh6lKLmj+yBN2DAvG0qZTM4=;
        fh=a25eVByX2tbWkDAXFd0rXQrkeHCtzCMwd+3Mn6/Xfq8=;
        b=aVRLIwz3AA/Azdgd3c3Z01vFjH2rAofq6BKlsChBp9WQ4IYma1Ob7kWKLO93TtRa8t
         gah2Ew7d53nUESgbA/ehKF7dqQUZpdpBz89RcuuncbxSOuTk2EXiB1CPmkcbVdJ/jgka
         kCSkbZ4QGyeLwsL7sZ9deJDnlyAnBbt2LrwsBwU+ewQj8oP/K4T9Mxq/EaP3dmvuGQZr
         fRpLSjefN5cZLRHH0cJWO/4XPSRCiXEpbS5tR+XUhxETcP2aNKQAqxeXnijNy7os5Mbp
         eQc7MOIoKf87t1LzttlpapevbceiFvsKRooVfXVhVm/u1hLGZUNVq7EG7ut0nqMraEQ8
         3nXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774236313; x=1774841113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6L7OuggG1xx/psBeZawamh6lKLmj+yBN2DAvG0qZTM4=;
        b=WiCVebupG2Ch5W7z6Nwg87yhnXRnqABBXcb2SHL1m3Lci3m/8XkvTpwg6IHuOQEh/C
         4XXzVdhDg9SMkRGxMN4MpCr/3qnRpV5n7mNAPK0BMhSFIVujHVnEH21KDKx41MPZOIFN
         Ep3O0QlXF5gPaPxgDoJHKrh5FSU6jAQEgQkHvSKJV0ngia9JPU0qXO3845rW+OhJST/v
         cKxYl0y6pC2MTW4eZWAYA9+oj2ejmH31GJqsmo2NmvRmF+n0zGf6fQPqsA1xMvGwbU+1
         mZrgxujh9KUQu4wrorolMFskl+rrBTNtSsZdhwH4DMODReh3Hda1h3qImjBpmi2mFBbK
         Cvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774236313; x=1774841113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6L7OuggG1xx/psBeZawamh6lKLmj+yBN2DAvG0qZTM4=;
        b=m5G+/43H7iFnWbe16armiynx3iLfXUS6lmScX0xA2mpseGiUNa2ghZT2XLLdLH9gG8
         z5XTMVp3WY46HDxI7MNYAo9AFtuzlQaVGEEVyA10cnCC7iBVG0wbY+XfXj+EvMCNxEIG
         qzQcK6hxNCfCK65eld7YQqpfBeiCUm9WiaVykqSOccKSBiyNAoKIgVWIDmFH6z19h6/0
         sHUfwXhgeuOAZ0GAmkQw5Hah8IGsbImVGa3deDCkbNx1W0hQNZsVjdA2yJTvQ2+ESUZc
         JIQHpbc0v+SOV5DXI9oyiXDtYqPcs3HNpnCLfkMIQj2tTYBbWVG90JR0/0UYpsibikdo
         2nhA==
X-Forwarded-Encrypted: i=1; AJvYcCU3eQpttp20/YmeeVwQUlibcipvsamgQRAtVJq/mDTZv2GbBk94hNyrVKnhr0aH4Poi/0gs8cTelzfK6uY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxpYhjfy2j2SRWcvL29cq2lX75becPIVf+PFN21csq6W4n8tY8
	9zIoLXotZk9c/N0Ips36ud0uP2r/dy2T3n6xZ7BwYWAvFoarORL2Md50ix1lUCy9Tu862FIn17t
	yI2qaM4/UJA17GEKrBo/pB4KgFlVczuY=
X-Gm-Gg: ATEYQzxcdp4mOsEu1nmuKTyto/EsOPRGOxsmRWY1i1OrFgdcDqKPguwPjf2OaSbIL+I
	ot1luDVqh47LWXBfHK9KSQ0OMBv/W41tVRcOxXM2aRYgbF2xNKjYci3kvDUFlc2SX6nfkcCeNf7
	KIBq+BxYBsHWMSMQ/pOO3chAkvjPrVp1+Hy5VpQ76OsJJR3+YOqj5tP1HYXOpISkV4hW9s2J/3b
	SNbWda9Q5jd/EW37ifkvN0GTjnF+DrCqij6dG9ojjS0jPZSth8virq8lwzuurXGWTVf4gvL+WgP
	SlZ+1iZYJ5pqqX6r35Oew00rtI9fUNWyvSC2mU6Q4yEarX9cPtHMmIXAj/nPKz/QJhlF6+n4Lli
	uIMk/s9txKChJBp5T0LgHGx0=
X-Received: by 2002:a05:7301:100d:b0:2be:1946:858b with SMTP id
 5a478bee46e88-2c10970d302mr2034525eec.3.1774236312928; Sun, 22 Mar 2026
 20:25:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch>
In-Reply-To: <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 04:24:59 +0100
X-Gm-Features: AQROBzAuhFHkGwwSKh-Ea07cCRjtb6eZEQluwHGIFmDfJPfdFW0BK0DaJf2FJhk
Message-ID: <CANiq72nwSWVDRqm0Vap5j5X5k+Q-wq8okQ9d3KUgZt6M4CpW9g@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Andrew Lunn <andrew@lunn.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux@armlinux.org.uk, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12141-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,linux-foundation.org,google.com,cambridgegreys.com,protonmail.com,gmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,vger.kernel.org,kvack.org,armlinux.org.uk,lists.linux.dev,arm.com,linux.dev,infradead.org,nod.at,umich.edu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lunn.ch:email]
X-Rspamd-Queue-Id: A707A2EC2F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 4:04=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> Rust is already fragmented, because it does not support all
> architectures. Do we really want to make it even more fragmented by
> having some bindings only work on a subset of the subset of
> architectures?

That is not the case. The `depends on` is not about putting them on
abstractions, but on this experimental build feature, which is gated
on `EXPERT` to begin with, because it uses a fairly exotic approach
involving LLVM bitcode, which carries potential pitfalls, like the
mismatches on the target string like one of the commit messages
mentions, and possibly others.

Cheers,
Miguel

