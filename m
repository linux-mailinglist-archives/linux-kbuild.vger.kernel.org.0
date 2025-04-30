Return-Path: <linux-kbuild+bounces-6817-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6CFAA53B3
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 20:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0B951C219AD
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 18:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9208B1BE251;
	Wed, 30 Apr 2025 18:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4k78qbE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621612DC76A;
	Wed, 30 Apr 2025 18:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746037875; cv=none; b=cvJWJiQUiQ86kgJfcqly3F3OPaI2Yllb7+45Sf9LHPqVMgzxwvvjJJO4pdHk4nfOqJpsaaBNLQY14PEhDtvCCTsSVbvSD5YW7eh01EXyZtppaV5c6ilRc2VqjIfQV+HjGGxN9SZT/F61f1M1RpOvjRJtxHofC800Sdz5v+FUGF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746037875; c=relaxed/simple;
	bh=N7kzsYx3AEB32SD0UVxEAdO7TZ8Bqk0u7UpHiyEytCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhoTzYL8oK0Prt7sS3Ef4L53ti2y95kR2ArMvaZzw6cQ9Zrt81FN5Pk4UQVu3jBjgAjI+ZBL3zwPJxJX9+swjooU/TcXosSWKsiZcGzt2zCJLsCMt7UzfrnagE7cjLeFmuDmynG9eoHnqCLY93/c+ZCsTehGmTfXum/+WiR/EQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4k78qbE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36EA1C4CEE7;
	Wed, 30 Apr 2025 18:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746037875;
	bh=N7kzsYx3AEB32SD0UVxEAdO7TZ8Bqk0u7UpHiyEytCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4k78qbE83Dce+JSd9LBXTExzJug4J4G5+/w+bpMy/5PVnmqOJSO6GZ3DGpNqAUQy
	 zzrUzdYCvyCDLfww71KMdZeSonZAMH1Lx8mv6U/HiYsNKLba9n2nCoJ0n5dbmJGFUQ
	 HPOKfX1EOHPRrg+Lx7sZzc3Mrj1Oi+ZjW9yw/D+or494Zq2OYt/FBkQXHO5YjFxZ1S
	 qx/NMxy2JTZ3RuONBS+pxgJzbOnLDWSPnuwUqAJvAZ69O5l6XMQI8hSx/fqs/Ni7Lx
	 Y59hfMPpb52g7aZ8ofQ895PW1/WlwXxGHdncs47XQS9pkZXtWOv7jQaYmt0wSLKde+
	 7B+AWN7bmo3Wg==
Date: Wed, 30 Apr 2025 11:31:12 -0700
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
Subject: Re: [PATCH v2 4/4] KVM: arm64: Handle UBSAN faults
Message-ID: <202504301131.E58BEF14@keescook>
References: <20250430162713.1997569-1-smostafa@google.com>
 <20250430162713.1997569-5-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430162713.1997569-5-smostafa@google.com>

On Wed, Apr 30, 2025 at 04:27:11PM +0000, Mostafa Saleh wrote:
> As now UBSAN can be enabled, handle brk64 exits from UBSAN.
> Re-use the decoding code from the kernel, and panic with
> UBSAN message.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Looks correct to me.

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

