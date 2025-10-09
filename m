Return-Path: <linux-kbuild+bounces-9061-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C577EBC81EA
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Oct 2025 10:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB8BA18861F1
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Oct 2025 08:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6426A2D1F44;
	Thu,  9 Oct 2025 08:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2/7XxzM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34196241CB7;
	Thu,  9 Oct 2025 08:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759999739; cv=none; b=ZsDiRFJJ1CbVwUphlhMfN37ynbavjJqhvkmmF8WiFLokBtqjy/uo3WnExD54fOn5n/v0NAT6H8NhBEawDsWyDSMMd+PdVIjNDIZCTep7GaZxeyfWz4QXIdZsPQhU/KCM6ffHayqikz5Nz2lk9T5S6CQ07Hq9GoWZ6Bn8HH4n46k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759999739; c=relaxed/simple;
	bh=XcVzGEG7wl6bThfY5lOeGukSt2PGXHScZ9EbqkTi7js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJ1pVYi6ZupmW6+RlWn0ehP14rtLeFD+gKNoKmG9VqG0rGzAbz/gybmFb/tagGvN8QF0mPpnVD8xbk+Bk8qZ/qP87XcwcLUvsjPjlDhGiPSy0gn/QGTcodwACNeOcBO1x5BGtzUleNCP7w/CMv5nh5NGBtoKhId1sOIEmxyWiwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2/7XxzM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EAFC4CEE7;
	Thu,  9 Oct 2025 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759999738;
	bh=XcVzGEG7wl6bThfY5lOeGukSt2PGXHScZ9EbqkTi7js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e2/7XxzM1HLb+pyFzIpz+xZ0yy4SzrCmR7PDLo6q1mnriFsw1HUFajJmocPwXS5ZZ
	 ZwbNoMLUWfNRG6i76FGSUpdGIsEllwR3JB/la68MYg2F3B6TAoqbwu90oMDLgNwJvb
	 n5CJpL4FIqyV27qYqN/QYDPDYIexuMVMjaZxSJ5k7QbOJykcjKT1NA5hklrmFTASwP
	 5FIN6F0iWwPE9g7p+jffU+4BEKaoh+eEcFXGMpuwYMRE1rlIObNag63WaFsxK10IdX
	 7sMkSAm5BVR4Z4+JiswasTUIe7DmJT4spXt8LRlO+Kgx3ZsFEMPVuFVQZiM6SzRlp9
	 muaHoPZlQEiKA==
Date: Thu, 9 Oct 2025 10:48:45 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Askar Safin <safinaskar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	regressions@lists.linux.dev, nathan@kernel.org,
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
	ojeda@kernel.org, sam@gentoo.org, thomas.weissschuh@linutronix.de,
	Daniel Xu <dxu@dxuuu.xyz>
Subject: Re: [REGRESSION][BISECTED] kbuild: CFLAGS=-w no longer works
Message-ID: <aOd27ViaWbsdwNDR@levanger>
References: <20251009075149.1083040-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009075149.1083040-1-safinaskar@gmail.com>

On Thu, Oct 09, 2025 at 10:51:49AM +0300, Askar Safin wrote:
> #regzbot introduced: d1d0963121769d8d16150b913fe886e48efefa51
> 
> As well as I understand, if you want to disable warnings, you
> should pass "CFLAGS=-w" to "make". Starting with d1d096312176,
> this no longer works.
> 
> Steps to reproduce:
> 
> $ cd linux
> $ git clean -f -q -d -x  # To clean everything not controlled by git
> $ echo 'CONFIG_64BIT=y' > /tmp/minimini
> $ make allnoconfig KCONFIG_ALLCONFIG=/tmp/minimini
> $ make -j32 CFLAGS=-w

If you want to hand-over additional CFLAGS to kbuild you need to use
KCFLAGS or other variations, see Documentation/kbuild/kbuild.rst.
When I intentionally introduce a warning in e.g. init/main.c, I can
suppress the compiler warning by calling

    make KCFLAGS=-w

Your log output below does not contain any warning, so I assume that you
actually want to point to something different.


[...]
>   CC      /rbt/linux/tools/objtool/libsubcmd/exec-cmd.o
>   CC      /rbt/linux/tools/objtool/libsubcmd/help.o
>   CC      /rbt/linux/tools/objtool/libsubcmd/pager.o
>   CC      /rbt/linux/tools/objtool/libsubcmd/parse-options.o
>   CC      /rbt/linux/tools/objtool/libsubcmd/run-command.o
>   CC      /rbt/linux/tools/objtool/libsubcmd/sigchain.o
>   CC      /rbt/linux/tools/objtool/libsubcmd/subcmd-config.o
> exec-cmd.c:2:10: fatal error: linux/compiler.h: No such file or directory
>     2 | #include <linux/compiler.h>
>       |          ^~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[5]: *** [/rbt/linux/tools/build/Makefile.build:86: /rbt/linux/tools/objtool/libsubcmd/exec-cmd.o] Error 1
> make[5]: *** Waiting for unfinished jobs....
> parse-options.c:2:10: fatal error: linux/compiler.h: No such file or directory
>     2 | #include <linux/compiler.h>
>       |          ^~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[5]: *** [/rbt/linux/tools/build/Makefile.build:86: /rbt/linux/tools/objtool/libsubcmd/parse-options.o] Error 1
> In file included from sigchain.c:3:
> subcmd-util.h:8:10: fatal error: linux/compiler.h: No such file or directory
>     8 | #include <linux/compiler.h>
>       |          ^~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[5]: *** [/rbt/linux/tools/build/Makefile.build:86: /rbt/linux/tools/objtool/libsubcmd/sigchain.o] Error 1
>   MKELF   scripts/mod/elfconfig.h
> In file included from help.c:12:
> subcmd-util.h:8:10: fatal error: linux/compiler.h: No such file or directory
>     8 | #include <linux/compiler.h>
>       |          ^~~~~~~~~~~~~~~~~~
> compilation terminated.
>   HOSTCC  scripts/mod/modpost.o
> make[5]: *** [/rbt/linux/tools/build/Makefile.build:85: /rbt/linux/tools/objtool/libsubcmd/help.o] Error 1
>   HOSTCC  scripts/mod/sumversion.o
> In file included from run-command.c:11:
> subcmd-util.h:8:10: fatal error: linux/compiler.h: No such file or directory
>     8 | #include <linux/compiler.h>
>       |          ^~~~~~~~~~~~~~~~~~
> compilation terminated.
>   HOSTCC  scripts/mod/symsearch.o
> make[5]: *** [/rbt/linux/tools/build/Makefile.build:85: /rbt/linux/tools/objtool/libsubcmd/run-command.o] Error 1
>   UPD     scripts/mod/devicetable-offsets.h
>   HOSTCC  scripts/mod/file2alias.o
> make[4]: *** [Makefile:78: /rbt/linux/tools/objtool/libsubcmd/libsubcmd-in.o] Error 2
> make[3]: *** [Makefile:83: /rbt/linux/tools/objtool/libsubcmd/libsubcmd.a] Error 2
> make[2]: *** [Makefile:73: objtool] Error 2
> make[1]: *** [/rbt/linux/Makefile:1430: tools/objtool] Error 2
> make[1]: *** Waiting for unfinished jobs....

This is reproducible on my machine:

    make -C tools objtool CFLAGS=-w

But is doesn't matter which CFLAGS you add here, as they overwrite
objtool's include paths.

According to tools/build/Documentation/Build.txt you should use
different variables for everything below tools/, e.g.:

    make -C tools objtool CFLAGS_objtool=-w

Does this help for your specific issue?

Kind regards,
Nicolas

