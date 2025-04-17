Return-Path: <linux-kbuild+bounces-6669-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C08D3A911CA
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Apr 2025 04:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 731167ADF1B
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Apr 2025 02:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE963185935;
	Thu, 17 Apr 2025 02:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ts/SLQAU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9819E42A97
	for <linux-kbuild@vger.kernel.org>; Thu, 17 Apr 2025 02:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744858506; cv=none; b=ts4Wm1L87Vvee9KXnrrQgAT4q0CBl7TrhjvlAW+AzmofLolPJKjffFlWbis0Them6nrwYydcu36HHWDOfH6yZylQ0BPDhJhbtQVAmzwRAVM9CqZZai27ZOerslodeifxOtrfsZlhQObM2csKGc76OlCm8j2+STTpk12WbPRJoKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744858506; c=relaxed/simple;
	bh=wmv45zFm4oGr2IbMwl2C+kyM3bmgROv3QIJkNynYY10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J6fcoeLr/ipwf28oPZFjeoIPiwwnPenDgmAcYG3Co+6mxCHQgqWveymhwF7g/4gaFd9KankRdmO3Vh8157UKjfZlQQvCLYluftTSkSttwOmt+lp4/H3m4PBk9vcDhdR87RlVvSkF4zsl3NMGiUGM98h8Axi73AtH8bXlRECN3Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ts/SLQAU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4CBC4CEE2;
	Thu, 17 Apr 2025 02:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744858506;
	bh=wmv45zFm4oGr2IbMwl2C+kyM3bmgROv3QIJkNynYY10=;
	h=Date:From:To:Cc:Subject:From;
	b=Ts/SLQAUIMAXAlwslybQtb8yzb+xjLT5UhfirWMDLiRCC9QLTZF1DPsWu58TZ9QK9
	 8jXXHY5wPAKrDT+i7O8+2DpLYCWVDHRUbhS670IsaLevpcxZ8ix+e3jw2tVttGUYLU
	 1+D8/7VuNtbQQRpZvmdZaXgmJl6i1OeTDWtVi/8aWxDru6UFdumuvQmz33qI9vaIZ3
	 on148WNtcYgQv50DOjyyC6/oOHiGXQlNdbesuLMuzdrdZs4oniueFyOd1Bxo9BtjJH
	 bZjo5D00a2u7MUqjZwlMPVIdxrYjyP30wH5rAfHcWariijKVpYcMvsA5hvJjojTC94
	 GfrbWNCCUAnDQ==
Date: Wed, 16 Apr 2025 19:55:02 -0700
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Subject: how to create early build deps?
Message-ID: <202504161928.17A90D9B@keescook>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

I am stumped...

I swear there was a time when changing the gcc-plugins would trigger a
full rebuild of all kernel sources. I tried to bisect where that stopped
happening, but it went back far enough that things stopped building with
my compiler at all. ;)

Anyway, I need this also for the Clang randstruct seed file -- if it
changes, we need to rebuild everything. I thought this worked back in
v5.19 when I moved the randstruct seed generation into scripts/basic[1],
but regenerating it doesn't trigger a rebuild (with v5.19 nor current
Linus nor linux-next):

$ make O=clang-all LLVM=1 allmodconfig kernel/seccomp.o
make[1]: Entering directory '/srv/code/clang-all'
...
  GENSEED scripts/basic/randstruct.seed
...
  CC      kernel/seccomp.o
make[1]: Leaving directory '/srv/code/clang-all'

$ rm clang-all/scripts/basic/randstruct.seed

$ make O=clang-all LLVM=1 kernel/seccomp.o
make[1]: Entering directory '/srv/code/clang-all'
  GEN     Makefile
  GENSEED scripts/basic/randstruct.seed
  DESCEND objtool
  CALL    ../scripts/checksyscalls.sh
  INSTALL libsubcmd_headers
make[1]: Leaving directory '/srv/code/clang-all'

kernel/seccomp.o doesn't get rebuilt :(

By what mechanism can I convince kbuild to rebuild everything if
randstruct.seed (or the gcc-plugins) are changed?

Thanks!

-Kees

[1] be2b34fa9be3 ("randstruct: Move seed generation into scripts/basic/")

-- 
Kees Cook

