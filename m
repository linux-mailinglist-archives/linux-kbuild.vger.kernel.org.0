Return-Path: <linux-kbuild+bounces-8961-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51439B9EF58
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Sep 2025 13:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35E9F1BC568F
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Sep 2025 11:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148822FB96C;
	Thu, 25 Sep 2025 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OeapiVtt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5F21B21BD;
	Thu, 25 Sep 2025 11:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758800577; cv=none; b=AHPvt0ckWqYGSASi3jMWq3HrgnxlzYA7z4VNcSHy0RRebgoT/gMw/na510nTBsZ/R8V7PmT0+v3MiVEOLmO/nR546zsGCjgNT1JfzjPzyp/r5EPYtrNpDrwxvELrljD4wiwpSVilrQsO/GlHkdce8/9B/EAki1ZtEhnqcR6pTnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758800577; c=relaxed/simple;
	bh=T8mhunrHqaBHBtDAFTetyBc2k1+FyYRSUQqQkX1ZnuE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CYsshh2arJBLYoyWaDGihBz6p2S85oinYmYk/YRIS8LFzSpsSgIUJIxOYzCsbnebEWj5sg3fwApLRctj7JRt/lt8bsvrnXo0JoGhl9PCnSFlTjduy+MatlJ/IN7AXBghkZ2WtSFlpzK/xCtO+5iDnID40n+RvRaJ/h7ulYcs55c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OeapiVtt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C27C4CEF0;
	Thu, 25 Sep 2025 11:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758800576;
	bh=T8mhunrHqaBHBtDAFTetyBc2k1+FyYRSUQqQkX1ZnuE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OeapiVtt6MPXQelJPYeJd7H1YOpKUIXZpXCNniH2RLp8uI4qy0im3rbuqSulswdQM
	 KzGUDR6m2cOFl0OCy4y6y67YKSJ+27et5iwlruxPCCRUDsXqS6AnLxG30NkFVo3ntF
	 uanFRC9LVLIbFzc/G9EXWdfA6Zd4ogTI8YWrUN6ve2SU6ACrD8CD+u9PT1dTDe4Sqa
	 BqWcKO9t33d9dGVAnuUYCPz/PYMmnyDMp01FljJ4a/VQPHap5Tn8VLYVsQL74w0L34
	 IXearPRPpvRAfE+8ZqyMXM2Aw5WFZ1H3GfY+TRfUisE82Pjp2mR0yMbCaSB5WYZJWj
	 pSKMHm846/FhA==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Nicolas Schier <nsc@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Ben Hutchings <ben@decadent.org.uk>, 
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250924-kbuild-doc-config-debug-efi-in-reproducible-builds-v2-1-d2d6b9dcdb7d@kernel.org>
References: <20250924-kbuild-doc-config-debug-efi-in-reproducible-builds-v2-1-d2d6b9dcdb7d@kernel.org>
Subject: Re: [PATCH v2] Documentation: kbuild: note CONFIG_DEBUG_EFI in
 reproducible builds
Message-Id: <175880057422.1320628.16389655105458984135.b4-ty@kernel.org>
Date: Thu, 25 Sep 2025 04:42:54 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Wed, 24 Sep 2025 21:47:58 +0200, Nicolas Schier wrote:
> CONFIG_EFI_DEBUG embeds absolute file paths into object files, which
> makes the resulting vmlinux specific to the build environment.
> 
> Add a note about this in reproducible-builds.rst
> 
> 

Applied, thanks!

[1/1] Documentation: kbuild: note CONFIG_DEBUG_EFI in reproducible builds
      https://git.kernel.org/kbuild/c/37fac070eb1e5

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


