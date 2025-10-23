Return-Path: <linux-kbuild+bounces-9278-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F6BC03B9F
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Oct 2025 00:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB7904E8BEA
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Oct 2025 22:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D1A2737EB;
	Thu, 23 Oct 2025 22:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjCVLPt3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DC0C2E0;
	Thu, 23 Oct 2025 22:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761260257; cv=none; b=O5O2LowP0Hgw6ZDf3O8rt8z6K76SZKMG4umdibStgRVhFWFg9iJCcdw8WHzRMnpm8wb3k16aFUhovItcZsa8UXYDQ1QB9sDuu/7L9hS7fqYFmHKT17NUo+8HoCsDFWyEfPicnqsb2Tx+VHAhnkUHnxw4NNtJAL+AK+ZtNeAXvCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761260257; c=relaxed/simple;
	bh=6H/+3YNWa3c7zsTHJISk8xnwkrgT9AkaORUmOLXv4NY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WlnOX+ZyVSifJlA/TLAkR2Gbg3cpSPCIwB9ieIRpflpgTqSXR250vm+TXlXDDzydip8/tL20J0kmYbfsooPIlKcFTNby7XATykXHIrsA75c9rcuIs+D8UgGgK3FVqulZ2pRRPZ/w2pmFQjZPw2DfC7/M/0mTemlKpKQNAC6is0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjCVLPt3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE25C4CEE7;
	Thu, 23 Oct 2025 22:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761260256;
	bh=6H/+3YNWa3c7zsTHJISk8xnwkrgT9AkaORUmOLXv4NY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JjCVLPt3CX3ScmnJkj2y+Gpc5aZp4tEZpucrsW7E9AZ1/f9xEEe6pccwRbiZAmjAP
	 P6zKjC8SbZrlypi+A2542lEseR9YAuiqsekxUw2cmadu2VFqtkUkLl2Xvl/Zp3JEHL
	 o9CMgDCHX6/L6WuS0m8sY/jmED0/as1c3h1jku0lvGQO5jKuU0Fe28mkT19MMCwzqe
	 CDoQVZyRP8f7a6cXxIyhv6By6DuamL988PZjzLAUsY4IEJKiF86frRGKH0Rbq9lh5y
	 8doAfV5YjlimMUBTnPhvyLGCDC94tykkCGJ0kXKd8KMibARzz6jVjPbkL9YtrSWBtd
	 XWpiDdBM/4Ijw==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251023-update-kconfig-maintainers-v1-1-0ebd5b4ecced@kernel.org>
References: <20251023-update-kconfig-maintainers-v1-1-0ebd5b4ecced@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update Kconfig section
Message-Id: <176126025560.2868073.2105663520674732617.b4-ty@kernel.org>
Date: Thu, 23 Oct 2025 23:57:35 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Thu, 23 Oct 2025 21:25:20 +0200, Nathan Chancellor wrote:
> Masahiro Yamada stepped down as Kbuild and Kconfig maintainer in
> commit 8d6841d5cb20 ("MAINTAINERS: hand over Kbuild maintenance"),
> leaving Kconfig officially orphaned and handing Kbuild over to Nicolas
> and myself. Since then, there have been a few simple patches to Kconfig
> that have ended up on the linux-kbuild mailing list without clear
> direction on who will take them, as they are not really sent to anybody
> officially, although the list is obviously watched by the Kbuild
> maintainers.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: Update Kconfig section
      https://git.kernel.org/kbuild/c/dfab67879bed6

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


