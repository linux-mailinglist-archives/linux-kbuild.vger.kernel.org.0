Return-Path: <linux-kbuild+bounces-6815-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3ABAA53AD
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 20:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B3E57AEFC2
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 18:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF9726B96B;
	Wed, 30 Apr 2025 18:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JkjsRPYl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C368266F08;
	Wed, 30 Apr 2025 18:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746037816; cv=none; b=sgrI9WPZMwM5V6aW3aWqUxKlmqDfIS8z8RRFN2h9+fSdDvG5qMZUzItUrT6CgnlQy8TLiFrtIE3SkMCkWXQVdx+gwV5+Db91E+qHo2+H6/33JowPlivr3oc7Z4A/uavb+/Nuqu8Fcmsh2N+klOkJC2ifPLMkp3MKEkeD7P8iG1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746037816; c=relaxed/simple;
	bh=+Bh8W2opHqTRaacu/woH8jsXXpI+2jmNYlTxL3d821E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgeBALGfmauqa4orYX3L/zofHHFeBFR5tHnjrgSnoqm+3s1VnrjSqfzFbNfUVcez2pvYmzyUBhWOeHVv6sSXOGhlBcQ1bUgcK3sTnhj16/JCWL2H+nQpQZB7iSzHpftAdAESckmiYQGhhDjVcWOJRAfHnVKCrRttnxC5n29r+oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JkjsRPYl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B0BC4CEE7;
	Wed, 30 Apr 2025 18:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746037816;
	bh=+Bh8W2opHqTRaacu/woH8jsXXpI+2jmNYlTxL3d821E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JkjsRPYlAsu1h78KDySX25PgSxCEQQwPBbYGDI+dVxcyA+ledZYULD/nf80rFHTmT
	 jz4eZW27iWvei/YehGt1vTSNurOLzCK/MtbaY+N4635Gy6UFwiHv1kzjeVw/4NsKGS
	 LRdygwbPVG37+ZS/pkpG7JFPd+ctzoqYsUWVPv0jMhUejpy18j7XXOHdWTAJqK+SNH
	 kKymcWmoivX1DomlQ+updVqU+saEnelIQ0d3ViCPLR4+yDthYf1Ii26xLIlWID0EXI
	 2W+qFiaQf/j0i21Rgkr7royQpTd4SF05Wh9GhG+0abzxQmVfkQvSw91WWSgP6F6ZwK
	 mzfIHdS8QQIjw==
Date: Wed, 30 Apr 2025 11:30:12 -0700
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
Subject: Re: [PATCH v2 1/4] arm64: Introduce esr_is_ubsan_brk()
Message-ID: <202504301130.184F0BC@keescook>
References: <20250430162713.1997569-1-smostafa@google.com>
 <20250430162713.1997569-2-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430162713.1997569-2-smostafa@google.com>

On Wed, Apr 30, 2025 at 04:27:08PM +0000, Mostafa Saleh wrote:
> Soon, KVM is going to use this logic for hypervisor panics,
> so add it in a wrapper that can be used by the hypervisor exit
> handler to decode hyp panics.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Mechanical change; looks good.

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

