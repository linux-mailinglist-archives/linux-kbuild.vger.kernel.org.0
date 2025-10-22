Return-Path: <linux-kbuild+bounces-9253-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2668BFE4B8
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 23:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 836183A8192
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 21:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360B32FF15F;
	Wed, 22 Oct 2025 21:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXCCvxeS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D14C277C9A;
	Wed, 22 Oct 2025 21:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761168018; cv=none; b=CfFQc3hv97NXeO1B8yc+u9U6TiJJzcf0nMNyD4ydlElC5Upj76X9zGckoxGdgkSIoS97RNLdW47ixKqCQRgBaQ+8qs2VQdfItsxL5h5CVvcnDPx3DYHp+HwTt9oAD+xZ1jFYBjjCBgS1/giiAL3ualR5GV6aStVMY+gSVPImq1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761168018; c=relaxed/simple;
	bh=Qex05TyDFGpumFQWkjJ8T6qWdmTsk4cOplsz9GD77Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kLUTCrJLTnGPF8S3OSz60Ae3IvzBolftjOUzTPThf+BlFJGyBEn+MYsT4YsxiHumr8jw2xP38mKeWkRK+Hk5mOLB5IWIEFs68U2IQjsyTLMRpkdeaI5z0qoMCouBzzJ3B+LzZscDxTgXj0mpP6YQVI6zRuajOQO2VMUHuW1HloA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXCCvxeS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF8FC4CEE7;
	Wed, 22 Oct 2025 21:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761168017;
	bh=Qex05TyDFGpumFQWkjJ8T6qWdmTsk4cOplsz9GD77Ho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RXCCvxeSmdPzOGSZV/M82L7MXS8Hk+QQEor1smPYZ2k4Izy41aLvRuNHDepoUHUTU
	 UyXyWpMCP1dYeWQiP7d9ztO9iSsHR/mfYsoBTaPq34aYbq/Hpaa3UK0F34N0Rl/JXS
	 HnDCf/IRjgggyO0aXmRbnIzAWIbuKCIqe7EMqq5P0q5mBQFhD7T4AT0w6T/y4Bf9WU
	 nIehxCfkeCeRjj2g7G8LmrVYIfjGril4oUXNerp5Rcl+xjRqoSh4mgrblQJDBKVLRA
	 j3lX3Pi6eTCR0lLlBQlXYzJvjI2NAyxb6NHLkx82EBOoRrLANyjYUXus5FfAWcOgWg
	 NT3FDMs6Qa/sw==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	David Disseldorp <ddiss@suse.de>,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Gang Yan <gang.yan@linux.dev>
Cc: Nicolas Schier <nsc@kernel.org>,
	Gang Yan <yangang@kylinos.cn>
Subject: Re: [PATCH, v2] kbuild: doc: improve KBUILD_BUILD_TIMESTAMP documentation
Date: Wed, 22 Oct 2025 23:20:07 +0200
Message-ID: <176116758392.2674526.14546491430146575647.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251017021209.6586-1-gang.yan@linux.dev>
References: <20251017021209.6586-1-gang.yan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 17 Oct 2025 10:12:09 +0800, Gang Yan wrote:
> This patch adds an example of how to set KBUILD_BUILD_TIMESTAMP to a
> specific date. Also, note that the provided timestamp is used for
> initramfs mtime fields, which are 32-bit and thus limited to dates
> between the Unix epoch and 2106-02-07 06:28:15 UTC. Dates outside this
> range will cause errors.
> 
> 
> [...]

Applied to kbuild-next, thanks!

[1/1] kbuild: doc: improve KBUILD_BUILD_TIMESTAMP documentation
      (indentation of code example adjusted)
      commit: 5cbfb4da7e063cb82b1ab044465aeff4542a436d

Please note that commit hashes might change in case of issues with
kbuild-next branch.

Best regards,
-- 
Nicolas


