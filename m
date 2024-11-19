Return-Path: <linux-kbuild+bounces-4722-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F349D1E3D
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 03:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 719CEB23780
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 02:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EEB78C76;
	Tue, 19 Nov 2024 02:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gePzZ0ga"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6879F2D600;
	Tue, 19 Nov 2024 02:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731983253; cv=none; b=eFxypKC6/kRgv1TrvdljHJuSatpqsPxpcGGyP/vZOn4ejVJGpEvzGqw+akR8ql+gxyvLWk6nEJuTqc0bc8FJ1Qm60LJGeCYPWHl1ZDGGFE0Fldb6FPOSkJ+Pro0Azv13NvN0zxKt9xuwZJKB8FW+bFT4H9BMxn4g3PvFmlIQpPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731983253; c=relaxed/simple;
	bh=jNYt/5ZeoW2P4ANhdq3q4i2jFSD2rau/nCAIuD3cIvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMXHx40Zi5USYFlUmpsJe/PeuTItSvuHurgBgdbZc1LzxxzfGOsW01/gGZC4Tew0CAiSWrHbOiQkGwFcdhu96WmLYVmeyJW3WM2ybl1AM2GNaaZfhnz+maVFU7nnKUKsKahri5nIMXlJ5dxtuv7JYRTc9DZfYhJkuPd5IfwnJkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gePzZ0ga; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753E5C4CECC;
	Tue, 19 Nov 2024 02:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731983253;
	bh=jNYt/5ZeoW2P4ANhdq3q4i2jFSD2rau/nCAIuD3cIvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gePzZ0gabKPZ+qqCPIOGMXwAo6nek5SE7ORSZ8ZysMqtpy6qy3NJ/X0Ll6GDssV7w
	 NWhG35//ZkfM/ZUw3u7tagIcNFXZlBNrn9b3LQK8PB1L/wG8jQVzIIMEIYYvDcRcp9
	 L3pU5gNI5Ee4v/P25m5opGnZthoqTuOkXBzPRzU3k8sxin7ok/BzLmz633dwkxRu3C
	 9ZLtGzrRgetOsA7CTZYF1WoFcvKiZ3ms7tkc8CFqDS5rCa0Vb9Db9BUjuMJFxbXa0H
	 Zn23545NzGuHTnH9zYngmu61QO/aIt+9h5G9nEkipUn2Qd8JUP1CqdGZXRhsBB1PZu
	 AmDdc7WTCEe3g==
Date: Mon, 18 Nov 2024 19:27:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>,
	Borislav Petkov <bp@alien8.de>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Marco Elver <elver@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] kbuild: enable objtool for *.mod.o and additional
 kernel objects
Message-ID: <20241119022730.GA2908286@thelio-3990X>
References: <20241113234526.402738-1-masahiroy@kernel.org>
 <20241113234526.402738-3-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113234526.402738-3-masahiroy@kernel.org>

Hi Masahiro,

On Thu, Nov 14, 2024 at 08:45:22AM +0900, Masahiro Yamada wrote:
> Currently, objtool is disabled in scripts/Makefile.{modfinal,vmlinux}.
> 
> This commit moves rule_cc_o_c and rule_as_o_S to scripts/Makefile.lib
> and set objtool-enabled to y there.
> 
> With this change, *.mod.o, .module-common.o,  builtin-dtb.o, and
> vmlinux.export.o will now be covered by objtool.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

I am seeing some build failures when LTO is enabled with this change in
-next as commit d8d3f6c6690c ("kbuild: enable objtool for *.mod.o and
additional kernel objects").

  $ printf 'CONFIG_LTO_%s\n' NONE=n CLANG_THIN=y >kernel/configs/thinlto.config

  $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 mrproper {def,thinlto.}config all
  ...
  .vmlinux.export.o: warning: objtool: gelf_getehdr: invalid `Elf' handle
  make[4]: *** [scripts/Makefile.vmlinux:13: .vmlinux.export.o] Error 1
  ...

When LTO is enabled, these files are LLVM bitcode, not ELF, so objtool
can't process them:

  $ file .vmlinux.export.o
  .vmlinux.export.o: LLVM IR bitcode

Cheers,
Nathan

