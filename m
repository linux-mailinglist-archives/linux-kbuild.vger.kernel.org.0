Return-Path: <linux-kbuild+bounces-8955-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D54D1B9AE90
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 18:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9414E323CE3
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 16:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A9030BF77;
	Wed, 24 Sep 2025 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDGPbSe+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF29019067C;
	Wed, 24 Sep 2025 16:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758732351; cv=none; b=Uwh6KiW9TtUgp5ukY8z1KA04G50fx5ifbY/ZthY4piggxUBu5JyxFFoisJBN3SutGRpjm/9pguzAR4IaYfAOn4o9zHiQw70UXHVU0aKl8gXWQ7fdXzbSi4oUi6TkqDALCraeVNkLVG90ksTOIV+sIUYBD8IRO1zPz8fOw/R8bgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758732351; c=relaxed/simple;
	bh=wdf+5pjJi22xsb8jMNRsZ+15FZv7hT/9zywIWnBqmyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KstRxmuD01qyVL4Z2o5RCgO+MILDOSMRpMQupBYLAZsBmsV/iMnvZBuPG1BGLmv9QimF5Cd+A8+q0yTugnO66yOeozpkNHjN9Uvy2APcAH3A+mIYZDFFzMOo24B/7hRrj6UOnMsn3NqNxsuxbfHqARGtr6OelVvfM91+MlQa7eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDGPbSe+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48C2C4CEF4;
	Wed, 24 Sep 2025 16:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758732350;
	bh=wdf+5pjJi22xsb8jMNRsZ+15FZv7hT/9zywIWnBqmyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jDGPbSe+0kEcWeAoEPV9/Pj//gL/pue/o+RdOFmk/VkvtnF2lYjUVKKG71AwL6RXL
	 whUiEs5ThhDGtfox+fUd7TsdMbHGySju6XeOTS0LbopAepcoHaIvKFgIcRZQQXbR+6
	 pLJ75OiXFLFpyHIiajMIEtlo8IlKW1EuFIhpNDOptbi620ZYSNQx5llmLrzxhEZtTw
	 1MaiGWflQy957JGOwdUOrtOr4ZYYPF4lduETuWI8YSP0fJmMal8rGt4JJlSTKht0Q6
	 md5ZWtmSdvFxTDo14InN4mQ4dj0m40JgtMh9WD2DUcr6G+T0hxOrHGqXaJJ6z6Pyrv
	 nXm28G+yGcEMg==
Date: Wed, 24 Sep 2025 09:45:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 3/3] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
Message-ID: <20250924164544.GA461995@ax162>
References: <20250923213120.make.332-kees@kernel.org>
 <20250923213422.1105654-3-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923213422.1105654-3-kees@kernel.org>

On Tue, Sep 23, 2025 at 02:34:19PM -0700, Kees Cook wrote:
> The kernel's CFI implementation uses the KCFI ABI specifically, and is
> not strictly tied to a particular compiler. In preparation for GCC
> supporting KCFI, rename CONFIG_CFI_CLANG to CONFIG_CFI (along with
> associated options).
> 
> Use new "transitional" Kconfig option for old CONFIG_CFI_CLANG that will
> enable CONFIG_CFI during olddefconfig.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Kees Cook <kees@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

FWIW, another instance of CONFIG_CFI_CLANG has snuck into -next via
commit aa34642f6fc3 ("tools headers: Sync linux/cfi_types.h with the
kernel source").

