Return-Path: <linux-kbuild+bounces-12972-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE4vJBud9GloCwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12972-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 14:31:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6F54AC68A
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 14:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F8813019454
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 May 2026 12:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF662D8381;
	Fri,  1 May 2026 12:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s3KKF08j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8C329E114;
	Fri,  1 May 2026 12:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777638678; cv=none; b=PcuYyvGhTxQr9wGSTrkDLn2e5oXldy2wwZFJHijHWOdmQZzd6Me323q1F0thWuhytsJJBglQOWO57XhKKoRfDuH/8pmdoyKrd7y3/jgceyTNyevPAsy60lLm4JJXdtYSKnX3b67trxbgT3N/6STlgOvXCUPv8hE8phSPl7SC2yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777638678; c=relaxed/simple;
	bh=mOhShvj4gvpdrJdzhTY0clT/AUI1RfZaKhiI+R0e/hc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=DGPAZ6C3zn5T7bDXe+ITku5Ys7pq1m/uSqyLlWSS13Ppl2dIqGIBAAhQsNcnBysV2wFgTV6x0aGp0I9eraBjh42lYNaW0zU3W6IUSFOHVwPPXHlBel1iTnkgaYED6h+hPzkfdT17ScCNIljFvDiPHGh0/LZqn36kZycE/Ds3btI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s3KKF08j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BAAC2BCB4;
	Fri,  1 May 2026 12:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777638677;
	bh=mOhShvj4gvpdrJdzhTY0clT/AUI1RfZaKhiI+R0e/hc=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=s3KKF08js6xdafptYe8LP6Aj/iGrtGXTPPSYErmwCYGNrT15Ycf5YGgw0Wqrt1Knu
	 g1kx6CX99U6peS7MVnIoF82HsjmFd4jLYtoFS3GylX1xUl/mZWVbEHw5Utwv7fDGs5
	 JMU3a7lCDQ+81BP+XyBGNahKNeRu19yDup1KIRO1YDW+5ZFk93q2V7H0TwGVRoFAHH
	 2z3J06XMXrgrNnQVPGVmpbXFok3+YroGEOXTiteu22afbPcSvjXCx4JbB8jvhISxeK
	 scGrY5yj1ugzllRtKjNQ9e8ibwMGkgDwLkZmAL1SpMvy8q+0pelo3/CAWEtSklmFld
	 l+GOjHgm0Ij3w==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 May 2026 14:31:11 +0200
Message-Id: <DI7CBG1A3DBE.GKX9UUYUBPV5@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 3/7] gpu: nova-core: rename module from nova_core to
 nova-core
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
 <20260430-nova-exports-v1-3-7ca31664e983@nvidia.com>
 <e0301888-940a-49a4-8a3a-47960162819f@nvidia.com>
 <DI70PV5V3W38.ZVD5ZE6027SD@nvidia.com>
In-Reply-To: <DI70PV5V3W38.ZVD5ZE6027SD@nvidia.com>
X-Rspamd-Queue-Id: 0E6F54AC68A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-12972-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Fri May 1, 2026 at 5:25 AM CEST, Alexandre Courbot wrote:
> Danilo, WDYT?

I think the patch is fine as is.

However, the commit message should say that it also changes nova_core.ko to
nova-core.ko, which is the reason I proposed this in [1] as well.

I.e. such that the module name (that we still need to change; I can send a =
patch
since I haven't heard back from Chou) matches the .ko file name.

I'm not a fan of generic names like lib.rs, mod.rs, main.rs, etc., as it me=
sses
with fuzzy finder tools.

If people feel strongly about this, we can probably rename it to
nova_core_main.rs, but I think it is not necessary.

- Danilo

[1] https://lore.kernel.org/all/DH56PG8GLW4X.2QMHJ91J9D29N@kernel.org/

