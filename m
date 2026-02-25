Return-Path: <linux-kbuild+bounces-11434-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BuLMMtnn2lRagQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11434-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 22:21:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC9819DC67
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 22:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0376F303074F
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 21:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3F830E0E7;
	Wed, 25 Feb 2026 21:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uqkTOYUa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588E427A927;
	Wed, 25 Feb 2026 21:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772054470; cv=none; b=o/fegrFuRBDS+tWrVxAfJvSVR/6h9d6UjVwOtMu79y9Q7JxRzgGPaiXhltcTpPbxk4NSMFHxWmpi3BZN3Y0UDuVZ9hvFFwfhJwXjacEPOuM8OvYq0w7lcmgG4Tu5rTEbwDiuC3WRZrKyegM1yDauD+l9ZJWCPNXpJOGBKWNxOG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772054470; c=relaxed/simple;
	bh=b6MUTQ+Idc5EI2W6m+753z6IbTzSt2Pu74Jww8poakA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYoFtoIsuTbpddWP+wuxiCg/Kzi0nfhJK2yIDU+rBOzG6D6k9E8MZ/6nLt9Bvgs5sQ8kcPlcJBqF38iAag48e2DzwEvMyamWfoaNp8CBu1pwXUBx/9LLGD5dUR/iO4PjiF6uapfP4HwRRkZErAw8vKslHzxVfGOz6szOnaqKjhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uqkTOYUa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9D7C116D0;
	Wed, 25 Feb 2026 21:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772054470;
	bh=b6MUTQ+Idc5EI2W6m+753z6IbTzSt2Pu74Jww8poakA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uqkTOYUaMiaeHm4rSNbnUWS5/BBNRA7v+CATrjb8u385zgAOjk9JH/9RnBYqd/oVB
	 ycT4FBC2pP1ySWTV72GQ/KHm3O190LEkRACrkqizSVPdaQVh0bfCEPfyFBQf0U4xj9
	 F0gdBg1voLCWJST7DB9/Vx591AdBujNl/XbaCaVzJu9SblKnHuPHEGjkKGUTBpfTOD
	 ZdO81W/L+PmHXtikAe3GA6bWzuFV48LJaKYolqXLi78uvp4D9P0I1egBEwZWjQw5Tg
	 2yAGNkxeLq1CYxQajIP7OcD9e8WyxqByoe+WtrRnbuhycoO2MwlCvpfRmlQcyyGotK
	 MhNDVV4fivbjA==
Date: Wed, 25 Feb 2026 14:21:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kbuild@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH] kbuild: only clean objtool on mrproper
Message-ID: <20260225212105.GG2755225@ax162>
References: <20260225112633.6123-1-msuchanek@suse.de>
 <20260225200417.GE2755225@ax162>
 <aZ9aLWIAzsWfYNyf@kitsune.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZ9aLWIAzsWfYNyf@kitsune.suse.cz>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11434-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3FC9819DC67
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 09:23:09PM +0100, Michal Suchánek wrote:
> On Wed, Feb 25, 2026 at 01:04:17PM -0700, Nathan Chancellor wrote:
> > Wouldn't resolve_btfids need the same treatment?
> 
> No, make clean runs the clean target for resolve_btfids but the tool
> remains.

That does not reproduce for me personally:

  $ cat kernel/configs/btf.config
  CONFIG_BPF_SYSCALL=y
  # CONFIG_DEBUG_INFO_NONE is not set
  CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
  CONFIG_DEBUG_INFO_BTF=y

  $ make -skj"$(nproc)" ARCH=x86_64 O=build mrproper defconfig btf.config prepare

  $ ls -al build/tools/{bpf/resolve_btfids/resolve_btfids,objtool/objtool}
  -rwxr-xr-x 1 nathan nathan 2224456 Feb 25 13:33 build/tools/bpf/resolve_btfids/resolve_btfids
  -rwxr-xr-x 1 nathan nathan 4046296 Feb 25 13:33 build/tools/objtool/objtool

  $ make -skj"$(nproc)" ARCH=x86_64 O=build clean

  $ ls -al build/tools/{bpf/resolve_btfids/resolve_btfids,objtool/objtool}
  "build/tools/bpf/resolve_btfids/resolve_btfids": No such file or directory (os error 2)
  "build/tools/objtool/objtool": No such file or directory (os error 2)

I guess resolve_btfids is not strictly required for external module
builds because vmlinux may not be present and cmd_btf_ko handles that
gracefully.

> > Also, what's the use case? Running 'make clean' then copying what
> > is left?
> 
> Yes, that's what my build script has been doing for at least a decade,
> possibly mutiple decades when it was somebody else's build script.

I guess that is one way to ensure 'make clean' upholds its promise of
leaving just enough to build external modules. I had missed that in
review of this change.

Another option would be splitting tools/objtool's clean target into
clean and mrproper like the main kernel and mirroring what that does so
that objtool the binary can remain around while all its objects get
cleaned up.

Cheers,
Nathan

