Return-Path: <linux-kbuild+bounces-8475-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCDBB26F8B
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 21:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD074626A67
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 19:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104261EEA55;
	Thu, 14 Aug 2025 19:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5fSDPg2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D978A1E7660;
	Thu, 14 Aug 2025 19:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755198712; cv=none; b=XHquHxEEpd6CEYVlaswddE7vCI/kPTUJepyRsGXaiF+9/0L0aHkdaTc+l32vgrLHiYo9jRx95cIFMvQfz9DKHCzWch1aQHtZDRlf5+i2Qql9SxosH4dz3tWamijwOfVWXxdJWCt0tXtPwavSewhdtbtn1MInbLghBVT8J5B38UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755198712; c=relaxed/simple;
	bh=rWR61neL3MyeysPfhUM6pZsrCT7uhomrQ6Z+HRz8JvU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d/XySres15opxoCVF/4cww9o3AvpFK3vOU5YOInqF7uDrI6p0195WWsUuLeNdqgiPJK50z4ifOLcOsQqTvvwsR7s8w8JeBm1jAo32jQ2ZJ7a8tQVl0Ji3lq/i1pca48Ds/sW2x73utm+nUtHSfAjXMWq1ik+rLSER/Gmkk+ie2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L5fSDPg2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660D4C4CEED;
	Thu, 14 Aug 2025 19:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755198711;
	bh=rWR61neL3MyeysPfhUM6pZsrCT7uhomrQ6Z+HRz8JvU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=L5fSDPg2rQK5b1sb9EFknDgrDQgDCsyJ9e34wgjy6J7gwRpVzyZJ+Z84bE20dIY3z
	 KdFZkaTQ7EvFQcZ5SFz5kxTM52zpMW0FZtdhYnbcLQ74ZUsPu5e0UiFQUpBQAY/ySz
	 5bWGBbkQQAkXQ43995r6k/uLaF1jYqpMPklJIacaI+u1znoXwbwr7+598AzqCSxGYl
	 6yWSgLf9+5T6MDjHR8pbaq/lr0T3hmHP6GyIdwuJnaj1DBlkJ2USnEdv/mJUfM4o74
	 SqlKE6QTiqRU3LbWBaK08XqH2niHxo1B+U10hgA0CEnvgXaX4KKNHuhsEUqm3A6QFC
	 1MOevBl60+kKA==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nicolas.schier@linux.dev>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nsc@kernel.org>
In-Reply-To: <20250813-kbuild-hdrtest-fixes-v2-0-8a7921ca3a03@linutronix.de>
References: <20250813-kbuild-hdrtest-fixes-v2-0-8a7921ca3a03@linutronix.de>
Subject: Re: [PATCH v2 0/5] kbuild: uapi: various fixes
Message-Id: <175519871015.2179051.5280852058585473330.b4-ty@kernel.org>
Date: Thu, 14 Aug 2025 12:11:50 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev


On Wed, 13 Aug 2025 08:16:55 +0200, Thomas Weißschuh wrote:
> Various fixes and promotion of warnings to real errors.
> 
> I didn't add Fixes: tags as digging up the original changes would be
> cumbersome as the code moved a lot over the years.
> Backporting this doesn't make sense anyways.
> 
> 
> [...]

Applied, thanks!

[1/5] kbuild: uapi: rerun header tests when headers_check.pl changes
      https://git.kernel.org/kbuild/c/d4b7080be277c
[2/5] kbuild: uapi: fail header test on compiler warnings
      https://git.kernel.org/kbuild/c/3788d69db18d3
[3/5] kbuild: uapi: upgrade warning on asm/types.h inclusion to error
      https://git.kernel.org/kbuild/c/24b1bd64ee403
[4/5] kbuild: uapi: upgrade check_sizetypes() warning to error
      https://git.kernel.org/kbuild/c/c3a9d74ee413b
[5/5] kbuild: uapi: upgrade check_declarations() warning to error
      https://git.kernel.org/kbuild/c/b8d762c983053

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


