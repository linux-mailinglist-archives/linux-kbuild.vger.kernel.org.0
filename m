Return-Path: <linux-kbuild+bounces-13950-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DEbAEVwvTmpvEwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13950-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Jul 2026 13:07:08 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6059724A7E
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Jul 2026 13:07:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Z9hw6vnN;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13950-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13950-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABA7E30A7A38
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2026 10:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9967F42EEBE;
	Wed,  8 Jul 2026 10:55:14 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B5242E8FB
	for <linux-kbuild@vger.kernel.org>; Wed,  8 Jul 2026 10:55:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783508111; cv=pass; b=q+f2SmYj8XqyRs6qIFgOhsnyXtmPh26xSOp/KkB/Hosi1uccCymFQHMwryTqrxd3bB0jS+lVpZOW3aUUaMYOQwgzzk8lAUJO3zWBl+ubOj+nJwMWQClp7/GV7PVpZ3O/1oCTKMHHwLlLfFLMfoJlUFhxfusIQNUG0GTi/w+j3/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783508111; c=relaxed/simple;
	bh=JlzNS0esmZdzUsLyJazA2D92smlaeRYfegVIPLN8YKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5TX17zkemZzsiFULKOCYl2AkkT7fcNMdBxjZufp3xHeth6JTo2p6Z4TFxU2AjoTDCSNOU2vuTpmSEh10wxI6vfTovh9dYOe8Usl4QlnCpHwZeh/LXNl3sumpHuTu4ZikapJAQmEaWKFk3W31CPE3Rms7yLDdykQSNscD2cvDbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9hw6vnN; arc=pass smtp.client-ip=209.85.216.47
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381d656c36eso54255a91.1
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Jul 2026 03:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783508099; cv=none;
        d=google.com; s=arc-20260327;
        b=Lm26NP993VOv1Vit+z03AdDAg3E5g7aKj/s66j8AMnOnwmn/4oqsXMsWgTfmW/UgEZ
         SUM15Rq2RIGaPAK3tXMjGpQ6uQ6CCWiu1teQ8TCixvB8n0NM7kfynjg+kSnjXYNbyt8y
         9R0W2v8wAGQCegIJyR6sZDe9BSLg80miO1RBNSqDo6h7ynbrKvQB5TGcgQYoIvbhdoFO
         KQh1wfWFkOW+E6rGF+qa0tYPZryyvBkxZ4F6CBKVxNYU/wESn8Sf1Qf/k9FVX+nnhSSc
         nsNf+Yf6w/sPQL5BWFgeSJz/XJZecy4dH3hrEpMfqY0+zddcIdsn/b96cg7V0ZtC+AIy
         SJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5XtzFmugVbIMu8031SSPHHiS7JIyWhVoU+hgD0OOMJM=;
        fh=/T7SEULK5zm+0kahbyj0x7ruu5YKhbBQO7KP4sSBYRU=;
        b=p3uYcxu1pevtJJpyvyM+gddODKsp5iRq2EzLvgZG/wj6QzUYXUEqh6cU2FKdSfp9mD
         ScE+waS6TZ1nhseWxje54hqmuYjaAJzK8s7DSRZcBWgZd16w3tiCB/3HahxOcixVPV4X
         MCliGyY2dOro2uO4M4rQw55X9vVMGCzbBqPvQkhADWICXlR0apLHOAB+G2moBOb1qMB4
         Qaa33C9XJBzwCbyDNqGG9ns/AIfULKxix4jUa7hXkJejuXBLj/vtJOYvUnYP7TaTFh8H
         Lzj1jv9GEKDWdNGfxvTvhIHWEH8qNdrWQobz80qEfn7Mw+LMsD1B9YuKDBPozmBomDw7
         UNsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783508099; x=1784112899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5XtzFmugVbIMu8031SSPHHiS7JIyWhVoU+hgD0OOMJM=;
        b=Z9hw6vnN4JAyrRI7qRxm0o1bQz20jatxqcwzhDS4EC3yMuubtHs3AnzavSc/LaZDlD
         buqZf5KfOxvrR5/LmRZUF9qcCnrZh7byEpl62RwMcSHkU1Kt5ABU3grvdllHiphd89N/
         5dJ0FW5eAjYrL+AyQcwy+Ummsk6wtjooQs+M92KW7E4LaS1ZBQ+Ri7H9JeOpS0antlpw
         K8tZHJInO4vO5ZRyI5i+pgsNwP/saK/kvvvWNplYzJ6yMuVEyFTDlWyn1o0vjPshA9E3
         s0Vf1lEAZRGwMcIvuEZW7KHX1ttkZ8AP2FPb1SjBBOYZakGGzDUITbgRXx80LPe6bZYA
         exyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783508099; x=1784112899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5XtzFmugVbIMu8031SSPHHiS7JIyWhVoU+hgD0OOMJM=;
        b=UA5O8Q33529ACMJ6N3DnTIc0ymutIyByabvnKkvGkYjq8cukFRKO9VFZxxhaVGcBYs
         e6YqaxA7lUjbo9Q8eauPFF4FNIECzkj/qMUF3YC88XwX0n++Tu+7A0HPT69AiFO3s2m9
         VCMSrRteKsgcLzcogK05/U5HT7GMq4LXSc7A+cNTiKiS1ZwDDgvJOWcj1/ICcIeYkCHs
         0VFaZ3+Y6uEHq3CWrikuDz0QCGqa02mS3DaFQ55WguynyKxs0z9SyxBWr6zt/2sdD5oa
         zeemZdxWE+2UY0TYCA547kyi4DU349QFw8JKkAainh7RjzZoE+q9cx7FgG+agVc6R11U
         OkYg==
X-Forwarded-Encrypted: i=1; AHgh+RrpG9nxZUn8ue51xWemrb2cKptTf33CWqt56WaHHt800cH+4bcMvX6smTCWreQxYYm48CG4XCSqM/0e+XY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt2Gc6OvEoEWZIkO0e3Qh/g5P+xpXBjOIoLND5pHgOnKCAn0rv
	k8kiDvQBIFFvt1qBoRZicnzEKyGMvZqt+qTThrgLXdDPNTje33l3BYxhxJuNgzhLVr251l+DqgW
	NTD485hA/rUC6I2jz1zmzawmB1WxJFNc=
X-Gm-Gg: AfdE7cmrym5MgGqOietoGZ33pX45/xUG/dh6/NCWY/dJpAUXrvGo7CAEoOGg9DBCiX8
	RfsV9CZ/G7XDPATzNMrcRFharMP3TywWcEkyeEADboIakN0kk3MSufNlqtnjZwWFeiVE88LvBDD
	4HbMAQ1k+cFGquOBwv4mo+8nWpqjP+pTgP1uo0JuD+Pbavkap0aF57gr1ZEwKR3VYHbmKRUW7SU
	mF74nkyPi70gT0/CbmVYHoHJgEYAtzNxHtOc1itTnu8ZsZ38IfzRqtJK83w+3YfQeV8NPeroSqf
	uHmDXugeHzvj6oEGh1H3pIqaVG7Nb7XYxy2MX0QYX7dSrDuewhfavHhrrw4mJedcaiSMaK/KJWM
	kQ/k9IHb5I0uq
X-Received: by 2002:a17:90b:35c4:b0:381:6cf0:d5f5 with SMTP id
 98e67ed59e1d1-3894279612dmr1551180a91.5.1783508098666; Wed, 08 Jul 2026
 03:54:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-soc_unwrap_or-v2-1-007ed724cc7b@nvidia.com>
In-Reply-To: <20260708-soc_unwrap_or-v2-1-007ed724cc7b@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jul 2026 12:54:45 +0200
X-Gm-Features: AVVi8CcYNzK72rgFcf_MGGOIljD7cV0DNEd6uNO1X5Foym-jQMge4LaBJm9o7ws
Message-ID: <CANiq72mn+8zqQguApz4FEqvu5mGSrt231BKOwKf9oHVx-xZ+Bw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: allow `clippy::unwrap_or_default` globally
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13950-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:acourbot@nvidia.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:work@onurozkan.dev,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,onurozkan.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6059724A7E

On Wed, Jul 8, 2026 at 12:49=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> +# `-Aclippy::unwrap_or_default`: the lint is buggy [1] and ignores our
> +# MSRV. It can trigger depending on the optimization level.
> +# [1] https://github.com/rust-lang/rust-clippy/issues/17379
>  rust_common_flags_per_version :=3D \
> -    $(if $(call rustc-min-version,108600),,-Aclippy::precedence)
> +    $(if $(call rustc-min-version,108600),,-Aclippy::precedence) \
> +    -Aclippy::unwrap_or_default

I guess it may be per-version later on (i.e. when they fix it), but
for now, it can go into the main list above -- I can move it when I
apply it.

Thanks for the patch!

Cheers,
Miguel

