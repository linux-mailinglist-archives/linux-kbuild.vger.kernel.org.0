Return-Path: <linux-kbuild+bounces-10601-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5669ED2973C
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 01:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63FF73036C6B
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 00:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9826C30B508;
	Fri, 16 Jan 2026 00:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tS7E2Pw1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739E729D289;
	Fri, 16 Jan 2026 00:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768524735; cv=none; b=e06uz84KeawIzBXqj3k7z+4HlvsZ/vXV/p0v5zDGNZ+FNn0aLi39ZewhXF6qSVfAj2VTJS9lygLCTY17FDFkGAVfzo8lx1lvG0oJNli/fZZkRIwKmovpJrAoOcgYGlw1yxBKpdQlS4O+TSUkbcnCQ7yEjfxUtHSnieDOG1JWnPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768524735; c=relaxed/simple;
	bh=K60EpeW1OnCTHNDlSQ02tOAQsYSCiDrib7sXMBvJMtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0dVMJa/av9CyWIHpq/V0UK6qc3kA99deGZl//2431163v66GP4OpBDyP7JB9t6bRVG1iSTcRVOn1fk/CIk3xQWm5L6zTIo+A3EvMfs+K0Mg7H3eB4maJZNRpK3Jyw3WIMioFRDkVxOh4tP1DDrgqTqjdflyNwF5TzG7m/K4i2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tS7E2Pw1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D25C116D0;
	Fri, 16 Jan 2026 00:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768524735;
	bh=K60EpeW1OnCTHNDlSQ02tOAQsYSCiDrib7sXMBvJMtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tS7E2Pw164OqZKCU6eE4nwPSy/8EY2d+tsW2YoRuhLHQMN4zv9n0LyAQaSg665B42
	 n47GhZ2OKPqw8i9JnS9sVjGDunlaVK47TWkcMr+ZR+nVf1PWDB5KeraSD/GFU505KJ
	 HqG9VM0kQLl/NebDxY/0/dyHW9rx/fN7ScGjWruZ/tE1A+kOwVYZk7+EIZeZU3mCFU
	 ko4Tfcg6bbcZtnF9In/5k+zFkJWg9F/HDSJSX9S153zz5vJaRLz4IHxS5tirvKbdDq
	 HWP+NgdwNYPebutLDfhB9+LFaAhYcgEhejUNAv8YGiT8PslNNj2I0taU5I0ArJgUv/
	 CzsYnjrrW8MXQ==
Date: Thu, 15 Jan 2026 16:52:14 -0800
From: Kees Cook <kees@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kallsyms: Get rid of kallsyms relative base
Message-ID: <202601151651.C156DC5D7@keescook>
References: <20260115145644.1749948-2-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115145644.1749948-2-ardb+git@google.com>

On Thu, Jan 15, 2026 at 03:56:45PM +0100, Ard Biesheuvel wrote:
> This makes all entries in the kallsyms_offsets[] array visible as
> place-relative references in the ELF metadata, which will be important
> when implementing ELF-based fg-kaslr.

This makes things a lot simpler.

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

