Return-Path: <linux-kbuild+bounces-12900-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHoIBoaj8GlAWgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12900-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 14:09:42 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD35484A00
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 14:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 011DE3153911
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 11:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2F43F0A9D;
	Tue, 28 Apr 2026 11:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBT1du2V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933613DF00B
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Apr 2026 11:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777377084; cv=pass; b=iDKoIw1RRXYvtGxIbmBCYaj+onKi7lYz+ff+J08+DoU7rPQhfUxPNJdZrt5ghw+wkth6EW+MBCqmKq1hle0TS/XGR0s4l2z54nug22IiL7aavvDKWZyuoY1pLS51g99Dy2JL14rxbZXfy3cU82OcDVuJh+pmPM7OxKc8loViQVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777377084; c=relaxed/simple;
	bh=E0Mf6nu/Yyi2mO8vmqCFQQuDl4ubjEv9FtbDx7gQTGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CDSqZPPPO5LVqVc8OLdYGP6M1tWBkVGgIqNo+V5u2yKS1IFAEu/QAszT1DcgIx681+MhlP/P5pdNwKfICJ+HcjjUffPy1lyGHrxdbX8cO/vJmIyrCGWZxV29Qxi639Sf/atYXuTjEZ/wp7cdlDbIP510YJeKTRgcm/3NCcU5WO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBT1du2V; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2d9b27e4aa3so685687eec.1
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Apr 2026 04:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777377083; cv=none;
        d=google.com; s=arc-20240605;
        b=FgxV3E27nDY+6/W+S7RlVW718bPNXqNvTer1JxBZ+7GACKjT/5pK162RGTWevggIXH
         haYS8TNGn7f2tJyQOCUysCXYaI7lWXh3SGFW2BOwHkjfDvHStzR0Gp9dPdsj9hPE61S1
         OdrBsRCRya/D3gwX2i2Q9cVR3ABXn9McgbyAWt8VoZgbMwJ8j66XyWPRyQQF19oKo4Qe
         oyFuyAuSMlprEa6SJgf7DKocO4cdQ0he8ilxE1fHMpEo53vU9MmIz70yElSUJOsIcu3T
         plzEo+2GctWY72BFLOFFlCjGalyNmWCi65YiXPeGszGqyvbxVCL+o9vsHu2cfLKD5+zF
         +3Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E0Mf6nu/Yyi2mO8vmqCFQQuDl4ubjEv9FtbDx7gQTGM=;
        fh=MjsFDv0o8wObOWfIwju/V3hSD9/TQFTc6qUea4e94t4=;
        b=Dhi8KLLCCb3z4fcTqX5IVIUka9M9avEyvhnYX1WW+WO6zKpkw8fQFwi9hsIp9I4/0Y
         s1B0GValhoAdBmmKpyNslLnNQdrF99kJgCV+rGTf9bT9L3yjFjyND/p0khDqBNHPpcim
         0QU5FD1TjdZF1ERURMjirrC6pdKgdDv1ua4vLTo7K6t7fwtaAGonhOcb40n2E0BSC7ez
         q8RJXk4asvyGZLBT5XRUFl5Xh7qFcAhWjIUNyRt7LU0wOzoyJEXoCGKt/EvV8XB5bi8f
         a8cHuSzKrEIoE31DTHEXN1Zn0aVdMnSOlsrfJNFcpDf0QTr8IMHy4zLFdLanFHO2+8M5
         bdSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777377082; x=1777981882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0Mf6nu/Yyi2mO8vmqCFQQuDl4ubjEv9FtbDx7gQTGM=;
        b=MBT1du2VPcosM1uWhj1auYgkyZBDXtcU0q3uRn0UaVRgtYuscxwKeLCoMRLexjMkN6
         /3XXhiEfld2SOlTQg3zBI7r/78CVn9mYxSQblYhTP38x3LkmCgcjI99T0CnRp2uoo9Gj
         8oYh09qg3kHmE4MEM5kBsFKWhZFto10Tee1J0SUuc9pC+uklcWm5zIbz6ZWEe6Pq63je
         f4DCTr/GjO9KLv1ApbTLcMYEsE9D9qdpSgPMMoxVlx5QcWyR7segCXODQ3968dscbVuP
         GAXVOLLCPhGDhKDVvR/T2eyOkomBRM4uwFqOia2Osal+MdqiNi8jo1S8E81MqAhEhfwL
         2h0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777377082; x=1777981882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E0Mf6nu/Yyi2mO8vmqCFQQuDl4ubjEv9FtbDx7gQTGM=;
        b=Cp1M1lJNpbRpJ33E1ejU5mPffxihSh3m3g2MyvCGbSXHYGcJyNSns2S9d75FnUR57K
         BbBTgi9tS32ogF8QOK47EAhZra4ZUwKTbTMOpYGzBrwkNdpUJtKnq1eAdFar/ehpE7LU
         We2xADZoHSJ8sByZp3pZRKRyN2WkxhADTROCxTHxXsQ6KHqouc4S1I6oA4PVnU5+01YR
         v/t0psyZCeb4xCnxVJl6+BeAComS4w1po0sQofJP+oCZn5V1R5IfdmMm5c75xZQOPsBK
         N/e+5IM0fK+WkVeRL+kALDswY5sLe7c6QOHqq1FubXW3CR1NHSgI6hiQftXNeYir6Sn+
         8yYg==
X-Forwarded-Encrypted: i=1; AFNElJ+5g7MrAE2QpVPRph257HQpZxGHJqZcKZPCLUanFg100UIrYr7LMu/ZRpP+10XLvNLw7J2xBzo8rnZRI7s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn4r1m9eFmH0MBSHkYvRAeBbeAAQE5RwOgjUvm9yjAHIWXZOny
	RNnAdJvIbpsNXI+OvR3VtRgMG0fwYOB5pr36aAvJsxtNLhSjvwp5e8APVFyuigb0zou0QtpmEQR
	4XsXJoZ5jzSB3u1phkorlDf3mJ6K/lq0=
X-Gm-Gg: AeBDieu2f0bZbxl4mtJFCHGFL13dZSY0jBf81+0PIg3zuuaWSZtjK4tWQElzkv0JSY3
	boUPyQRvR0nDULl4olIZfQlmMMLO9pxBizHgIDJIGUtnRyxJ/s83w6uO6BxNUxxGh63EG4owYw1
	Qcvxfo2EWlhhBm1to0O9TrJBd4S7XXB85daSPzbePZSMRSkdmAEKFxav1a7cv94j8UZEkZ5jG6M
	zBVeCbxoYliTqjpB1S4FGYVpGVjy1hwOKA2DgpXk/vtmfbNrCwNAvaAtYLubup47sCps7Vts0qT
	gUyTtqAzUowQ54+LwZKxC24xhbDdOZgYwTNjte5qQ9B27AFMQ3/rWnR5hbVkNq9C5Ac0eg1Dn7Z
	YSqPbcXWVwAQL12AG3bgIuTI1xTlr9NzC9A==
X-Received: by 2002:a05:7301:3d10:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-2ed09bdc0ccmr579752eec.5.1777377082557; Tue, 28 Apr 2026
 04:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-3-julianbraha@gmail.com> <CANiq72=nCw+zWYhvPMJiG8oOT3zpaD8eGVUgaK5rnSzAiGGjPw@mail.gmail.com>
 <607be3b2-11bc-4074-a396-39da73089b74@app.fastmail.com>
In-Reply-To: <607be3b2-11bc-4074-a396-39da73089b74@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Apr 2026 13:51:09 +0200
X-Gm-Features: AVHnY4I93jEEHcqLYwjkfMluqxrTct8LvxfIDurB2CADW-KHDEb5dYbjSTfetIM
Message-ID: <CANiq72mEgpe-UGMQ_YWb8SKsY96Oc0b4sQ_MKvhMDVkNC9WvQA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
To: Arnd Bergmann <arnd@arndb.de>
Cc: Julian Braha <julianbraha@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, ljs@kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6DD35484A00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12900-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,kernel.org,linuxfoundation.org,lwn.net,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Mon, Apr 27, 2026 at 9:34=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> It would also be helpful to reduce the number of hard dependencies
> and ideally only rely on packages that are already shipping in common
> distros.
>
> From the dependency list, it appears that the majority of dependencies
> here are only indirectly pulled in by 'reqwest'. I guess is only
> required for dead-link checking, so maybe that part could be
> made optional?

+1, I had the same thoughts -- even if the fetching is done outside
`make`, it would be still be nice to reduce the dependencies. Even if
it just means calling into `curl` or similar.

Then I thought if the same would apply to `clap` etc., but then again,
we may want to write more tools like this in Rust in the future (we
already felt the pain in the past the pain of not having a e.g. JSON
parser), and whether we could have a more general solution for this,
including perhaps even a kernel.org registry (either as primary or
not) etc.

Cheers,
Miguel

