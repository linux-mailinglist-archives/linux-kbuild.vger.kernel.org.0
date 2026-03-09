Return-Path: <linux-kbuild+bounces-11718-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDUgGFf9rmkxLQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11718-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 18:03:19 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2355B23D4B9
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 18:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 865583049700
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 17:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D23E289E17;
	Mon,  9 Mar 2026 17:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2RNgURe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FE627FB1F;
	Mon,  9 Mar 2026 17:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075613; cv=none; b=IadEq0V3QJnlBLRj8MCRlhUAhxcvcjxR/OTMVRhtHqeLhD1dwcQmX5frOlu45hpPvN6oM+C5Aj4+VfUMorm1u8EdXa8RMIVguAnaB7ZB7w8dU4qtuMZqs8EyR/6uOUzd1zi35iC133WIrbAPLmGwNVvlTp6LHfEO+S/KKRiFtLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075613; c=relaxed/simple;
	bh=CtqSZRrtQ086u71AP2P/+EeQ4W/0e0n5IIi6cp4D3LY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=KPuGkwGLLJDy5uQs/ybH1xflZqyJuXD20TfE1xOquJo3x3PcLqhVZmpZtG5Qdq57Acb/oQC8TP/pGZYsRKnEgJIdviTtlySc9nRk32gZOzbD1oN30h1TPYTDmIcZ6tEAbCHDVnpD0O3b5A0rjhCLaWXjQludIoikXa0CrrOekBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2RNgURe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874CFC4CEF7;
	Mon,  9 Mar 2026 17:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773075613;
	bh=CtqSZRrtQ086u71AP2P/+EeQ4W/0e0n5IIi6cp4D3LY=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=l2RNgUReeisohSOqQEi1BMesOrHU+atDi+li0Bc300RhI+QPC2Hopn5Wj/HRuh4Pg
	 ItbtBP6b1VQfrr7w9JldiQ1teAdj9+afnY21kw23oSVfQs8DyshNBv9HH+w+8VsNu3
	 WwQUYY2APS0OPRF5rEwOPS3PwvkpijnT5ZbEdnMRuQ6a7JqKeDTZHX0Ww4VDljs/7K
	 hg3JqnKbcCQf/Cz5Qzo9PxxVtc2WuScrKdSjCWh7kQRwg87/N8D1P+gSVyNddQ6Nbm
	 /UpnDyfZpdPRagImRsaaoWg4tYIdkMNMrAhbB8hqoQZ7asbYB7li9ARgGRmC3Lh1qn
	 pFyBh1bwqOJRA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 18:00:06 +0100
Message-Id: <DGYEUGRWCLZK.2325N9QPODXTP@kernel.org>
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
Subject: Re: [PATCH v4 0/4] Fixes the stack overflow
References: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
In-Reply-To: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
X-Rspamd-Queue-Id: 2355B23D4B9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11718-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.982];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,tim.kovalenko.proton.me];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon Mar 9, 2026 at 5:34 PM CET, Tim Kovalenko via B4 Relay wrote:
>
> ---
> Changes in v4:
> - Rebase on top of projection changes

Thanks for the quick follow-up!

There was no need to include the series you rebased onto, i.e. it is usuall=
y
enough to just mention that your patch is based on another series and provi=
de a
link.

But don't worry, I just mention this for the next time, there is nothing th=
at
needs to be done on your end.

(One additional thing to note, in case you will actually have to (re-)send
patches of other people in the future, is that such patches still need to h=
ave
your Signed-off-by: in addition, since by sending them you are involved in =
the
handling of those patches.)

Thanks,
Danilo

