Return-Path: <linux-kbuild+bounces-9435-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F3DC3CBBD
	for <lists+linux-kbuild@lfdr.de>; Thu, 06 Nov 2025 18:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DE8A1898841
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Nov 2025 17:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC8B346E43;
	Thu,  6 Nov 2025 17:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7Gwrhbt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16A432D0E3;
	Thu,  6 Nov 2025 17:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762448977; cv=none; b=OzpZ4tO9Ny0wjvYzb6R6zyst1094q4ibZBsSrqHnZfTdMHsUl+I71Xw8HvQ3sgMtimoDJ/9SDS7LY8eNrCJKWCQQNDnH3Gi6AV91QApg8hkfXRT83LIAB7REsU/aDIDZxlZOoWsLyiTI4Ie77tTtUygdaG4hLfFvmp1/OkmNlgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762448977; c=relaxed/simple;
	bh=n3rKBJFqHLj8j8SKcpaSVVC9o3fpjgUcWalYVNmrkJ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I3xzoR03wMLsjyokjiG2j0J3NzCYXHvblXFfXP19rkZfKHRqjCUxy54CWTkCeR+SFsfNn+9U13IpZLB/cZOuUBluSDYOOcZnpA9v2ub/oyMT9egRoahXLG+YAKva63HFZBy7lTb+Z4kOObZirm7AeTvZyzpH0f2qmGtubYTecUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7Gwrhbt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42566C116B1;
	Thu,  6 Nov 2025 17:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762448977;
	bh=n3rKBJFqHLj8j8SKcpaSVVC9o3fpjgUcWalYVNmrkJ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=H7GwrhbtKhfAPbNhENaSpfpBIv7liICagz7GfXKpZCviP+uAVhmTl+Tqfr0euERgf
	 8E6s9n3mPbrBQaYYeX///+24h+zUZrK5su9Xfc2upHJesnfxrC5kFOkn4dtVuDtnvX
	 0FNIGAGMJAQrZv4ovenYy2kSGlcAwUve1mvn9fAMn29U2LYJYMwEjVfRb/dl+k2PUz
	 iw4su63D65sKYpz+SXYHo0MX9nwd6+HTgRCdt3BJmY7MILnHxyku1OX2+g5gFDLff9
	 4UK5Tozsc0qqO6E+/tp6tDNKNBc1/cKrQaRbWSAFswZKEVK3N7iJZED1gZNsayaQun
	 Pl2BguQu1MtJw==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Omar Sandoval <osandov@fb.com>, 
 Samir M <samir@linux.ibm.com>, 
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20251105-kbuild-fix-builtin-modinfo-for-kmod-v1-1-b419d8ad4606@kernel.org>
References: <20251105-kbuild-fix-builtin-modinfo-for-kmod-v1-1-b419d8ad4606@kernel.org>
Subject: Re: [PATCH] kbuild: Strip trailing padding bytes from
 modules.builtin.modinfo
Message-Id: <176244897498.1698854.1509769597718225621.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 10:09:34 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Wed, 05 Nov 2025 15:30:27 -0700, Nathan Chancellor wrote:
> After commit d50f21091358 ("kbuild: align modinfo section for Secureboot
> Authenticode EDK2 compat"), running modules_install with certain
> versions of kmod (such as 29.1 in Ubuntu Jammy) in certain
> configurations may fail with:
> 
>   depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname prefix
> 
> [...]

Applied, thanks!

[1/1] kbuild: Strip trailing padding bytes from modules.builtin.modinfo
      https://git.kernel.org/kbuild/c/a26a6c93edfee

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


