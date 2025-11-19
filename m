Return-Path: <linux-kbuild+bounces-9677-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E41C6E59B
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Nov 2025 12:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 86E4C2CF06
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Nov 2025 11:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC46D3559CC;
	Wed, 19 Nov 2025 11:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyUP/H6x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4425352926;
	Wed, 19 Nov 2025 11:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763553508; cv=none; b=U7guQZhK4GsAj1NAgBon2PTRKfKr7V75r/OW7Rx6IZ7/UZ/ctNugbA3jKDDlUCkjXIxFTlhMV+e2g6FOiwH7pjKtlxx1rM40rEFtkcPr1Eot3IRnqfbwSlZMrxyJTuuUGStSO/a3vLefjftH/WvqNbbNrlzfrFV7zOhFHsrZEq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763553508; c=relaxed/simple;
	bh=EEq3CMT36Hg9BSWs3grYZBIr3x7fJN7wNGA24xcardE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rWKjdyM1SAHwaefX/H89WLZuNBc1C6wthDpYYK+6X4iN9hsWsYJSPxfBiDoM+LZzEw4L8hQUDv+IY7azao2cjIH1zSFyooiojICu0zB22aMTAhKdnN6IVxwWG6z/1lytzBi23RpUPGKyRLQCud5iJE129qbFtSg/YAiLUMfTob8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyUP/H6x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF6AC19422;
	Wed, 19 Nov 2025 11:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763553507;
	bh=EEq3CMT36Hg9BSWs3grYZBIr3x7fJN7wNGA24xcardE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jyUP/H6xFGHydzC6WHHXkgAAO/jHEFzcnslszJ6Lm4EbPDcpff4zL5uWrOYXyoAsn
	 KhsXV2Hyib7XJaFVapiPssRuuCCsGXB+/fZq31Q784+xhwRpMfnTfNOmubEwTDPced
	 ag+eaofyctVIYUgkP+itRCqhmWBPKVWf9SVIApd4+WWNQpzns5O7aYiefcHsWuqsE1
	 0mr/y3RhJDG4BVPUSyj8JtdXVJBPHQbUO6F5/Jt4at8kG5UUCnMLiPomENhVJXma58
	 bkY8aJasn0qJIfGM0QAVsBuOZeSmVhyuGBDMmisTH5qDWToWOGtMMB9oUNBIVJjJDX
	 cm3+aHNE8nWGA==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/3] kbuild: userprogs: introduce architecture-specific CC_CAN_LINK and userprog flags
Date: Wed, 19 Nov 2025 12:58:13 +0100
Message-ID: <176355344004.27328.4435801280673856059.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114-kbuild-userprogs-bits-v3-0-4dee0d74d439@linutronix.de>
References: <20251114-kbuild-userprogs-bits-v3-0-4dee0d74d439@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 14 Nov 2025 14:43:55 +0100, Thomas Weißschuh wrote:
> The current logic to inherit -m32/-m64 from the kernel build only works
> for a few architectures. It does not handle byte order differences,
> architectures using different compiler flags or different kinds of ABIs.
> 
> Introduce a per-architecture override mechanism to set CC_CAN_LINK and
> the flags used for userprogs.
> This revision only contains the generic kbuild infrastructure bits.
> The architecture-specific will go through the architecture trees.
> They are present in v2 of the series linked below.
> 
> [...]

Applied to kbuild-next, thanks!

[1/3] kbuild: don't enable CC_CAN_LINK if the dummy program generates warnings
      https://git.kernel.org/kbuild/c/d81d9d38
[2/3] init: deduplicate cc-can-link.sh invocations
      https://git.kernel.org/kbuild/c/80623f2c
[3/3] kbuild: allow architectures to override CC_CAN_LINK
      https://git.kernel.org/kbuild/c/deab487e

Please note that commit hashes might change in case of issues with
kbuild-next.

Best regards,
-- 
Nicolas


