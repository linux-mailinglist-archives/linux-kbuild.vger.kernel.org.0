Return-Path: <linux-kbuild+bounces-9626-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 73948C5D692
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 14:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A5CC44E1066
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 13:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD5D31A044;
	Fri, 14 Nov 2025 13:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FyxBsSkb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ElHgmLMR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FyxBsSkb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ElHgmLMR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFE031812E
	for <linux-kbuild@vger.kernel.org>; Fri, 14 Nov 2025 13:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127760; cv=none; b=W17sR5MxK6uiYyRBz0S8kCZbpC7aL9RAdSfRD6GuxEhnYbmUf++zg+TBFX896pJxK89HkrCNoifJbjmFz/gsrlzMYmCCbZ4VYRKqeyVs0B0HSp4bHaDaIt9oD6npSrU/yu8rqcjec6y08TzT5GlQGZQFmuGDv5OAVJOmZMMOMq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127760; c=relaxed/simple;
	bh=jjpP/weceEqeoclW7PG2fbBDDtT9Eeg02tIpOYsyq7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mVM4ojDtheHB0L4yMZdOGmaiJJmwuWrS1/UkLN7Lt6BTDQY4cwyoIL6zqa7vA5xQW9z2Dp7HRhmiZ+Wkf8pMgx8Mavoy9E3N1IfQpuiGiYMwtPjX6kLpmOrlClMOmViEQ0YlEIDH3hxod0tSUwGo+rYotnlJPmFFncxzgrDYvAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FyxBsSkb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ElHgmLMR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FyxBsSkb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ElHgmLMR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5A96B2122E;
	Fri, 14 Nov 2025 13:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763127757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DxOGWffyVuW8pl3GZE/Xi5orlk84b/kPr+I63aZu/ow=;
	b=FyxBsSkbcW67u6JaLU40pTCG0aOejuJyaQQl4q38A+O6GNs+bnFFlUaTo1nlDpwen49F+w
	ZmjQc6izUZySypEoMfXdSS3bLjJ7aWz7rvRV34LRZkFGMjSGE/DpzItMniUnfB7mahQFd+
	hNcroQHC8WkZOxsBGFzzP91ze87IW0o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763127757;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DxOGWffyVuW8pl3GZE/Xi5orlk84b/kPr+I63aZu/ow=;
	b=ElHgmLMRDUWKf9icQboWPpX06dJKUIyYnjoxOoK75AuYXjkHIGzTJZXYCLJMk60dxsnLI+
	0mAS2Z6JvxPOU7Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763127757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DxOGWffyVuW8pl3GZE/Xi5orlk84b/kPr+I63aZu/ow=;
	b=FyxBsSkbcW67u6JaLU40pTCG0aOejuJyaQQl4q38A+O6GNs+bnFFlUaTo1nlDpwen49F+w
	ZmjQc6izUZySypEoMfXdSS3bLjJ7aWz7rvRV34LRZkFGMjSGE/DpzItMniUnfB7mahQFd+
	hNcroQHC8WkZOxsBGFzzP91ze87IW0o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763127757;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DxOGWffyVuW8pl3GZE/Xi5orlk84b/kPr+I63aZu/ow=;
	b=ElHgmLMRDUWKf9icQboWPpX06dJKUIyYnjoxOoK75AuYXjkHIGzTJZXYCLJMk60dxsnLI+
	0mAS2Z6JvxPOU7Aw==
Date: Fri, 14 Nov 2025 14:42:36 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sami Tolvanen <samitolvanen@google.com>
Subject: gendwarksyms not 32bit-clean
Message-ID: <aRcxzPxtJblVSh1y@kitsune.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.59 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MIXED_CHARSET(0.71)[subject];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kitsune.suse.cz:helo,kitsune.suse.cz:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.59
X-Spam-Level: 

Also cc lists

Hello,

I tried to build kernel with gendwarfksyms and it does not work on
32bit:

[   30s]   HOSTCC  scripts/gendwarfksyms/dwarf.o
[   30s] ../scripts/gendwarfksyms/dwarf.c: In function ‘process_enumerator_type’:
[   30s] ../scripts/gendwarfksyms/dwarf.c:764:64: error: passing argument 3 of ‘kabi_get_enumerator_value’ from incompatible pointer type [-Wincompatible-pointer-types]
[   30s]   764 |                         state->expand.current_fqn, cache->fqn, &value);
[   30s]       |                                                                ^~~~~~
[   30s]       |                                                                |
[   30s]       |                                                                Dwarf_Word * {aka long long unsigned int *}
[   30s] In file included from ../scripts/gendwarfksyms/dwarf.c:10:
[   30s] ../scripts/gendwarfksyms/gendwarfksyms.h:283:47: note: expected ‘long unsigned int *’ but argument is of type ‘Dwarf_Word *’ {aka ‘long long unsigned int *’}
[   30s]   283 |                                unsigned long *value);
[   30s]       |                                ~~~~~~~~~~~~~~~^~~~~
[   30s] make[3]: *** [../scripts/Makefile.host:131: scripts/gendwarfksyms/dwarf.o] Error 1
[   30s] make[3]: *** Waiting for unfinished jobs....
[   30s]   HOSTCC  scripts/gendwarfksyms/cache.o
[   30s]   HOSTCC  scripts/gendwarfksyms/gendwarfksyms.o
[   30s]   HOSTCC  scripts/gendwarfksyms/kabi.o
[   30s]   HOSTCC  scripts/selinux/mdp/mdp
[   30s]   HOSTCC  scripts/gendwarfksyms/die.o
[   30s]   HOSTCC  scripts/gendwarfksyms/symbols.o
[   30s] In file included from ../scripts/gendwarfksyms/symbols.c:6:
[   30s] ../scripts/gendwarfksyms/symbols.c: In function ‘elf_for_each_global’:
[   30s] ../scripts/gendwarfksyms/gendwarfksyms.h:47:27: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 4 has type ‘Elf64_Xword’ {aka ‘long long unsigned int’} [-Wformat=]
[   30s]    47 |                 __println("error: ", format, ##__VA_ARGS__); \
[   30s]       |                           ^~~~~~~~~
[   30s] ../scripts/gendwarfksyms/gendwarfksyms.h:35:25: note: in definition of macro ‘__println’
[   30s]    35 |         fprintf(stderr, prefix __PREFIX "%s: " format "\n", __func__, \
[   30s]       |                         ^~~~~~
[   30s] ../scripts/gendwarfksyms/symbols.c:243:33: note: in expansion of macro ‘error’
[   30s]   243 |                                 error("expected sh_entsize (%lu) to be %zu",
[   30s]       |                                 ^~~~~
[   30s] ../scripts/gendwarfksyms/symbols.c: In function ‘set_symbol_addr’:
[   30s] ../scripts/gendwarfksyms/gendwarfksyms.h:41:35: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 6 has type ‘Elf64_Addr’ {aka ‘long long unsigned int’} [-Wformat=]
[   30s]    41 |                         __println("", format, ##__VA_ARGS__); \
[   30s]       |                                   ^~
[   30s] ../scripts/gendwarfksyms/gendwarfksyms.h:35:25: note: in definition of macro ‘__println’
[   30s]    35 |         fprintf(stderr, prefix __PREFIX "%s: " format "\n", __func__, \
[   30s]       |                         ^~~~~~
[   30s] ../scripts/gendwarfksyms/symbols.c:293:17: note: in expansion of macro ‘debug’
[   30s]   293 |                 debug("%s -> { %u, %lx }", sym->name, sym->addr.section,
[   30s]       |                 ^~~~~
[   30s]   HOSTCC  scripts/kallsyms
[   30s]   HOSTCC  scripts/gendwarfksyms/types.o
[   30s] make[2]: *** [../scripts/Makefile.build:556: scripts/gendwarfksyms] Error 2
[   30s] make[2]: *** Waiting for unfinished jobs....
[   30s]   HOSTCC  scripts/sign-file
[   31s]   HOSTCC  scripts/sorttable
[   31s]   HOSTCC  scripts/asn1_compiler
[   31s] make[1]: *** [/home/abuild/rpmbuild/BUILD/kernel-default-6.18_rc5-build/kernel-default-6.18~rc5/linux-6.18-rc5/Makefile:1285: scripts] Error 2
[   31s] make: *** [/home/abuild/rpmbuild/BUILD/kernel-default-6.18_rc5-build/kernel-default-6.18~rc5/linux-6.18-rc5/Makefile:248: __sub-make] Error 2
[   31s] error: Bad exit status from /var/tmp/rpm-tmp.a006l0 (%prep)

Can you fix it, or make it depend on host being 64bit?

Thanks

Michal

