Return-Path: <linux-kbuild+bounces-6835-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7974AA5E5C
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 14:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DBA04C046C
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 12:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D50522424E;
	Thu,  1 May 2025 12:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceArrZif"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201CD19A297;
	Thu,  1 May 2025 12:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746102458; cv=none; b=TBwI8oul8q7OMM0YB9Vs1o04paa9xK2Vsxa4mkD68W0DVNroPNO3uZ0v4YWqp21hNGK2Jx+xMfluxoDtsgRR+UiS8BRHl80GQkvHVrzFQmE+RdNu0XSfdDcMf2uQ40l7tzVPotSnELVt99vkCUKIiYJQC/6AX2IHpTIuYGOq9FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746102458; c=relaxed/simple;
	bh=HexxN5nBN6eJcubonn7zpFcCsGz6O39RwpRUeRqXaN4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JvQE0N9LnLRs/dUXDiesdhFl2aRXP/bT9N/wba46f2b6Co2OcV7VW7EBsSI6zCD14d6WNvfPay5xRuWtpud7FRk67Mmhfa0R84i/P80FLnEk5rjkQ59wNB6evRZ8PI1gDQd2GW9A0ybbUAX3+ISMfsTCLsz169LnvpBWSHej/d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceArrZif; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D30C4CEE3;
	Thu,  1 May 2025 12:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746102457;
	bh=HexxN5nBN6eJcubonn7zpFcCsGz6O39RwpRUeRqXaN4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ceArrZifcuDTLlxaQF68cB0zhaTwXEmSLucN+FavQ3D2uLaTllnzM+78CB4U2YP22
	 fgicl9TAAwhrQ42sRIjTaA1Ki5IdC2YnNbzRLDVfnITOHEAOGTiG2UFkHHUKiyDSqv
	 wpyt3cf2GCsrp3MUDb0n+JgvCbim4q60h0gSO274t2q2bvI5rTCIG7WprwQEnsp4Wr
	 RyNsMxUcuvoRF9fy1x6qwYnSsIrObncwIPEIIBMrmHtrvUDZHDnXm9P/O48deajuJd
	 L2y7sI9+Zs/xoVqyxWmGPj4IAEtYU93QXTosjK9Ge+F7/rtZI0LL+/u0S6RReV/0Mx
	 2VGr5DanzpJYw==
From: Lee Jones <lee@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Alexey Gladkov <legion@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
In-Reply-To: <79d5a847303e45a46098f2d827d3d8a249a32be3.1745591072.git.legion@kernel.org>
References: <cover.1745591072.git.legion@kernel.org>
 <79d5a847303e45a46098f2d827d3d8a249a32be3.1745591072.git.legion@kernel.org>
Subject: Re: (subset) [PATCH v1 1/7] mfd: stmpe-spi: Correct the name used
 in MODULE_DEVICE_TABLE
Message-Id: <174610245466.3816002.10815099602264061906.b4-ty@kernel.org>
Date: Thu, 01 May 2025 13:27:34 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-39345

On Sat, 26 Apr 2025 18:16:32 +0200, Alexey Gladkov wrote:
> The name used in the macro does not exist.
> 
> drivers/mfd/stmpe-spi.c:132:26: error: use of undeclared identifier 'stmpe_id'
>   132 | MODULE_DEVICE_TABLE(spi, stmpe_id);
>       |                          ^
> 1 error generated.
> 
> [...]

Applied, thanks!

[1/7] mfd: stmpe-spi: Correct the name used in MODULE_DEVICE_TABLE
      commit: 7e5d7dcd96e29bb30fe7b105c53ae63a8edcd3e1

--
Lee Jones [李琼斯]


