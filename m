Return-Path: <linux-kbuild+bounces-6545-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C214A82AD5
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 17:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A6D51892DE4
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 15:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05688266B75;
	Wed,  9 Apr 2025 15:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="hjyDH8D7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA3C262811;
	Wed,  9 Apr 2025 15:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213121; cv=none; b=ZePAaieVxFW3K/zAuYeCrJJl0MG/XEkCDLAeXoE5dTBUAcY6Wnx7GloU6INLmqh89mHIuYon9n2VJigGHn0zNRUIQai/gRD2mhVX6zc601Bo/N/DXcZneRm4VInNB6kvJiSiHhFXbHFj32SbH1M9DS8zYjaO+SC8Elbvf+YQfN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213121; c=relaxed/simple;
	bh=IOMjHfxBYGcUZJveBDmau45ZQjzYvAvvpPX2rlPLdD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjJeSdyMgpANfJTKQlLG2kjEaILUPQu2jmFJXwy9tMEMWHNIiO9GTah8ql9WVWdvuBgMeAzDM7vRs2KXIt88yGEedyv7rZO8MokPXev9fJ1oojNNhGfIc2wVIGQ5kjFE1gXs+HFXgqWAd4+UlZ2VgObnCEPjQHXLRfDUFoxtT/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=hjyDH8D7; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 52CDF40E021D;
	Wed,  9 Apr 2025 15:38:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id HS0GJrRt_Tau; Wed,  9 Apr 2025 15:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744213113; bh=/pEuj1pEo+DngRY1u3NIkINdnDeK8Jv6l/fvUOZ1n+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjyDH8D7J2l1q5vFmmbL8ZNU9saEYECOANpVnBJm9w0hNVxSA8uIQguZbQEZ9cVYq
	 LS38zYH2qTTADrpzY1gmbroSVrd+ayzR3RiHX30dXk9Qu7OLVkSoip8RpBN1i3rxl3
	 2o6Zd/J8CPN0sAsN61Jx7zxnPvqEwsXShmw4y18OiiPHSwSBcM1e7UiOWvKJXdnXz5
	 /V3Nn6LwDx2jGb+j9Zr9NSTRRcxJsha14qAftN4Uf8jiya7NRz6wI8DJhUteOIBCkX
	 aHEhZYo6DoS1yrBP4V73FqE2pTvuWPQbsLq+cOfNSVceNtdi3yIB+bihTcBlIuTI3e
	 Oslvw+n/Kq1XaeLbxTs/dtlP+028Qz88cygbsJqITGSuN+ECxGOYanId5GAxTZgjrG
	 FrBYkkJZfOMtPTgMaGMvcFWBhkawWA24XP4p4VKZabDkhrMm93ibld5aAWH141hh+u
	 01NjD87sc+r887RiX0oyLP+6rA8lUyFuD5s1bONeF6CFwc2ssxvDszw5nkbFQ0Guqj
	 9y0l6iWr++8Lwi26h9Q/nC5+LEwMtnJA12fmZO+wfj0YgsZrzrbbTg1PwKHQFtdnyj
	 Ql6NN1M1d2GuWil7a6hiaO4uv4u1RyVm6CvQfZfDBZieeATNZ553C9W/H9g88G5Qqy
	 0QujQm5p1/l5bxN3KgX6oHbk=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DBEA540E0169;
	Wed,  9 Apr 2025 15:38:24 +0000 (UTC)
Date: Wed, 9 Apr 2025 17:38:19 +0200
From: Borislav Petkov <bp@alien8.de>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] compiler.h: Avoid the usage of __typeof_unqual__() when
 __GENKSYMS__ is defined
Message-ID: <20250409153819.GHZ_aUayZlfOd7TTq4@fat_crate.local>
References: <20250404102535.705090-1-ubizjak@gmail.com>
 <CAK7LNATO1RfACvWhHJuLi-FYWMnSn6+Tp67-EZtVWNk+RCSTVQ@mail.gmail.com>
 <CAFULd4bx9BGKo_4kn14rsVr44otpdjpjn_o6=zMp8iu98f9Upg@mail.gmail.com>
 <CAK7LNATnactfA2U0CB2VcoE1eDc+bj=Jjye-Khsc3xG-iZ2XVQ@mail.gmail.com>
 <CAFULd4b25r5wf31DJputSOZhhMTrejQ_3-2P5rpeOL8H=4_mcA@mail.gmail.com>
 <CAK7LNAQVbwnnX5TJLmEShtmUtLCwr=rnZgwX9NoAke+PqzsqiA@mail.gmail.com>
 <CAFULd4b2azU-oBOTTXgQ6ahkVeYWHTJrnmJ97vtLm3P6jMOeug@mail.gmail.com>
 <20250409152812.GGZ_aSDEaLEOVUf3YX@fat_crate.local>
 <CAFULd4avYC6V=-ewBcTGHA5GjuTBh++-wLNOH=M68u1rwNsAmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFULd4avYC6V=-ewBcTGHA5GjuTBh++-wLNOH=M68u1rwNsAmg@mail.gmail.com>

On Wed, Apr 09, 2025 at 05:32:39PM +0200, Uros Bizjak wrote:
> The workaround is posted to the list. It should be committed to the
> mainline until genksyms is fixed.

I'll take it through tip.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

