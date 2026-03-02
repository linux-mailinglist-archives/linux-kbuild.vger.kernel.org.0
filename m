Return-Path: <linux-kbuild+bounces-11518-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIECJMTcpWkvHgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11518-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 19:53:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BDC1DE7E6
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 19:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 702CF30BFABD
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2026 18:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC382319847;
	Mon,  2 Mar 2026 18:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V89H1abG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98771288D0;
	Mon,  2 Mar 2026 18:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772477380; cv=none; b=SfOQz8zi8yyjWzf/ukdtRfbYmsqWjFNU/pXbwn0J1U6HgxulGRIznx76NaN8xwfXPp+7NxBoOz6XGOfLJf2eRwnfodqL7rhTKRLUJ7fSzA48fSo8rc4C2VefDOK95Kfbm5bNu2qTbK0kRrV6SP+aAQmojkQNrQ/RSGzMIxIbl14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772477380; c=relaxed/simple;
	bh=BcsL79IJhwd7FAwX1EI2Imf/fcTXZ3d4XedyvqerWig=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ePyMhTZo0NpAWAb9+UePAeO43vS+1Y2caoDEtOPN8s9Uvd3/IH4dK7PMaNvNR3jXC0jnwtVEKsXs4jIbvrFDUd1Cv/g0kWcbDf9la/DA3C4SdLugQ6A8IYO0uHqRAH4HSX7tdNAK75OFJhmfmDUOLgRJIWXFx7YBY06tppoiLlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V89H1abG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1E8C19423;
	Mon,  2 Mar 2026 18:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772477380;
	bh=BcsL79IJhwd7FAwX1EI2Imf/fcTXZ3d4XedyvqerWig=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=V89H1abGuvTjVC76gSx6lPPJHo/OvCUZr2Rr6yWxV8QRydq9Pzubxq4Mlp+8By2rj
	 R9GgAcWu3GIgZVcF0oNxJ3YDsRvxkbuHyADRy9EqVawVMJ0UGh3PAdEdwLAgSc3O6j
	 u5hcr2L3PNnrdGNeBiMOiYNWvu5F1HpdhVHla6owLeWNKsr+bYYiSmVMh8mUNn0MLq
	 +z+GSoqbZACowaRGtSomq5T3pySVWioTAJrnZeJpGmxR0SpWT28YYsVwjt7p6551S1
	 Tbj3ShtcA/95ztgTAatbPJMm1IwQq7AKkRzkP5DQ/KtnXPSqvqDhnLyR8RNJBf62wW
	 9BpuzVCQ5v3TQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 19:49:35 +0100
Message-Id: <DGSISHB3UDZZ.3U1OWYM0OQUJP@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Aditya Rajan"
 <adi.dev.github@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] rust: add projection infrastructure
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260302130223.134058-1-gary@kernel.org>
 <20260302130223.134058-2-gary@kernel.org>
 <DGSDGDIVUHO0.P594H9B4LLO5@kernel.org>
 <DGSDNOH55CX8.CMGYO2OMDBJZ@kernel.org>
In-Reply-To: <DGSDNOH55CX8.CMGYO2OMDBJZ@kernel.org>
X-Rspamd-Queue-Id: F2BDC1DE7E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11518-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,protonmail.com,google.com,umich.edu,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lossin@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,rust-lang.org:url]
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 3:48 PM CET, Danilo Krummrich wrote:
> On Mon Mar 2, 2026 at 3:38 PM CET, Benno Lossin wrote:
>> [1]: https://doc.rust-lang.org/std/mem/fn.size_of_val_raw.html
>
> I recently would have had a use-case for this as well, but besides the re=
asons
> you can't use it in this patch, I think it's also still unstable?

Oh yeah that's right.

Cheers,
Benno

