Return-Path: <linux-kbuild+bounces-9352-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E361BC281D9
	for <lists+linux-kbuild@lfdr.de>; Sat, 01 Nov 2025 16:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 941133A6C41
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Nov 2025 15:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C2320298D;
	Sat,  1 Nov 2025 15:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4BV0M0n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495F717B418;
	Sat,  1 Nov 2025 15:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762012335; cv=none; b=UxZ8MBxJxf9+Kc76S9KJ7O5PVSLRi+9YeOfNyt5dXdXBXp8+T2044TTgVTmziP3JqtrqnKyXQLQwhjXwjrKOm+Hyg8udbawJNAalEYERBrGHW5tg59COphlKcCYJjRj0WqWGVq/HWJOk8UKaHy0mbsZksTPKO4BMc4LLsM4ba6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762012335; c=relaxed/simple;
	bh=mXqd0l7ECSTvxHPGvSpLFI1tOa5Alav9itpNsJAdNHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z2WgM80M5ublOQqtlYsaz/DCyqgD4uIJXqvD16wzWJK7p/yYusojehE18F9WMIb+KoModE+8FmPOmYYoZCuj0dagJQzR4v798Q5kVlpfxCk92AgEZ9RrM4t23RxC1Qs4wfB0M37Ixn6eHwC2vgaPRrKY7voPysCADSSt1CLvWTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4BV0M0n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11298C4CEF1;
	Sat,  1 Nov 2025 15:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762012334;
	bh=mXqd0l7ECSTvxHPGvSpLFI1tOa5Alav9itpNsJAdNHc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h4BV0M0n10LDbuwAwZsWXONtt3jXlW7BvPyFY18806Q71OGK6KJdHJhMYp8TeM4JI
	 kRDTXBnsZ7Aeu2iCaFEQvA3HZMSpD1ytCXi37KzRFjHxX03uAvdaPr5E+8Uq5GnIBF
	 H9dMAhkKfIaUrdRdpU1l71e1g4HBJyfr+oi7ofIaJoi3EhXC3UXSwmb0l0WVAWoEZg
	 IMLL/6samBqAOf3QB54sehaxeHlrCIbWbxC24Bq0H/y5FW8Jq3JGMd07IlTY1c7w40
	 PextemOi/n+htkbZo8QX4dcZJo//pz5uPDGJwSaXciIjJw9GMkydbwfMViE4I1tcws
	 LAD+m7cA6oXRA==
Message-ID: <65a7bf26-6661-42dd-aa9f-dd1076a866a8@kernel.org>
Date: Sat, 1 Nov 2025 16:52:09 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] rust: enable slice_flatten feature and abstract it
 through an extension trait
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20251101-b4-as-flattened-v1-1-860f2ebeedfd@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251101-b4-as-flattened-v1-1-860f2ebeedfd@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/1/25 2:31 PM, Alexandre Courbot wrote:
> Since the Nova GSP boot series makes use of this, I hope to eventually
> merge it alongside the series, through the DRM tree.

If Miguel agrees, it's fine for me to take it through the drm-rust tree.

Acked-by: Danilo Krummrich <dakr@kernel.org>

