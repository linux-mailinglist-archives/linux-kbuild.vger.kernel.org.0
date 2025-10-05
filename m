Return-Path: <linux-kbuild+bounces-9000-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E6BBB9370
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Oct 2025 03:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8047B3C0292
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Oct 2025 01:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E25054262;
	Sun,  5 Oct 2025 01:32:10 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31D6B661;
	Sun,  5 Oct 2025 01:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759627930; cv=none; b=EwOxz+Whsr9f3npLzu8BqCgE/KbXX2Yo1hvgA9bhS5Tu/78UBv26w+JE6TMOqqcDN8Kzqh28Pbjte1LSeN7Xg+WhAaY1xwbOylKML/YUgRbCjzbB7I0rCKf3sBZ98pvJOiLSyrXMH7S9R3Fpo21KGfmZlzrEdkgjcY/RiWLHfqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759627930; c=relaxed/simple;
	bh=MnhaQ06Bc8VW9F3RHBsp0zlkihGDlRVukcqGFu25J8o=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=qQd194DfPCK/N0Ladbj0RhE7vkMFzbmIndnbuE2iFDXA6vaksb03RGJ0h50OcW44OZBo9AeTUecV6G0o0n8F36l9eW0B0UvjgPwHOyk+ZqyUFKtbaFBuJelW3jJ+5jhuBrUSuQCDEAzDwN3x5eXBuxzOqx8mFDfDRSDpRH307vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (2.8.3.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::382])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 97B4C341064;
	Sun, 05 Oct 2025 01:32:01 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: safinaskar@gmail.com
Cc: a.hindborg@kernel.org,alex.gaynor@gmail.com,aliceryhl@google.com,bjorn3_gh@protonmail.com,boqun.feng@gmail.com,dakr@kernel.org,gary@garyguo.net,linux-kbuild@vger.kernel.org,linux-kernel@vger.kernel.org,lossin@kernel.org,nathan@kernel.org,nicolas.schier@linux.dev,ojeda@kernel.org,rust-for-linux@vger.kernel.org,thomas.weissschuh@linutronix.de,tmgross@umich.edu
Subject: Re: [PATCH v2 6/6] kbuild: enable -Werror for hostprogs
In-Reply-To: <20251005011100.1035272-1-safinaskar@gmail.com>
Organization: Gentoo
User-Agent: mu4e 1.12.13; emacs 31.0.50
Date: Sun, 05 Oct 2025 02:31:59 +0100
Message-ID: <87tt0eb0c0.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

I tried to make this argument recently for libbpf but was unsuccessful:
https://lore.kernel.org/bpf/7e6c41e47c6a8ab73945e6aac319e0dd53337e1b.1751712192.git.sam@gentoo.org/

I agree, though.

