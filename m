Return-Path: <linux-kbuild+bounces-11717-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAHnIGj4rmnZKgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11717-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 17:42:16 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D9F23CE63
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 17:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 490D3300D0FC
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 16:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D7D392809;
	Mon,  9 Mar 2026 16:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b="Y9klK2gY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5953A7837;
	Mon,  9 Mar 2026 16:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.231.106.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074342; cv=none; b=QsbBPzhvcS9pghonw7P8KiFbbiBgK+8GhYpU/f8th0r+kR0j8n6Ovy19grLKz2+RwqnJ9uyW7PvgylqBKc01+hjO7FgOoqlHWXcnFX1EjqrzXah/GQMDmLwTjU50XPEwz90RAc3DhnZ0O7RclqmgKEjjWTYQOqWFzgGnS/2Y2Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074342; c=relaxed/simple;
	bh=HaMppz6BLqcdRe/QZhkiTCdaXo6KZqP/HF1r3hiV7oY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DjxF7O9+OWS0ABxI9GqHCuX2+GS6rWS1btRAfFC0K0O31tQ3VT7FeiYMqtJhO61QisOkaj23kSk80ysQ2QKmmVY0P4mFnWkJfWheR7+lie4p9A1Sgs00Fu9XFUNV87oUZFv5y17jcfODUF5aLLlnM2jGPEqv0tCbH+f+kmIj0KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; dkim=fail (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=Y9klK2gY reason="key not found in DNS"; arc=none smtp.client-ip=94.231.106.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaisler.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4fV2lQ6r1Mz1DDS0;
	Mon,  9 Mar 2026 17:38:58 +0100 (CET)
Received: from [10.10.15.24] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4fV2lQ4f7Jz1DDRp;
	Mon,  9 Mar 2026 17:38:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1773074338;
	bh=4E1NM2+O+d14hhAHHRmyP6YPcZQ1xF+7N7AJ51xX8zU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Y9klK2gYFYcdMtYm90E1s/XziC1EJqtlcTQX8EoA1JTYX3+LfRWbM6326uOIyB1t7
	 PfeNqv7iPTnOCQLKxSctoihoy2NlibXt7WyJUIqxN99Gbe5qFq0dhPkmL4M1D8D0EK
	 R8I+ZevYqksJI7vld7hCWWZDFgc3AxxITgBXe3MJK/fW/gxRbQX2NLIEO3tLPt4HO+
	 nLnLmuGtatTxTR9H/mswVSG2el/vmF7SEgqfanEqK98PrLEABBHJuLkpxWlYfMNqcg
	 1mKTjXBhG6ulhJFTxTwrI+g9UgsGlVESTKBPhPP3/fZ2+oW+LtgLeUKDvBQzVGzPll
	 VyJ0vQIYfJsnQ==
Message-ID: <acb36651-449a-43e4-afe2-ba42a435cbb0@gaisler.com>
Date: Mon, 9 Mar 2026 17:38:58 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] scripts: kconfig: merge_config.sh: refactor from
 shell/sed/grep to awk
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Anders Roxell <anders.roxell@linaro.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260122105751.2186609-1-mikko.rapeli@linaro.org>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20260122105751.2186609-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A3D9F23CE63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gaisler.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11717-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_PERMFAIL(0.00)[gaisler.com:s=simplycom2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gaisler.com:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@gaisler.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.343];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:email,gaisler.com:mid]
X-Rspamd-Action: no action

On 2026-01-22 11:57, Mikko Rapeli wrote:
> From: Anders Roxell <anders.roxell@linaro.org>
> 
> merge_config.sh shell/sed/grep loop scales poorly and is slow.
> With Yocto genericarm64 kernel and around 190 config fragments
> the script takes more than 20 minutes to run on a fast build machine.
> Re-implementation with awk does the same job in 10 seconds.
> Using awk since it is likely available in the build environments
> and using perl, python etc would introduce more complex runtime
> dependencies. awk is good enough and lot better than shell/sed/grep.
> 
> Output stays the same but changed execution time means that
> parallel job output may be ordered differently.
> 
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  scripts/kconfig/merge_config.sh | 168 ++++++++++++++++++++++++--------
>  1 file changed, 128 insertions(+), 40 deletions(-)

Hi,

Commit 5fa9b82cbcfc ("scripts: kconfig: merge_config.sh: refactor from
shell/sed/grep to awk") breaks merge_config.sh for me:

---------->%----------
$ make tiny.config
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
The base file '.config' does not exist. Creating one...
Using .config as base
Merging ./kernel/configs/tiny.config
awk: cannot open ./.tmp.config.U9SROCKTBj.new (No such file or directory)
mv: cannot stat './.tmp.config.U9SROCKTBj.new': No such file or directory
make[2]: *** [scripts/kconfig/Makefile:112: tiny.config] Error 1
make[1]: *** [<kernel-source-top-dir>/Makefile:744: tiny.config] Error 2
make: *** [Makefile:248: __sub-make] Error 2
---------->%----------

with this underlying call to merge_config.sh, an empty .config and where
my awk is GNU Awk 5.1.0:

---------->%----------
$ make tiny.config V=1
make --no-print-directory -C <kernel-source-top-dir> \
-f <kernel-source-top-dir>/Makefile tiny.config
make -f ./scripts/Makefile.build obj=scripts/basic
make -f ./scripts/Makefile.build obj=scripts/kconfig tiny.config
# cmd_merge_fragments tiny.config
  ./scripts/kconfig/merge_config.sh -m .config ./kernel/configs/tiny.config ./arch/x86/configs/tiny.config
...

$ awk --version
GNU Awk 5.1.0, API: 3.0 (GNU MPFR 4.1.0, GNU MP 6.2.1)
---------->%----------

At 5fa9b82cbcfc~ things works as expected.

Cheers,
Andreas


