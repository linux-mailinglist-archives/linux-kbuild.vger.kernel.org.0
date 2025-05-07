Return-Path: <linux-kbuild+bounces-6988-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02851AADC92
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 12:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F5A54652BA
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 10:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4C8213E6A;
	Wed,  7 May 2025 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="quH70Q9F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5655120E315;
	Wed,  7 May 2025 10:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614122; cv=none; b=Mx81mwva/oyJTTW9Ewm0MaxerSkFpMqz5aEaakfCRIHG3yNFISkOXV78k8la3PIW8K9Cjvzal1mVPY+t/KzRKmr5FTOUZZn0Cd0kK82EBIPvZNQfO2NoX2EqAQcx40H+lZECHpu2FdYsYoWkyzkuq4Vbc/nbR1mTWHigSVX32kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614122; c=relaxed/simple;
	bh=C42TwOzo4bEYHYaWCns3jFUDVHKAdqG/MYS13QYBCAw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iZjd4vRughvpvhPwqP/A2yqzIJ5+GNMrirTwGGQnYDZSNss6JZ/hX/gdIChocyovyoS+32B4DIFX06NZ09ivgzxjTKwnijJ8++Y4SotXPh4ExiVcCzYk13SlQ0sZ+pH1wpyAyurAP7U/nC31Ns5oUw/Hxu8SEmnk1y5cSS6TUcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=quH70Q9F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2307C4CEE7;
	Wed,  7 May 2025 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746614121;
	bh=C42TwOzo4bEYHYaWCns3jFUDVHKAdqG/MYS13QYBCAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=quH70Q9Fpoe9vAziyUtIBxQQtxnGpYfbU6W/Eirh09Tjozp544MEEIwc3HkLxjgV2
	 Lw7lITivj0HEGdf/mp9ZcZaxzGBdP8eboO50fRe3YrGaAFZUnz2CASP0N3BCr4noSs
	 ZxLIta2lC0oGZHTAzym8G0Ch+qZPrboV6sjEQpHIkKuLtQP/822WW9vlr1v5M6/VwT
	 pqSbEthg5ytcaacEqU++prwb0MNRQutN4BQI0Ra8vPhIADzNAr7LCa3CszncwaQwf0
	 21nIG2zwDWI9PO2SFG0Tep1s+UnE/HFk7450PhNVQgmhGU9idWpIvG6YZagXHSd15s
	 NlgN/n3U/arhw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCc7T-00CZoF-93;
	Wed, 07 May 2025 11:35:19 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mostafa Saleh <smostafa@google.com>
Cc: will@kernel.org,
	oliver.upton@linux.dev,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	kees@kernel.org,
	elver@google.com,
	andreyknvl@gmail.com,
	ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org,
	yuzenghui@huawei.com,
	suzuki.poulose@arm.com,
	joey.gouly@arm.com,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev
Subject: Re: [PATCH v2 0/4] KVM: arm64: UBSAN at EL2
Date: Wed,  7 May 2025 11:35:13 +0100
Message-Id: <174661410588.354102.12581614598575589637.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250430162713.1997569-1-smostafa@google.com>
References: <20250430162713.1997569-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, smostafa@google.com, will@kernel.org, oliver.upton@linux.dev, broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, kees@kernel.org, elver@google.com, andreyknvl@gmail.com, ryabinin.a.a@gmail.com, akpm@linux-foundation.org, yuzenghui@huawei.com, suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Wed, 30 Apr 2025 16:27:07 +0000, Mostafa Saleh wrote:
> Many of the sanitizers the kernel supports are disabled when running
> in EL2 with nvhe/hvhe/proctected modes, some of those are easier
> (and makes more sense) to integrate than others.
> Last year, kCFI support was added in [1]
> 
> This patchset adds support for UBSAN in EL2.
> UBSAN can run in 2 modes:
>   1) “Normal” (CONFIG_UBSAN_TRAP=n): In this mode the compiler will
>   do the UBSAN checks and insert some function calls in case of
>   failures, it can provide more information(ex: what is the value of
>   the out of bound) about the failures through those function arguments,
>   and those functions(implemented in lib/ubsan.c) will print a report with
>   such errors.
> 
> [...]

Applied to next, thanks!

[1/4] arm64: Introduce esr_is_ubsan_brk()
      commit: dc1fd37a7f501731e488c1c6f86b2f591632a4ad
[2/4] ubsan: Remove regs from report_ubsan_failure()
      commit: d683a8561889c1813fe2ad6082769c91e3cb71b3
[3/4] KVM: arm64: Introduce CONFIG_UBSAN_KVM_EL2
      commit: 61b38f7591fb434fce326c1d686a9793c7f418bc
[4/4] KVM: arm64: Handle UBSAN faults
      commit: 446692759b0732ef2d9a93b7e6730aa762ccf0ab

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



