Return-Path: <linux-kbuild+bounces-12172-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yI5fOjFUwWkYSQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12172-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 15:54:41 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C1E2F5686
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 15:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D031C301909E
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68DCD26ED46;
	Mon, 23 Mar 2026 14:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2KIofvk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3035E37E30F
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774277617; cv=pass; b=Z4a7KURc+Mccx66DmVnZJqCqAybpQbzTqjttglLhgSJ1z5uCJRBgExipZNOTUdLOKRo+/LQXzehkf6N3k3Q9cgs5DvmBzt4WMmoG0ITvn46jbRIutRmZdWQj/NO+fKoQWfzTyQjQjWYECxeQBpDGogbUV5cqdY4fFGHeEPmN990=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774277617; c=relaxed/simple;
	bh=SQMQ2nNoMlvs5BNEFGHnf/DZ8k1Iwt1ytZQm0Fd8SoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=nS1inPAbsN7DsVH4RM+fgfd9eGHKRun5wtbjGHiid554+tDPH6/5ekB1YnXst1/90qyTGbIbyFKV/lxhI/U35wrBF6393ksM7roRkOcq7QWblHKc/Wi822fqCU5uD2KF1JEGZ5/+sXGcUfMmarUTdjhOOGpQNSPDFnw3SEDxkPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2KIofvk; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c0e6f5abb5so141160eec.3
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 07:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774277615; cv=none;
        d=google.com; s=arc-20240605;
        b=TC9P3I5mVXoXlCaCCa9ald45rpwOqxTwqa109GCZCPBnWPIU/5gTknweG4crs93ys5
         4k5x0ikLnvk+BTV6rMVPk0peLILwoPqdobdh5VA4ou7Q+hAXFepTtuMI/4LffLwYQXmU
         nTUm6i8CQG5V4ld/UZna6QXstjVNAy8HvS++cAXr7NWDMzUB1PJkv4rrZqc353/vsTDR
         8JNEI1yAOJ/t4rid93J1I31qV6NcGt8H8Iwrtbdnc35ZCCQ+BmGOijOXOE80f7r90eSl
         vNgCVi6tfTkMazF41Sn2dHvDqqbvHzxiExF45jejKlNFXSVj8szIS3TmFH8C7hPYanW7
         KdwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LI8/dUz99GIMIFX7jL9A6Uqav/8pN6H5Y3gQQrLVq3g=;
        fh=kpikxZ5bKvjkX7Cypu07bx8s66K9a7HZI5MMtEz4aIw=;
        b=bIzZwgBhtST+X+RgaJE5iwBjIpoBU8K6DAQKLCG5XXmOQuORhr5Wmnnj4SQYvZGJY+
         TYPSP/ABMzffWn0CfFrcuobLMw0rXxzPzgiQJxGacR4g/WAMdS9uHxGA5thehzG49NUF
         l2PlolXhlTVPLBu9iSFpChv0MEuQ/3dC/Ndh5bwweN6XK4/ZIBcUCRRHm9vDxOIp9Ime
         wZ+ycmfZNHsArE4POgKl1WGgvQjmrxPa9j4pG2faW3RMbpPJ9P3sktijZoGPCWlWOp1a
         A/0L4LKmbAHeUdXE2Rc7e5NL571g6vz2v1MDDrQ272YveqbiRy0wkGpEXpUM6I7iMh/B
         kuAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774277615; x=1774882415; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LI8/dUz99GIMIFX7jL9A6Uqav/8pN6H5Y3gQQrLVq3g=;
        b=H2KIofvkg6+R/rwuu2MKJgcRoUn0XNzw00h5MA26cQcJesqSCrGPkSvR7d2mBkRxhO
         NhBQgNMbGnC+kEy49birGI1Mab3iLuVgGBYbkhvXmdIFclq+L4TjRXljyot6tczYHZIy
         gZl/ookvI8+HopAtLVltzbhDtRYuMpXxT/X9X8s5PAiQXrGjLH1QMBFPrX3IBfEuFIHW
         ESf6rq2whtrGZUDrfvEuZOx+1LWtiBFaVRt2GpnsV3eXRlUtyQ4omr0eVga0S5isWHxr
         Js/F8QhQaSvxnNvhS3eSdySH0pgmLepQugWi3OnkpPjxYaSFTE/QVsHvecmtCCKUPbCL
         UvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774277615; x=1774882415;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LI8/dUz99GIMIFX7jL9A6Uqav/8pN6H5Y3gQQrLVq3g=;
        b=jtNmRSzLi3/Br8ClGM+X/1Et4HVBCYuD9XsZk6i/bpnwiybEPHil91CooW5jg3rJed
         cdsnkm0JnqKiRFSbLKcwF48y9sGwi97WFWWhFkUsVTCf4fmrN4dOdleVebf87kMsOrkB
         Bui8En7ZBySGsyagOdvTT9n588M+JDSyTLdDqpEUtL7T+HSoJSOGGRFB4riyBon0b0Qs
         c0Vsgy53dtZxUpaE2+fvYxUl7bDacDtF3OZwE4hy6EqF101SlZ3RBrMUfb901sCzCcv7
         b69nmJKpSpR9NsETQqA2m73VgmtdSgLmoeU1CW0d9RNaGU6h4bLsFzHesH+Q8bd70uhH
         23Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWdAVwKiGHGnhJ+Lt4OwFLimKxNF4mAzajFFqkhug/G9MieLZjv1kH32cMS/bEB9oGwS0A5PhNUFINiApc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZYD1M3JL4s2u/wmBavav2V4Xz4VkmgVaB/iUSsX+Emx0fR2xm
	PB//YpxfS6yXO0UAJ2wlIdcYqZYftVDYW92oSO5ruqNW5lI4u7r6vry63P63Pgs7h2/np0Ublp+
	9voQlp0FAPvznAIre/vMSAvP832yW/LQ=
X-Gm-Gg: ATEYQzzplCoBwWLjg5FOG7osVEBCIIdCocnXzTscGa2/RsET6xTWZd2Nbq6u8XX+czw
	7bfezOZHB5wKdm+Hf4ZY1FT+zyeS9a+WvZxyKxUDXDehwM4ElSK3G8Rj9zYVVvFztfLBWqDa7XL
	q4BGbpAoAd17bdibXqogxhHRfBsC9l6ffSr9kvIZd2nB2GTalubZ6puZCe6FSgmU+zsZk8TmkDS
	dtQVP7yGSWOrmdQ7Xt0/gvM7WbkFIlXHlY4U10+AIbVzRgn0ttK+HlL+tqBzD5ni3+Xpma9nTuI
	CiIQm0RmhPCtRGsnqRODcY9MV5qwr5oH5yrPpQeAmTCiQHTrpDWlw0ShGgQkOemawuQfFM4zTMK
	Xab20gTG+KYKZ2Xy5A0PkIJU=
X-Received: by 2002:a05:7300:3215:b0:2c1:27c:758c with SMTP id
 5a478bee46e88-2c109938d44mr2357139eec.8.1774277615132; Mon, 23 Mar 2026
 07:53:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260322193830.89324-1-ojeda@kernel.org>
 <4fba0163-547e-4099-8b37-5d8429bda6da@sirena.org.uk>
In-Reply-To: <4fba0163-547e-4099-8b37-5d8429bda6da@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 15:53:21 +0100
X-Gm-Features: AQROBzBN4j7-1buNPtn5ON4A_wtJBuiQQ3UlTVe5clvsCt_bKh7FB_BsDwGf67A
Message-ID: <CANiq72nmFsnoP3dv_-0PWH0XBpf0OuPzNR2CP9Hw56Z+RVifAg@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Miguel Ojeda <ojeda@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Jean Delvare <khali@linux-fr.org>, 
	linux-kernel@vger.kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-mm@kvack.org, linux-um@lists.infradead.org, linux@armlinux.org.uk, 
	llvm@lists.linux.dev, lossin@kernel.org, mark.rutland@arm.com, 
	mmaurer@google.com, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, nsc@kernel.org, 
	peterz@infradead.org, richard@nod.at, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, urezki@gmail.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12172-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,linux-fr.org,vger.kernel.org,nvidia.com,linux-foundation.org,google.com,cambridgegreys.com,protonmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,kvack.org,armlinux.org.uk,lists.linux.dev,arm.com,linux.dev,infradead.org,nod.at,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 97C1E2F5686
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 2:54=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Callers should never treat NULL any differently to any other non-error
> pointer, this is not a value intended for inspection by users.
>
> Having specific handling for NULLs is very much not a preferred
> interface, and most things shouldn't.  The caller should probably have
> it's own !CONFIG_REGULATOR checks rather than using the return value.

Yeah, that is the understanding I got from reading both the docs and
the comment, but I think the docs (i.e. not the comment in the stub)
could point that `NULL` is one possible pointer value (perhaps
including discouraging relying on particular values at the same time,
and perhaps mentioning `!CONFIG_REGULATOR`).

i.e. to me, "Pointer to a struct regulator corresponding to the
regulator producer," sounds in the docs a bit too much like it will be
a valid one... no?

Another perspective is that, when one reads the rendered docs:

  https://docs.kernel.org/driver-api/regulator.html#c.regulator_get

one sees the postconditions, but they happen to not apply in all cases
(in fact, perhaps not having the "Returns" there would increase the
chances one realizes that, but I understand that you want them to
treat it as fully opaque as much as possible).

It could also help things like AI review systems which may only notice
the docs and not the comment inside the stub.

Perhaps it could be at least a one-line comment in the real
definition, even if not in the rendered docs, to have a chance for
others to notice.

I don't know -- I hope that helps, in any case. Perhaps Daniel can
tell us what he thought when he was writing the code, as another
perspective, i.e. whether it was the docs or not the issue.

Thanks!

Cheers,
Miguel

