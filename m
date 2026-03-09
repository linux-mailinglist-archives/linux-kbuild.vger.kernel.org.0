Return-Path: <linux-kbuild+bounces-11720-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNJzAtf/rmkLLgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11720-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 18:13:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6B423D794
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 18:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A108301907F
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 17:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3DE3B8926;
	Mon,  9 Mar 2026 17:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5IZ0rtC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5963B4E94;
	Mon,  9 Mar 2026 17:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773076149; cv=none; b=Usb1WmUT4ZAem5Etx+kzqWUAzbYC9RVpOrcK2cb4mWTUOm5dfevsyuv0/+SOoTP158hVdqk0EyoM7wOYbxStUwldrs5+gw+o8pTul2/218aiHvQk9n0S+VbWGde+WAl93b0YCAymCieYPPj0Uhus/N4VGUioEHR3Cvt4uZB4ACc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773076149; c=relaxed/simple;
	bh=yxGIrUPdFor93HFgO2zpfedJF5LnSs28AUCRMjSOLRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsNoJd2+mf4sxtvFWqEDuSho0N25yFcLQMHfIn25gj0SgoFMAUE8GI1uu1my67TLv6Qdzjdi5NXzOU2nSvmgOuir/RrK2Seulg+giIQKHINftDBFkCmoOVGXtu5ZeWEew4tb8LIm2+rmwrJZk1RoyDsUmvxto6pl8DPPd65zlNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5IZ0rtC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3C3C4CEF7;
	Mon,  9 Mar 2026 17:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773076148;
	bh=yxGIrUPdFor93HFgO2zpfedJF5LnSs28AUCRMjSOLRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U5IZ0rtCtpzCw5F5D6e1QxScM/L76X5N6JOBwUpbjk7oJfX4bXu6Qz19/KxxoGV0S
	 UyTjF2EBOluOn0XjLvksOAX6oKoeu0hNRFutD+UbQLyx+juY8bbeh9tVuCt9/XN4zc
	 Md2PosEOPjttofNjoEa41SZ9bMwMkMRCktZX3uSdIR0K0zIxta4DAitSVaoic1duP7
	 ZWeRs3gtW04XUNYrHdErst4hjN4CnJncRRfXtL6B83A+IZ5N4n2T5r3plUycAuMj8H
	 5JZXLz9PREdQ7bxl8LrBs1Prl+QSaFdKPck3LzgrpTeJqUrfkebln10i8edlscskWT
	 WbRVwb1AN7MLA==
Date: Mon, 9 Mar 2026 10:09:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andreas Larsson <andreas@gaisler.com>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, Nicolas Schier <nsc@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] scripts: kconfig: merge_config.sh: refactor from
 shell/sed/grep to awk
Message-ID: <20260309170904.GA2779008@ax162>
References: <20260122105751.2186609-1-mikko.rapeli@linaro.org>
 <acb36651-449a-43e4-afe2-ba42a435cbb0@gaisler.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acb36651-449a-43e4-afe2-ba42a435cbb0@gaisler.com>
X-Rspamd-Queue-Id: 7E6B423D794
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11720-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,merge_config.sh:url]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 05:38:58PM +0100, Andreas Larsson wrote:
> On 2026-01-22 11:57, Mikko Rapeli wrote:
> > From: Anders Roxell <anders.roxell@linaro.org>
> > 
> > merge_config.sh shell/sed/grep loop scales poorly and is slow.
> > With Yocto genericarm64 kernel and around 190 config fragments
> > the script takes more than 20 minutes to run on a fast build machine.
> > Re-implementation with awk does the same job in 10 seconds.
> > Using awk since it is likely available in the build environments
> > and using perl, python etc would introduce more complex runtime
> > dependencies. awk is good enough and lot better than shell/sed/grep.
> > 
> > Output stays the same but changed execution time means that
> > parallel job output may be ordered differently.
> > 
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  scripts/kconfig/merge_config.sh | 168 ++++++++++++++++++++++++--------
> >  1 file changed, 128 insertions(+), 40 deletions(-)
> 
> Hi,
> 
> Commit 5fa9b82cbcfc ("scripts: kconfig: merge_config.sh: refactor from
> shell/sed/grep to awk") breaks merge_config.sh for me:
> 
> ---------->%----------
> $ make tiny.config
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/kconfig/conf.o
>   HOSTCC  scripts/kconfig/confdata.o
>   HOSTCC  scripts/kconfig/expr.o
>   LEX     scripts/kconfig/lexer.lex.c
>   YACC    scripts/kconfig/parser.tab.[ch]
>   HOSTCC  scripts/kconfig/lexer.lex.o
>   HOSTCC  scripts/kconfig/menu.o
>   HOSTCC  scripts/kconfig/parser.tab.o
>   HOSTCC  scripts/kconfig/preprocess.o
>   HOSTCC  scripts/kconfig/symbol.o
>   HOSTCC  scripts/kconfig/util.o
>   HOSTLD  scripts/kconfig/conf
> The base file '.config' does not exist. Creating one...
> Using .config as base
> Merging ./kernel/configs/tiny.config
> awk: cannot open ./.tmp.config.U9SROCKTBj.new (No such file or directory)
> mv: cannot stat './.tmp.config.U9SROCKTBj.new': No such file or directory
> make[2]: *** [scripts/kconfig/Makefile:112: tiny.config] Error 1
> make[1]: *** [<kernel-source-top-dir>/Makefile:744: tiny.config] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> ---------->%----------
> 
> with this underlying call to merge_config.sh, an empty .config and where
> my awk is GNU Awk 5.1.0:
> 
> ---------->%----------
> $ make tiny.config V=1
> make --no-print-directory -C <kernel-source-top-dir> \
> -f <kernel-source-top-dir>/Makefile tiny.config
> make -f ./scripts/Makefile.build obj=scripts/basic
> make -f ./scripts/Makefile.build obj=scripts/kconfig tiny.config
> # cmd_merge_fragments tiny.config
>   ./scripts/kconfig/merge_config.sh -m .config ./kernel/configs/tiny.config ./arch/x86/configs/tiny.config
> ...
> 
> $ awk --version
> GNU Awk 5.1.0, API: 3.0 (GNU MPFR 4.1.0, GNU MP 6.2.1)
> ---------->%----------
> 
> At 5fa9b82cbcfc~ things works as expected.

Hmmm, not sure how I have not seen this error myself since I test
tiny.config but I can reproduce with a clean output directory. Something
like this seems like a simple fix but the only instances of ARGV[3] in
the awk script that I can see use '>>', which should create the file if
it does not exist. Mikko, any ideas?

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 735e1de450c6..070ecae87a1c 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -123,6 +123,7 @@ fi
 MERGE_LIST=$*
 
 TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
+touch "$TMP_FILE.new"
 
 echo "Using $INITFILE as base"
 

