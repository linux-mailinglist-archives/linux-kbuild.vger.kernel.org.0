Return-Path: <linux-kbuild+bounces-13445-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIb+LKm7HWo/dQkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13445-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Jun 2026 19:04:41 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 107FB622FE3
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Jun 2026 19:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1035A30057AE
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2026 17:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F913DC4C8;
	Mon,  1 Jun 2026 17:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sjs0FMtK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D913DBD5E
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Jun 2026 17:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333226; cv=pass; b=D1s6L0PZfWb2MdRMjrKSo4q97QnFIuxhliR/k/nRvhAfqNstDOB1DpM6Ay4CEgCHP0hyPqfC7SLD+fAIr3XBKgoVCwI1uJTzasbCnANB81XAVQwnT8fY1zIqfRkIg52KdtjWOHtuomEirW7caWXopdfvyyZSAvEgdnixA/PH5HE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333226; c=relaxed/simple;
	bh=salmmm95H70q1+9ROpe1qMKo8sa8cqKehQgZ87WFyHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JSdUMNUCGSHAJxDxnbYCVSrkZYK8bzbbz2FSU5QVVs6tRR5qw7kLq1ElJva5txR29ohpW7a1iLzvxJJjTFy0XGhr2eanyfDWzcXBFm+s62Bi+f2+/m3QzqOq8laE/jTPRtaYbJVeVNEKikZHAlpBoN1FQ/tD6G0vsOv4mQBqKvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sjs0FMtK; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-137eb8e3491so39936c88.3
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Jun 2026 10:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780333225; cv=none;
        d=google.com; s=arc-20240605;
        b=Bo2yD2AOJWyQzDdltAoblK3u6NRGYrW7gPZVRMXHi6IZ966KM2CR2pOubSvJezNqck
         sGcbWZ8t+9WZCvyA6AVXoj2GddjlXslu3PG72W2gNL/iJbAldP2UwTWPcHZtNEE0u6lf
         6wBXcc/K+2aSriPIrjSSgroXhwhIQS258tRajjYrP8VEaAeZx4+pb0XpTqdyf2SVQFBf
         dkt83/QM5h/1SzGhQx6pXw+6Db0J+d+a6aOkxga1F849W9DJpf3WksT0GoQBdbVnUdui
         WdduhVcxWlGHEv4E+bVm350YO0HKr+zf6mtWTrcNQolMsfV/p12Jod4r9ujq/yJdqJDJ
         hx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kYUhb6mQkkMhkxxhyG/H6BneYLT2Y7wBn/vJjSqdV84=;
        fh=f1An2V1Z6zph8qBcr4hqyc13ztIDnsO+C6XSsVInhDI=;
        b=kFUVgdByD352OeBG6zm2nj3eUaAk3s2/89H1M3ZCUr0rUzzdPXTpeZ9Alqw7A1zHbU
         j5A02lHYsvgkOKlr8P967Snugnrj0YSQj+cP4vzD4r9fP3Rcom+N4CrPE82f2ZVMVYKc
         WXAeljCYckP+xRTlRgZKJygZSsV5DO71M9z0Blj33/Q1ZElUdZZHht68/0rVRJqBoT4M
         PBPHyfAltbiFgnC4NHK5k51I0kNRZFoDk6SPgJv0aTQc4Q0o8UkosujHI6zXK9nBK6P3
         YO0g3OzrfxEJLn6bPQ1pLKq6v7oBXqxQ7Ok6uNbJEe8+5SunQMDSh+2Bco/VQoKzkHoE
         VKNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780333225; x=1780938025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYUhb6mQkkMhkxxhyG/H6BneYLT2Y7wBn/vJjSqdV84=;
        b=Sjs0FMtKJQROH9P5CNZZ/6n82+bhS42s06nHi/9Hamb7jL6hvJ9g4E7TWkWRZt5Cys
         jO6lm9reXo+m9gjECDEkdANBts9bJYY5RlZM+6hm4EzC9lJ6DrBYd6rsC+s+WbYFENB+
         wb4uwgcEvRw05bYVG3/SYMxrxX55q4/eiRXYSck7BRltmDc/BnDKbgQ9WbwPPOYQTuyh
         xaynkgkNYppS4T7q5a4D10nh2SzIzv2p261LEN5UkIqZ04oEbb5egmb8JevCDKgC1gnQ
         fTu/4V/oGff9TQc0qT8JvucmyK10O2pR42RmbIUX+iLVWy/hbPypDM5FQ/wgnufzXFQE
         tRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333225; x=1780938025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kYUhb6mQkkMhkxxhyG/H6BneYLT2Y7wBn/vJjSqdV84=;
        b=UDwPtu0U0/NQwJW+I18mCeU3D6DVoQcaQoQxR9myGJ67d2fv93jYYyWfezWQqbyR6y
         DTY4naD8VNgsfMPEqWrQmZMKh4MHpsKtDdik6GoYKAUY83gsYHBF10nUlPx0AZ6bQzH1
         hi2hVwQLUxSbxmhokXHMyjkbQL2w27uc8+3FclDyBavZrx/L9xGFdnlFvQvSzpqTSb5H
         AcAZguopEmbS6CQaaOVQrlakmHPXEAUOwhL3g133FyOWEbWB9i6oviCvWkI64vPQpORn
         nEOqcApQsvPBY/YaavLNBDusIBTyzYkVi1OpvjhSnQ3UF6p+vSFZHvb9Q7Pfey46vIgS
         uIoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8EtR2ZKzcu+pWlLNooyYlK3hse7ayFatGFfiV8QWQIJm0c14WFkyoHJNxigbR3xxznld2aHTSe9SK6y+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YykslMNC8RowmhDC95fGAWdM7T72OI3rKnsp6C52mc7PYYFuSKc
	otc/MR7sSdrnEtIihNPgS23kNuryEYDCnLIjWBNEsR/ryaBm1MhoWSd5GgEs8OPMMf3djBw8RxB
	PUqgMAM1UvOrUBGA/UfdSqQDHa2RfiUY=
X-Gm-Gg: Acq92OHyi/s+Dp4+4vN5+EYuCybkeeVe8OCUkmKFBOPj5Gx+0t7GSdrVEwE4ShuIcBw
	cL/dHWGjHVS42rEUdwRu8XoJBCw45o9Bbo2ZHX8pIoNI1hVbfBjbn+2/jByQzCZY+ykZBotYSLg
	6OWh3PfgEb4Eff7pKD3D1PsYUww6HwKkiCSecrRuAgI+mSX/N1ScMNqyf2AWGe6F/5n7QOk98km
	pRj9CB96lK+bLN3+Tdqc0pk67VNPsF5GJmnbwKbhmzRAHgkShCv8Plxrl+V16tIEnMNlO5l+j8i
	SrfIguEmqACrnLnQzyAIWymiR5UztVu6x1hH5JVPJoIYiy0m/gRsp859mI+1ffjL5Ka0kxiUlco
	oNWqY3L3w8ce+xoJm52PUqeU1ImUKLRUeug==
X-Received: by 2002:a05:7300:d508:b0:2e6:b55a:76ca with SMTP id
 5a478bee46e88-304fa30cb81mr2563311eec.0.1780333224237; Mon, 01 Jun 2026
 10:00:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com> <CANiq72kbzmLeFv58mkiKn+LvhCXmH5g7UsnTYTcVmJ6kyc+vLw@mail.gmail.com>
In-Reply-To: <CANiq72kbzmLeFv58mkiKn+LvhCXmH5g7UsnTYTcVmJ6kyc+vLw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Jun 2026 19:00:10 +0200
X-Gm-Features: AVHnY4LIwUudBe8SRqAYvkFU4tYqnuQ9elbt4jHzXY4lB4fo93aHUJvNuPfUj8E
Message-ID: <CANiq72nAOpowra81qOHHCw6EVyWVTymDoL8xPdpjT=xc3eS5bQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] gpu: drm: nova: enable calling into nova-core
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13445-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,nvidia.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 107FB622FE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 1, 2026 at 3:50=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> By the way, I think a `.gitignore` entry for the generated header is miss=
ing.

A few other notes:

  - The `exports` rule' `awk` filtering is stricter than the one we
normally use -- it is fine if you don't need `static`s etc., but I
will likely export `T|R|D|B` when I replace it, not just `T`.

  - Similarly, you don't use `EXPORT_SYMBOL_RUST_GPL` and the "dummy
symbol" is a function instead of the simple `int`. Is there a reason
for that? i.e. the ones you want to export are functions, but using
the global one (even defining `EXPORT_SYMBOL_RUST_GPL` the same way)
would reduce the divergence (so one less thing to think about later
when I replace it).

  - I noticed touching `nova-core` and then running a build twice will
only build `nova-drm.ko` the second time -- you may want to use
`--extern nova_core -L $(objtree)/...` like we do in `rust/Makefile`
instead of giving an explicit path to `--extern`.

I hope that helps!

Cheers,
Miguel

