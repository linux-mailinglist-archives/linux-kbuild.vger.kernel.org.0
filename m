Return-Path: <linux-kbuild+bounces-10345-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 991D5CE0268
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Dec 2025 22:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC7593032955
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Dec 2025 21:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D4524E4B4;
	Sat, 27 Dec 2025 21:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YvwXWJXq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B981266B6B;
	Sat, 27 Dec 2025 21:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766871570; cv=none; b=C4l6n6JJEZklwXECulRsMez6sUcKNGFhqi/0m7ErKcNgZt9eHjdh2yJ8tuhlMQ3Re49ktfBzhrA7bQ2syW1+fVAXCfWI9TkS1N2hBlTXFim1j9yvWvt6q6st9e9e1mtnZJe19gc8aXfSP/Z0Ag6TnUcfHJsQ4hosogIfBGK19AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766871570; c=relaxed/simple;
	bh=XvGJb1phF7xYj0g2IHqpolZd9uY1y0271uoQo+3iRyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B6h23ZBurXJEIAyr1ytx2yKA8NHN1s/NFKrNCYFipG1zQ5PpXuXu/zljmws/vcbeg9tyushWJErtnZUjbkoSogxGXmuDIf8/CuA7dGe21b2fTzRJZofVaRJtZhT8DrwNhx7IzflZVhaybugIBIG0uH6knMP0W0x5iObi93Li5Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YvwXWJXq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B744C4CEFB;
	Sat, 27 Dec 2025 21:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766871569;
	bh=XvGJb1phF7xYj0g2IHqpolZd9uY1y0271uoQo+3iRyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YvwXWJXqq+l87ml/MS8XyxngjZtVrhuRRi0d8fDdtTTp7AwUKR7/9qGeEh2D3W1Pp
	 /4TQ1GA9Peb3utc8WQy/1ZZTX7U5sj7acVzpgTx6X+4dlYNf3qLyWgr7QYU8USfW2Z
	 DMQEsJq6NvZ6Jx0aFJweal2XCv6MvnLGt+t+8Fn+JNfCI9/BbbYJXA9Dxj5132qmKf
	 jr2kj3BvVC1CqpPzJKAo6W5386NcOmcEd46hGOaJVscn55Zz8aX/QGoRiKQDVqz0Xo
	 XZYewPPrHXADL4VrlcV7h80FSNR13QapFSITodk9ejKQ8V85beofKmZrfEjIMUlpKs
	 7ykuys8ZXT23g==
From: Nicolas Schier <nsc@kernel.org>
To: linux-kbuild@vger.kernel.org,
	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: fix compilation of dtb specified on command-line without make rule
Date: Sat, 27 Dec 2025 21:10:13 +0100
Message-ID: <176686408088.98851.1612046725611900225.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251126100017.1162330-1-thomas.de_schampheleire@nokia.com>
References: <20251126100017.1162330-1-thomas.de_schampheleire@nokia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 26 Nov 2025 11:00:16 +0100, Thomas De Schampheleire wrote:
> Since commit e7e2941300d2 ("kbuild: split device tree build rules into
> scripts/Makefile.dtbs"), it is no longer possible to compile a device tree
> blob that is not specified in a make rule
> like:
>     dtb-$(CONFIG_FOO) += foo.dtb
> 
> Before the mentioned commit, one could copy a dts file to e.g.
> arch/arm64/boot/dts/ (or a new subdirectory) and then convert it to a dtb
> file using:
>     make ARCH=arm64 foo.dtb
> 
> [...]

Applied to kbuild-next, thanks!

[1/1] kbuild: fix compilation of dtb specified on command-line without make rule
      commit: b08fc4d0ec2466558f6d5511434efdfabbddf2a6
      https://git.kernel.org/kbuild/c/b08fc4d0ec24

Best regards,
-- 
Nicolas


