Return-Path: <linux-kbuild+bounces-9038-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B6658BC2331
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 18:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4E8EF4F7846
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 16:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2EA2E889C;
	Tue,  7 Oct 2025 16:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEfiEv8j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC6D54652;
	Tue,  7 Oct 2025 16:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759856154; cv=none; b=PXc2eLqjZMa6hjtAx0RHxKiTJa3FVTC8QWSuFbw4V8EOBKT0RwNncDvscC3PbS2SIXmRKEmoPPhlKrqDQLx1tXtRWPK0oV659ZC/FAZwugHG4nJUa+pH7vX0+fPMWmn16t5ZE1qMoI/YAC+7sd5a4CXQuWTWw9RxA2JTpFJYhXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759856154; c=relaxed/simple;
	bh=URAiG9MmTw29Ev5NGh/hkcy8mhrNOyqYfKWtm5NzFgw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uj+HyK83F3y+gxLFPJk6sJVYHDcMW6a3i3gBXqwZA8kL52TJbDd03yen3EYb15nQ4Pkn2PpwOMXxxxrFK4TVmp/uoYBkS13i7eeLGk9lzUDzfc0sQvdU2OARn+3+/M68boNQl7KdNhFERqHDUyLuYEqwAHwUT9ObzZ+gIaPT9GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEfiEv8j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6660C4CEF1;
	Tue,  7 Oct 2025 16:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759856154;
	bh=URAiG9MmTw29Ev5NGh/hkcy8mhrNOyqYfKWtm5NzFgw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UEfiEv8j+Nj9oortxUUSIWTtbfLlFvnAga1GJYGZPhSj2SJVVH9hpZ1N2oGvwebP9
	 Yt6i56XKHAPP1xexe1By27KDfgxfCsEIAiB9o73+KFanDC86OdGwVYjT4kdCCNd/IR
	 HLd8XGwjnmt5QM5XvApB3pGux9kQ6A4aix5y62b5NWT+rEPWjeas9ZYfJbJl2S+4Xn
	 W8fTIqWA8p7KdyHZIaeBc+r+ntwoOtlosEXWXlsDgt5AnFdPT/EZTjjP1ORWHv0yVB
	 BRuNyhCtHiJ0o0TfEJaKTBgX9TIlqznXgT05deSSEhnxtldZRj/OlKCsW4pUS6UeUn
	 QhpSwlDcGpkqw==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kbuild@vger.kernel.org, linux-m68k@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <949f096337e28d50510e970ae3ba3ec9c1342ec0.1759753998.git.geert@linux-m68k.org>
References: <949f096337e28d50510e970ae3ba3ec9c1342ec0.1759753998.git.geert@linux-m68k.org>
Subject: Re: [PATCH v2] kbuild: uapi: Strip comments before size type check
Message-Id: <175985615239.1365513.5981195894675028617.b4-ty@kernel.org>
Date: Tue, 07 Oct 2025 09:55:52 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Mon, 06 Oct 2025 14:33:42 +0200, Geert Uytterhoeven wrote:
> On m68k, check_sizetypes in headers_check reports:
> 
>     ./usr/include/asm/bootinfo-amiga.h:17: found __[us]{8,16,32,64} type without #include <linux/types.h>
> 
> This header file does not use any of the Linux-specific integer types,
> but merely refers to them from comments, so this is a false positive.
> As of commit c3a9d74ee413bdb3 ("kbuild: uapi: upgrade check_sizetypes()
> warning to error"), this check was promoted to an error, breaking m68k
> all{mod,yes}config builds.
> 
> [...]

Applied, thanks!

[1/1] kbuild: uapi: Strip comments before size type check
      https://git.kernel.org/kbuild/c/66128f4287b04

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


