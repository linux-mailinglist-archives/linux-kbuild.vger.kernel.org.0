Return-Path: <linux-kbuild+bounces-3055-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E361095539D
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 01:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22E7A1C21BF5
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 23:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296CB13DB90;
	Fri, 16 Aug 2024 23:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="Sk4XSiql"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B85147C79;
	Fri, 16 Aug 2024 23:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723849468; cv=none; b=fhRIyTa73K/t8XrLU3sBDspSAXhjmlP+opYu7JU4cFkyku6zefJuy8C88PfZ+NVOa88/xVFlGbznGf4QYG0WiO52IanBJXIBN3BDLCmN/pBPXrhf6AyP60NmSmBfdb8+yZJ3KmzUI0QZa3gRXLTuYI3qqqCbFNYLDvG80XTN0kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723849468; c=relaxed/simple;
	bh=Y5/Gimvm3m3uUoIctaiu3fbIOMfcFy+xzSL5XT5v8vs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OvOZ0IxVS6otI47i1gnJr7/Lr6Hz/UTmK71JqsKJLkITof/pi6ZaSmZRSFs4sH0eqSWe6ibqJEKLMykFz6JRCgBMeTUzqOj/hTPVxbu9WqXpaC4WQlRB4NtKLk6be7KjtqQMqM8hShppk9sHHhcqm717CfNjHdVRGuxaW2Qfvh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=Sk4XSiql; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723849464;
	bh=Y5/Gimvm3m3uUoIctaiu3fbIOMfcFy+xzSL5XT5v8vs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Sk4XSiqlShJxmfMJBLcBNjDi6FeX1il4lfn9nR2l5xLY5N2x4mCzpPVifnP7QDbWF
	 l7Y06pOstzc2Na07dLZiXQBkeXnbsXaLbguhlsenLKyagVT8aWwIrgjnsjysOdVgIy
	 yQCrkq/KOoqePJhaPmmARbESGlBd61UankYAWDZt/G+t88Dv7c+MZzAwexTh6+RA02
	 D1Julpi3xVHnNQ7nV1141llox5u5xRrBg3/ZTi58a0KgRinJIBE7Rk39yUkWzanPjm
	 OoErY8FWNqKbinfVkfLm/qdyr2CNtbdr+IcgMiyZB5BHFiCRRIV2EKD8MJuwXCuGYf
	 0yYPFFZVltLDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WlyHB5BVhz4wcs;
	Sat, 17 Aug 2024 09:04:22 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Matthew Maurer <mmaurer@google.com>, masahiroy@kernel.org,
 ndesaulniers@google.com, ojeda@kernel.org, gary@garyguo.net,
 mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida
 Filho <wedsonaf@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Matthew Maurer <mmaurer@google.com>, Naveen
 N Rao <naveen@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st,
 j@jannau.net, asahi@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH v3 14/16] modules: Support extended MODVERSIONS info
In-Reply-To: <20240806212106.617164-15-mmaurer@google.com>
References: <20240806212106.617164-1-mmaurer@google.com>
 <20240806212106.617164-15-mmaurer@google.com>
Date: Sat, 17 Aug 2024 09:04:22 +1000
Message-ID: <87le0w2hop.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Matthew Maurer <mmaurer@google.com> writes:
> Adds a new format for MODVERSIONS which stores each field in a separate
> ELF section. This initially adds support for variable length names, but
> could later be used to add additional fields to MODVERSIONS in a
> backwards compatible way if needed. Any new fields will be ignored by
> old user tooling, unlike the current format where user tooling cannot
> tolerate adjustments to the format (for example making the name field
> longer).
>
> Since PPC munges its version records to strip leading dots, we reproduce
> the munging for the new format.

AFAICS the existing code only strips a single leading dot, not all
leading dots?

cheers

