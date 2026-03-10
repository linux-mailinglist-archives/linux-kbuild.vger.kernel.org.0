Return-Path: <linux-kbuild+bounces-11788-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBKxJ8hYsGmMiQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11788-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 18:45:44 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF2C255D30
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 18:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3004A309E297
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 17:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E703D47BA;
	Tue, 10 Mar 2026 17:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IU6ukDu/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5464B33A717;
	Tue, 10 Mar 2026 17:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773164435; cv=none; b=GajNEKGxyFAuJeZU12K1ICucZqEABgGlQDet3lyGYvJhHIG12TUpEoaZpYmmU4/E86vwVK5Q3/kZNWkAIbw6ry64AbtcQ2XSPFzLmyO3xwxjUZ0U34uL+bKhsnwQZBfian8kFUH0R1oBPKGf+bJYg6xG8mYh/yuqVlj4zO1F6fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773164435; c=relaxed/simple;
	bh=dZcsL0fWmyyyT+dQAR3Tw27jgu+4nBjdpMoWNfXiRGE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=o8tpO5Ds1SZTCGl0LSk7wUR/wJH0Pw4U6ETFUXzWW8bIRtEdCGGs+0LbNFvCCwQL61Q8Td5U4kcbZx/Sm+RmaCRMpW9sqsPHwbZim3YNAvhhjy63ZOxM/ITkeqWqGx3vDZID7fuTf7RPpYRMmJnm8AcNofF4eyAH1SzUvoU8jTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IU6ukDu/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93826C19423;
	Tue, 10 Mar 2026 17:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773164435;
	bh=dZcsL0fWmyyyT+dQAR3Tw27jgu+4nBjdpMoWNfXiRGE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=IU6ukDu/7o3EsXY4ZbhK5KDzIDLwThH1lDsx5GEybwp0pY4JtE+FqnjeTXLapyu70
	 f6b/+h80mFDLbb9oEuxyxCqCGPzxmPQS4uBmAF9nbFcT4+APDum+cBkozCm6OW72eL
	 vWiaomYoj/Mn4OtvuNbv4Z0FS19z652Dqq4SpYm2MCYsvdOiUdIeA544+6sbHYMXRG
	 akqOK+rUEWkHw4KjvBvGGOuMs1j9tjWoUeXEsM3bTqwaicly4Ul2eldP71Plh1vDCS
	 18xiQLe0ebXJYGo6uRbM2az2OZuHgvOjFsF5rNVVVsEQlLIu3cXa9K1xn9sQiS7jYo
	 Ffx0ONT0DD1gg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 18:40:28 +0100
Message-Id: <DGZABX6ABLN8.SBT6J72KH8YH@kernel.org>
Subject: Re: [PATCH v4 4/4] gpu: nova-core: fix stack overflow in GSP memory
 allocation
Cc: <tim.kovalenko@proton.me>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <driver-core@lists.linux.dev>
To: "Tim Kovalenko via B4 Relay"
 <devnull+tim.kovalenko.proton.me@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
 <20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me>
In-Reply-To: <20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me>
X-Rspamd-Queue-Id: 0BF2C255D30
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11788-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[proton.me,nvidia.com,google.com,gmail.com,ffwll.ch,kernel.org,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,tim.kovalenko.proton.me];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:email,nvidia.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,msgid.link:url,zulipchat.com:url,garyguo.net:email]
X-Rspamd-Action: no action

On Mon Mar 9, 2026 at 5:34 PM CET, Tim Kovalenko via B4 Relay wrote:
> From: Tim Kovalenko <tim.kovalenko@proton.me>
>
> The `Cmdq::new` function was allocating a `PteArray` struct on the stack
> and was causing a stack overflow with 8216 bytes.
>
> Modify the `PteArray` to calculate and write the Page Table Entries
> directly into the coherent DMA buffer one-by-one. This reduces the stack
> usage quite a lot.
>
> Signed-off-by: Tim Kovalenko <tim.kovalenko@proton.me>

Applied to drm-rust-fixes, thanks!

--- commit ---

commit c7940c8bf215b9dc6211781c77ce80e76982a723
Author: Tim Kovalenko <tim.kovalenko@proton.me>
Date:   Mon Mar 9 12:34:21 2026 -0400

    gpu: nova-core: fix stack overflow in GSP memory allocation

    The `Cmdq::new` function was allocating a `PteArray` struct on the stac=
k
    and was causing a stack overflow with 8216 bytes.

    Modify the `PteArray` to calculate and write the Page Table Entries
    directly into the coherent DMA buffer one-by-one. This reduces the stac=
k
    usage quite a lot.

    Reported-by: Gary Guo <gary@garyguo.net>
    Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/509436-Nov=
a/topic/.60Cmdq.3A.3Anew.60.20uses.20excessive.20stack.20size/near/57037554=
9
    Link: https://lore.kernel.org/rust-for-linux/CANiq72mAQxbRJZDnik3Qmd4ph=
vFwPA01O2jwaaXRh_T+2=3DL-qA@mail.gmail.com/
    Fixes: f38b4f105cfc ("gpu: nova-core: Create initial Gsp")
    Acked-by: Alexandre Courbot <acourbot@nvidia.com>
    Signed-off-by: Tim Kovalenko <tim.kovalenko@proton.me>
    Link: https://patch.msgid.link/20260309-drm-rust-next-v4-4-4ef485b19a4c=
@proton.me
    [ * Use PteArray::entry() in LogBuffer::new(),
      * Add TODO comment to use IoView projections once available,
      * Add PTE_ARRAY_SIZE constant to avoid duplication.

        - Danilo ]
    Signed-off-by: Danilo Krummrich <dakr@kernel.org>

