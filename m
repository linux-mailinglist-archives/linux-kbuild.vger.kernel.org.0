Return-Path: <linux-kbuild+bounces-6161-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 471DFA62BDA
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 12:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51B76189C913
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 11:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7DFD1E8346;
	Sat, 15 Mar 2025 11:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="NpT3ZBCb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9119917BED0;
	Sat, 15 Mar 2025 11:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742038309; cv=none; b=rFki+aI6DcQbw3ky9s2Mwuywc3MyMDfenqZzPvhWLp2EAlN671roqJhaDLEW3NWtOWL4Wu0Mmk8BQyDQ1zGRQGD0VPQpl+OTZoyecbVYExImv0ttix+8ogKb6Yf+yU1kbVzC4U7HZqdkX4Og80Lka7wYtjrDmR+a4L8UqV3rqzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742038309; c=relaxed/simple;
	bh=K9d1kJdz5yq0Uq48u99qCb0bbHMNcF6bAMCyt1AqpQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AoEeY80CgBuwwrjF67DPAQV9W/Ltcj6hOAjyYgw7IRUuFUL/75qY7X4325P+JhSU5ePoJ9X1Dg44/ZiXKRLTPIoYlr1ti9/keL6NUCUuNS87v5kRwyYbBvRo5d07WO8aHf/wDH0fwBzuFne7GPB1c+PC1qGmwErVAfkg40CCXPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=NpT3ZBCb; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8E09540E0216;
	Sat, 15 Mar 2025 11:31:36 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NXNqFkrviatE; Sat, 15 Mar 2025 11:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1742038291; bh=PsScqUSoVeEoPv6a4o4GiQ6cvtqVSTt7NDZ7hyVEc9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpT3ZBCbloM/6/t5/a2Lk8TI/CAULwCoOTdUVrJzkp6sepF8am53gjQmudlzDnXCL
	 CYMoGe0xwGmYSMHnh32oMyegdzR0PdzxxlCuU8PZ7/nLgPcmqouEFvVQsgzrKtsMew
	 JU1FuMgR35eUbLfPgMeHRLZqtx4Jpw1219HpssgUFmAQLRk87/yHzwwaXstJ6+zrVw
	 wyv2X/1BJiGgVHH4OvYUuiAd+HcrtyyTsSwiSKRjEsTBWygf3FNGCCGQmTnNv8nz7q
	 LtReE02rw//Qc9lJvAIhVGXkmTLT4xEBepzGwjXlQdeD7I32K2C3mZE9fsD5p5+wJU
	 uUeDlyxBibRlgsPEsjBReOml6r+8UMoytO8B80bLkB7NM4LfuK3mCPyLTCT2Es9uKh
	 Ynkf50eTveRQNT7gjwqKGRbq+hmEcHhgeOkAePclEeY33e3M38EjTIhxOngatMYaOW
	 8yz2+mYOm3J1Tq49AwOD35/G6zlM52Az99C7xKdgYlpUUCqSACJP4Nq2BJk6synqWD
	 s4xCf+BeYjMPnSGB6Q6tLtf1R2oS7jltRNJUW6LZslLchbjsVxA0v47wfT/E5TzlAB
	 zgQC6yS7lsbBT6At3suxnROyUVNnc9EjB39zEFICtBXqzLB7YjYoAfaNKHKbPDmdFZ
	 3dc3FXL63HSQ19OOMWFqPMhk=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 06CFF40E00C9;
	Sat, 15 Mar 2025 11:31:16 +0000 (UTC)
Date: Sat, 15 Mar 2025 12:31:09 +0100
From: Borislav Petkov <bp@alien8.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/4] x86/boot: Switch to -ffile-prefix-map
Message-ID: <20250315113109.GAZ9Vk_eqcYNzgPcy4@fat_crate.local>
References: <20250313-kbuild-prefix-map-v1-0-38cea8448c5f@weissschuh.net>
 <20250313-kbuild-prefix-map-v1-3-38cea8448c5f@weissschuh.net>
 <CAK7LNAQ695Ur3tvq+W67zgkRuw_wnRJpoAsmpEUgVLyFx8USNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAQ695Ur3tvq+W67zgkRuw_wnRJpoAsmpEUgVLyFx8USNg@mail.gmail.com>

On Sat, Mar 15, 2025 at 05:15:33PM +0900, Masahiro Yamada wrote:
> Hi X86 maintainers,
> 
> Is it OK to pick up this to kbuild tree?
> Ack is appreciated.

For both:

Acked-by: Borislav Petkov (AMD) <bp@alien8.de>

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

