Return-Path: <linux-kbuild+bounces-11488-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0x7bJfaCommz3gQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11488-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Feb 2026 06:53:58 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B69BD1C0785
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Feb 2026 06:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2C43A3028D71
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Feb 2026 05:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9892D7DD9;
	Sat, 28 Feb 2026 05:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1I9Ib3x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FC1267B90;
	Sat, 28 Feb 2026 05:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772258031; cv=none; b=de7Ankv2VTHbJnRxNGICa2eqZWGOE8PWlsBYBRjpUzgDbxlITUcRzMCYxpFeTM7wgjz5XJPGD/96oA+XegtyTjUkxngjV3d/fzZNSM1g0oLn4P6BeokKBlEEnszNuqqpqUUnd7jxH47HAppGJ5asqmZoUULxGOXnVbcQaF4h3rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772258031; c=relaxed/simple;
	bh=pBEV+jBvJvdSoPvJVuVxRapAX5gdRdCbYo9cbLc5UCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9i6/aLzVb0TdqgjULOpGMrFhfnMHxv//EV7EXJVxOe594qb4mhqBtfxWPBX0ZZCPZqumaOaIwBQheB+emK1jqF73r9/08kFalNVabl6fIVvUbnaxbDTpyoH2l9y4L8WvZ6K6KiCWou+/z45oZPyLXkAsqagT2zweUgCIjKyfUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1I9Ib3x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8006C116D0;
	Sat, 28 Feb 2026 05:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772258031;
	bh=pBEV+jBvJvdSoPvJVuVxRapAX5gdRdCbYo9cbLc5UCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m1I9Ib3xGI8AzHZj+4PTU9jvIRHD3TiXxNOtYDornttDTtObrQvCo2bmoPaTzrPFD
	 CJnseTLJMkuwdFBzW41HTiSrkzPrs7GoqAgVK7QKAuD3BWNMdxhEBhiCYgjRBWDPd1
	 J1TWl528T+LxgCji917IhHvWlo08DOxynWU6Uz7uozFbBYMe7niM3tNAA543tlqZMo
	 TcjY8gQLq6CXdzvIUBDdkMiFiqI3i2YKoIDg5fgy0jEJcanvMJZY+CJObFiMYJz3e8
	 vQkQd7gTfm9WoOoBtF/CjL6OgFv/uhHrEZFOxzjxfVN6NSBXHEI4SDJpcs2xr3wkWi
	 czBTuV+nt1bGg==
Date: Fri, 27 Feb 2026 22:53:46 -0700
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
Message-ID: <20260228055346.GA2321981@ax162>
References: <20260225112633.6123-1-msuchanek@suse.de>
 <20260225200417.GE2755225@ax162>
 <aZ9aLWIAzsWfYNyf@kitsune.suse.cz>
 <20260225212105.GG2755225@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225212105.GG2755225@ax162>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11488-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B69BD1C0785
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 02:21:05PM -0700, Nathan Chancellor wrote:
> On Wed, Feb 25, 2026 at 09:23:09PM +0100, Michal Suchánek wrote:
> > On Wed, Feb 25, 2026 at 01:04:17PM -0700, Nathan Chancellor wrote:
> > > Wouldn't resolve_btfids need the same treatment?
> > 
> > No, make clean runs the clean target for resolve_btfids but the tool
> > remains.
> 
> That does not reproduce for me personally:
> 
>   $ cat kernel/configs/btf.config
>   CONFIG_BPF_SYSCALL=y
>   # CONFIG_DEBUG_INFO_NONE is not set
>   CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>   CONFIG_DEBUG_INFO_BTF=y
> 
>   $ make -skj"$(nproc)" ARCH=x86_64 O=build mrproper defconfig btf.config prepare
> 
>   $ ls -al build/tools/{bpf/resolve_btfids/resolve_btfids,objtool/objtool}
>   -rwxr-xr-x 1 nathan nathan 2224456 Feb 25 13:33 build/tools/bpf/resolve_btfids/resolve_btfids
>   -rwxr-xr-x 1 nathan nathan 4046296 Feb 25 13:33 build/tools/objtool/objtool
> 
>   $ make -skj"$(nproc)" ARCH=x86_64 O=build clean
> 
>   $ ls -al build/tools/{bpf/resolve_btfids/resolve_btfids,objtool/objtool}
>   "build/tools/bpf/resolve_btfids/resolve_btfids": No such file or directory (os error 2)
>   "build/tools/objtool/objtool": No such file or directory (os error 2)
> 
> I guess resolve_btfids is not strictly required for external module
> builds because vmlinux may not be present and cmd_btf_ko handles that
> gracefully.

To close the loop here, 'make clean' removes vmlinux and resolve_btfids
at the same time and the check in cmd_btf_ko prevents that from becoming
a hard error. So technically no problem but a little fragile.

> > > Also, what's the use case? Running 'make clean' then copying what
> > > is left?
> > 
> > Yes, that's what my build script has been doing for at least a decade,
> > possibly mutiple decades when it was somebody else's build script.
> 
> I guess that is one way to ensure 'make clean' upholds its promise of
> leaving just enough to build external modules. I had missed that in
> review of this change.
> 
> Another option would be splitting tools/objtool's clean target into
> clean and mrproper like the main kernel and mirroring what that does so
> that objtool the binary can remain around while all its objects get
> cleaned up.

FWIW, I sent this as an alternative since I think it adheres a little
more to Kbuild's contract that 'make clean' leaves enough around for
external module builds while removing all unneeded generated files:

  https://lore.kernel.org/20260227-avoid-objtool-binary-removal-clean-v1-1-122f3e55eae9@kernel.org/

Cheers,
Nathan

