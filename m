Return-Path: <linux-kbuild+bounces-13148-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPvIOrAnBWq3SwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13148-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 03:38:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 922B753CC33
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 03:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 71AF33019899
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 01:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DDF31ED8B;
	Thu, 14 May 2026 01:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWelMqc1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508EF31A053;
	Thu, 14 May 2026 01:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778722734; cv=none; b=Z8pHNFNtcFawRocP/K+ixI0INpWEroUOPRfF4GRBWRzu+3VwtDTe1wgd3y5gVT55sLmBXWhMWWCgF+DuwlWcCkhMJUBiEifXt4I0ycG9gb8Y5U6c1BQa8RnMfbCrx8YwETPsERRm6hAsWZXkfFrnz+gfrh47Sz1Ptv0miskBG5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778722734; c=relaxed/simple;
	bh=azx75L+0LsCmzV7YzgWzSDXiprim9aRbKB+QdHdpWcU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Cf5/nS5+2BiI58b0/Keq8mHYmCcYedU4aCZEov+M1Vsmr1UlTkrgwYNR/BQGGd4mOKVRUpdn5wfcqfeoVP19+BgqhAXTEpNM8NKO3OCCvOehlLvt8h6YsB1jsavnXMRhd0srI6zo/QgXwwhhQU3rfysP0AkWqNaePePSG9jANds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWelMqc1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A213C19425;
	Thu, 14 May 2026 01:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778722733;
	bh=azx75L+0LsCmzV7YzgWzSDXiprim9aRbKB+QdHdpWcU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JWelMqc1orGpixsJdFi9RzJHAPx2YWdVYrYvGbGWfan07qTlSKpw03aLSoN/oFIWG
	 Gce/A3jHn6z/5m6YZym0FadHtug59M9PYnI6Dmw8cZ53l7W9qY1RtBiNyG2GlHcapZ
	 V+Ocbx5kF51bz5hu94O6oXtDSfrElIbbOAP4/3LH7pndT21dVP7uIItQ5ur9kQdYYh
	 y/HVozFDPlAkneMoF03TVVZwRqWUz2CxPCP55DmfTBWbS589DnrjsRldEo1lgvCZal
	 eVYNb1GS3paQPLRZrw6k2i7e7f6o8qQnUy6eOnj020OmUIhIj9yz9CwztKzgcKaIF9
	 i+nShwmL0M3Jw==
Date: Wed, 13 May 2026 19:38:52 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
cc: Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
    Justin Stitt <justinstitt@google.com>, 
    Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
    linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
    linux-kbuild@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 09/14] riscv: Drop tautological condition from
 TOOLCHAIN_NEEDS_OLD_ISA_SPEC
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-9-81d9b2e8ee75@kernel.org>
Message-ID: <39e64254-2a21-5b50-a8fa-a6295e61fed5@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org> <20260428-bump-minimum-supported-llvm-version-to-17-v1-9-81d9b2e8ee75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 922B753CC33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13148-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,lists.linux.dev,dabbelt.com,eecs.berkeley.edu,ghiti.fr,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pjw@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, 28 Apr 2026, Nathan Chancellor wrote:

> Now that the minimum supported version of LLVM for building the kernel
> has been raised to 17.0.1, the Clang dependency part of
> CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC is always false, so it can be
> removed. Adjust the help text to remove mention of Clang < 17, as it is
> irrelevant for the kernel after the minimum supported bump.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org> 

Acked-by: Paul Walmsley <pjw@kernel.org>  # arch/riscv


- Paul

