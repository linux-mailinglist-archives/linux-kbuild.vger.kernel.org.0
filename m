Return-Path: <linux-kbuild+bounces-9040-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC07BC2339
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 18:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D0BB1897B06
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 16:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA73A2E8E0C;
	Tue,  7 Oct 2025 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhazKTvw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816672E8E05;
	Tue,  7 Oct 2025 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759856158; cv=none; b=nMcme9l+EPcgKWEucsViDFkX4fE3TfZi9DGLefzudO/r98pocZLRhi9MVqpaoDmA7I/1qDtBWq7gD4pWOszaKJev54BzG5AO4LXLL5TzJrDJhigbsFE1bu/UwefgIT4pWUnFNHwGNAoEpIbL77roECR1TLtg7PxkAPYrYerKiz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759856158; c=relaxed/simple;
	bh=C0cjztWTADyyBdZgUOa02WdX0ZCVRGzguRfgCOfCmIY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mgWJW1BjlMqdT56K8Ij7Fx7TeHRj8NFef5mg5EBAZ5TDbb/scS/hwxxOcPbNPd+XkrlzMP3N43hPXSha3GPU+B75SLFufvq3wjM9ptQZOEXsNnhNMCcD5E/aeAmMCJK7F3MahtVWFPnU6/jnw0kf/aiG8MLLpW5QCy8L9HitwB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rhazKTvw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD65CC4CEFE;
	Tue,  7 Oct 2025 16:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759856158;
	bh=C0cjztWTADyyBdZgUOa02WdX0ZCVRGzguRfgCOfCmIY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rhazKTvwUohncUuS4E2mORWzaUVNQ7d0uNWoFjyGW6kgy6pBOKJw8Qb7HK6gdhlxl
	 EE9fzFP1MCFBmVshfR9DmtHlGSSmag9FpzSxv9HT2wT2zz0AVbURD6TZmyilNVxrFF
	 5I8BKJF8TBAQhyvBmPT5LQjmwDeUJNzA+tW079All4X0dWcxLxqMOw5pkjketLFITu
	 U3vs+ZLONroQztm55EZHHrF+xnSC/32gTyYLyUg42kJSsxbCGn+8dmn+NVe/QzDyDK
	 rc9UNYl/XkSvx30y3mguL1VDj0soPkLIU1mgcg6CHL0HwjQWjxFky0gZmbNDzfV5CN
	 s2tI2JxQidLiA==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, David Disseldorp <ddiss@suse.de>, 
 Dmitry Safonov <0x7f454c46@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nsc@kernel.org>
In-Reply-To: <20251007-gen_init_cpio-pipe-v2-1-b098ab94b58a@arista.com>
References: <20251007-gen_init_cpio-pipe-v2-1-b098ab94b58a@arista.com>
Subject: Re: [PATCH v2] gen_init_cpio: Ignore fsync() returning EINVAL on
 pipes
Message-Id: <175985615642.1365513.6759583402363005234.b4-ty@kernel.org>
Date: Tue, 07 Oct 2025 09:55:56 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Tue, 07 Oct 2025 04:46:47 +0100, Dmitry Safonov wrote:
> The reproducer:
> echo | ./usr/gen_init_cpio /dev/stdin > /dev/null
> 
> fsync() on a pipe fd returns -EINVAL, which makes gen_init_cpio fail.
> Ignore -EINVAL from fsync().
> 
> 
> [...]

Applied, thanks!

[1/1] gen_init_cpio: Ignore fsync() returning EINVAL on pipes
      https://git.kernel.org/kbuild/c/38492c5743f8b

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


