Return-Path: <linux-kbuild+bounces-8952-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D074B9AD61
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 18:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E01919C364C
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 16:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BFF631283E;
	Wed, 24 Sep 2025 16:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nh5uPide"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EF8191F89;
	Wed, 24 Sep 2025 16:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758730650; cv=none; b=rFIHDC07S33EbAtgUbV8m4ljkGZLnDPsi9MU1UpNz4nU+GWQ8WWFeCAh/U4K1oPG9Rt/6+13a3frsoeqH/63CXWuoO4d86qsq1P1l6NqPSoUkifk8haBBWHYBuVESfwcNWiD5Gu11dXmF/kCgtMWH5VXb4qGpOmPhaNB0LZtZwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758730650; c=relaxed/simple;
	bh=lFc7WZFyHZ2kDXSBgI5uw7/ckDVjfHIb98JLcLwjT3o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZwHc3rhm0thG6Zk5B6idK8kd3WOBJkzQVYYjTKUzVGjuEVT7q3bQlGPRoqClu9dtOfCQcp/vT9Z7ZeEeoNmB1jNMOofHAI6dI0KjaxwxGF6VwZewnzQ3GZCAZ5oWtzLdBk+XKX7ZNkF360VlH4BM/CJBKRSxNe1AMJJYruvZXys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nh5uPide; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD76C4CEF7;
	Wed, 24 Sep 2025 16:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758730649;
	bh=lFc7WZFyHZ2kDXSBgI5uw7/ckDVjfHIb98JLcLwjT3o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nh5uPideomEd4WhMMbS/FPthFE5xriXjfbSEbr7Bw2siJxaYPOGfmLCaXDrEAK7dM
	 SvKTevswIzlOIRsOsvFahj9FeJL5RQjo2B7ZxuEVO1Zd7fvOmDEGoVhxPGzJeCZ0ec
	 GgYyFXScleamUok6oRNY1qgox0EF3eRWd0RMq3kOSqZwKxpQ9d2TyQfVbVmjSvMTD2
	 9KKij0M6jI83SjrNKEW91yym43bmOUJFfE0JgaXIxiQEn/5JEc1XHLRDfvMmSXOV1Y
	 8NQlZING9z6NBkLA5iNYmZtz5r+/ggrmUdUTZ0fk/kx5iINQGLC5S0ozfWhYwSkO+4
	 PDG4vL5OyKP6Q==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Petr Pavlu <petr.pavlu@suse.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Alexey Gladkov <legion@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kbuild@vger.kernel.org
In-Reply-To: <cover.1758182101.git.legion@kernel.org>
References: <cover.1758182101.git.legion@kernel.org>
Subject: Re: [PATCH v8 0/8] Add generated modalias to
 modules.builtin.modinfo
Message-Id: <175873064730.2295881.4958403315180215995.b4-ty@kernel.org>
Date: Wed, 24 Sep 2025 09:17:27 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Thu, 18 Sep 2025 10:05:44 +0200, Alexey Gladkov wrote:
> The modules.builtin.modinfo file is used by userspace (kmod to be specific) to
> get information about builtin modules. Among other information about the module,
> information about module aliases is stored. This is very important to determine
> that a particular modalias will be handled by a module that is inside the
> kernel.
> 
> There are several mechanisms for creating modalias for modules:
> 
> [...]

Applied, thanks!

[1/8] s390: vmlinux.lds.S: Reorder sections
      https://git.kernel.org/kbuild/c/8d18ef04f940a
[2/8] kbuild: always create intermediate vmlinux.unstripped
      https://git.kernel.org/kbuild/c/0ce5139fd96e9
[3/8] kbuild: keep .modinfo section in vmlinux.unstripped
      https://git.kernel.org/kbuild/c/3e86e4d74c049
[4/8] kbuild: extract modules.builtin.modinfo from vmlinux.unstripped
      https://git.kernel.org/kbuild/c/39cfd5b12160b
[5/8] scsi: Always define blogic_pci_tbl structure
      https://git.kernel.org/kbuild/c/b88f88c26705a
[6/8] modpost: Add modname to mod_device_table alias
      https://git.kernel.org/kbuild/c/83fb49389bbe0
[7/8] modpost: Create modalias for builtin modules
      https://git.kernel.org/kbuild/c/5ab23c7923a1d
[8/8] kbuild: vmlinux.unstripped should always depend on .vmlinux.export.o
      https://git.kernel.org/kbuild/c/3328d39a8dca2

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


