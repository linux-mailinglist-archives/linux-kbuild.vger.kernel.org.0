Return-Path: <linux-kbuild+bounces-9425-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D075AC38087
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 22:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7EEF734FDCA
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 21:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50D62DC34D;
	Wed,  5 Nov 2025 21:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2imYSjl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2932E11D7;
	Wed,  5 Nov 2025 21:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762378269; cv=none; b=Mj/AVq7bFwYTirU4vmBv3zQ5tCZQNWEuKD3dnKFSkO0H8fm+PylkcnG81yB8ERcFED2ktiS7u2jnTrv1Rkl83ceehgwOY7IoZEByaSwitEsenGbl0V0OER5uFqg0IkiXuRLzvuF5UsMxNCaIYXNZLciF3HXAJ1AIP7lcvuNw65Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762378269; c=relaxed/simple;
	bh=643Bnw2lwFQjsIC6VqTKx4koy2RKtRCvkIpOI+vv8CE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Cv2vAtSw4XcAJ/xOGRtERyEwlQ16Ms83P39X9WfEez2IrGlgX6waDFR2wh8OrV1X0lFO0qf4rHoEPnhh930d/WHfuvYMwp4mcu/E0uUVoqNtJn2KZoW9a/EAd+6w97gv4QkE0IzezcV3rrGDmQ0bhEp8r+VYU0jZIFkl/LRl3RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2imYSjl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB14C4CEF5;
	Wed,  5 Nov 2025 21:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762378268;
	bh=643Bnw2lwFQjsIC6VqTKx4koy2RKtRCvkIpOI+vv8CE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M2imYSjlMob7HcRKeBFemJiqZOJjCuJAwIHPGEH83GuJmxabv1GRu/b1f2OKcQlQj
	 CACCSuj81qm8yppoThSjbDDUwoFogSojwCcmrg0NFRinQRR6bc775xoEn+2Q3kXacT
	 A9lDj61TldVbUDUDe3IgjDm26Sn4iorC0Tw70DMfpAxPXZXTuhlPCZlk5BcaJjJCFQ
	 kPyl7lzLIUtKtPjCqiLLTwp7XVUg7m7Fe5LZJD3//be/4Vx+HTcv2jDn9k7fqQI+OH
	 jN4zhdgUKgj2eXAWIH9KL7P5Vf93n1AkzKvQgehMUahRKMOkq+Zr1ZW8hKmYgaKLDF
	 BZ8U+Rp4/U99g==
From: Nicolas Schier <nsc@kernel.org>
To: Pat Somaru <patso@likewhatevs.io>
Cc: justinstitt@google.com, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com
In-Reply-To: <20251008004615.2690081-1-patso@likewhatevs.io>
References: <20251008003739.2659141-1-patso@likewhatevs.io> <20251008004615.2690081-1-patso@likewhatevs.io>
Subject: Re: [PATCH v2] scripts/clang-tools: Handle included .c files in gen_compile_commands
Message-Id: <176237822421.134706.15967814896659435327.b4-ty@kernel.org>
Date: Wed, 05 Nov 2025 22:30:24 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Tue, 07 Oct 2025 20:45:28 -0400, Pat Somaru wrote:
> The gen_compile_commands.py script currently only creates entries for the
> primary source files found in .cmd files, but some kernel source files
> text-include others (i.e. kernel/sched/build_policy.c).
> 
> This prevents tools like clangd from working properly on text-includedd c
> files, such as kernel/sched/ext.c because the generated compile_commands.json
> does not have entries for them.
> 
> [...]

Applied to kbuild-next, thanks!

[1/1] scripts/clang-tools: Handle included .c files in gen_compile_commands
      https://git.kernel.org/kbuild/c/4e455b73

Please note that commit hashes might change in case of issues with
kbuild-next.

Best regards,
-- 
Nicolas


