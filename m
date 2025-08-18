Return-Path: <linux-kbuild+bounces-8513-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14387B2B00C
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 20:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 014A01882C54
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 18:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D87C32BF5E;
	Mon, 18 Aug 2025 18:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zr748SJy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031C732BF59;
	Mon, 18 Aug 2025 18:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755540881; cv=none; b=h34CuDiG7ig2N3ZXKoWsyEsFBJNIunEzvY5tnM2vZQ+JxJjz+zYWxorHLrY/mQtcirPYWQ6GPAN0pFtznfIAZz7hPCEmiGtXZqXmQmHjXOQkhOMU9AuvMJH2zzBugxdo8N9GDVtSRQU8Un8/9p0Rs25djh42Ha6BCSKe+1WgOEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755540881; c=relaxed/simple;
	bh=C0/0i4+z9cHC28VL1NQWS0dOpOlZo/koEbN/FC4+Wlg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q06PMEkOYChYUTd2jvVouFzi3JvUly9XqsY+9HQwjN+QnGYX+Pmq4Fw4ln8Lr1uFvFulCyTONlmQntCE+adyIgXi301j9eZXFu84l3VBJxiFfTxqx2SwP/Gd0NJt2mPNsEAdA7IHCLdYX12cj3WMUKpJO0QOcKpwrl1Fl6xOSuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zr748SJy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92814C4CEF1;
	Mon, 18 Aug 2025 18:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755540880;
	bh=C0/0i4+z9cHC28VL1NQWS0dOpOlZo/koEbN/FC4+Wlg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Zr748SJyMT1WYnF2iZTFnSuSEoi6b66JfIdZj43lPt6FZFZylGaldMHhea33eNNmE
	 7LlZ+4+aswigA5Xw4IDmTmi4G9mAoVX0PCNWw6UbThDeLuxoqOG827Hr1PfnCHP3ix
	 clZjC36VYZ/KmJnMbgzMTPE+l2vDfd0eA5KEpdsUJHnDUksF70OFO87q3SBhZHSgRa
	 gutYDElmg7jm9i9DPIk/xu3pIwUoWHyCIbBvznWUe+cRznH/JPzAN0lz15bstgpiep
	 1BfnzKuLbmS9ZowTG6yJGm5iNOYsNRa6Jir6auUJ0hnezeF1blRLefMKaMBa1pKKBZ
	 1C5HEx2/fhPAQ==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
In-Reply-To: <20250812223502.1356426-1-rdunlap@infradead.org>
References: <20250812223502.1356426-1-rdunlap@infradead.org>
Subject: Re: [PATCH] kconfig: qconf/xconfig: show the OptionsMode radio
 button setting at startup
Message-Id: <175554087932.3761802.7665709422071619681.b4-ty@kernel.org>
Date: Mon, 18 Aug 2025 11:14:39 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Tue, 12 Aug 2025 15:35:02 -0700, Randy Dunlap wrote:
> When qconf (xconfig) exits, it saves the current Option settings
> for Show Name, Show Debug Info, and Show {Normal|All|Prompt} Options.
> When it is next run, it loads these Option settings from its
> config file. It correctly shows the flag settings for Show Name
> and Show Debug Info, but it does not show which of the 3 Show...Options
> is set. This can lead to confusing output, e.g., if the user thinks
> that xconfig is in Show All Options mode but kconfig options which
> have an unmet dependency are still being listed.
> 
> [...]

Applied, thanks!

[1/1] kconfig: qconf/xconfig: show the OptionsMode radio button setting at startup
      https://git.kernel.org/kbuild/c/75a6b4595daa5

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


