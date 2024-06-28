Return-Path: <linux-kbuild+bounces-2286-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5209D91C654
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 21:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BBC328592E
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 19:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B15E59147;
	Fri, 28 Jun 2024 19:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="iKrdH93O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CC1D27E;
	Fri, 28 Jun 2024 19:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601543; cv=none; b=GRAmZtAuYd3ZybOSi916WPjfnuDGxmH25SpEYaB5JVRGzkZPN1zA9dklVptDaut/Zk8t4+n19Vora7gwjAQ7fFDjGyM2HQyixETjJ4YPdLiA1n3FaUKtRPtdFIkuz1c22ggF7eiMZRPvL9RU5mRbAAp7npPzmlKLfQBv+7oPZmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601543; c=relaxed/simple;
	bh=dh4pMsSHJ0VE/SuGxQIQ1tXjHqDJcjcOdDwNBCGSjAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NtUvJpFd8SyXb8Vcwr4axYADQLb9TAdGYd8OXWAzivbZKK9EPzWmc7kbtXxW+x3UjAUHmUJ33zib6IOLMzfs1BJ25YVXl3bqqD2G+XCKS3UcZXrwK9NZUpuWxDFQSB9Xcwf9xaIvO3rQTjbgAL/eXXu1NHOgVyLDLVStxvRlrQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=iKrdH93O; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Finn Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1719601528; bh=dh4pMsSHJ0VE/SuGxQIQ1tXjHqDJcjcOdDwNBCGSjAk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iKrdH93OT4IbK6VXcXrM3AIeDOGS0myc62WrqdZqPMgcGolEZiXPemyAmZRuRA8mC
	 bWgdOOV9IwnO9CC9BLGGoRfDCT+bj3c0epn7gWvD8pAGj6WaZTokmEiwKC6FfG8rW/
	 ZWWeJri5nf6o2V6yd242Q0UjoiqwCKuIhImjG3js=
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] Makefile: improve comment documentation for the
 rust-analyzer target
Date: Fri, 28 Jun 2024 21:05:26 +0200
Message-ID: <23596EED-9730-4D0E-BD54-FB4CBE78ED95@kloenk.dev>
In-Reply-To: <20240628004356.1384486-3-jhubbard@nvidia.com>
References: <20240628004356.1384486-1-jhubbard@nvidia.com>
 <20240628004356.1384486-3-jhubbard@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain



On 28 Jun 2024, at 2:43, John Hubbard wrote:

> Replace the cryptic phrase ("IDE support targets") that initially
> appears to be about how to support old hard drives, with a few sentences
> that explain what "make rust-analyzer" provides.
>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Finn Behrens <me@kloenk.dev>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Finn Behrens <me@kloenk.dev>

