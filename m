Return-Path: <linux-kbuild+bounces-4549-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C089C0DF6
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 19:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA59A282AF4
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 18:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9EE217306;
	Thu,  7 Nov 2024 18:40:44 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF862170D5;
	Thu,  7 Nov 2024 18:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731004844; cv=none; b=jhPDcX5chk9TE3mHPKpsLNUXnvR9FIt6cpkCurNYn2gJEFSD9NOxmDkMnbatx804q8L/FD4SMkDGad7DXe18NOB/l+iSFHWwvfe4w8lanyEPx0LpMcaOuW8FfuKSFYcQHhMnx4j0k2LfqKnqu7KBxh7xuEDgONZgQli6ImXlRSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731004844; c=relaxed/simple;
	bh=pmIMgWsQRTuiEXWJ92FvB2tFP/PUYve4jWeF5UluKxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qtq44ZYgIDP2EKOUKJdF6up3S166JVfKHkfTasPMTEVAEhz6CIdWRyb/DtFcT/POM9vAKgGcDba51TQPGnCwnYVjh2rolLvyULNzXAHQktpPzauys+/ICwM+XCd62CnqYZ2Qf1ois4B9aanD/FRT0D8sDdt0mlDcDKHwWKS87sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D58AC4CECC;
	Thu,  7 Nov 2024 18:40:42 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: fix .data.rel.ro size assertion when CONFIG_LTO_CLANG
Date: Thu,  7 Nov 2024 18:40:39 +0000
Message-Id: <173100483729.985303.11178489688159304644.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241106161843.189927-1-masahiroy@kernel.org>
References: <20241106161843.189927-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 07 Nov 2024 01:18:42 +0900, Masahiro Yamada wrote:
> Commit be2881824ae9 ("arm64/build: Assert for unwanted sections")
> introduced an assertion to ensure that the .data.rel.ro section does
> not exist.
> 
> However, this check does not work when CONFIG_LTO_CLANG is enabled,
> because .data.rel.ro matches the .data.[0-9a-zA-Z_]* pattern in the
> DATA_MAIN macro.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: fix .data.rel.ro size assertion when CONFIG_LTO_CLANG
      https://git.kernel.org/arm64/c/340fd66c8566

-- 
Catalin


