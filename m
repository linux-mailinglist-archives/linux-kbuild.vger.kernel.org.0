Return-Path: <linux-kbuild+bounces-3725-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD3C984F82
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 02:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53F17B23288
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 00:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06834A18;
	Wed, 25 Sep 2024 00:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mebeim.net header.i=@mebeim.net header.b="M8937kgP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from h7.fbrelay.privateemail.com (h7.fbrelay.privateemail.com [162.0.218.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70739DDA0;
	Wed, 25 Sep 2024 00:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.0.218.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727224747; cv=none; b=Pm14Dy/ezKcbiQdRlrz+7vrMyDVqn54mRmC+QpdZlkaQMdADMIsP+Bc3d4Fq8m31hBXmfPZ2Q3iuFSdj0V6gAye/ih2zTIl8nuts47Oj6c9ZqUsKStF9tH/Opfx2gshYpgZi1LNrqhzlVOBtN5WYFKwOUNGScNMDzhKpImkOst8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727224747; c=relaxed/simple;
	bh=oiB2mcGrcocAEq3HAn+Q7QNtNCJCcr6lELuaQWXoVn4=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=WYuxyeWeFJHkvu3nmn+F37fj3modefnKQziEEMQqCloCHpRQm5MCC2aimkh/Icbfj3H2ERiKZmUwdRLh4phVIokPAKI+5xnRFkXxJGYfg5Fk5Zfl8NiXFn7DxYSw5NMLSMoJh2OQlurEF5HJcRNXIfbkoWJsGeTKJUvLaOzUsT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mebeim.net; spf=pass smtp.mailfrom=mebeim.net; dkim=pass (2048-bit key) header.d=mebeim.net header.i=@mebeim.net header.b=M8937kgP; arc=none smtp.client-ip=162.0.218.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mebeim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mebeim.net
Received: from MTA-13-4.privateemail.com (mta-13-1.privateemail.com [198.54.122.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 07A02607F2;
	Tue, 24 Sep 2024 20:28:56 -0400 (EDT)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
	by mta-13.privateemail.com (Postfix) with ESMTP id 7B67B18000BD;
	Tue, 24 Sep 2024 20:28:48 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mebeim.net; s=default;
	t=1727224128; bh=oiB2mcGrcocAEq3HAn+Q7QNtNCJCcr6lELuaQWXoVn4=;
	h=Date:From:To:Cc:Subject:From;
	b=M8937kgPY1yMipiviPuJgl5avh38gzzVf4zgax66fhLCHf7gAnzWj2IcZbFiBUzGj
	 F4+JS1OyBmmrvA5qprXjHOXkALqN7X38VOa811EuoHwoD/0SYcUWhHdirePndPghBn
	 mIMxq1VNYcDgV+MIf7dWdtHk9cuGtsMJ76FOi+T6191GGNTMU7es8xGdXa2OIb8fEI
	 qtpq7Vhq41GK2LegJK7cIWRGyxRPwCO/WGxNw3G7XeigMjRY4IDS6xf00BtICixD9Y
	 XE8KxBVT8CONFWSZqCpKbKzOrN7gLvxdxBAhm1SQn1/wVY0AiNGYHYEgPUjw3cpOpr
	 uBdGC5tV13Q6g==
Received: from APP-16 (unknown [10.50.14.240])
	by mta-13.privateemail.com (Postfix) with ESMTPA;
	Tue, 24 Sep 2024 20:28:46 -0400 (EDT)
Date: Wed, 25 Sep 2024 02:28:46 +0200 (CEST)
From: Marco Bonelli <marco@mebeim.net>
To: "masahiroy@kernel.org" <masahiroy@kernel.org>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <1763151587.3581913.1727224126288@privateemail.com>
Subject: Broken Kconfig scripts in v6.11: conf/mconf stuck in endless loop
 at 100% CPU
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev67
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP

I was building v6.11 for PowerPC when I noticed that `make olddefconfig` hangs
indefinitely when running `scripts/kconfig/conf` and gets stuck in what seems
an infinite loop at 100% CPU while evaluating an expression.

The issue is still present on master of linux-next. I did a bisect run and
narrowed it down to this commit:

	f79dc03fe68c79d388908182e68d702f7f1786bc kconfig: refactor choice value calculation

Steps to reproduce:

	git checkout v6.11
	export ARCH=powerpc CROSS_COMPILE=powerpc-linux-
	make distclean
	make ppc64_defconfig
	./scripts/config --file .config -d PPC64
	make olddefconfig
	# Hangs indefinitely running scripts/kconfig/conf

The same outcome can be achieved with:

	git checkout v6.11
	export ARCH=powerpc CROSS_COMPILE=powerpc-linux-
	make distclean
	make ppc64_defconfig
	make menuconfig
	# Manually disable PPC64 by unchecking "64-bit kernel", save and exit
	# Hangs indefinitely running scripts/kconfig/mconf

Not sure what exactly is causing the issue as I am not familiar with these
tools, but it seems to me that conf/mconf get stuck endlessly evaluating an
expression.

Here is a stack trace after re-compiling with HOSTCFLAGS="-O0 -g" and attaching
to the `conf` process with GDB. It looks like the last sym_calc_choice() at
frame #4 never returns.

	#0  0x0000557bc97287cd in expr_calc_value (e=0x557bcb812800) at scripts/kconfig/expr.c:1012
	#1  0x0000557bc972880e in expr_calc_value (e=0x557bcb8127e0) at scripts/kconfig/expr.c:1017
	#2  0x0000557bc9728823 in expr_calc_value (e=0x557bcb8127a0) at scripts/kconfig/expr.c:1018
	#3  0x0000557bc9732a67 in sym_calc_visibility (sym=0x557bca6692e0) at scripts/kconfig/symbol.c:211
	#4  0x0000557bc9732db3 in sym_calc_choice (choice=0x557bca669040) at scripts/kconfig/symbol.c:299
	#5  0x0000557bc9733384 in sym_calc_value (sym=0x557bca66bb10) at scripts/kconfig/symbol.c:457
	#6  0x0000557bc97287ec in expr_calc_value (e=0x557bcb80e710) at scripts/kconfig/expr.c:1014
	#7  0x0000557bc9728886 in expr_calc_value (e=0x557bcb80e6f0) at scripts/kconfig/expr.c:1025
	#8  0x0000557bc9728823 in expr_calc_value (e=0x557bcb80e670) at scripts/kconfig/expr.c:1018
	#9  0x0000557bc972885f in expr_calc_value (e=0x557bcb80e630) at scripts/kconfig/expr.c:1022
	#10 0x0000557bc9732a67 in sym_calc_visibility (sym=0x557bca66d970) at scripts/kconfig/symbol.c:211
	#11 0x0000557bc97332f3 in sym_calc_value (sym=0x557bca66d970) at scripts/kconfig/symbol.c:443
	#12 0x0000557bc97287ec in expr_calc_value (e=0x557bcc6a6cf0) at scripts/kconfig/expr.c:1014
	#13 0x0000557bc9728823 in expr_calc_value (e=0x557bcc6a6cb0) at scripts/kconfig/expr.c:1018
	#14 0x0000557bc9728823 in expr_calc_value (e=0x557bcc6a6bd0) at scripts/kconfig/expr.c:1018
	#15 0x0000557bc9732a67 in sym_calc_visibility (sym=0x557bcb6cf0e0) at scripts/kconfig/symbol.c:211
	#16 0x0000557bc97332f3 in sym_calc_value (sym=0x557bcb6cf0e0) at scripts/kconfig/symbol.c:443
	#17 0x0000557bc97287ec in expr_calc_value (e=0x557bcc6a7270) at scripts/kconfig/expr.c:1014
	#18 0x0000557bc972880e in expr_calc_value (e=0x557bcc6a7290) at scripts/kconfig/expr.c:1017
	#19 0x0000557bc972885f in expr_calc_value (e=0x557bcc6a72b0) at scripts/kconfig/expr.c:1022
	#20 0x0000557bc972884a in expr_calc_value (e=0x557bcc6b1bf0) at scripts/kconfig/expr.c:1021
	#21 0x0000557bc972884a in expr_calc_value (e=0x557bcc6b5c70) at scripts/kconfig/expr.c:1021
	#22 0x0000557bc972884a in expr_calc_value (e=0x557bcc6cf2d0) at scripts/kconfig/expr.c:1021
	#23 0x0000557bc972884a in expr_calc_value (e=0x557bcc6fc0f0) at scripts/kconfig/expr.c:1021
	#24 0x0000557bc972884a in expr_calc_value (e=0x557bcc726130) at scripts/kconfig/expr.c:1021
	#25 0x0000557bc972884a in expr_calc_value (e=0x557bcc726170) at scripts/kconfig/expr.c:1021
	#26 0x0000557bc972884a in expr_calc_value (e=0x557bcc7262f0) at scripts/kconfig/expr.c:1021
	#27 0x0000557bc972884a in expr_calc_value (e=0x557bcc73bb30) at scripts/kconfig/expr.c:1021
	#28 0x0000557bc9732ba7 in sym_calc_visibility (sym=0x557bca718350) at scripts/kconfig/symbol.c:234
	#29 0x0000557bc97332f3 in sym_calc_value (sym=0x557bca718350) at scripts/kconfig/symbol.c:443
	#30 0x0000557bc97287ec in expr_calc_value (e=0x557bcc725e10) at scripts/kconfig/expr.c:1014
	#31 0x0000557bc9732a67 in sym_calc_visibility (sym=0x557bcb737420) at scripts/kconfig/symbol.c:211
	#32 0x0000557bc97332f3 in sym_calc_value (sym=0x557bcb737420) at scripts/kconfig/symbol.c:443
	#33 0x0000557bc9724718 in conf_read (name=0x0) at scripts/kconfig/confdata.c:492
	#34 0x0000557bc9722f6e in main (ac=3, av=0x7ffe09eadc08) at scripts/kconfig/conf.c:733

Additional details:

	Host: Linux 6.1.0-25-amd64 Debian Bookworm 
	HOSTCC: gcc --version: gcc (Debian 12.2.0-14) 12.2.0
	CC: powerpc-linux-gcc --version: powerpc-linux-gcc (GCC) 12.2.0
	(from https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/12.2.0/)

Full bisect run log:

	# bad: [8400291e289ee6b2bf9779ff1c83a291501f017b] Linux 6.11-rc1
	# good: [0c3836482481200ead7b416ca80c68a29cfdaabd] Linux 6.10
	git bisect start 'v6.11-rc1' 'v6.10'
	# good: [280e36f0d5b997173d014c07484c03a7f7750668] nsfs: use cleanup guard
	git bisect good 280e36f0d5b997173d014c07484c03a7f7750668
	# good: [a4f9285520584977127946a22eab2adfbc87d1bf] Merge tag 'clk-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux
	git bisect good a4f9285520584977127946a22eab2adfbc87d1bf
	# good: [2c9b3512402ed192d1f43f4531fb5da947e72bd0] Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
	git bisect good 2c9b3512402ed192d1f43f4531fb5da947e72bd0
	# good: [6dc2e98d5f1de162d1777aee97e59d75d70d07c5] s390: Remove protvirt and kvm config guards for uv code
	git bisect good 6dc2e98d5f1de162d1777aee97e59d75d70d07c5
	# bad: [c2a96b7f187fb6a455836d4a6e113947ff11de97] Merge tag 'driver-core-6.11-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
	git bisect bad c2a96b7f187fb6a455836d4a6e113947ff11de97
	# bad: [786c8248dbd33a5a7a07f7c6e55a7bfc68d2ca48] Merge tag 'perf-tools-fixes-for-v6.11-2024-07-23' of git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools
	git bisect bad 786c8248dbd33a5a7a07f7c6e55a7bfc68d2ca48
	# good: [643af93f15be901982b2b08f241263934201c99f] Merge tag 'rpmsg-v6.11' of git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux
	git bisect good 643af93f15be901982b2b08f241263934201c99f
	# bad: [bde6fb37bbc3a41eb63b1e4d06e2ff217d4a2f18] kallsyms: avoid repeated calculation of array size for markers
	git bisect bad bde6fb37bbc3a41eb63b1e4d06e2ff217d4a2f18
	# bad: [b139b43e9d47552b3f998fade184ed19e45d0c32] kconfig: use sym_get_choice_menu() in sym_check_deps()
	git bisect bad b139b43e9d47552b3f998fade184ed19e45d0c32
	# good: [bd988e7cb84a7f27e8ec100c5f68498b7d4fa69c] kconfig: introduce choice_set_value() helper
	git bisect good bd988e7cb84a7f27e8ec100c5f68498b7d4fa69c
	# bad: [f79dc03fe68c79d388908182e68d702f7f1786bc] kconfig: refactor choice value calculation
	git bisect bad f79dc03fe68c79d388908182e68d702f7f1786bc
	# good: [7308bf8a2c3d008f3662eaa3b4c3bbe55852d6c6] modpost: Enable section warning from *driver to .exit.text
	git bisect good 7308bf8a2c3d008f3662eaa3b4c3bbe55852d6c6
	# good: [17c31aded9a1ee87e37f0ea0e3737797ef3f8c97] scripts/make_fit: Support decomposing DTBs
	git bisect good 17c31aded9a1ee87e37f0ea0e3737797ef3f8c97
	# good: [ee29e6204c32dce013ac6d1078d98dce5607ce86] kconfig: import list_move(_tail) and list_for_each_entry_reverse macros
	git bisect good ee29e6204c32dce013ac6d1078d98dce5607ce86
	# first bad commit: [f79dc03fe68c79d388908182e68d702f7f1786bc] kconfig: refactor choice value calculation


Let me know if any additional information is needed. Happy to help.

--
Marco Bonelli

