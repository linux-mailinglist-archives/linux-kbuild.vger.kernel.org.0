Return-Path: <linux-kbuild+bounces-4334-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ADE9B18C6
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Oct 2024 16:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDDBB282826
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Oct 2024 14:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB08A947;
	Sat, 26 Oct 2024 14:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="l+Ya5fTj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-40140.protonmail.ch (mail-40140.protonmail.ch [185.70.40.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE9620326;
	Sat, 26 Oct 2024 14:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729954255; cv=none; b=VMgDk55oDJkCGlgKCNUFmCZpvWs0Qs4lFyvy7h5JxC/KZ7GsKiujDejCDP5dOdfOYXF1/P0P0Ji5PMA+tzVZjK3pakxwkkwsu0BPyWn5zr2/OJEebHlRY8UvhF5rAVPBbdcm9xot7WUb4MFQjVCH3kvfq6+/Wv5X3vSJU5e3uFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729954255; c=relaxed/simple;
	bh=/s2RP+BM1xGQVat361nWRiCVu5P0PD3Yqcl3IL7AO3A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NagmFTxfvEFBVTbb90BT4AMTroZ0TywpUq9x7okyxfZMoyqdRC0xyh4WbOBiRjVT0bVO0n3fVN22bjFa6SJ6IOF3s0yZCb1m3ueerh8ShP0GVu6l+gTttTNRuJel1GhmPTFmhucmFb3sjJmJfwE19SXn7+aye1MGhKjjRCwioeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=l+Ya5fTj; arc=none smtp.client-ip=185.70.40.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1729954245; x=1730213445;
	bh=/s2RP+BM1xGQVat361nWRiCVu5P0PD3Yqcl3IL7AO3A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=l+Ya5fTjVWNHVVKxsF4AfbgQuZ+0hsUlhyaz8UzBQgOw/7iaFq/E3vCplxhScqcIm
	 pfCBOX8vyVEk/42ChAjFTPkGhj7ElSAZhQ4vm3O83Knv6lBTfKkfVK4G4AJfH0Nwzp
	 5YL2E2gsPOwWjMxFm0CXXh2muNB+hzl7clq9G5+1rWbhgLzycROcBqJMi52siGYGBe
	 MPn7ltBu099OoBSs7eaTlqriob4q5N5RaO0jY3l34aThTCxKVXARFqvNcO/EiFvy3p
	 t1O7kW/lIfLGwwvFeOZkKs7nPHN6tGzf+7IVDMyujlrzK/HkLf3VKc7Ua4a4MP1cvw
	 oVrj/CCBaxoBg==
Date: Sat, 26 Oct 2024 14:50:41 +0000
To: Andreas Larsson <andreas@gaisler.com>
From: Koakuma <koachan@protonmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de, Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 1/2] sparc/build: Remove all usage of -fcall-used* flags
Message-ID: <9ospa4bgpJsgr1ACc_GNsvDxFH-ErKkGTq8iUFDVUrvL2nRxDhZAzXReo33X8VEystz97nbjEq0GJIKISPURMHRYAxJaFXLzVXxqPnjGYes=@protonmail.com>
In-Reply-To: <93d038de-3ba8-4d1e-9660-4c5e26ac055c@gaisler.com>
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com> <20240717-sparc-cflags-v2-1-259407e6eb5f@protonmail.com> <93d038de-3ba8-4d1e-9660-4c5e26ac055c@gaisler.com>
Feedback-ID: 6608610:user:proton
X-Pm-Message-ID: 010d36611b283debe17a6a9b2b52d3a37400f8c3
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Andreas Larsson <andreas@gaisler.com> wrote:
> Couldn't you use ifndef CONFIG_CC_IS_CLANG or perhaps better, use
> $(call cc-option,-fcall-used-g5) and $(call cc-option,-fcall-used-g7) to
> not remove the possibility for gcc to make use of these registers?

Sure sure! It works okay that way too.
But before I send a v3, let me wait for clarification for the docs issue
for the other patch.

