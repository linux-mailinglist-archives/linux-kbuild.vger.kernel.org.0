Return-Path: <linux-kbuild+bounces-6818-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE5CAA53B8
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 20:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C08301BA277D
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 18:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9C025E444;
	Wed, 30 Apr 2025 18:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IB2X2j/T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FEF1BE251;
	Wed, 30 Apr 2025 18:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746037947; cv=none; b=mJu5Z/eN6n5NAktZfnVyxF/1qiGxqVbyBQ+R+O0Yxoza5Z1cdqlZ149PaBnk2j9niyicLawdqlkoCBBfGd74t6Z3QhwywxwcisAlIYf2qdPeKyUqqnrqKT0/PjpDEOtRX4LPzo/b2K8/rjobhtJA2LCc7VMjxL2wEpOG0dDeXKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746037947; c=relaxed/simple;
	bh=TYhgix12dGzxcZC8EV8jdnO88G/BhDWgXBe6jHhLI8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVGd6pJ2TfeL8WO5fW3CKch5LLrorOIp/QciJ/VEvvAPshuyvqqYJTi76TePIvL3vS37O2xYv6QCUZgkWwX+LF0m49sknbFDdXYdWfo2+s0BFfMh7TnrjEURGjBS5FTlsffcVzvS7jWLUiFwfsIjeCs9LYrn6GFGmjQZDYwPsk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IB2X2j/T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A331C4CEE7;
	Wed, 30 Apr 2025 18:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746037946;
	bh=TYhgix12dGzxcZC8EV8jdnO88G/BhDWgXBe6jHhLI8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IB2X2j/TomWE4MnvUk8n5a4msFY5rPtItY31T/FdMJyQc/vE7POD5ctE1hHyWVhBo
	 xgmxVKXZHEuJZfiEeimc8LhMhbpqHzzt1fgnySSyw76jxjchTvd1WoRVqQ2mVhiX/k
	 FnGCRet0XJwNjHQfgwDWVpRTpFpmWLpLjxvvtp5khqq5F4dLBO82E4bXdpsyocoUBW
	 5lGBWvGntuH2bJX3xAmp/gBXg3tj09DHNTw48bp/Ct/Mf53GMb2yFzEfV8JtPd8gHD
	 EXeohERnPfRCUtSvD2k+f7GJpzZqY0acWyBcjPUhjA6JbcRFRGmGV4xWGWrlrxzseK
	 ok32P1l0oUmcA==
Date: Wed, 30 Apr 2025 11:32:23 -0700
From: Kees Cook <kees@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, elver@google.com,
	andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, yuzenghui@huawei.com,
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas.schier@linux.dev
Subject: Re: [PATCH v2 0/4] KVM: arm64: UBSAN at EL2
Message-ID: <202504301131.3C1CBCA8@keescook>
References: <20250430162713.1997569-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430162713.1997569-1-smostafa@google.com>

On Wed, Apr 30, 2025 at 04:27:07PM +0000, Mostafa Saleh wrote:
> Many of the sanitizers the kernel supports are disabled when running
> in EL2 with nvhe/hvhe/proctected modes, some of those are easier
> (and makes more sense) to integrate than others.
> Last year, kCFI support was added in [1]
> 
> This patchset adds support for UBSAN in EL2.

This touches both UBSAN and arm64 -- I'm happy to land this via the
hardening tree, but I expect the arm64 folks would rather take it via
their tree. What would people like to have happen?

-Kees

-- 
Kees Cook

