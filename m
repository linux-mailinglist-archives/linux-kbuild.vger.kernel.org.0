Return-Path: <linux-kbuild+bounces-13585-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xKCNMsGMImouaAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13585-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 10:45:53 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 65157646863
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 10:45:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dIfcH9t6;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13585-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13585-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42F3630233CD
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 08:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9E33CF665;
	Fri,  5 Jun 2026 08:36:43 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331E53CF68E
	for <linux-kbuild@vger.kernel.org>; Fri,  5 Jun 2026 08:36:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780648603; cv=pass; b=rauVzr0pSNni9KLiraYOyl66nuk5m+/MBs4GAB4SIlrm30/3CWropV3STj2KvN/wAsVzZKthN6YMeemKtHahGSUzYZWDmRQ/5I29LXXK2eNXiARwHKWfALxSMCwvkpGHn+Tg+x3VodC8tGsNv5ebS4ZUsK9Uhl95B4sbmebkx3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780648603; c=relaxed/simple;
	bh=mSgvPmECu35Tw7MMm3j47U64E8vDrNkepG2EWMTevfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ft4EATY/xjmva27h1ffn7eUFOdgZ9K8Vk5Kru9PcrqTkngpGhHQLUFwEp4OQI813Q8BbtTVAytjbjuA5lNvjzsMZfsLeythvKFIvEsG5KWU6cgaO0IdryIe9aj9dMxu0BhmoMgPfSkSM9lMo+BOcqncGucPGXy7nDRihA3jhBrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIfcH9t6; arc=pass smtp.client-ip=74.125.82.170
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304e5d3cdfeso72313eec.3
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Jun 2026 01:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780648601; cv=none;
        d=google.com; s=arc-20240605;
        b=dmJr/Qo6Xz9w/D6THJ/PM6wjkWd5HMyupYXXLjRYWEuzMvvHr2NmSIqLNCFXsjmUPH
         lN9AZ1qynSSfsk/GW1kIygdy03+dgM/6QJX5jR2dinVVlon3aZaogeHZoFWwIug9pxzG
         UL5S3HJKQCJuL5j+MJZfJuw3t0SPP/5PqIxc4lCUmOet913gT7af8eJIVVDYVy6mlRpy
         exdxGzyiIJaPOpQY4fD1g8nhEN+S1CSOWpjsv2Iu0447jAeYQnl2uneWEvhh/429Rvsm
         vuhBCcXlh0H8pUU9OwmU2rJVLxtUV5PE67j0c3dYtlhc80FWCz6wqBFX48qlsNGzbPhu
         SxOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mSgvPmECu35Tw7MMm3j47U64E8vDrNkepG2EWMTevfs=;
        fh=jWb/pY1uSv+I0LWC5toCBaYiDvl+qTv+ut6Dkhdh/3Q=;
        b=Dyq1gtTJeUrxbp6A/fkDQE3NLNwPH9h3XLcLmD+OG/N1yh1Fae4+VGbsTTCS5IosEM
         yQMnG5Ma7cv/AV87JBXChv3pbAIvnMoilo58BPj/Njwvur4D9gfOslOpAboRvx+2ylE8
         PrhBeFgHM+6428SP7F3w9kR7H15HRnk/4g32IpJJrOS39juLFgCPrbKGqKvfLzKKkLKl
         r6JuFSjLjjpoh7xtpPCJ6w3NjvKHLhvwu8bBRlzJVvXhFcyxdE7M6AX9DogvgXOG4s5c
         EcWFD4Dzil7kvNV1ANrMJY9PJZjREaT+q1dqId7EsChiAHWIuAoOxwSf/GvSX0IILfVK
         g5ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780648601; x=1781253401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSgvPmECu35Tw7MMm3j47U64E8vDrNkepG2EWMTevfs=;
        b=dIfcH9t6/Mmpp078bY3/a2h8QlPtCyp15uHGMBrOk0YDgea/7qQzrvgB5VtGycVtFJ
         nHWTi1sF7Tu0ffhV1rgxBGAYzRMXmfjOuYwzrPzhmqAfv/SlPQOst9Q3NBisuAIcQvy4
         v0vZSj0z00EO/ggyb+19JnIQChZEc9z6geixOv3cxakeT8nXZYtcZaZMax2CwBu3pfCk
         dcF99nldhGsbyWgxCtKIyFZyAf7wb4QDtLToNbtKpmqPlrIue4YVh7/vhURvySgFAwvk
         ocgzOW2GuAXRlFOdUmm/+/KbzEukENBKyGfjp71PuGbf0N54gy9F2RubqwOfCtKSd5v5
         p5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780648601; x=1781253401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mSgvPmECu35Tw7MMm3j47U64E8vDrNkepG2EWMTevfs=;
        b=TDkI2Hl571yE70zZwdm2KBiiYfXzhewoCcChtgvmc4BQwC0dt2SiENr4rJzSwr2iB6
         yP/jE8NtEDLKq7xcqMd0FDD9mt6403uD5TP6PZQ1ucbUaRJzymjLXPQx3kM2jSWahRmR
         v5CTJCk/BZ8VJ4MrdfCiRx/0h13MMIwAmc1MUrxFX2xq+iJ/4SRv1+hWMInrifk8FZ4m
         BE85M9r/cS4p13JP9RSA1DR9lZnWz5wAO3ecMzF5+57iQDiBwwrM+eBk0PyAMrwJQooX
         rd/znu9iqSSou9UuI97RpNU3Lz5kBfwVWVLgu3sZWtVeMsb6db804kkoY61hYTAKUIPx
         KMGg==
X-Forwarded-Encrypted: i=1; AFNElJ9F2ShW+oFJqI/BvZeBsGPlPiy0IdtbXWpxXCIYA2hmvbX91C9o+rxjYCQoXczu6k0lMEpwrD/ZukKjdUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFHEw8PpT69gcPpEK0mTSR8HJaHdICH9d9zpeTZb702lrGzxUN
	ktY37wdfhRDWMuzbPLpdwQmLqVQESxmm2NWVVpSF+bSYImhG+vW3rn1/n230u1NyYnVbRgsbDsz
	PMzsMX6EZOG/TVLxFo85BXiY8HzMWsMg=
X-Gm-Gg: Acq92OHSLUCIyV0ztAKYchc7gUZZaKVkYd3v89mnW+pTLLMDhmKkOcSYsINI3kXLeP8
	x319se+DI6PfRA9vLstoecK8JH278xDOBgUm40nY4jW33AznmWSwSn8yVC1d9txndAbdrDknQIG
	jSdzu5gnmi/I3p3y8RVrRVAYafZPQ2CsKfTq+mUnw0JTzPpe9jDiN9z+rfQ7o122LzjqOdcPEK8
	e1OKdL8q6SLVbcYeR/CAz3Lz5i6VCEA4fSibD+g0+o/NHk6iT5s55fpz+E1ZVjwnr6J0WogBlnP
	TP06K66d3+YLsOR6hMYus6KOE3lQi6n2VQ0RxMD9VzmR9WvAyn+Ev3gVWV+lyeSHsS/lYk3cilb
	ZXxkTaNnU2RMLdC+ap4z3Zuk8TYQZ1ZOGWw==
X-Received: by 2002:a05:7301:9f07:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-3077b5eabbfmr547169eec.5.1780648601370; Fri, 05 Jun 2026
 01:36:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com> <20260605-nova-exports-v4-4-e948c287407c@nvidia.com>
In-Reply-To: <20260605-nova-exports-v4-4-e948c287407c@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Jun 2026 10:36:28 +0200
X-Gm-Features: AVVi8CcQyHZaxrVm9l3w8nQkPTRE7ixo9gqTVbYy1F9Fup8-NkOcmlFkT0pwkvM
Message-ID: <CANiq72mFouTJTKePtQsDONZr2H=JbAEZOuGO6LoK4EVCSvAFOw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] gpu: nova-core: emit Rust metadata for nova-drm
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13585-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nvidia.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65157646863

On Fri, Jun 5, 2026 at 10:32=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> +libnova_core.rmeta

This should be already covered by our global `.gitignore`, unless I am
missing something subtle here.

Cheers,
Miguel

