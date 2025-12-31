Return-Path: <linux-kbuild+bounces-10386-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D702ACEAF7C
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 01:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BCE43018316
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 00:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BB0199385;
	Wed, 31 Dec 2025 00:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHB3jVKB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAB3131E49;
	Wed, 31 Dec 2025 00:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767141061; cv=none; b=GWcHRnIHWbOhBpTo02yQ1i/BLXqXEqm6i3cSw6dv6FEdvN/J62XIaKAjyIiHFYvwkXmN7KlJo/GQG1RSLZzSTv41FDsiuNMCVcz3crWr/AFM0DR2N+yNGdQL0gPyj9HgBX2NErYR6xfluIdzWhgBKTMzaU3/4PBfUKibFxubDAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767141061; c=relaxed/simple;
	bh=8DsH0rZ65Z/UvLa0nkE/G0G86Zhg6WQwFd0CWhDEEr4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DkoJnCfeVHb4PeSOf0/0PWdP99J6F83f2X2z4ajTbUHgz+1oboERhyDOiNP0K3XKhGRFZpx8ZRCzGfu9Nu37q/sYIVRTXWuMcttpmVKIMpLkWrtTyiUXJu5Ck+xVK1brdIl/MAokutPZzrKvwR4eKnhvQvQ7HY4W5/0WVT7Dbuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHB3jVKB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83EE7C4CEFB;
	Wed, 31 Dec 2025 00:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767141061;
	bh=8DsH0rZ65Z/UvLa0nkE/G0G86Zhg6WQwFd0CWhDEEr4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nHB3jVKBI/qdutZRMky1723rGYNqEZBnM9repl3u0BSnOdTSfw21E1nRpx3Fwxyah
	 2UulhTlgxx+zDZUXEKwa91QXux23JUAcTUd+8QCwXxIK6TWm+hXXyXmIdvZkmmy+E6
	 UCzGzuvQBIuhgMGnnfAyF6amxPCGLV37giEORUbcd5Ry45qOX9Ddjy9pmgGjLV01DW
	 u+7sAxTrgRftwmoBug48O2o4VA4etzCOyMQnoxnAlzf79/LkSr22s9h0V2z0qwW+1g
	 uJ6yhNwWi7zRbnnCMT5qhBN4qElD0YUVNKg7Vey5S+AyNe5vvWHJp0YMgqTinR15JU
	 PneD5jgKIfZog==
Date: Tue, 30 Dec 2025 17:30:57 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Nathan Chancellor <nathan@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
    Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
    Han Gao <gaohan@iscas.ac.cn>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
    stable@vger.kernel.org
Subject: Re: [PATCH] riscv: boot: Always make Image from vmlinux, not
 vmlinux.unstripped
In-Reply-To: <20251230-riscv-vmlinux-not-unstripped-v1-1-15f49df880df@iscas.ac.cn>
Message-ID: <28f873a5-6e9e-f2d3-9eb3-587745705eca@kernel.org>
References: <20251230-riscv-vmlinux-not-unstripped-v1-1-15f49df880df@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Dec 2025, Vivian Wang wrote:

> Since commit 4b47a3aefb29 ("kbuild: Restore pattern to avoid stripping
> .rela.dyn from vmlinux") vmlinux has .rel*.dyn preserved. Therefore, use
> vmlinux to produce Image, not vmlinux.unstripped.
> 
> Doing so fixes booting a RELOCATABLE=y Image with kexec. 

Thanks, queued for v6.19-rc.


- Paul

