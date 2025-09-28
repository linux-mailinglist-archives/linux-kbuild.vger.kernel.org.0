Return-Path: <linux-kbuild+bounces-8970-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88301BA705A
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Sep 2025 14:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E797179CF0
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Sep 2025 12:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6212E2D24B3;
	Sun, 28 Sep 2025 12:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r5v31OEz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B1934BA4D;
	Sun, 28 Sep 2025 12:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759061516; cv=none; b=cDn0WsWJudTrKg28I/mmqsSR6KiSVnPcV6Nf/k7QDgQ78eLXmMhbaLg75D6NyNcAXmMj998lXZApW37GRp962at9UfO1e/z6b+EKEiavCLxnaTYqmkrV9jLGqqKmkUoR9Z4DfxbCgWeet1bp/dqlcwzXTyNmjaWAH/6YT1Ezuuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759061516; c=relaxed/simple;
	bh=ibzRO4DmZCBci1lUCVJotBZ9F7l1ePVZDLi3RT2Vs0Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=R3zy/pU+rzN9DbsODLTmncTS948dpnL7h7x22vJh0NhVd6bbq0C9RY679qgwaKINi7SmMHFQXVTSEuX+OTrtL+blfENOeRasUUJrNS2RLhYPm8fCjnx68H5XTezZGnZEuij4Z89XzTM7ZHHAcGql+gqji1r4rkb9JIExreDTcbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r5v31OEz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFDBC4CEF0;
	Sun, 28 Sep 2025 12:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759061515;
	bh=ibzRO4DmZCBci1lUCVJotBZ9F7l1ePVZDLi3RT2Vs0Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r5v31OEzZSZkjgbMzCW9meb0N65t6nXZsU+a7tkXfexToTXgQEbcBvxjmepGNXZYl
	 JjgmJzj65IwzzLPGQINIfHlDtctzjXG/UVGwpImy4uN7u/JBuwGzyCI5Zzl0fPSjyu
	 xeBVpXDHTFi4ogoI/yVdab3g3mxEgKXbuws+ifB2c1lyZLOylE7bExsiKY3gNG0OvA
	 WWwIx5vVxo5xNDaYXy+F2ufayE+qZI3c35XEwlWMR7b2JmEd6SosDYonNIsLUvTmHq
	 eqycqNLC7CID7lJj6BEKNwZlwjwLm4SKfHakjmeSlrIvY9/S8VXHvM4D0AmclO5qQo
	 T1vzaVOBNrBLQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Hugh Dickins <hughd@google.com>
Cc: Alexey Gladkov <legion@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, Nicolas Shier <nsc@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <4590a243-0a7e-b7e6-e2d3-cd1b41a12237@google.com>
References: <4590a243-0a7e-b7e6-e2d3-cd1b41a12237@google.com>
Subject: Re: [PATCH next] modpost: Initialize builtin_modname to stop
 SIGSEGVs
Message-Id: <175906151390.2640739.5095902499304192973.b4-ty@kernel.org>
Date: Sun, 28 Sep 2025 08:11:53 -0400
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Sat, 27 Sep 2025 21:28:06 -0700, Hugh Dickins wrote:
> Segmentation fault ./scripts/mod/modpost -o vmlinux.symvers vmlinux.o
> stops the kernel build.  It comes when write_vmlinux_export_c_file()
> tries to buf_printf alias->builtin_modname.  malloc'ed memory is not
> necessarily zeroed.  NULL new->builtin_modname before adding to aliases.
> 
> 

Applied, thanks!

[1/1] modpost: Initialize builtin_modname to stop SIGSEGVs
      https://git.kernel.org/kbuild/c/2ea77fca84f07

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


