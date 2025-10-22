Return-Path: <linux-kbuild+bounces-9255-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9470BFE4BF
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 23:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A507C3AA2F1
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 21:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E332C302159;
	Wed, 22 Oct 2025 21:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2cs2eFO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EE73019C8;
	Wed, 22 Oct 2025 21:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761168052; cv=none; b=UiXzs+9z2PrRb4G6DIti6PSiKbfWG/VvMYAyP9pWstghAzoRFOR2VN51khspAgKm9PBcYaWFlB+3KkzR3N2ZyLkfORBJdpbjT60o2mDIHVOIyt9q82x8My5+Z+N73FKkDun8zlOShMf5BeqvgN2HVwNl2FBoET/6eQ89spJ4rGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761168052; c=relaxed/simple;
	bh=estFXfsjS5iO9c9gJK/FeFAujXczQBeiX7eQWk69h6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jFiRT6nWoT1fNNqQZrobxvrQA0flHO7eNc6SJagYXcZ8rDyoqvVmsNuoSPmL6YZdIWWWYMDG6h8K4YUYWfT5zejRdVWm3dSutvDyh8fpLTuVBdnTzrz7SvYatFXUP/1nSyNaj8mUgWxAFPBn2/KxLVczi2iwnxurXePWm0JK4S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2cs2eFO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEEE2C4CEFF;
	Wed, 22 Oct 2025 21:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761168052;
	bh=estFXfsjS5iO9c9gJK/FeFAujXczQBeiX7eQWk69h6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z2cs2eFO6WTwQq+lxx+bvXZPVcpWj0jEfaVT1ky2B/roc2+q6ViT5C5Tb0f4bvW59
	 i02kvQdNzinygSsGZDM/j/le9QUcxYyC6vsJRVwwDpPsyS/aNYwwoRMsvPEodR2xm+
	 FV+TV27kr5c26xshaJUo10bKcL1h47+s3Zgj0cfS4bV1NpM6NdPJyZMN54p2Y+kqfg
	 uTk6yiw0Ph033cwM4IZp06zyU1pEXte01IQvFV1TwYpTeYschgqY11LqWcuQb3ldej
	 jQjB7i11g5oWJ4ReMFlPm/w+sjuhxBd5UHhdQElE9KrNbNZirWOwV2jJX1vxWCFK3h
	 6FKGPAtXvOFKA==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: uapi: reuse KBUILD_USERCFLAGS
Date: Wed, 22 Oct 2025 23:20:41 +0200
Message-ID: <176116758393.2674526.5064950028182720369.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251014-kbuild-uapi-usercflags-v1-1-c162f9059c47@linutronix.de>
References: <20251014-kbuild-uapi-usercflags-v1-1-c162f9059c47@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Oct 2025 07:55:32 +0200, Thomas Weißschuh wrote:
> The toplevel Makefile already provides the compiler flags necessary to
> build userspace applications for the target.
> 
> Make use of them instead of duplicating the logic.
> 
> 

Applied to kbuild-next, thanks!

[1/1] kbuild: uapi: reuse KBUILD_USERCFLAGS
      commit: ac1280211e1c41704c756fd1bc5512f92010b3f0

Please note that commit hashes might change in case of issues with
kbuild-next branch.

Best regards,
-- 
Nicolas


