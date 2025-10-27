Return-Path: <linux-kbuild+bounces-9288-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 37546C119D6
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Oct 2025 23:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A51B14F52F7
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Oct 2025 22:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543F5328B73;
	Mon, 27 Oct 2025 22:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfTJ+Z7I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA9F328627;
	Mon, 27 Oct 2025 22:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761602760; cv=none; b=H9Y/E+4jDLvBcRcuxwRj68voYKAhOgzbGXaj3HN8DQTiklSs6aC2kVdKnvwV8IAWWxom/BP+HbMJSTLCByT19GWk51Xysj4hf9c8cCBO0ZzoVRLSHViKsaxPrmb4ArxbEdB346fnZaMPFULwsaSootHvdJSaMirRWfjeLDNloDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761602760; c=relaxed/simple;
	bh=NWOobQrN/SWWEQbE94p5Q3NBEbr+1fRps0CEyyIa9NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OheoOFv9Vo2ekfYXoXg0ps9p7zLQfvLBdy7VYpPaCDKD8oMEusORpK39AHpheqgh3vYB/+v2wriaiO0dPV13P4ZJWOnr9uY1F39zEM3nngcWhaG5SPYXG052n3U9inydUhzy1xRXy0r8FgXfsJu5ECGYWdGemlU2Nh6GDI5YK2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfTJ+Z7I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCCAC4CEF1;
	Mon, 27 Oct 2025 22:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761602759;
	bh=NWOobQrN/SWWEQbE94p5Q3NBEbr+1fRps0CEyyIa9NQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dfTJ+Z7IrEERjK25NOFLlX+5bmFNEVpgyk/Y1ELBp2lVjckr4WtHD43rFkM29Druj
	 LszesxKwjXaqjJiC0b3JRlwDM3VpMd7rUMUCn4cHhX9TLGkMGyJCt84+upytUP4Zfi
	 q8gUAX4p7uXZz6AvZQyiR+xd2kPt7evbSM8xBdJhGKajU0w01BMpHPH440ZK7M3gPu
	 zAQC31bcU5373YhXF7M9gBRK0t0mPnvGW202nra8mht0ymFLMGvWQ6eCP33vtj5C4N
	 sZLCqkoYswiul3mHNkd8P8E8WtTpawI4QUq59lyN6JY1I2e0l0+OGeVD/ZPa2rKLZm
	 0cjxqcJ/QzW3A==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] kbuild: Rename Makefile.extrawarn to Makefile.warn
Date: Mon, 27 Oct 2025 22:59:28 +0100
Message-ID: <176160225481.2834943.9284627955715309233.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251023-rename-scripts-makefile-extrawarn-v1-1-8f7531542169@kernel.org>
References: <20251023-rename-scripts-makefile-extrawarn-v1-1-8f7531542169@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 23 Oct 2025 22:01:36 +0200, Nathan Chancellor wrote:
> Since commit e88ca24319e4 ("kbuild: consolidate warning flags in
> scripts/Makefile.extrawarn"), scripts/Makefile.extrawarn contains all
> warnings for the main kernel build, not just warnings enabled by the
> values for W=. Rename it to scripts/Makefile.warn to make it clearer
> that this Makefile is where all Kbuild warning handling should exist.
> 
> 
> [...]

Applied to kbuild-next, thanks!

[1/1] kbuild: Rename Makefile.extrawarn to Makefile.warn
      https://git.kernel.org/kbuild/c/24722b62

Please note that commit hashes might change in case of issues with
kbuild-next.

Best regards,
-- 
Nicolas


