Return-Path: <linux-kbuild+bounces-13586-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wJfTL4mPImrbaAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13586-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 10:57:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7A6646A0C
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 10:57:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=tLRRiEmn;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13586-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13586-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6591302F27B
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 08:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEFB3DCD98;
	Fri,  5 Jun 2026 08:48:28 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C689477E48
	for <linux-kbuild@vger.kernel.org>; Fri,  5 Jun 2026 08:48:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649308; cv=pass; b=e9VHGmlXEBJo6+phnbc+sWjATJO9Xj70WmnR2T7t5nOmvmks6aj2X+DKMLnvlcGfZQOc9zb04FvPkp+WUi3gr+P9yyqtQ2bcyXKXEpEhQ26U0aVIhmikOH1J+4I20M36rhaFSwQbchGMUf6Oo9xYTrkcLU4uqr30OQBNQz4+4+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649308; c=relaxed/simple;
	bh=t30JAFeGxUhlx2yZbt8/VaZkSxhoi+xRWFYAKjEhn+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K05XnZ6YuZThtrEzzf+vQ/x1KJ/6BlXPLMXMUhwdvlPt83dxtTTgETHzJP6bfyIhYhGoy3uHbzuB5mLuG9rpwxp8TNLi79rz6LTIZmP9o6CIO/ExO9i2wk+ZJkMnBlE9Kh7rWCYBnFlvD2yWDUaES49vd61L5SrxwcoqmTFPdQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tLRRiEmn; arc=pass smtp.client-ip=74.125.82.176
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-304da3b4508so161697eec.2
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Jun 2026 01:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780649306; cv=none;
        d=google.com; s=arc-20240605;
        b=bSKBWjRjgv4NrKBWMswhpgyMOEC9hdZw2MsaBX8La9JB7CKHiRTG9DNtEiNmMyJmOX
         HJTiY7H7qRc2zwEG2grHiQI26/F5+0IL5vHXAllGHCJWNLBdmvfdorRaLjYbqwTJE9D9
         NlAxoUHuzdM4JqLiFmeph7ckX8aj6fdNe+KYdC7qzeEfa39heSuXHYbN212ct0JbcWyY
         wEWu2ZCYBq9miT8Zqzu8Bhg9CkToko0FufyVrNuNjzLhD5HjWhB7fKtLYUbgexCUHFHB
         uSacakVgm5XnWuMe3D6O1wTooGT2HDwtvU/mqsjFouqR3nyuIwP/YFw0winNsWVTlgXB
         7ieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t30JAFeGxUhlx2yZbt8/VaZkSxhoi+xRWFYAKjEhn+g=;
        fh=NVNH/uNt4lVSn0RpYzjJlubzrKARaIq6Owx+84vw1vI=;
        b=UlDo21l2RMdl49XyhQNHJeQfjpDAGFZRqPKffjO15Cg0Lwm1bJ1D1ym1jwrAjLxa2H
         WcNeA1yHBFS6nBtR16Up3UJx/UKCw4+/H6fo48niK+Ha0h9yECR2nzJnVNt8izLHL+rw
         QpbkzVrb17iRgy7/oOVh/fYSFFqqpXv7h5mQ1TgRoVdmMM77Fd+Yqu8KWxx1k2FZ/Cqo
         xED68hROn8Q+bjv7W6Mgd/wBmG/SPdl7sLXPbGX/hRElD2cznE6EgiXOKrr3kg04BXMo
         15Msau8BPIGsHub3G9BhVDlV+XiZNCKzg/kMgMQgEiwuDuy07oTQzRF4xLgG0fzqIg2u
         uorw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780649306; x=1781254106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t30JAFeGxUhlx2yZbt8/VaZkSxhoi+xRWFYAKjEhn+g=;
        b=tLRRiEmnwsOH1yOPao1chqAKiQ288RLmaFsbhKXRMrfWdzQwttD8gZNLrH8hA1mQq/
         dzWNBQ1IpSnTlybccQ9EjFZ4XUNs7DfKQNwEPJKDldpjAxnz20PxIB7nn64TYkj52GNT
         dar+KXraYjJsWUJxL4Uq2n6GxBmwu4rAJCBoeY2fJazdn4YGw6l+Rdnt1r+36EZHhBAp
         c4JYV52ZBg4i589s/YZwPz7U9devEPAZu76YwOsOXp9SjgndTm418gY70nnnn/hMA82D
         Prgotuftw2cSXKB9rR2fKHOELVLTZGuc0oHtgazVU3LsJIHr5tnlnIfReTtWejEngWdr
         paVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780649306; x=1781254106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t30JAFeGxUhlx2yZbt8/VaZkSxhoi+xRWFYAKjEhn+g=;
        b=o+DfAOs2pA4tiBdr5SenGoH+Op3kWNRxj27lX9FTl776w6Z8qM7dUhlsu5EMSjw4pB
         plZKXApeKEYw6YIGLoKtrTMyBuacuJddjykYxRpwiTgz2ZVqxg3J+mYi8j+0ZHRAoxOJ
         q/UMC8EzpgfvC0Y+4lol8OgaPbW1MHqAcCT7c31LjYHmauvjW6f7Fo1vynWIefGGsHxX
         AY+lLuUQG8VUvfQjkqGbssIWZQIVRQ2EDiyw5+NhdDL+qYRHylZbGjQ/sQ28NLVa08vs
         5iZjQNq+6iryDTh4HWDg9GfC7nAo4hdbu5FpshZgLfSoeSvwCTV9tOSwlB8VeRSEwwcx
         pAqA==
X-Forwarded-Encrypted: i=1; AFNElJ/Xc+29RnRy62GuMOkBxf1O2s9ldQ+hsMRnuyh7uC3tjts4tuWQL5j/9zY4diWdpOznkcROSiMG1vBWAHU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3pGQbQ7oBH2dmLVtY3+961mw/HJ4kcqQfvU/UKVk1PHlaDshI
	M/4nqogSgCPjHfQscgtg4YDf+jAv4R3/bDeooyPJLG2EvEkd9uZz72tV5uV9iKrmGfqVMzbAlo2
	6cQXKALD2dZk6cRqBDREWI/mAfjUzi0k=
X-Gm-Gg: Acq92OE1TPI4xo+TNzoh/N+MLm/+8TgdysNpE2QCufkp6LhxDfmnfUA3AAg3ANXO+wc
	nxN5I/viNeWPSq6Y/jvsFBx+QQGSEd9odTZKtMw2FnqrtKsCWQtWeP3K2YvAhRiOqVedCnVENLM
	9Gag43zHLRdmfYYAq/fj52w7Qm9vT9Am4/2XD48N56FgAmrl7aWgfQIVeBmO063mt4rQdSO7CAw
	VVPxEKt1DqjyCXfQNbbqK9FJ2LEz8GbBBU0OQr8paVn+90Ue9JRqGEO98g7TllWBblT70brtp6X
	LlYmlrB5rhVPruLadFi3SGfPtNRoT7uM0/B5zweYo9Mg019Yb04AofczBKw2FBmv4keC2FOQ70f
	xThQLNsweEDZGGtFLFqmM6fJ5D7jBw/U2jA==
X-Received: by 2002:a05:7301:1e4a:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-3077b3668c1mr552123eec.3.1780649306414; Fri, 05 Jun 2026
 01:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com>
In-Reply-To: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Jun 2026 10:48:12 +0200
X-Gm-Features: AVVi8Cc74TRwhc7yjE46MLUkC2_0K6dWthB_1BctPYhz93WSvkLnW5tntk2yBNE
Message-ID: <CANiq72m54FU+zqhhGCXC_v2TyBA2LjpgHbU_J=AFfpWZLM_6_w@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] gpu: drm: nova: enable calling into nova-core
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13586-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:acourbot@nvidia.com,m:ojeda@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:zhiw@nvidia.com,m:ecourtney@nvidia.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:nova-gpu@lists.linux.dev,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,linux.intel.com,nvidia.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nvidia.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A7A6646A0C

On Fri, Jun 5, 2026 at 10:32=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> This series is based on `drm-rust-next`. The current revision includes
> the feedback received on v3. In particular, moving everything to
> `drivers/gpu/Makefile` simplifies things considerably, and I have tried
> to align more with what is done in `rust/Makefile`.

Thanks for reworking it!

It looks indeed way simpler, and is pretty much what tried when we
discussed this a few months ago (well, speaking from memory), so I am
glad it works for you.

And now that it is also closer to `rust/Makefile`, it will be easier to rep=
lace.

So thanks again :)

Cheers,
Miguel

